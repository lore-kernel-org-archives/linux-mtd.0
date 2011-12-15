Received: from imx12.toshiba.co.jp ([61.202.160.132])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rb9eS-00075y-0B
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2011 11:39:08 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <matthieu.castet@parrot.com>
Subject: Re: [PATCH] [MTD] NAND : SFTL (Simple Flash Transration Layer)
Date: Thu, 15 Dec 2011 11:38:55 +0000
Message-ID: <5ECCBB1E1F657Akatsuki.uwatoko@toshiba.co.jp>
References: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
 <4EE86C95.4050101@parrot.com>
In-Reply-To: <4EE86C95.4050101@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <0576569F45158741BA4D274B9B12F162@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From:     Matthieu CASTET <matthieu.castet@parrot.com>
> Date:     Wed, 14 Dec 2011 10:29:57 +0100
:
> > SFTL is a flash translation layer for NAND Flash on mtd_blkdevs
> > interface.  This is mainly-useful for read-oriented use (ex. a storage
> > for a boot image) because this provides simple wear-leveling and
> > scrubbing. The features are:
> >=20
> >  * sftl provides wear-leveling (not static wear-leveling) and scrubbing=
.
> >  * sftl has one erase block size cache.
> >  * sftl uses 6 bytes in OOB for a logical address, status, version.
> >  * the erase block scan at init is fast.
> >  * a unit of read/write from/to MTD is an erase block.
> >=20
> What's the advantage over ubi and/or mtd over ubi.

Time of the scan at init is faster, because this reads oob of a page=20
in each erase block normally.=20

The flash space overhead is smaller, because this does not have headers=20
which UBI has. As you know, UBI uses 1 or 2 pages for the headers per=20
one erase block in addition to bad block management. In the case of=20
smallpage (512B) NAND and 16KB erase block w/o subpage write support,=20
the overhead of UBI is approximately 6%. The overhead of sftl is only=20
for bad block management.

So I think this is suitable for a boot image including a compressed=20
rootfs (ex. squashfs and cramfs) or a compressed kernel.

Regards,
--=20
UWATOKO Katsuki=
