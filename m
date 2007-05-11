Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HmOix-0002Du-An
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 02:35:32 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l4B6ZLW2006923
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2007 08:35:21 +0200
Date: Fri, 11 May 2007 08:36:28 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: NAND flash write goes wrong
In-Reply-To: <200705102150.31171.borasah@gmail.com>
Message-ID: <Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
References: <200705102150.31171.borasah@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 10 May 2007, borasah@gmail.com wrote:

> Hi,
>
> I have a MIPS based board and want to use its NAND flash for storage. NAN=
D
> chip is a Samsung part: K9F1208UDA. It has 16KB erase block size and 512 =
byte
> page size.
> =09cat /proc/mtd
> =09dev:    size   erasesize  name
> =09mtd0: 02000000 00020000 "mtdram test device"
> =09mtd1: 00800000 00004000 "NAND FS 0"
> =09mtd2: 03800000 00004000 "NAND FS 1"
>
> As you see there are two partitions on it. I want to use "NAND FS 1"(56MB=
) for
> rootFS storage. I obtained mtd-utils from the site and compiled them for =
both
> the host and the target. I am using "mkfs.jffs2 command on the host" to
> generate a jffs2 image.
> =09./mkfs.jffs2 -p 0x3800000 -s 0x200 -e 0x4000 -r rootfs -o img -l

I don't know if this is it but

- I wouldn't pad the output image using -p <padsize>. Since there may be
   bad blocks in the flash, the image might not fit if padded to the
   whole partition size. Just skip the -p and its argument. As long as
   the whole partition into which the image is written has been erased
   beforehand, jffs2 will be able to make use of the unused space.

- The -s <pagesize>  argument doesn't specify the page size of the
   flash chip, rather it should be the same as the 'page size' in the
   Linux system, normally 4096 for most architectures.

- In nand flash, the cleanmarkers are normally not part of the image
   as they reside in the 'spare area' in the flash. The JFFS2 driver will
   automatically create cleanmarkers when it scans the chip at first boot,
   and having them in the image will confuse the issue, even if it normally
   works anway (but with lots of warnings at boot time).
   So, add -n to the list of arguments to inhibit cleanmarker
   generation by mkfs.jffs2.

> ...
> =09Erasing 16 Kibyte @ 24000 --  0 % complete. Cleanmarker written at 240=
00.
> =09Skipping bad block at 0x00028000
> =09...
> Is this normal? Then I do
> =09./nandwrite /dev/mtd2 img
> It writes by skipping bad blocks.
> =09...
> =09Writing data to block 189c000
> =09Bad block at 189c000, 1 block(s) from 189c000 will be skipped
> =09Writing data to block 18a0000
> =09...

If there indeed are bad blocks it is correct to skip them both when=20
erasing and writing.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
