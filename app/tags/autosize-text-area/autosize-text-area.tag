<autosize-text-area>
    <script type="text/es6">
        import FamousInitializer from "../shared/FamousInitializer";
        import AutosizeTextareaSurface from "famous-autosizetextarea/AutosizeTextareaSurface";


        this.on("mount", ()=>{


            $(this.root).hide();


            if(!this.parent.root.isFamousContainer){
                this.root.contextInstance =  opts.context || FamousInitializer.getRootContext();    
            }
            

            let attributes = {};
            attributes.id = this.root.id || "";         

            let properties = {};
            properties.resize = opts.resize;   

            this.root.autosizeTextAreaInstance = new AutosizeTextareaSurface({
                classes: opts.classes,
                properties: properties,
                placeholder: opts.placeholder,
                size:[opts.width, opts.height],
                attributes: attributes
            });

            this.root.getScrollHeight = ()=>{
                return this.root.getFamousInstance().getScrollHeight();
            }


            this.root.getFamousInstance = ()=>{
                return this.root.autosizeTextAreaInstance;
            }

            this.root.on = (ename, ehandler) =>{                
                this.root.getFamousInstance().on(ename, ehandler);
            };            

            if(this.root.contextInstance){
                this.root.contextInstance.add(this.root.getFamousInstance());
            }
        });    
    </script>    
</autosize-text-area>