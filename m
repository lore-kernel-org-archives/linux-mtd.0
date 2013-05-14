Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uc5FJ-0003io-OF
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 02:45:47 +0000
Message-ID: <5191A5C8.1000308@freescale.com>
Date: Tue, 14 May 2013 10:47:36 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
 <5190551A.5010400@freescale.com> <51909DF1.4060201@denx.de>
 <5190ABF0.10501@freescale.com> <51911A2E.1060903@gmail.com>
 <5191A037.6060002@freescale.com> <5191A269.6040006@gmail.com>
In-Reply-To: <5191A269.6040006@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8814=E6=97=A5 10:33, Vikram Narayanan =E5=
=86=99=E9=81=93:
> So, don't think that we are pointing that the GPMI-NAND driver is=20
> buggy. My only concern is _mtdtests_ are there to reveal
the mtd_tests may have bugs too. :)
So do not depend on the mtd_tests too much.
I don't think the mtd_tests can cover all the cases in the real world.


> problems (if any) in the NAND related code, be it a driver or the mtd=20
> layer. If one can make that run happily, it's easy to pin point the=20
> source of these errors. (-74, fixable bit-flip etc).
>
> Hope this clarifies my point.=20
thanks. I know.


Huang Shijie
