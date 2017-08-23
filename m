Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkbPh-0004mR-E5
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 19:34:11 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Lee Jones <lee.jones@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v5 0/9] mtd: sharpslpart partition parser
References: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
 <20170821221339.70cfcfb7@bbrezillon>
Date: Wed, 23 Aug 2017 21:33:44 +0200
Message-ID: <87pobmoz8n.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Le Mon, 14 Aug 2017 22:48:31 +0200,
>> Andrea Adami (9):
>>   mtd: sharpslpart: Add sharpslpart partition parser
>>   mtd: nand: sharpsl: Add partition parsers platform data
>>   mfd: tmio: Add partition parsers platform data
>>   mtd: nand: sharpsl: Register partitions using the parsers
>>   mtd: nand: tmio: Register partitions using the parsers
>
> Applied patches 2, to 5 to nand/next.
>>   ARM: pxa/corgi: Remove hardcoded partitioning, use sharpslpart parser
>>   ARM: pxa/tosa: Remove hardcoded partitioning, use sharpslpart parser
>>   ARM: pxa/spitz: Remove hardcoded partitioning, use sharpslpart parser
>>   ARM: pxa/poodle: Remove hardcoded partitioning, use sharpslpart parser

I'm quite happy with patches 6 to 9 except for the subject title length.

Andrea, if you give me an idea of change, I'll modify the titles myself before
applying, no need to resend a serie.

For example, you could propose :
ARM: pxa: corgi: use sharpslpart parser instead of hardcoded one


Then I'll take them into pxa/for-next if there are no objections.

Cheers.

-- 
Robert
