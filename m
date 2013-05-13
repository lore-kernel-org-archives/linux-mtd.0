Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubobg-00083G-P8
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 08:59:46 +0000
Message-ID: <5190ABF0.10501@freescale.com>
Date: Mon, 13 May 2013 17:01:36 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
 <5190551A.5010400@freescale.com> <51909DF1.4060201@denx.de>
In-Reply-To: <51909DF1.4060201@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8813=E6=97=A5 16:01, Stefan Roese =E5=86=99=
=E9=81=93:
> On 05/13/2013 04:51 AM, Huang Shijie wrote:
>>>> Also, I don't have enough spare boards to sacrifice it for mtd_tortu=
re test.
>>> Yes, I can understand this.
>>>
>>> Huang, do you have any idea on how to proceed here? What else
>>> could/should we test? Any ideas/hints?
>> Currently, the kernel supports three imx6 boards for the gpmi-nand:
>>      imx6q-arm2, imx6q-sabreauto, imx6dl-sabareauto.
>>
>> I am afraid your board is none of them. I doubt your board is not
>> correctly configrated with
>> some timing or signals.
> Correct, our board is a custom imx6 board. Basically NAND is working
> just fine (UBI/UBIFS works basically). This board even boots from NAND.
> So at least the pin muxing has to be correct.
>
> Please correct me if I'm wrong, but from my understanding the Linux GPM=
I
> NAND driver configures the timings. So this is not board platform code
> related but NAND driver related.
>
> Do you have any hints where to "tune/change" some values (timing or
> signal related) to fix this error?
>
Please check the schematic, is there some pin conflict with the gpmi-nand=
?
What's the pad value for these pins? You can take a reference with=20
current dts file.

>> The key issue (i want to emphosis ) is that the current gpmi-nand does
>> not support the
>> subpage operations.
> Yes. And this is disabled via setting NAND_NO_SUBPAGE_WRITE in the
> options variable in the GPMI NAND driver.
>
> BTW: I just tested with the "mtd_nandbiterrs" test. This fails directly=
.
> I would have expected the ECC to being able to at least correct the
> errors for some loops:
>
> # insmod mtd_nandbiterrs.ko dev=3D3 mode=3D0
> [  831.622694]
> [  831.624198] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [  831.630071] mtd_nandbiterrs: MTD device: 3
> [  831.634259] mtd_nandbiterrs: MTD device size 519045120,
> eraseblock=3D131072, page=3D2048, oob=3D64
> [  831.642796] mtd_nandbiterrs: Device uses 1 subpages of 2048 bytes
> [  831.648920] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D=
0
> [  831.655026] mtd_nandbiterrs: erase_block
> [  831.659502] mtd_nandbiterrs: incremental biterrors test
> [  831.664805] mtd_nandbiterrs: write_page
> [  831.669028] mtd_nandbiterrs: rewrite page
> [  831.673413] mtd_nandbiterrs: read_page
> [  831.691729] mtd_nandbiterrs: error: read failed at 0x0
> [  831.696887] mtd_nandbiterrs: After 0 biterrors per subpage, read
> reported error -74
> [  831.704546] mtd_nandbiterrs: erase_block
> [  831.708997] mtd_nandbiterrs: finished successfully.
> [  831.713880] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> insmod: error inserting 'mtd_nandbiterrs.ko': -1 Input/output error
>
> Huang, is this to be expected? How does this look on one of your
> officially "supported" imx6 boards with NAND support?
>
I suggest you do not use the mtd_nandbiterrs.ko. It will call the=20
mtd_write_oob() which will definitely lead to the
-EBADMSG (-74) error.

The mtd_write_oob() in mtd_nandbiterrs.ko writes a whole page without=20
enabling the BCH to do the hardware ECC.
But mtd_read() in mtd_nandbiterrs.ko DOES do the hardware ECC by the BCH.
It's normal that you meet -74.



You can use the mtd_torturetest, such as:

#insmod mtd_torturetest.ko dev=3D3 check=3D1 cycles_count=3D1 eb=3D0 ebcn=
t=3D4 gran=3D1


>
> SLC. Why do you ask?
For the MLC, if you write the OOB, it will impacts other part of the=20
page. For some nands, you will meet a -74.
that's another story.

thanks
Huang Shijie
