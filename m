Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFlIw-0003yN-Ba
 for linux-mtd@lists.infradead.org; Sat, 10 Dec 2016 17:19:22 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id F03165466B
 for <linux-mtd@lists.infradead.org>; Sat, 10 Dec 2016 18:18:59 +0100 (CET)
Subject: Re: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-3-git-send-email-clg@kaod.org>
 <076683ea-fa94-2284-f269-2fcebd793940@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <30a50d6d-07c5-0ca6-2d1b-3ba46c10da49@kaod.org>
Date: Sat, 10 Dec 2016 18:18:49 +0100
MIME-Version: 1.0
In-Reply-To: <076683ea-fa94-2284-f269-2fcebd793940@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/2016 05:03 AM, Marek Vasut wrote:
>> +/*
>> + * The AST2400 SPI flash controller does not have a CE Control
>> + * register. It uses the CE0 control register to set 4Byte mode at the
>> + * controller level.
>> + */
>> +static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip)
>> +{
>> +	chip->ctl_val[smc_base] |= CONTROL_IO_ADDRESS_4B;
>> +	chip->ctl_val[smc_read] |= CONTROL_IO_ADDRESS_4B;
> How do you know the SPI NOR is in 4B mode ?

in aspeed_smc_chip_setup_finish() :

	if (chip->nor.addr_width == 4 && info->set_4b)
		info->set_4b(chip);

C.

 
>> +}
>> +
>>  static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>  				      struct resource *res)
>>  {
>>
