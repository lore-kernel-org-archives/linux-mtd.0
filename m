Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GCQmN-0005qX-Vq
	for linux-mtd@lists.infradead.org; Sun, 13 Aug 2006 20:58:20 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J3Y00D84QONB7@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Aug 2006 09:57:59 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPSA id <0J3Y00FSRQOM9W@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Aug 2006 09:57:59 +0900 (KST)
Date: Mon, 14 Aug 2006 09:58:15 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: RE: linux-mtd Digest, Vol 41, Issue 17
In-reply-to: <mailman.3.1155484808.5978.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
Message-id: <001a01c6bf3c$b9fa9d30$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
linux-mtd-request@lists.infradead.org
Sent: Monday, August 14, 2006 1:00 AM
To: linux-mtd@lists.infradead.org
Subject: linux-mtd Digest, Vol 41, Issue 17

Send linux-mtd mailing list submissions to
	linux-mtd@lists.infradead.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.infradead.org/mailman/listinfo/linux-mtd
or, via email, send a message with subject or body 'help' to
	linux-mtd-request@lists.infradead.org

You can reach the person managing the list at
	linux-mtd-owner@lists.infradead.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-mtd digest..."


Today's Topics:

   1. Re: [RFC] Adding MTD to device tree  (Wolfgang Denk)
   2. Re: [RFC] Adding MTD to device tree  (Wolfgang Denk)
   3. OneNAND - Cannot mount jffs2 partition (John)
   4. Re: OneNAND - Cannot mount jffs2 partition (Artem B. Bityutskiy)


----------------------------------------------------------------------

Message: 1
Date: Sun, 13 Aug 2006 02:20:40 +0200
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [RFC] Adding MTD to device tree 
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,	Arnd Bergmann
	<arnd@arndb.de>, Milton Miller <miltonm@bga.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	linuxppc-embedded@ozlabs.org
Message-ID: <20060813002040.DFA8D352660@atlas.denx.de>
Content-Type: text/plain; charset=ISO-8859-1

In message <44DE4F84.9030802@ru.mvista.com> you wrote:
> 
>     Hm, MTD is a short for "memory type device", what Linux has to do with
it 

Memory Technology Device.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
We are Microsoft. Unix is irrelevant. Openness is futile.  Prepare to
be assimilated.



------------------------------

Message: 2
Date: Sun, 13 Aug 2006 02:20:51 +0200
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [RFC] Adding MTD to device tree 
To: Milton Miller <miltonm@bga.com>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	linuxppc-dev@ozlabs.org,	linux-mtd@lists.infradead.org, Arnd
Bergmann
	<arnd@arndb.de>,	linuxppc-embedded@ozlabs.org
Message-ID: <20060813002051.3237E352660@atlas.denx.de>
Content-Type: text/plain; charset=ISO-8859-1

In message <91f1d0619c8ff22cf70404059d514857@bga.com> you wrote:
> 
> Second, no, memory type devices are not specific to Linux.  But the 
> term MTD
> probably is[1].  If you don't want to call it flash, then call it rom.  

No, it is not. It has been used by other RTOS as well,  and  probably
before Linux.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
A conservative is a man who believes that nothing should be done for
the first time.                                   - Alfred E. Wiggam



------------------------------

Message: 3
Date: Sun, 13 Aug 2006 11:24:35 +0100 (BST)
From: John <john@arrows.demon.co.uk>
Subject: OneNAND - Cannot mount jffs2 partition
To: <linux-mtd@lists.infradead.org>
Message-ID:
	<Pine.LNX.4.33.0608131059220.32638-100000@arrows.demon.co.uk>
Content-Type: TEXT/PLAIN; charset=US-ASCII

I am trying to use a OneNAND device fitted to a MIPS board.
I am the first person to use this device on this board.

And I am fairly new to the MTD world. My problems may be generic to MTD
rather than being OneNAND specific.

My Kernel is based on Linux 2.6.12 patched with the OneNAND code from
Linux 2.6.16.

I am running little endian.
My mtd-utils are from October 2005.


Questions:
  Is this a suitable pair of commands?
   $ flash_eraseall -j /dev/mtd5
   $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand

  Would they work on an ordinary NAND device?

  Should I be using the NFTL code is some way?

  What is the likely underlying cause of the error message
      "Cowardly refusing to erase blocks on filesystem with
       no valid JFFS2 nodes"

I'd be very grateful for any guidance,

John
(John Smith)


Hi John 

Can u tell how u are creating JFFS2 image for ONENAND partition.

./mkfs.jffs2 --pad=0x3e80000(size of ur partition) -s 2KiB -m none -e 128KiB
--root=empty/ -o jffs2.image .Please try these options for ur image.

Rgs
Amit


Here is some log stuff from the Kernel showing what happens:

