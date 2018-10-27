Received: from mta.witecom.ch ([185.43.244.8])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGMX1-0003X1-96
 for linux-mtd@lists.infradead.org; Sat, 27 Oct 2018 11:13:29 +0000
From: Yannick Lanz <yannick.lanz@wifx.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: bad block table erased by u-boot's ubi part command
Date: Sat, 27 Oct 2018 11:13:04 +0000
Message-ID: <A5CEBF07E04C514A9C56312C6027F32186A8C8CC@SWIFXDC01.lan.wifx.net>
References: <A5CEBF07E04C514A9C56312C6027F32186A8C57B@SWIFXDC01.lan.wifx.net>
 <20181026225651.24be0d06@bbrezillon>
In-Reply-To: <20181026225651.24be0d06@bbrezillon>
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >=20
> > If a mount the UBI partition in U-Boot, then the bad block table is=20
> > never found in the kernel and always recreated. The other strange=20
> > point is that U-Boot doesn't find the 4 bad block found by the kernel.
> >=20
> > If I reboot without mounting the UBI partition in U-Boot, then the bad=
=20
> > block table is directly discovered by the kernel following its creation=
 on latest boot.
> > It seems that U-Boot is destroying the bad block table.
> >=20
> > Do you have any idea what's happening ?
>
> Probably because u-boot does not have on-flash-bbt enabled, so it's assum=
ing the blocks reserved by Linux for the bad block table are free, and when=
 UBI is attached to the last partition it picks > the last 4 blocks and wri=
tes its metadata on it.

Exactly, thank you for the support. I activated the on-flash-bbt in my u-bo=
ot device tree but I was using the binary without embedded device tree...
It's now working well.

Yannick=20
