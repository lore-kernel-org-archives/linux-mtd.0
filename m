Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13EEGF-0007dg-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 18:00:55 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13EEGC-0007dC-00
	for mtd@infradead.org; Mon, 17 Jul 2000 18:00:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9EFD6@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9EFD6@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: Compiling MTD in the kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jul 2000 18:00:42 +0100
Message-ID: <3372.963853242@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
> 	Are you using the 2.2.16 patch of the 2000/07/04 build?  I am having
> a similar problem, and it looks like the patch does not set up the
> make files properly to handle the jffs stuff.  At least, the jffs is
> not an option with 'make menuconfig' even though the other MTD  stuff
> is.

Strange. It should be.

--- fs/Config.in        2000/06/07 10:00:29     1.5
+++ fs/Config.in        2000/06/26 07:30:01
@@ -59,6 +59,7 @@
   if [ "$CONFIG_EFS_FS" != "n" ]; then
     define_bool CONFIG_SGI_PARTITION y
   fi
+  tristate 'Journalling Flash filesystem (JFFS) support (experimental)' CONFIG_JFFS_FS
 fi
 
 if [ "$CONFIG_NET" = "y" ]; then


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