(The board has both a NOR flash device, and a oneNAND flash device)
At boot time the kernel reports:

  Flash device: 1000000 at 1f000000
  Mapped flash: Found 1 x16 devices at 0x0 in 16-bit bank
   Amd/Fujitsu Extended Query Table at 0x0040
  Mapped flash: CFI does not contain boot bank location. Assuming top.
  number of CFI chips: 1
  cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
  Creating 5 MTD partitions on "NOR flash":
  0x00000000-0x00c00000 : "rootfs"
  0x00c00000-0x00c80000 : "loader"
  0x00c80000-0x00fff800 : "vmlinux"
  mtd: partition "vmlinux" doesn't end on an erase block
      -- force read-only
  0x00fff800-0x00fff890 : "config"
  mtd: partition "config" doesn't start on an erase block boundary
      -- force read-only
  0x00fff890-0x01000000 : "nvram"
  mtd: partition "nvram" doesn't start on an erase block boundary
      -- force read-only
  MTD: pace_onenand_init
  OneNAND 16MB 2.65/3.3V 16-bit (0x05)
  Lock scheme is Continues Lock
  Scanning device for bad blocks
  Creating 2 MTD partitions on "Onenand":
  0x00000000-0x00800000 : "part_one"
  0x00800000-0x01000000 : "part_two"

##
## Looking at /proc/mtd, the partitions seem to exist
##

~ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00c00000 00020000 "rootfs"
mtd1: 00080000 00020000 "loader"
mtd2: 0037f800 00020000 "vmlinux"
mtd3: 00000090 00020000 "config"
mtd4: 00000770 00020000 "nvram"
mtd5: 00800000 00010000 "part_one"
mtd6: 00800000 00010000 "part_two"

##
## I can build a jffs2 partition on the NOR device
##  (with a worring error message)

~ # flash_eraseall -j /dev/mtd0
Erasing 128 Kibyte @ be0000 -- 98 % complete. Cleanmarker written at
be0000.
~ # mount -t jffs2 /dev/mtdblock0 /mnt/nor
Eep. No valid nodes for ino #1
~ #~ # cp /my-registers.txt /mnt/nor
~ # ls -l /my-registers.txt /mnt/nor/my-registers.txt
-rw-r--r--    1 0  0   2087754 Jan  1 00:02 /mnt/nor/my-registers.txt
-rw-r--r--    1 0  0   2087754 Aug 13  2006 /my-registers.txt
~ # md5sum /mnt/nor/my-registers.txt /my-registers.txt
3b8b150e7067d2a7b251cfcd0200e530  /mnt/nor/my-registers.txt
3b8b150e7067d2a7b251cfcd0200e530  /my-registers.txt

(after rebooting and mounting, the file was still there)

##
## Equivalent commands on the OneNAND flash fail
##
~ # flash_eraseall -j /dev/mtd5
Erasing 64 Kibyte @ 7f0000 -- 99 % complete. Cleanmarker written at
7f0000.
~ # mount -t jffs2 /dev/mtdblock5 /mnt/onenand/
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 128
mount: Mounting /dev/mtdblock5 on /mnt/onenand failed: Input/output error

##
## And afterwards only the NOR device is mounted:
##
~ # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root             76255996  64592052   7790272  89% /
tmpfs                      256        12       244   5% /var
/dev/mtdblock0           12288       852     11436   7% /mnt/nor

##
## mtd_debug reports the right sizes.
## (oneNAND has internal ECC logic. It has 16 bytes of OOB space
##  for every 512 byte sector, several of which are reserved for use by
the
##  ECC logic)
~ # mtd_debug info /dev/mtd5
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB | MTD_ECC
mtd.size = 8388608 (8M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 1024 (1K)
mtd.oobsize = 32
mtd.ecctype = MTD_ECC_NONE
regions = 0






------------------------------

Message: 4
Date: Sun, 13 Aug 2006 16:10:52 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: OneNAND - Cannot mount jffs2 partition
To: John <john@arrows.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
Message-ID: <44DF16CC.3070708@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello John,

John wrote:
> Questions:
>   Is this a suitable pair of commands?
>    $ flash_eraseall -j /dev/mtd5
>    $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand
Yeah, I believe this is the right commands and should work.

>   Would they work on an ordinary NAND device?
Yeah, and even on NOR.

>   Should I be using the NFTL code is some way?
Nope.

>   What is the likely underlying cause of the error message
>       "Cowardly refusing to erase blocks on filesystem with
>        no valid JFFS2 nodes"
Hmm, JFFS2 is complaining that you feed it with a flash which is neither 
empty nor contains a valid JFFS2 FS image.

Try to avoid using -j ans see what happens. You also may try to enable 
JFFS2's debugging prints.

I personally have never used OneNAND, and AFAIK it is rather new in MTD.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.



------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 41, Issue 17
*****************************************
