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
                
                placeholder: opts.placeholder,
                size:[opts.width, opts.height],
                attributes: attributes
            });

            

            this.root.getFamousInstance = ()=>{
                return this.root.inputSurfaceInstance;
            }

            if(this.root.contextInstance){
                this.root.contextInstance.add(this.root.getFamousInstance());
            }
        });    
    </script>
</input-surface>
