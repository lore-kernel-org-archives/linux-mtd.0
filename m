Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173oBg-00066H-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 May 2002 02:18:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0205031647020.8561-100000@localhost.localdomain> 
References: <Pine.LNX.4.44.0205031647020.8561-100000@localhost.localdomain> 
To: Paul <paul@oz.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Advice sought: new SmartMedia driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 04 May 2002 02:18:05 +0100
Message-ID: <10553.1020475085@redhat.com>
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

paul@oz.net said:
> [1] The NAND routine nand_scan(), called during module initialization,
>     seems to assume that a Flash memory device is always present.  If
>     not, nand_scan() quits and unloads the kernel module. 

nand_scan() will only return -1 if it finds a device is not present. If 
nand_scan is referenced by your driver module, then the nand.o module will 
not be unloaded unless your driver module has allowed itself to be unloaded.

>     I have a SmartMedia slot where the SmartMedia memory card may or 
>     may not be present at a given time, and may be yanked in/out at 
>     any time.  How can I best handle this "hot plug" situation without
>     disrupting much of the existing MTD code?

When you detect that a new card has been inserted, you call nand_scan to
probe the chip and register an MTD device. When you detect that a card has
been _removed_, you deregister it and, er, complain at me that there's no
reference count on it so you can't know if you can just free the structures
associated with it. Let's deal with that one a little later :)


> [2] I had to supply my own nand_cmd() via "this->cmdfunc" because I don't 
>     have direct control of the ALE/CLE/NCE lines, and I don't know
>     precisely how to control those lines through the controller chip.
>     Also, I found that I needed to insert a 1ms delay (udelay(1000))
>     after resetting the Flash memory chip; otherwise subsequent operations
>     (e.g. reading the Flash chip ID) didn't seem to work. 

Thomas?


paul@oz.net said:
> [3] One of the things I'd like to do is to be able to read photos
>     taken on my digital camera, which uses SmartMedia and a FAT12-like
>     filesystem like many other cameras & MP3 players.  However, I'd
>     like to avoid writing a FAT12 Translation Layer for MTD, if possible.
>     Currently, the SmartMedia image isn't recognized as any FAT filesystem:

Ignore FAT. SmartMedia implements a block device by having a kind of 
pseudo-filesystem on the flash, similar in concept to FTL and NFTL. That 
pseudo-filesystem or translation layer is what needs to be implemented, and 
I think there's some support for this in the sddr-09 driver, but it needs 
extracting and persuading to work on a generic NAND-based MTD device.

On top of that block device, you'll find a FAT file system, but I believe 
you could use any normal file system on top of the emulated block device. 
Not that your camera would like it much.

More information at 
	http://www.ssfdc.or.jp/spec/english/index.htm
	http://samsungelectronics.com/semiconductors/Flash/technical_data/application_notes/application_notes.htm

--
dwmw2
