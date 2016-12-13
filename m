Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGm6r-000050-2m
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 12:23:06 +0000
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id BFEF569097
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 13:22:39 +0100 (CET)
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <3f3260d1-e677-b6d9-5571-a08a80344495@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4ed8b39b-69af-e62b-f6d6-472a6c791bcc@kaod.org>
Date: Tue, 13 Dec 2016 13:22:26 +0100
MIME-Version: 1.0
In-Reply-To: <3f3260d1-e677-b6d9-5571-a08a80344495@gmail.com>
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

On 12/13/2016 08:50 AM, Marek Vasut wrote:
> On 12/12/2016 04:40 PM, Cédric Le Goater wrote:
>> This driver adds mtd support for the Aspeed AST2500 SoC static memory
>> controllers :
> 
> [...]
> 
>> +#define DEVICE_NAME	"aspeed-smc"
>> +
>> +/*
>> + * The driver only support SPI flash
>> + */
>> +enum aspeed_smc_flash_type {
>> +	smc_type_nor  = 0,
>> +	smc_type_nand = 1,
>> +	smc_type_spi  = 2,
>> +};
> 
> So why is this here ? :)

well, because we do enforce the SPI type in aspeed_smc_chip_set_type()
but I agree, we could be a bit more direct with it and just write
the SPI type. May be in a followup patch then.

> 
>> +struct aspeed_smc_chip;
>> +
>> +struct aspeed_smc_info {
>> +	u32 maxsize;		/* maximum size of chip window */
>> +	u8 nce;			/* number of chip enables */
>> +	bool hastype;		/* flash type field exists in config reg */
>> +	u8 we0;			/* shift for write enable bit for CE0 */
>> +	u8 ctl0;		/* offset in regs of ctl for CE0 */
>> +
>> +	void (*set_4b)(struct aspeed_smc_chip *chip);
>> +};
> 
> Otherwise looks good:
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> 

Thanks for the review,

C. 
