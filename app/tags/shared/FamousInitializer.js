import Engine from "famous/core/Engine";
import FastClick from "fastclick/lib/fastclick";


require('famous-polyfills');
require('famous/core/famous.css');

class FamousInitializer{
    constructor(){
        this.rootContext = null;
        this.isInitialized = false;

        this.init();
    }

    triggerResize(){
        setTimeout(()=>{
            Engine.nextTick(()=> {
                this.getRootContext().emit('resize', {});
            });            

        }, 1)

    }

    init(){
        if(!this.isInitialized){
            FastClick.attach(document.body);
            this.triggerResize();
            // Engine.nextTick(()=> {
            //     this.getRootContext().emit('resize', {});
            // });            
        }
    }

    getRootContext(){
        if(this.rootContext === null){
            this.rootContext = Engine.createContext();
        }

        return this.rootContext;
    }
}

export default new FamousInitializer();