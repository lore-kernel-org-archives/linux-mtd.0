Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GwxZf-00077B-SO
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 04:17:50 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	kBK9H7hY032402
	for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2006 10:17:07 +0100
Date: Wed, 20 Dec 2006 10:17:04 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Reduce boot time with jffs2 and CM-X255
In-Reply-To: <4588F67A.6080602@sacet.com>
Message-ID: <Pine.LNX.4.64.0612201007240.11369@lnxricardw.se.axis.com>
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
	<4588F67A.6080602@sacet.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 20 Dec 2006, Michel LECONTE wrote:

> I use a CM-X255 with a NAND Flash of 512 Mo
> where roughly 250 Mo are used (90 Mo for the native distribution
> provided by Compulab and 160 Mo for specific applications).
>
> At the boot, there's a scanning of the MTD1 (4096 blocks) corresponding
> to the NAND Flash.
> This scanning takes 1mn20s. The full boot time, from a reset to the
> login prompt, takes 4mn.
>
> I hope that these precisions can be useful.

I don't know if this helps, but I have noted that when mounting a flash=20
partition which contains lots of erased blocks/sectors, that jffs2 after=20
the mount has completed in the background (re-)erases the blocks and=20
writes cleanmarkers to them (the logic of this is clearly explained in the=
=20
JFFS2 documentation on the mtd home page). For NOR flash, this can be=20
alleviated easily by instructing mkfs.jffs2 to add cleanmarkers to unused=
=20
parts of the image. For NAND flash, the cleanmarkers are stored in the=20
out-of-band (OOB) area, which is normally not part of an image;=20
consequently, it is easier to leave it up to jffs2 on the target system to=
=20
erase and write cleanmarkers, which takes time, or at least takes up=20
system resources, causing other processes to run slower. Admittedly, NAND=
=20
is faster than NOR, but then you've got quite a lot of empty flash too=20
(250 MB).

I don't know what the solution is - one idea is that a program like=20
nandwrite could be instructed to write cleanmarkers to the OOB of unused=20
parts of a partition. Currently there is no support for this but it could=
=20
be added.

Hm, sidetracking here a bit, I'm thinking a general erase + write image=20
utility for NAND flash would be useful, given that bad block management=20
gets a bit hairy when you write to NAND and the write fails - should the=20
block be re-erased (not really part of a nand writing tool's job) and=20
retried, or just marked as bad (because most likely the block had recently=
=20
been erased by an erasing tool)? Having erase+write in the same tool would=
=20
make it easier for the tool to manage this, and it could also write jffs2=
=20
cleanmarkers to the oob as part of the whole procedure.

Except for testing, most of the flash writing I come across is writing a=20
complete image (usually jffs2, but also boot images) to a flash partition.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
