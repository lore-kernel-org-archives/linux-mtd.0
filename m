Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12qAxH-0001RT-00
	for mtd-list@infradead.org; Fri, 12 May 2000 09:37:55 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12qAxG-0001RN-00
	for mtd@infradead.org; Fri, 12 May 2000 09:37:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0005111346170.12018-100000@phiggins.transzap.com> 
References: <Pine.LNX.4.21.0005111346170.12018-100000@phiggins.transzap.com> 
To: Patrick Higgins <phiggins@transzap.com>
Cc: mtd@infradead.org, syslinux@linux.kernel.org
Subject: Re: DOC firmware update with PXELinux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 12 May 2000 09:43:31 +0100
Message-ID: <32735.958121011@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


phiggins@transzap.com said:
>  So, I believe I need to update the firmware on the DOC as specified
> in the M-Systems user guide.  However, I have no easy way to boot DOS
> on this machine, other than using PXE (it's diskless).  Has anyone
> gotten this to work, and might have some tips? 

Back when I was trying to reverse-engineer the DiskOnChip drivers, I used 
to run it in dosemu, having configured dosemu to give direct access to the 
memory window of the DiskOnChip. You should find that works. Best to make 
sure you have a backup plan first, though.

Or you could get an ISA evaluation board, pull the DiskOnChip out of your 
device and use the eval board to plug it into a 'real' PC.

It's also possible to use the MTD drivers to write the firmware to the 
device. The doc_loadbios program will do that for you. The only 
complication is that the .exb files shipped by M-Systems aren't a straight 
image of what to put on the flash; it should be fairly simple to convert 
them though.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
