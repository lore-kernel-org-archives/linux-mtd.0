Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1432JY-00057B-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 20:34:20 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1432IV-000571-00
	for mtd@infradead.org; Mon, 04 Dec 2000 20:33:36 +0000
Date: Mon, 4 Dec 2000 15:32:59 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: <mark.langsdorf@amd.com>
cc: <mtd@infradead.org>
Subject: Re: Odd behavior of JFFS with AMD chips - kernel panic!
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F20D@txexmta8.amd.com>
Message-ID: <Pine.LNX.4.30.0012041525460.16670-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 4 Dec 2000 mark.langsdorf@amd.com wrote:

> I'm still working on diagnosising what's causing my problems
> with JFFS and MTD.
>
> I built a version of the Dec 3rd MTD code for my device, and
> booted the kernel.
>
> As far as I can tell, my device works fine with the char interface,
> and I was able to build a file system image and put it in flash
> using 'cat Flash.img > /dev/mtd2'
>
> mounting the flash system with 'mount -t jffs /dev/mtdblock2 /tst'
> also seemed to work.

Beware that /dev/mtd2 (char 90:2) and /dev/mtdblock2 (block 31:2) aren't
pointing to the same MTD object...

David --> This is really really misleading and non-intuitive.  Is there a
good reason to have a separate device node only for read-only access?


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
