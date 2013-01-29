Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U00at-0000ic-Hc
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 02:06:40 +0000
Message-ID: <51072EA4.7000201@freescale.com>
Date: Tue, 29 Jan 2013 10:06:28 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com>
In-Reply-To: <5106AFAA.1020502@gmail.com>
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

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8829=E6=97=A5 01:04, Vikram Narayanan =E5=
=86=99=E9=81=93:
> On 1/28/2013 8:50 AM, Huang Shijie wrote:
>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8828=E6=97=A5 10:39, Vikram Narayanan =
=E5=86=99=E9=81=93:
>>> Hello Huang,
>>>
>>> On 1/21/2013 7:42 AM, Huang Shijie wrote:
>>>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8819=E6=97=A5 00:52, Vikram Narayana=
n =E5=86=99=E9=81=93:
>>>>> Hi,
>>>>>
>>>>> When I try to run the mtd_oobtest on an i.Mx6Q board, it results in=
 a
Which mx6q' board are you using? the mx6q-arm2 or mx6q-ard?

The kernel only supports the mx6q-arm2 now.

>>>>> failure with the following error.
>>>>> I'm using 3.5.7 Kernel.
>>>>>
>>>>> root@freescale:/# insmod mtd_oobtest.ko dev=3D6
>>>>> [ 7534.508880]
>>>>> [ 7534.511228] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>>>> [ 7534.518460] mtd_oobtest: MTD device: 6
>>>>> [ 7534.523000] mtd_oobtest: MTD device size 304087040, eraseblock=20
>>>>> size
>>>>> 262144, page size 4096, count of eraseblocks 1160, pages per
>>>>> eraseblock 64, OOB size 128
>>>>> [ 7534.539301] mtd_oobtest: scanning for bad eraseblocks
>>>>> [ 7534.545345] mtd_oobtest: scanned 1160 eraseblocks, 0 are bad
>>>>> [ 7534.552482] mtd_oobtest: test 1 of 5
>>>>> [ 7534.556797] mtd_oobtest: erasing whole device
>>>>> [ 7537.523540] mtd_oobtest: erased 1160 eraseblocks
>>>>> [ 7537.528888] mtd_oobtest: writing OOBs of whole device
>>>>> [ 7537.534704] mtd_oobtest: error: writeoob failed at 0x0
>>>>> [ 7537.540562] mtd_oobtest: error: use_len 0, use_offset 0
>>>>> [ 7537.546565] mtd_oobtest: error -22 occurred
>>>>> [ 7537.551456] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>>>>
>>>>> This boils down to the fake "struct nand_ecclayout" defined in
>>>>> <drivers/mtd/nand/gpmi-nand/gpmi-nand.c>
>>>>>
>>>>> Is there a way to run this test successfully?
>>>> The gpmi-nand may use all the oob. So the oobtest may fails.
>>>
>>> I'm in receipt of the error mentioned in [1]. The FAQ also suggests t=
o
>>> run mtd_tests. mtd_oobtest might give more information on whether or
>>> not the NAND driver is buggy.
>>>
>>> Since I couldn't run this test on gpmi-nand due to the driver design,
>>> any ideas on how do I resolve the "ubi_io_read: error -74 (ECC error)=
"
>>> while mounting my UBIFS?
>>>
>> [1] what's the kernel's version?
>
> The above log is from 3.5.7, but the results are same for the latest=20
> kernel (3.8-rc) too.
>
>> [2] what's type of the nand chips?
>>      could you show me the nand chip's geometry?
>
> Toshiba, 4 Gbit, (4096 +224) bytes =C3=9764 pages =C3=972048blocks

The Toshiba's nand is not well supported by the kernel.
Are you sure the kernel parse out the correct geometry for the toshiba's=20
nand?
Please recheck the page size and oob size with "mtdinfo /dev/mtd0".

thanks
Huang Shijie
> writesize - 4KiB
> oobsize - 224 bytes
>
> Regards,
> Vikram
>
