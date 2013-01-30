Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0NPA-0002jn-Qf
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 02:28:05 +0000
Message-ID: <5108852C.5040002@freescale.com>
Date: Wed, 30 Jan 2013 10:27:56 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com>
In-Reply-To: <5107F899.5090506@gmail.com>
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

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8830=E6=97=A5 00:28, Vikram Narayanan =E5=
=86=99=E9=81=93:
> On 1/29/2013 8:06 AM, Huang Shijie wrote:
>>> May I know in what way the driver is restricted for using with other
>>> boards?
>> The devicetree. Please check the dts file in arch/arm/boot/dts/.
>> If there is no dts file for your board, the gpmi will not works very
>> well for your board.
>> for example, there is arch/arm/boot/dts/imx6q-arm2.dts for the MX6Q-AR=
M2
>> board.
>
> I've a valid dts file for my board which is good enough to probe the=20
> Toshiba NAND on-board and mount a UBIFS filesystem.
could you tell the dts file for your board?
are you sure the pinmux settings are right?

>
>>> You're right and we knew it earlier as the Kernel detects the OOB siz=
e
>>> as 128 bytes. So, some remaining bytes become unused at the end of
>>> each page. i.e., (224-128). Instead of supporting ecc strength as ECC=
9
>>> we end up using ECC8. Should this be a cause for the -74 error?
>> no. this is not the cause. even you get the wrong geometry of the nand
>> chip. the gpmi still can works.
>>
>> I think the root cause is the devicetree issue as above.
>
> Something else is causing the issue. Can you give some other pointers=20
> which can potentially cause this -74 error while mounting?
the -74 error is the EBADMSG, it's caused by the uncorrectable ECC failur=
e.
There are many reasons can cause this error:
    [1] the pinmux setting is not right, the gpmi does not works well.
    [2] the wrong setting of BCH. for example, the page size is 8K, you=20
set 4k to BCH.
        so you can set the correct nand geometry parameters for your=20
nand chip firstly, and then do the debug.
    [3] timings.

BR
Huang Shijie
>
> Regards,
> Vikram
>
