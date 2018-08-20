Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fretr-0001RZ-LF
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 07:46:57 +0000
Date: Mon, 20 Aug 2018 09:46:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kostya Porotchkin <kostap@marvell.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Mike Dunn <mikedunn@newsguy.com>, Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [EXT] Re: nand speed test
Message-ID: <20180820094630.392f050f@xps13>
In-Reply-To: <1c78935418904123a9cc27a65ec9d3e4@IL-EXCH02.marvell.com>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
 <20180804205923.25298-2-boris.brezillon@bootlin.com>
 <1c78935418904123a9cc27a65ec9d3e4@IL-EXCH02.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kostya,

Kostya Porotchkin <kostap@marvell.com> wrote on Sun, 19 Aug 2018
14:12:16 +0000:

> Hi, Miguel,
>=20
> We clearly have a problem with BBT on this 8K-page NAND.
> The Linux driver is unable to find BBT after reboot, even if it reports t=
hat the new table was written upon previous boot.
> It looks like the u-boot also lost the BBT information after reboot.
> So something is not yet working well with this 4GB device.
>=20
> Marvell>> nand info =20
>=20
> Device 0: nand0, sector size 1024 KiB
>   Page size       8192 b
>   OOB size         448 b
>   Erase size   1048576 b
>   subpagesize     8192 b
>   options     0x     200
>   bbt options 0x   a0000
> Marvell>> nand bad =20
>=20
> Device 0 bad blocks:
>   ff800000
>   ff900000
>   ffa00000
>   ffb00000
>   ffc00000
>   ffd00000
>   ffe00000
>   fff00000

This enlarging list is very likely to show a mismatch between U-Boot
and Linux ECC configuration, you should check that first. It will
probably explain why BBT is not recognized.

Thanks,
Miqu=C3=A8l
