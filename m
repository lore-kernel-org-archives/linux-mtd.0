Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxtJu-0006qr-Tg
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 10:46:47 +0000
Received: by mail-wm0-x235.google.com with SMTP id t189so57894361wmt.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2017 03:46:26 -0700 (PDT)
Subject: Re: [PATCH 07/10] mtd: spi-nor: aspeed: configure chip window on AHB
 bus
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-8-git-send-email-clg@kaod.org>
 <35014889-064a-3162-d23b-69e8441e31b5@gmail.com>
 <a6efce0e-2265-b7bf-d572-0098687a7f0d@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <41412164-6652-885d-c6a0-b72d4a40c32c@gmail.com>
Date: Tue, 11 Apr 2017 12:44:22 +0200
MIME-Version: 1.0
In-Reply-To: <a6efce0e-2265-b7bf-d572-0098687a7f0d@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/11/2017 12:20 PM, Cédric Le Goater wrote:
[...]
>>> +static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	u32  val0, start0, start;
>>> +	u32 size = chip->nor.mtd.size;
>>> +
>>> +	/* The AST2500 SPI controller has a bug when the CE0 chip size
>>> +	 * exceeds 120MB.
>>
>> 120 or 128 ?
> 
> 120. This is a HW bug.
> 
Please note that in the comment then .


-- 
Best regards,
Marek Vasut
