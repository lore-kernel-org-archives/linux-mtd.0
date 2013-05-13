Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubip7-0002Kp-NQ
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 02:49:14 +0000
Message-ID: <5190551A.5010400@freescale.com>
Date: Mon, 13 May 2013 10:51:06 +0800
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
In-Reply-To: <518C91AA.8040107@denx.de>
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

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8810=E6=97=A5 14:20, Stefan Roese =E5=86=99=
=E9=81=93:
>
>
>> Also, I don't have enough spare boards to sacrifice it for mtd_torture=
 test.
> Yes, I can understand this.
>
> Huang, do you have any idea on how to proceed here? What else
> could/should we test? Any ideas/hints?

Currently, the kernel supports three imx6 boards for the gpmi-nand:
    imx6q-arm2, imx6q-sabreauto, imx6dl-sabareauto.

I am afraid your board is none of them. I doubt your board is not=20
correctly configrated with
some timing or signals.

The key issue (i want to emphosis ) is that the current gpmi-nand does=20
not support the
subpage operations.





> Here the infos for our NAND device:
>
> [    0.917552] ONFI param page 0 valid
> [    0.921053] ONFI flash detected
> [    0.924206] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micro=
n MT29F4G08ABADAH4), 512MiB, page size: 2048, OOB size: 64
> [
It's a SLC ,or a MLC?

thanks
Huang Shijie
