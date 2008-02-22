Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JSWoq-000794-Tv
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2008 12:16:01 +0000
Date: Fri, 22 Feb 2008 13:15:26 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Mangesh Edake <m_edake@yahoo.com>
Subject: Re: JFFS2 as rootfs on DataFlash
In-Reply-To: <389154.92868.qm@web50802.mail.re2.yahoo.com>
Message-ID: <Pine.LNX.4.64.0802221308540.6032@lnxricardw.se.axis.com>
References: <389154.92868.qm@web50802.mail.re2.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org, michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 21 Feb 2008, Mangesh Edake wrote:

> However I found that dataflash driver in u-boot
> doesnot deal with extra 16-bytes (oob) and doesnot
> write any JFFS2 specific magic bitmask, node crc,
> cleanmarker etc. info to the oob. But the nand flash
> (legacy) driver does the same in u-boot. Also
> kernel-mtd driver for at45 dataflash is missing with
> read_oob, write_oob functions whereas mtd-nand uses
> those routines. So my concern is, while copying the
> jffs2 image to dataflash is it necessory to write
> jffs2 specific info in oob region..? My assumption is,
> this info should be present in image itself and
> mkfs.jffs2 must take care of this while creating an
> image. (Please corret me if I'm wrong...)

The only JFFS2 data present in the OOB is the cleanmarker indicator for=20
blocks that are unused, i.e. where the data is =3D0xFF. For blocks that are=
=20
used, all JFFS2 info is in the ordinary data area.

Since the JFFS2 driver automagically writes cleanmarkers to unused blocks=
=20
when mounting (after erasing them first), it is not necessary to have=20
(oob) cleanmarkers in the filesystem image produced by mkfs.jffs2, and=20
indeed there is no option to do so IIRC.

The said, we've seen that the erase/cleamarker write during initial mount=
=20
of a JFFS2 filesystem consumes a lot of cpu time, and this can be=20
minimized by writing all the cleanmarkers before mounting. It is possible=
=20
that nandwrite -j would do this (we don't use nandwrite to write the=20
initial image in our products so I don't have any experience with this).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
