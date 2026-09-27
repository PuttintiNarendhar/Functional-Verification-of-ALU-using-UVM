class my_reg_new_seq extends uvm_sequence;
  `uvm_object_utils(my_reg_new_seq)
  
      
  function new (string name = "reg_new_seq");
    super.new(name);
  endfunction
  
  my_reg_model reg_model;
  
  task body;
    
    uvm_status_e status;
    
    uvm_reg_data_t incoming;
    uvm_reg_data_t reset_val;
    uvm_reg_data_t desired_val;
    uvm_reg_data_t mirrored_val;
    logic [31:0] rval;
    logic [31:0] pval;
    
    if(starting_phase != null)
      starting_phase.raise_objection(this);
    /*
    //Get the reset value of the CR1 register using get_reset() 
    reset_val = reg_model.cr1.get_reset();
    `uvm_info("reg_seq, CR1, reset", $sformatf("reset value of CR1: %h", reset_val), UVM_MEDIUM)
    
    //set the desired value of the CR1 register using set() but not touch the DUT
    reg_model.cr1.set(32'h1F2F3F4F);
    
    desired_val = reg_model.cr1.get();
    `uvm_info("reg_seq, CR1, after set", $sformatf("desired value of CR1: %h", desired_val), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr1.get_mirrored_value();//what we think that DUT will have
    `uvm_info("reg_seq, CR1, get_mirrored_value", $sformatf("mirrored value of CR1: %h", mirrored_val), UVM_MEDIUM)
    
    reg_model.cr1.update(status);//update only issues/applies(register write) a value to the DUT when both desired_val and mirrored_val are different
    #30;
    mirrored_val = reg_model.cr1.get_mirrored_value();
    `uvm_info("reg_seq, CR1, get_mirrored_value after update", $sformatf("mirrored value of CR1: %h", mirrored_val), UVM_MEDIUM)
    
    desired_val = reg_model.cr1.get();
    `uvm_info("reg_seq, CR1, after update", $sformatf("desired value of CR1: %h", desired_val), UVM_MEDIUM)
    
    reg_model.cr1.update(status);
    
    reg_model.cr1.write(status, .value(32'hA5A5BCBC), .parent(this));
    assert( status == UVM_IS_OK);
    
    #30;
    desired_val = reg_model.cr1.get();
    `uvm_info("reg_seq, CR1, after write", $sformatf("desired value of CR1: %h", desired_val), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr1.get_mirrored_value();
    `uvm_info("reg_seq, CR1, get_mirrored_value after write", $sformatf("mirrored value of CR1: %h", mirrored_val), UVM_MEDIUM)
    
    reg_model.cr1.read(status, .value(incoming), .parent(this));
    assert( status == UVM_IS_OK);
    assert( incoming == 32'hA5A5BCBC)
      else `uvm_warning("", $sformatf("incoming = %4h, expected = 32'hA5A5BCBC", incoming))
    
        
        
    reg_model.cr1.read(status, .value(rval), .parent(this), .path(UVM_BACKDOOR));
    `uvm_info("reg_seq, CR1, after BACKDOOR read", $sformatf("read value of CR1: %h", rval), UVM_MEDIUM)
    
    reg_model.cr1.peek(status, .value(pval), .parent(this));
    `uvm_info("reg_seq, CR1, after peek", $sformatf("real value of CR1: %h", pval), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr1.get_mirrored_value();//always mirrored_value is updated with the most recent read
    `uvm_info("reg_seq, CR1, get_mirrored_value after peek", $sformatf("mirrored value of CR1: %h", mirrored_val), UVM_MEDIUM)
    
    reg_model.cr1.poke(status, .value(32'hFEDCBA98), .parent(this));//it is applied to change the register value directly in the DUT through the Backdoor without any transactions between the sequencer and the driver
    reg_model.cr1.peek(status, .value(pval), .parent(this));
    `uvm_info("reg_seq, CR1, after poke", $sformatf("real value of CR1: %h", pval), UVM_MEDIUM)
    
    desired_val = reg_model.cr1.get();
    `uvm_info("reg_seq, CR1, after poke", $sformatf("desired value of CR1: %h", desired_val), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr1.get_mirrored_value();
    `uvm_info("reg_seq, CR1, get_mirrored_value after poke", $sformatf("mirrored value of CR1: %h", mirrored_val), UVM_MEDIUM)
    
    reg_model.cr1.mirror(.status(status), .check(UVM_CHECK));//to get the mirrored_vlaue after checking the real value in the DUT
    mirrored_val = reg_model.cr1.get_mirrored_value();
    `uvm_info("reg_seq, CR1, get_mirrored_value after mirror", $sformatf("mirrored value of CR1: %h", mirrored_val), UVM_MEDIUM)
    
*/
    
    //Get the reset value of the CR2 register using get_reset() 
    reset_val = reg_model.cr2.get_reset();
    `uvm_info("reg_new_seq, CR2, reset", $sformatf("reset value of CR2: %h", reset_val), UVM_MEDIUM)
    
    //set the desired value of the CR2 register using set() but it not touch/change the DUT
    reg_model.cr2.set(32'h1E2E3E4E);
    
    desired_val = reg_model.cr2.get();//it gives the value that we had set
    `uvm_info("reg_new_seq, CR2, after set", $sformatf("desired value of CR2: %h", desired_val), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr2.get_mirrored_value();//what we think that the DUT will have or to get the actual value in DUT by the predictor
    `uvm_info("reg_new_seq, CR2, get_mirrored_value", $sformatf("mirrored value of CR2: %h", mirrored_val), UVM_MEDIUM)
    
    reg_model.cr2.update(status);//update will issues/applies(register write) a value to the DUT only when both desired_val and mirrored_val are different
    #30;
    //to check whether the register value is updated or not by looking the mirrored_value and desired value that is both gives same value
    mirrored_val = reg_model.cr2.get_mirrored_value();
    `uvm_info("reg_new_seq, CR2, get_mirrored_value after update", $sformatf("mirrored value of CR2: %h", mirrored_val), UVM_MEDIUM)
    
    desired_val = reg_model.cr2.get();
    `uvm_info("reg_new_seq, CR2, after update", $sformatf("desired value of CR2: %h", desired_val), UVM_MEDIUM)
    
    reg_model.cr2.update(status);//nothing changes or no transactions between sequencer and driver if everything is constant
    
    reg_model.cr2.write(status, .value(32'hFFFFAAAA), .parent(this));
    assert( status == UVM_IS_OK);//to see the transactions between sequencer and driver by doing register write in DUT
    
    #30;
    desired_val = reg_model.cr2.get();
    `uvm_info("reg_new_seq, CR2, after write", $sformatf("desired value of CR2: %h", desired_val), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr2.get_mirrored_value();
    `uvm_info("reg_new_seq, CR2, get_mirrored_value after write", $sformatf("mirrored value of CR2: %h", mirrored_val), UVM_MEDIUM)
    
    //to read the register value in DUT and also validating previous write operation by checking the register value with a different value
    reg_model.cr2.read(status, .value(incoming), .parent(this));
    assert( status == UVM_IS_OK);
    assert( incoming == 32'hFFFFAAAA)
      else `uvm_warning("", $sformatf("incoming = %4h, expected = 32'hFFFFAAAA", incoming))
    
        
    //to get the register content by using read() through Backdoor and it shows no transations are issued between sequencer and driver 
    reg_model.cr2.read(status, .value(rval), .parent(this), .path(UVM_BACKDOOR));
    `uvm_info("reg_new_seq, CR2, after BACKDOOR read", $sformatf("read value of CR2: %h", rval), UVM_MEDIUM)
    
    //to get the register value directly by using peek() and also it shows no transations are issued between sequencer and driver and no need of mentioning explicit link to backdoor 
    reg_model.cr2.peek(status, .value(pval), .parent(this));
    `uvm_info("reg_new_seq, CR2, after peek", $sformatf("real value of CR2: %h", pval), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr2.get_mirrored_value();//always mirrored_value is updated with the most recent read
    `uvm_info("reg_new_seq, CR2, get_mirrored_value after peek", $sformatf("mirrored value of CR2: %h", mirrored_val), UVM_MEDIUM)
    
    reg_model.cr2.poke(status, .value(32'hFEDCBA98), .parent(this));//it is applied to change the register value directly in the DUT through the Backdoor without any transactions between the sequencer and the driver
    reg_model.cr2.peek(status, .value(pval), .parent(this));
    `uvm_info("reg_new_seq, CR2, after poke", $sformatf("real value of CR2: %h", pval), UVM_MEDIUM)
    
    
    //check whether desired_val and mirrored_val are updated or not after poke() 
    desired_val = reg_model.cr2.get();
    `uvm_info("reg_new_seq, CR2, after poke", $sformatf("desired value of CR2: %h", desired_val), UVM_MEDIUM)
    
    mirrored_val = reg_model.cr2.get_mirrored_value();
    `uvm_info("reg_new_seq, CR2, get_mirrored_value after poke", $sformatf("mirrored value of CR2: %h", mirrored_val), UVM_MEDIUM)
    
    //mirror() will gives the register value by checking it in the DUT that is it does the read operation or by transactions between driver and DUT
    reg_model.cr2.mirror(.status(status), .check(UVM_CHECK));//to get the mirrored_vlaue after checking the real value in the DUT
    mirrored_val = reg_model.cr2.get_mirrored_value();
    `uvm_info("reg_new_seq, CR2, get_mirrored_value after mirror", $sformatf("mirrored value of CR2: %h", mirrored_val), UVM_MEDIUM)
    
    if(starting_phase != null)
      #20;
      starting_phase.drop_objection(this);
    
  endtask : body
    
	

endclass: my_reg_new_seq

