Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubpb7-000176-J3
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 10:03:14 +0000
Message-ID: <5190BA44.4050509@denx.de>
Date: Mon, 13 May 2013 12:02:44 +0200
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
 <5190551A.5010400@freescale.com> <51909DF1.4060201@denx.de>
 <5190ABF0.10501@freescale.com> <5190B0C9.5000006@denx.de>
 <5190B3B5.8070805@freescale.com>
In-Reply-To: <5190B3B5.8070805@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/13/2013 11:34 AM, Huang Shijie wrote:
> 于 2013年05月13日 17:22, Stefan Roese 写道:
>> Done. But no errors in this test though. Even with increasing the
>> cycles_count. I don't want to destroy this chip, so I'm not increasing
>> the cycles too much.
> If you can pass the bonnie++ stress test on the ubifs, it means the gpmi 
> works fine.

Do you have any specific parameters that I should use for this test?

>> Which NAND devices did you test with on imx6? Did you also tests with a
>> "similar" Micron ONFI chip as this one (MT29F4G08ABADAH4)?
>>
> For micron's chips, I tested more then 10 chips. some chips show following :
> Micron MT29F4G08ABADAWP (2048 + 64)
> 
> Micron MT29F8G08ABACAWP (4096 + 224)
> 
> Micron MT29F4G08ABAEAWP (4096 + 224)
> 
> Micron MT29F32G08QAA (4096 + 218)

Thank for this update.

> But i do not test your chip. I do not have this chip, if i have, i can 
> test it on arm2/ard boards.

Sure. Thanks anyways for all your input.

Thanks,
Stefan
