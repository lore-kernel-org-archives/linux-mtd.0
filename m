MIME-Version: 1.0
In-Reply-To: <20171130230246.61a9ed19@xps13>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-2-miquel.raynal@free-electrons.com>
 <20171130215113.458d616f@bbrezillon>
 <20171130230246.61a9ed19@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Dec 2017 11:12:08 +0900
Message-ID: <CAK7LNASxa4GCnutU4LZhVjV4sK3YLZ+RkewvyY0P4rZENpoOwQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] mtd: nand: use usual return values for the ->erase()
 hook
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Hanna Hawa <hannah@marvell.com>, Stefan Agner <stefan@agner.ch>,
 Nadav Haklai <nadavh@marvell.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 devel@driverdev.osuosl.org, Maxim Levitsky <maximlevitsky@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Ofer Heifetz <oferh@marvell.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-12-01 7:02 GMT+09:00 Miquel RAYNAL <miquel.raynal@free-electrons.com>:
>> > diff --git a/drivers/mtd/nand/nand_base.c
>> > b/drivers/mtd/nand/nand_base.c index 630048f5abdc..4d1f2bda6095
>> > 100644 --- a/drivers/mtd/nand/nand_base.c
>> > +++ b/drivers/mtd/nand/nand_base.c
>> > @@ -3077,7 +3077,7 @@ int nand_erase_nand(struct mtd_info *mtd,
>> > struct erase_info *instr, status = chip->erase(mtd, page &
>> > chip->pagemask);
>> >             /* See if block erase succeeded */
>> > -           if (status & NAND_STATUS_FAIL) {
>> > +           if (status) {
>> >                     pr_debug("%s: failed erase, page 0x%08x\n",
>> >                                     __func__, page);
>> >                     instr->state = MTD_ERASE_FAILED;
>>
>> You forgot to patch single_erase() accordingly.
>
> Right, sorry about that, I will fix that.
>

Assuming single_erase() will be fixed,


For denali.c

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>





-- 
Best Regards
Masahiro Yamada
