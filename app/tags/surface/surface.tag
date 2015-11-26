<surface>
    <yield/>
    
    <script type="text/es6">
        import FamousInitializer from "../shared/FamousInitializer";
        import Surface from "famous/core/Surface";





        this.on("mount", ()=>{


            $(this.root).hide();


            if(!this.parent.root.isFamousContainer){
                this.root.contextInstance =  opts.context || FamousInitializer.getRootContext();    
            }
            

            let attributes = {};
            attributes.id = this.root.id || "";      

            let properties = opts.properties;

            // console.log(opts);      

            this.root.surfaceInstance = new Surface({
                classes: opts.classes,
                content: this.root.innerHTML,
                size:[opts.width, opts.height],
                attributes: attributes,
                properties:properties
            });

            this.root.on = (ename, ehandler) =>{
                this.root.surfaceInstance.on(ename, ehandler);
            };

            this.root.getFamousInstance = ()=>{
                return this.root.surfaceInstance;
            }

            if(this.root.contextInstance){
                this.root.contextInstance.add(this.root.getFamousInstance());
            }
        });

        
    </script>
</surface>