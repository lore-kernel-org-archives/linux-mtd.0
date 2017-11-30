Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKMFu-0000K1-3L
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 10:39:47 +0000
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
 [209.85.213.46]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id vAUAcuF8017196
 for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2017 19:38:56 +0900
Received: by mail-vk0-f46.google.com with SMTP id s141so3091450vkb.12
 for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2017 02:38:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171130091831.06781ce2@bbrezillon>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-2-miquel.raynal@free-electrons.com>
 <CAK7LNATWXZci_M8EqeU-8KSEviWzAT7p1KSdkuqAkSAuj-Zj6w@mail.gmail.com>
 <20171130091831.06781ce2@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 30 Nov 2017 19:38:15 +0900
Message-ID: <CAK7LNARFHqg+EE6m0pxx7Pbs+p-w+W0MMtu4kgXLNBhfeycXVA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] mtd: nand: provide several helpers to do
 common NAND operations
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Stefan Agner <stefan@agner.ch>, Wenyou Yang <wenyou.yang@atmel.com>,
 Nadav Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Han Xu <han.xu@nxp.com>, Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Josh Wu <rainyfeeling@outlook.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2017-11-30 17:18 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

>>
>> Theoretically, there could be three cases:
>>   [1] INTR__ERASE_COMP interrupt is asserted
>>   [2] INTR__ERASE_FAIL interrupt is asserted
>>   [3] Nothing is asserted (bailout by timeout)
>
> Well, ideally we should have something like:
>
>         if (irq_status & INTR__ERASE_COMP)
>                 return 0;
>         else if (irq_status & INTR__ERASE_FAIL)
>                 return -EIO;
>
>         return -ETIMEDOUT;
>
> But let's keep the existing behavior (return -EIO in case of timeout).
>


I agree with this change,
but it should also be done in a separate work.





-- 
Best Regards
Masahiro Yamada
