Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12neGy-0003dh-00
	for mtd-list@infradead.org; Fri, 05 May 2000 10:19:48 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12neGx-0003db-00
	for mtd@infradead.org; Fri, 05 May 2000 10:19:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10005051006260.1087-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10005051006260.1087-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org, torvalds@transmeta.com,
    linux-kernel@vger.rutgers.edu
Subject: [PATCH] Re: try_inc_mod_count not exported to modules in 2.3 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 May 2000 10:24:11 +0100
Message-ID: <32604.957518651@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
> I have some problems using the latest mtd cvs as modules:
>
> insmod mtdblock.o
> mtdblock.o: unresolved symbol try_inc_mod_count 

Don't tell me. Tell Linus.

Index: kernel/ksyms.c
===================================================================
RCS file: /cvs/linux/kernel/ksyms.c,v
retrieving revision 1.3.2.34
diff -u -w -r1.3.2.34 ksyms.c
--- kernel/ksyms.c	2000/04/12 09:11:55	1.3.2.34
+++ kernel/ksyms.c	2000/05/05 09:23:00
@@ -80,6 +80,7 @@
 
 #ifdef CONFIG_MODULES
 EXPORT_SYMBOL(get_module_symbol);
+EXPORT_SYMBOL(try_inc_mod_count);
 #endif
 EXPORT_SYMBOL(get_option);
 EXPORT_SYMBOL(get_options);


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
