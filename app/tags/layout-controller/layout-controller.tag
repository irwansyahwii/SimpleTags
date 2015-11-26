<layout-controller>

    <yield/>
    <script type="text/es6">
        import FamousInitializer from "../shared/FamousInitializer";
        import LayoutController from "famous-flex/src/LayoutController";

        this.root.isFamousContainer = true;

        if(!this.parent.root.isFamousContainer){
            this.root.contextInstance =  opts.context || FamousInitializer.getRootContext();    
        }

        // console.log(this.root);

        this.on("mount", ()=>{            
            $(this.root).hide();

            this.root.refresh = ()=>{

                this.root.getFamousInstance().setOptions(this.root.layoutControllerOptions);
            }

            this.root.layoutControllerOptions = {
                dataSource: {}
            };

            this.root.layoutControllerOptions.layout = opts.layout_function;
            this.root.layoutControllerOptions.layoutOptions = opts.layout_options;

            this.root.getLayoutOptions = ()=>{
                return this.root.getFamousInstance().getLayoutOptions();
            }

            this.root.setLayoutOptions = (options)=>{
                this.root.getFamousInstance().setLayoutOptions(options);
            }

            console.log(opts);

            for(let tag_name in this.tags){
                
                if(this.tags[tag_name].length){
                    
                    for(let i = 0; i < this.tags[tag_name].length; i++){
                        let curr_child = this.tags[tag_name][i];
                        curr_child.on("mount", ()=>{

                            this.root.layoutControllerOptions.dataSource[curr_child.opts.id] = curr_child.root.getFamousInstance();

                            
                        });                        
                    }
                }
                else{
                    let current_child = this.tags[tag_name];
                    current_child.on("mount", ()=>{

                        this.root.layoutControllerOptions.dataSource[current_child.opts.id] = current_child.root.getFamousInstance();

                        
                    });
                }
            }



            this.root.layoutControllerInstance = new LayoutController(this.root.layoutControllerOptions);

            this.root.getFamousInstance = ()=>{
                return this.root.layoutControllerInstance;
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