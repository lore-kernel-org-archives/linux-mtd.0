Received: from imx12.toshiba.co.jp ([61.202.160.132])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rdg2O-0000Ve-PF
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 10:38:15 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] [MTD] NAND : SFTL (Simple Flash Transration Layer)
Date: Thu, 22 Dec 2011 10:38:02 +0000
Message-ID: <C4CCC095C74FEDkatsuki.uwatoko@toshiba.co.jp>
References: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
 <1324138390.4240.69.camel@sauron.fi.intel.com>
In-Reply-To: <1324138390.4240.69.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <6D48BB76E49DA84FB64C063CB6136AFC@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thank you for the information and the advice. I will re-design it.

> > SFTL is a flash translation layer for NAND Flash on mtd_blkdevs
> > interface.  This is mainly-useful for read-oriented use (ex. a storage
> > for a boot image) because this provides simple wear-leveling and
> > scrubbing. The features are:
> >=20
> >  * sftl provides wear-leveling (not static wear-leveling) and scrubbing=
.
> >  * sftl has one erase block size cache.
> >  * sftl uses 6 bytes in OOB for a logical address, status, version.
>=20
> This is really bad idea nowadays, because modern flashes tend to use
> whole OOB for bad block handling. Or they may disallow writing to OOB
> because they cannot handle a write to OOB after a write to the page.
>=20
> On top of this, modern flashes are so crappy that they have bit-flips
> all the time, and need strong ECCs (like 8-bit or more). But the OOB
> area is not covered by ECC, so your data in OOB will constantly become
> corrupted.
>
> I really suggest to re-design this.

I understood it and agree with that. I have to move the data of an erase
block to data area from OOB.  But I think that even nowadays,=20
there are not a few NANDs which has ECC data on OOB to be trusted.

> Could you please present your work in more details. Could you please
> describe:

I would like to explain about your questions/comments. =20
If I misunderstood something, please let me know.

We would like to use a block device on NAND as a storage for boot image.=20
It includes compressed filesystem image and/or Linux Kernel.=20
And the most important purpose of this driver is making the boot fast.=20

> 1. Which problems this solves.

Compared mtdblock+gluebi+ubi,

1st, currently time of the sftl initial time (insmod time) is faster=20
than ubi. The time is so important for us because a boot time depends=20
on this.
=20
The following is the result of insmod time on our target board.
(The NAND read performance of our target board may not be good.)

NAND : 256MB SLC, Large Size Page (2KB), Erase Block Size 128KB
       w/o subpage write=20
MTD Partition Size : 16MB, 32MB, 256MB

	sftl	ubi
------------------------
32MB	 30msec	 160msec	 =09
64MB	 40msec	 290msec
256MB	150msec 1070msec
------------------------

2nd, as I wrote already, the flash overhead is smaller than ubi.

> 2. What are the practical use-cases.

A boot image including compressed read-only filesystem (squashfs) is=20
stored in a MTD partition of NAND Flash.=20
All of the image is read to memory at system booting from NAND and=20
it on memory is mounted at boot. Or it in NAND flash directly is=20
mounted.

This means that it is normally read-only except update and the time
of reading from NAND affects boot time.

> 3. What are alternative existing solutions, why they are not good enough
>    and why this solution is better.
> 4. Explain why it is not possible to teach UBI to solve these tasks.
>    E.g., introduce a special "simplified" UBI mode with 1-1 mapping / no
>    erase counters / whatever. In other words, provide good grounds for
>    adding a separate module.

I heard that currently the optimization of UBI scan time is in progress.
It might be enough but currently I do not know how much fast it is.
I should investigate details of it.=20

I think sftl would be close to sm_ftl in Linux MTD. But this driver=20
depends on the specification of SMART media like small page size NAND,=20
the size of logical address is 2 bytes (ZONE addressing) and so on.
So I think we should not modify this driver.

Thank you,
--=20
UWATOKO Katsuki=
