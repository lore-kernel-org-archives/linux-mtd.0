Received: from cp-out4.libero.it ([212.52.84.104])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KyRLw-000107-8U
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 13:26:20 +0000
Received: from libero.it (192.168.17.5) by cp-out4.libero.it (8.5.016.1)
	id 4912CFAB00228D27 for linux-mtd@lists.infradead.org;
	Fri, 7 Nov 2008 14:26:18 +0100
Date: Fri,  7 Nov 2008 14:26:18 +0100
Message-Id: <K9YTBU$F773893C838A5134DFCF103AEC9B5EF3@libero.it>
Subject: Problems writing to JFFS2 flash
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "ffileppo" <ffileppo@libero.it>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

I'm having some problems with JFFS2 on my arm embedded system.
The system has two Intel P30 Flash banks (2*32MB).

I'm running linux kernel 2.6.24, here is the definition of mtd partition =
that I'm using:

static struct mtd_partition mainstoneflash0_partitions[] =3D {
	{
		.name =3D		"U-Boot",
		.size =3D		0x00080000,
		.offset =3D	0,
		.mask_flags =3D	MTD_WRITEABLE  /* force read-only */
	},{
		.name =3D		"Linux kernel",
		.size =3D		0x00200000,
		.offset =3D	0x00080000,
	},{
		.name =3D		"JFFS2 filesystem",
		.size =3D		MTDPART_SIZ_FULL,
		.offset =3D	0x00280000
 	}

};


The problem is that after writing some data to flash, I start getting lot=
s of these errors:

Write of 200 bytes at 0x03d68084 failed. returned -30, retlen 0
Not marking the space at 0x03d68084 as dirty because the flash driver ret=
urned retlen zero

and the flash get screwed up.

I use the following commands to erase and write to flash:

flash_eraseall -j /dev/mtd2
flashcp fs-jffs2 /dev/mtd2

And the command used to create the jffs2 filesystem from a ramdisk:

mkfs.jffs2 -d /mnt/ -e 0x00020000 -o fs-jffs2

(I've checked and the erase block size seems to be correct).

Anyone knows what could be the problem here?
I'll post more details if needed.

Thank you very much,

Francesco
