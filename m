Received: from gk2-ext.lineo.com ([64.50.107.253] helo=thor.lineo.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1709tV-0005rR-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 00:40:21 +0100
Message-ID: <3CC5EB96.C1D137E4@Rikers.org>
Date: Tue, 23 Apr 2002 17:17:42 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: Albert Rybalkin <albertr@forbes.net>
CC: linux-mtd@lists.infradead.org
Subject: Re: mtd partitions on Sharp Zaurus
References: <20020423190845.486244B001@iral.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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

The base Zaurus uses a readonly mtd driver called mtdrom. It also
partitions ram into a normal area and a mtdram area which is used for
/home. /home is remounted on soft boot allowing data to be preserved.

The latest kernel releases include proper read/write mtd flash drivers
but incomplete partition information imho. jffs2 will work with an
alternate kernel. The OpenZaurus project is configured to use jffs2
instead of cramfs.

http://OpenZaurus.SourceForge.net/

I suggest you start with the kernel they are useing which you can build
from the buildroot system in CVS:

http://sourceforge.net/cvs/?group_id=43045

The bootloader used on the Zaurus is a modified version of Angel. It
uses multiple partitions as described on:

http://www.btinternet.com/~p.flinders/sl-5000d/romimage-layout.html

128k - angel
128k - cf updater
512k - diagnostics
1M - kernel
14M+128k - root filesystem
128k - partition info

It would be a fairly simple matter to convert that over to:

128k - blob (including CF updater, diagnostics, and partition table)
16M-128k - rootfs (including kernel and modules)

if the blob team had access to a zaurus with jtag, but sharp has not
released this information. I suspect the pins on the back of a zaurus
next to the battery include jtag pins.

Ask your Sharp reps for this feature if you are interested in fitting
more data in the internal flash.

Albert Rybalkin wrote:
> 
> Hi,
> 
> I'm new to linux and mtd, sorry if my post is misdirected...
> 
> I have a Sharp Zaurus PDA with 16MB sharp flash rom. There's a linux
> mtd chip driver `coolie_sharp.c` written by Sharp/Lineo for this
> flash chip (there's two 8MB chips actually for total of 16MB in there).
> This PDA comes with linux 2.4.6 kernel and initrd
> that has root partition mounted as cramfs. Both zImage and initrd can
> be flashed into the rom separately. Apparently, rom has some kind
> of partitioning already. There's a boot loader in the flash rom, no
> separate program to perform flashing.
> 
> I have source code for most of the kernel (save for couple of
> closed-source drivers for which I have binary KLMs). But I don't
> have source code or any documentation on sharp boot loader/flash
> program.
> 
> With the sharp stock kernel I have a couple of mtd devices, i.e.:
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00020000 "mtdrom"
> mtd1: 02200000 00000400 "mtdram"
> #
> 
> Also, I have /dev/collie-fl that I think is a flash chip device.
> 
> I've recompiled the kernel to remove cramfs and use jffs2 instead
> for a root partition.
> 
> But I'm in a complete dark as of how I need to partition flash rom
> chip and map its partions to mtd block devices. Is there any user
> space program exist that can enumerate and display existing partitions
> which are already in the flash? Is there any documentation I can read
> on how to partition flash?
> Thanks,
>  -albertr
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
