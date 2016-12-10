Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFn0j-00071I-R8
 for linux-mtd@lists.infradead.org; Sat, 10 Dec 2016 19:08:42 +0000
Received: by mail-wm0-x241.google.com with SMTP id m203so2732889wma.3
 for <linux-mtd@lists.infradead.org>; Sat, 10 Dec 2016 11:08:21 -0800 (PST)
Subject: Re: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-3-git-send-email-clg@kaod.org>
 <076683ea-fa94-2284-f269-2fcebd793940@gmail.com>
 <30a50d6d-07c5-0ca6-2d1b-3ba46c10da49@kaod.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <65abc62b-6add-ff21-efc5-01075bfa0c63@gmail.com>
Date: Sat, 10 Dec 2016 18:30:28 +0100
MIME-Version: 1.0
In-Reply-To: <30a50d6d-07c5-0ca6-2d1b-3ba46c10da49@kaod.org>
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

On 12/10/2016 06:18 PM, Cédric Le Goater wrote:
> On 12/10/2016 05:03 AM, Marek Vasut wrote:
>>> +/*
>>> + * The AST2400 SPI flash controller does not have a CE Control
>>> + * register. It uses the CE0 control register to set 4Byte mode at the
>>> + * controller level.
>>> + */
>>> +static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip)
>>> +{
>>> +	chip->ctl_val[smc_base] |= CONTROL_IO_ADDRESS_4B;
>>> +	chip->ctl_val[smc_read] |= CONTROL_IO_ADDRESS_4B;
>> How do you know the SPI NOR is in 4B mode ?
> 
> in aspeed_smc_chip_setup_finish() :
> 
> 	if (chip->nor.addr_width == 4 && info->set_4b)
> 		info->set_4b(chip);
> 

Ahhh, great :)

-- 
Best regards,
Marek Vasut
