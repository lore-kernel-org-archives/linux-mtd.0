Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKOqa-00068E-Uu
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2003 21:17:49 +0000
Received: from localhost (nico@localhost)
	by xanadu.home (8.11.6/8.11.6) with ESMTP id hADLGOd11693
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2003 16:16:24 -0500
Date: Thu, 13 Nov 2003 16:16:24 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0311131607230.12180-300000@xanadu.home>
MIME-Version: 1.0
Content-ID: <Pine.LNX.4.44.0311131607231.12180@xanadu.home>
Content-Type: MULTIPART/Mixed; BOUNDARY=------------000806010609010805060004
Subject: RedBoot partition support, was re: 2.6.0-test9-rmk1 ioremap() oops
 (with lubbock-flash) (fwd)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--------------000806010609010805060004
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; FORMAT=flowed
Content-ID: <Pine.LNX.4.44.0311131607232.12180@xanadu.home>


---------- Forwarded message ----------
Date: Thu, 13 Nov 2003 08:37:10 -0800
From: David Brownell <david-b@pacbell.net>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: 2.6.0-test9-rmk1 ioremap() oops (with lubbock-flash)

>> This patch should fix it.
> 
> Indeed it does -- though without KMOD, that particular modprobe
> needed a bit of manual assistance to finish.

And for that matter, all the mtd map code expects a module
called "RedBoot" instead of "redboot".  Rather than expect
them all to change, this patch seems preferable.

- Dave



--------------000806010609010805060004
Content-Type: TEXT/PLAIN; NAME=Diff
Content-ID: <Pine.LNX.4.44.0311131607233.12180@xanadu.home>
Content-Description: 
Content-Disposition: INLINE; FILENAME=Diff

--- 1.4/drivers/mtd/redboot.c	Wed May 28 08:01:05 2003
+++ edited/drivers/mtd/redboot.c	Thu Nov 13 08:32:14 2003
@@ -189,6 +189,7 @@
 module_init(redboot_parser_init);
 module_exit(redboot_parser_exit);
 
+MODULE_ALIAS("RedBoot");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Red Hat, Inc. - David Woodhouse <dwmw2@cambridge.redhat.com>");
 MODULE_DESCRIPTION("Parsing code for RedBoot Flash Image System (FIS) tables");

--------------000806010609010805060004
Content-Type: TEXT/PLAIN; CHARSET=us-ascii
Content-ID: <Pine.LNX.4.44.0311131607234.12180@xanadu.home>
Content-Description: 
Content-Disposition: INLINE

-------------------------------------------------------------------
Subscription options: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ/Etiquette:       http://www.arm.linux.org.uk/armlinux/mailinglists.php


--------------000806010609010805060004--
