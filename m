Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ZrUL-00018M-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 11:13:25 +0100
Message-Id: <5.1.0.14.0.20010823052444.00a6f488@mail.spewey.com>
Date: Thu, 23 Aug 2001 05:33:27 -0500
To: Luke <luke_epsilon@yahoo.com>,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: ZFMicro MachZ success with the Am29LV065D 
In-Reply-To: <20010823060822.87865.qmail@web13609.mail.yahoo.com>
References: <20010814040820.37578.qmail@web13607.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 11:08 PM 8/22/2001 -0700, Luke wrote:

>As I have it right now, linux loads and I see:
>
>physmap flash device: 800000 at 10000000
>Physically mapped flash: Found 1 x8 devices at 0x0 in 8-bit mode
>  Amd/Fujitsu Extended Query Table v1.1 at 0x0040
>number of CFI chips: 1
>mtd: Giving out device 0 to Physically mapped flash
>
>and if I cat /proc/mtd I see
>
>dev:      size        erasesize          name
>mtd0    00800000      00010000        "physically mapped flash"
>
>
>I tried a few different things and haven't got the second chip recognized 
>yet.  I tried setting
>the size (in the make xconfig dialog) to 16M and setting the MemWindow1 
>base address register to
>8Mbytes (with MemWindow1 page register 0 and size 8Mbytes) - but that 
>didn't work.  Do I need to
>do something else to get MTD to work with multiple flash devices?

What "map" driver are you using. If it's the generic "physmap" one 
(physmap.c), then you need to loop in
the detection code in the driver for each physical chip on your board 
(actually each physical chip on your board
that is to be mapped as a separate MTD device- so if you have two physical 
8bit chips on a 16bit bus (interleave of 2), you don't need to loop).

See the sc520cdp.c file as an example.


>I know this is long and drawn out and that I may be rambling from my 
>sleepiness - I do appreciate
>the help I have been given.  I did have a JFFS2 question or two also.
>
>I want to mount these 2 flash devices (well all of one and half of the 
>other since the other half
>is filled with the kernel and initrd, this seems like it should be 
>straightforward by messing with
>the MemWin0 size register and page register to point to the right portion 
>of the first flash
>device).
>
>I don't have any image - I just want these 2 flash chips to be initially 
>empty file systems where
>I can write data that is collected from some atmospheric sensors hooked up 
>to the embedded system.
>  Do I need mkfs.jffs on the embedded system or can I use it on my 
> development system and then
>transfer it over?

You don't need mkfs.jffs on your end system. This guy is only used i you 
want to go the mkiso fs route- i.e.
build a binary image off line then burn it in the mtd device (think of 
mkfs.jffs2 -> mkisofs and copying to the mtd device as cdrecord).

I personally never use this program- as JFFS2 also supports populating the 
fs "by hand"- i.e. make sure that the mtd device is completely erased (the 
first time), then mount the JFFS2 fs. This will result in a blank JFFS2 fs. 
Then just copy the files over that you need.
To make further copies (for e.g. in production), just "dd" the entire mtd 
image out to a file. You can then use this file as a binary image to 
initialize other systems.

Vipin

P.S. Once you have successfully detected your flash as an mtd device, could 
you please make an entry into my mtd flash device database at:
http://www.embeddedlinuxworks.com/db.html
