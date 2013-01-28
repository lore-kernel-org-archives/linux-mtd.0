Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TzfHe-0005MW-Hw
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 03:21:23 +0000
Message-ID: <5105EE9B.9050405@freescale.com>
Date: Mon, 28 Jan 2013 11:20:59 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com>
In-Reply-To: <5105E4CE.1090800@gmail.com>
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

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8828=E6=97=A5 10:39, Vikram Narayanan =E5=
=86=99=E9=81=93:
> Hello Huang,
>
> On 1/21/2013 7:42 AM, Huang Shijie wrote:
>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8819=E6=97=A5 00:52, Vikram Narayanan =
=E5=86=99=E9=81=93:
>>> Hi,
>>>
>>> When I try to run the mtd_oobtest on an i.Mx6Q board, it results in a
>>> failure with the following error.
>>> I'm using 3.5.7 Kernel.
>>>
>>> root@freescale:/# insmod mtd_oobtest.ko dev=3D6
>>> [ 7534.508880]
>>> [ 7534.511228] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>> [ 7534.518460] mtd_oobtest: MTD device: 6
>>> [ 7534.523000] mtd_oobtest: MTD device size 304087040, eraseblock siz=
e
>>> 262144, page size 4096, count of eraseblocks 1160, pages per
>>> eraseblock 64, OOB size 128
>>> [ 7534.539301] mtd_oobtest: scanning for bad eraseblocks
>>> [ 7534.545345] mtd_oobtest: scanned 1160 eraseblocks, 0 are bad
>>> [ 7534.552482] mtd_oobtest: test 1 of 5
>>> [ 7534.556797] mtd_oobtest: erasing whole device
>>> [ 7537.523540] mtd_oobtest: erased 1160 eraseblocks
>>> [ 7537.528888] mtd_oobtest: writing OOBs of whole device
>>> [ 7537.534704] mtd_oobtest: error: writeoob failed at 0x0
>>> [ 7537.540562] mtd_oobtest: error: use_len 0, use_offset 0
>>> [ 7537.546565] mtd_oobtest: error -22 occurred
>>> [ 7537.551456] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>>
>>> This boils down to the fake "struct nand_ecclayout" defined in
>>> <drivers/mtd/nand/gpmi-nand/gpmi-nand.c>
>>>
>>> Is there a way to run this test successfully?
>> The gpmi-nand may use all the oob. So the oobtest may fails.
>
> I'm in receipt of the error mentioned in [1]. The FAQ also suggests to=20
> run mtd_tests. mtd_oobtest might give more information on whether or=20
> not the NAND driver is buggy.
>
> Since I couldn't run this test on gpmi-nand due to the driver design,=20
> any ideas on how do I resolve the "ubi_io_read: error -74 (ECC error)"=20
> while mounting my UBIFS?
>
[1] what's the kernel's version?

[2] what's type of the nand chips?
     could you show me the nand chip's geometry?

thanks
Huang Shijie

> Thanks,
> Vikram
>
> [1] http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error
>
>
>
