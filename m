Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wgae-0002Hr-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 08:09:44 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13wgaZ-0002H6-00
	for mtd@infradead.org; Fri, 17 Nov 2000 08:09:39 +0000
Message-ID: <01C05075.8E6A49E0@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: block device for 2.0
Date: Fri, 17 Nov 2000 09:05:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Nicolas Pitre[SMTP:nico@cam.org] wrote:
> 
> Why not the other way around, i.e. CONFIG_MTD_BLOCK and CONFIG_MTD_BLOCK_RO?
> The read-only one is more the "special case" than the read-write one...
> 
> 
> Nicolas
> 
Ok., I have modified it this way. I don't know in detail what kind of changes are planned
for module support, thus I'd like to know if it's ok. to modify cfi_probe.c to be able to
compile without module support before I commit that:

-Erwin


#ifdef CONFIG_MODULES
        sprintf(probename, "cfi_cmdset_%4.4X", type);
        probe_function = (void *)get_module_symbol(NULL, probename);
        if (!probe_function) {
                request_module(probename);

                probe_function = (void *)get_module_symbol(NULL, probename);
        }

        if (probe_function) {
                (*probe_function)(map, primary, base);
                put_module_symbol((unsigned long)probe_function);
                return;
        }
#else
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
        }
#endif  /* CONFIG_MODULES */






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
