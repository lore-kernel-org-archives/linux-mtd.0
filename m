Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SMR7-0001Ox-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 17:34:33 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13SMR5-0001Or-00
	for mtd@infradead.org; Fri, 25 Aug 2000 17:34:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F080@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F080@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: Simple Newbie Questions for MTD and JFFS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 Aug 2000 17:34:28 +0100
Message-ID: <28611.967221268@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
>  If I copy a file directly into the mount point, it doesn't show up
> the next time I mount the flash.  If I use mkfs.jffs to create an
> image and copy that into flash, I can see the image but I can't access
> the files that I put into it. 

That's odd. Are you 100% sure that the physical write support for your 
flash chips is working? When you make an image with mkfs.jffs, how are you 
writing that to the flash?

You _are_ using the latest version from CVS, aren't you?


mark.langsdorf@amd.com said:
> I guess I'm asking if there's any documentation or hints on how to use
> the files in the util/ directory, 

Erase a single erase block in a device:
	erase <device> <offset>
e.g.:	erase /dev/mtd0 0

Erase a whole device:
	eraseall <device>
e.g.:	eraseall /dev/mtd0

Load an image into a device:
	doc_loadbios <device> <image>
e.g.:	doc_loadbios /dev/mtd0 myimage.jffs
 (note: This doesn't erase to the end of the device, only as far as is 
necessary to load the image. Use 'eraseall' beforehand if necessary)

> as well as how mtd and jffs are supposed to work once they've mounted. 

Once JFFS is mounted, it should just work. It does for me.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
