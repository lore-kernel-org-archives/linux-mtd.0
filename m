Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12poSu-0007im-00
	for mtd-list@infradead.org; Thu, 11 May 2000 09:37:04 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12poSt-0007ig-00
	for mtd@infradead.org; Thu, 11 May 2000 09:37:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0005101335290.1556-100000@phiggins.transzap.com> 
References: <Pine.LNX.4.21.0005101335290.1556-100000@phiggins.transzap.com> 
To: Patrick Higgins <phiggins@transzap.com>
Cc: mtd@infradead.org
Subject: Re: Initrd? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 May 2000 09:42:36 +0100
Message-ID: <28657.958034556@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


phiggins@transzap.com said:
> Has anyone tried to get the M-Systems driver to work with initrd,
> enabling a Disk on Chip to be the root device without (illegally)
> statically linking the driver? 

A reasonable short term solution, but in smaller embedded devices, the 
extra code & data required for the ramdisk and initrd support are quite a 
significant overhead which it would be nice to render unnecessary.

phiggins@transzap.com said:
>  Would the bootloader require special knowledge of Disk on Chip to do
> this?

Not if you still have the M-Systems' firmware in the DiskOnChip, which 
emulates the BIOS disk calls. Which you probably do.

phiggins@transzap.com said:
>  I would like to use the free drivers that you are developing, but I'm
> afraid they won't be completed in time for my needs.  Any suggestions?

Help with the code and/or testing? :) I'm doing my best to arrange matters
so that I get to spend 100% of my time on MTD, but it's taking me a while to
manage that - for some reason, the CEO wants me to spend time on things 
which are immediately relevant to company business :)





--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
