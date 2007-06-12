Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HxzaL-0004MS-Ji
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 02:10:36 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l5C6ANZu003979
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2007 08:10:23 +0200
Date: Tue, 12 Jun 2007 08:08:48 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: CLEANMARKER node found at 0x007a4000 has totlen 0xc != normal 0x0
In-Reply-To: <009201c7ac42$0cee6ec0$3902a8c0@FRN2>
Message-ID: <Pine.LNX.4.64.0706120800010.3966@lnxricardw.se.axis.com>
References: <009201c7ac42$0cee6ec0$3902a8c0@FRN2>
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


On Mon, 11 Jun 2007, Kevin Morfitt wrote:

> I'm using mtd-utils-1.0.0 on a KB9202B with a 32M NAND flash. /dev/mtd0=
=20
> is mapped as one partition:
>
> [root@KB9202B:~] cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 02000000 00004000 "nand_fs"

From=20this we can see that the [erase]block size is 0x4000, as one would=
=20
expect for a NAND flash of this size.

> I create my jffs image using:
>
> mkfs.jffs2 --pad=3D0x4000 --eraseblock=3D0x4000 -l --root=3Dkb9202_nfsroo=
t/target_fs
> -o full_fs.bin

--pad should suffice, it should pad the image up to a multiple of the=20
block size.

> To program the NAND, when I'm mounted via NFS, I do:
>
> [root@KB9202B:~] flash_eraseall -j /dev/mtd0
> Erasing 16 Kibyte @ 1ffc000 -- 99 % complete. Cleanmarker written at
> 1ffc000.
> [root@KB9202B:~] nandwrite -f /dev/mtd0 /full_fs.bin

Since you are writting a preformatted image, and not just erasing the=20
flash to get an empty jffs2 partition, I would suggest not using -j to=20
flash_eraseall, in order to get a clean flash.

(Side note: Even if you did want to create an empty jffs2 partition, you=20
could skip the -j . The JFFS2 driver automatically erases and writes=20
cleanmarkers to blocks that lack them. It does take a bit of time on first=
=20
boot though, but as a kernel thread that runs in the background, so you=20
may not even notice it.)

> When I re-boot from MTD I always get lots of messages like "CLEANMARKER n=
ode
> found at 0x007a4000 has totlen 0xc !=3D normal 0x0". The board still boot=
s but
> after a few re-boots I end up getting other messages like:

AFAIR this is what happens when you have cleanmarkers in the image and you=
=20
are using nand flash. The solution as you suggest is to specify -n (or=20
--no-cleanmarkers) to mkfs.jffs2.

> I've seen the other threads on this subjects and tried using '-n' in my
> mkfs.jffs2 command but if I do that nandwrite fails with:
>
> [root@KB9202B:~] Input file is not page aligned
> [root@KB9202B:~] Data did not fit into device, due to bad blocks

I think this could be because you are erasing the flash with -j. The flash=
=20
isn't empty, and writing with nandwrite clashes with the data already=20
there. The 'not page aligned' bit is confusing though.

You can also specify -p (or --pad) to nandwrite to get it to pad the=20
image.

> I've read somewhere else that the "wrong data CRC" message might mean my
> erase size is wrong but I don't know what the erase size should be anyway=
=2E

You can see the erase[block] size in /proc/mtd, or in the data sheet of=20
the device (called 'block size' there).

So to sum up:

- Use -n and --pad to mkfs.jffs2 (or skip --pad here and specify it to
   nandwrite instead).
- Avoid -j with flash_eraseall

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
