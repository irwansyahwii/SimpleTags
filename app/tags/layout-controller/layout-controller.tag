<layout-controller>

    <yield/>
    <script type="text/es6">
        import FamousInitializer from "../shared/FamousInitializer";
        import LayoutController from "famous-flex/src/LayoutController";

        this.root.isFamousContainer = true;

        if(!this.parent.root.isFamousContainer){
            this.root.contextInstance =  opts.context || FamousInitializer.getRootContext();    
        }

        this.on("mount", ()=>{            
            $(this.root).hide();

            this.root.refresh = ()=>{

                this.root.getFamousInstance().setOptions(this.root.layoutControllerOptions);
            }

            this.root.layoutControllerOptions = {
                dataSource: {}
            };
            this.root.layoutControllerInstance = new LayoutController(this.root.layoutControllerOptions);

            this.root.getFamousInstance = ()=>{
                return this.root.layoutControllerInstance;
            }            

            for(let tag_name in this.tags){
                
                if(this.tags[tag_name].length){

                }
                else{
                    let current_child = this.tags[tag_name];
                    current_child.on("mount", ()=>{

                        this.root.layoutControllerOptions.dataSource[current_child.opts.id] = current_child.root.getFamousInstance();

                        
                    });
                }
            }

            if(this.root.contextInstance){                
                this.root.contextInstance.add(this.root.getFamousInstance());
            }

            if(this.opts.onready){
                this.opts.onready(this);
            }

        });

    </script>
</layout-controller>