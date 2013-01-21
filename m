Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tx6sp-0008S4-1G
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 02:13:11 +0000
Message-ID: <50FCA426.6030309@freescale.com>
Date: Mon, 21 Jan 2013 10:12:54 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com>
In-Reply-To: <50F97DB5.7040801@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8819=E6=97=A5 00:52, Vikram Narayanan =E5=
=86=99=E9=81=93:
> Hi,
>
> When I try to run the mtd_oobtest on an i.Mx6Q board, it results in a=20
> failure with the following error.
> I'm using 3.5.7 Kernel.
>
> root@freescale:/# insmod mtd_oobtest.ko dev=3D6
> [ 7534.508880]
> [ 7534.511228] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [ 7534.518460] mtd_oobtest: MTD device: 6
> [ 7534.523000] mtd_oobtest: MTD device size 304087040, eraseblock size=20
> 262144, page size 4096, count of eraseblocks 1160, pages per=20
> eraseblock 64, OOB size 128
> [ 7534.539301] mtd_oobtest: scanning for bad eraseblocks
> [ 7534.545345] mtd_oobtest: scanned 1160 eraseblocks, 0 are bad
> [ 7534.552482] mtd_oobtest: test 1 of 5
> [ 7534.556797] mtd_oobtest: erasing whole device
> [ 7537.523540] mtd_oobtest: erased 1160 eraseblocks
> [ 7537.528888] mtd_oobtest: writing OOBs of whole device
> [ 7537.534704] mtd_oobtest: error: writeoob failed at 0x0
> [ 7537.540562] mtd_oobtest: error: use_len 0, use_offset 0
> [ 7537.546565] mtd_oobtest: error -22 occurred
> [ 7537.551456] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> This boils down to the fake "struct nand_ecclayout" defined in
> <drivers/mtd/nand/gpmi-nand/gpmi-nand.c>
>
> Is there a way to run this test successfully?
The gpmi-nand may use all the oob. So the oobtest may fails.

thanks
Huang Shijie
>
> Regards,
> Vikram
>
