<input-surface>
    <script type="text/es6">
        import FamousInitializer from "../shared/FamousInitializer";
        import InputSurface from "famous/surfaces/InputSurface";


        this.on("mount", ()=>{


            $(this.root).hide();


            if(!this.parent.root.isFamousContainer){
                this.root.contextInstance =  opts.context || FamousInitializer.getRootContext();    
            }
            

            let attributes = {};
            attributes.id = this.root.id || "";            

            this.root.inputSurfaceInstance = new InputSurface({
                classes: opts.classes,
                placeholder: opts.placeholder,
                size:[opts.width, opts.height],
                attributes: attributes,
                value: opts.value
            });

            this.root.on = (ename, ehandler) =>{
                this.root.inputSurfaceInstance.on(ename, ehandler);
            }

            this.root.getValue = ()=>{
                return this.root.inputSurfaceInstance.getValue();
            }

            

            this.root.getFamousInstance = ()=>{
                return this.root.inputSurfaceInstance;
            }

            if(this.root.contextInstance){
                this.root.contextInstance.add(this.root.getFamousInstance());
            }
        });    
    </script>
</input-surface>
