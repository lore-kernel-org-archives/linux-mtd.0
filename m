Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13yBob-0001SL-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 11:42:21 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13yBoZ-0001SF-00
	for mtd@infradead.org; Tue, 21 Nov 2000 11:42:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01C053B4.B7C47C60@smithwicks.softsys.co.at> 
References: <01C053B4.B7C47C60@smithwicks.softsys.co.at> 
To: Erwin Authried <eauth@softsys.co.at>
Cc: "'MTD List'" <mtd@infradead.org>
Subject: Re: 2.4 stuff. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Nov 2000 11:42:14 +0000
Message-ID: <12621.974806934@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


eauth@softsys.co.at said:
>  * map_rom.c There is a im_name member used in map_rom.c, line 51. Has
> this been added by mistake? In mtd.h, there's no such member. 

Mea Culpa. Should be map->im_name, not mtd->im_name. Fixed. Thanks.


eauth@softsys.co.at said:
> * compatmac.h: For 2.0, the inter_module_* functions are defined as
> empty macros if CONFIG_MODULES is not defined. If CONFIG_MODULES is
> defined (for 2.0), compilation is stopped with #error saying that it's
> not possible to use MTD in 2.0 kernels with module support enabled.

Careful not to make the #error break stuff that does actually work. 
If you're compiling in all the stuff that you're actually going to need, 
but also have CONFIG_MODULES, it should all work, shouldn't it?

It might be better to define the inter_module_get() functions to return 
NULL but printk a warning that they've been used - which should explain to 
the user why it's not actually working for them.

eauth@softsys.co.at said:
>  * I have removed the "static" for the cfi_cmdset_0001/0002 probe
> functions. 

OK.

eauth@softsys.co.at said:
>  * I have added a switch statement for compilation without module
> support in cfi_probe.c: 

Looks sensible, and could also help to get rid of the ugly link order 
dependencies that the inter_module_xxx stuff has introduced. I've modified 
it to:

	switch(type){
#ifdef CONFIG_MTD_CFI_INTELEXT
	case 0x0001:
		cfi_cmdset_0001(map,primary,base);
		return;
#endif
#ifdef CONFIG_MTD_CFI_AMDSTD
	case 0x0002:
		cfi_cmdset_0002(map,primary,base);
		return;
#endif
	default:
#ifdef CONFIG_MODULES
		sprintf(probename, "cfi_cmdset_%4.4X", type);
		
		probe_function = inter_module_get_request(probename, probename);
		if (probe_function) {
			(*probe_function)(map, primary, base);
			return;
		}	
#endif
	}


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
