Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13yBSW-0001Mg-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 11:19:32 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13yBSR-0001Ma-00
	for mtd@infradead.org; Tue, 21 Nov 2000 11:19:30 +0000
Message-ID: <01C053B4.B7C47C60@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: 'MTD List' <mtd@infradead.org>
Subject: Re: 2.4 stuff.
Date: Tue, 21 Nov 2000 12:15:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I had to make a few changes to the inter_module stuff to get 
MTD working for uClinux.The changes are explained below. 
They are not yet comitted, please let me know what you think.

-Erwin

* map_rom.c
There is a im_name member used in map_rom.c, line 51. Has this
been added by mistake? In mtd.h, there's no such member.

* compatmac.h:
For 2.0, the inter_module_* functions are defined as empty macros
if CONFIG_MODULES is not defined. If CONFIG_MODULES is defined
(for 2.0), compilation is stopped with #error saying that it's not possible
to use MTD in 2.0 kernels with module support enabled.

* I have removed the "static" for the cfi_cmdset_0001/0002 probe functions.

* I have added a switch statement for compilation without module support
  in cfi_probe.c:

+#ifdef CONFIG_MODULES
        sprintf(probename, "cfi_cmdset_%4.4X", type);

        probe_function = inter_module_get_request(probename, probename);
@@ -743,6 +747,20 @@
                (*probe_function)(map, primary, base);
                return;
        }
+#else
+       switch(type){
+#ifdef CONFIG_MTD_CFI_INTELEXT
+       case 0x0001:
+               cfi_cmdset_0001(map,primary,base);
+               return;
+#endif
+#ifdef CONFIG_MTD_CFI_AMDSTD
+       case 0x0002:
+               cfi_cmdset_0002(map,primary,base);
+               return;
+#endif
+       }
+#endif /* CONFIG_MODULES */




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
