Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zcpe-0002Yg-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 18:29:54 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zcpd-0002Ya-00
	for mtd@infradead.org; Thu, 14 Sep 2000 18:29:53 +0100
From: "Alex J Lennon" <ajlennon@arcom.co.uk>
To: <mtd@infradead.org>
Subject: RE: CFI detection of x16 chips in x8 mode 
Date: Thu, 14 Sep 2000 18:28:49 +0100
Message-ID: <NEBBLLDBMLGONJHPHHEKOENBCHAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <E13Zc8g-0005Fe-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> The problem with booting off JFFS is that until Linux has loaded, 
> the only 
> means of accessing the flash is via VBF... which doesn't 
> understand JFFS. And 
> once Linux has loaded, it doesn't understand VBF.
> I've managed to get a dual-personality system up and running now. 
> It boots 
> ROM-DOS off the VBF partition; then I load Linux with loadlin, 
> and it boots 
> off the network. Once the modules are loaded I can access the 
> JFFS partition.

A backwards step perhaps, but its entirely feasible to hook INT19h
and load the kernel out of flash directly - no need for filesystem 
support in the loader.

Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
