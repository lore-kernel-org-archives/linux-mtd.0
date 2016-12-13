Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGlSM-0002QF-06
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 11:41:14 +0000
Received: by mail-wj0-x242.google.com with SMTP id xy5so15945244wjc.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 03:40:53 -0800 (PST)
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3f3260d1-e677-b6d9-5571-a08a80344495@gmail.com>
Date: Tue, 13 Dec 2016 08:50:20 +0100
MIME-Version: 1.0
In-Reply-To: <1481557252-13656-2-git-send-email-clg@kaod.org>
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

On 12/12/2016 04:40 PM, Cédric Le Goater wrote:
> This driver adds mtd support for the Aspeed AST2500 SoC static memory
> controllers :

[...]

> +#define DEVICE_NAME	"aspeed-smc"
> +
> +/*
> + * The driver only support SPI flash
> + */
> +enum aspeed_smc_flash_type {
> +	smc_type_nor  = 0,
> +	smc_type_nand = 1,
> +	smc_type_spi  = 2,
> +};

So why is this here ? :)

> +struct aspeed_smc_chip;
> +
> +struct aspeed_smc_info {
> +	u32 maxsize;		/* maximum size of chip window */
> +	u8 nce;			/* number of chip enables */
> +	bool hastype;		/* flash type field exists in config reg */
> +	u8 we0;			/* shift for write enable bit for CE0 */
> +	u8 ctl0;		/* offset in regs of ctl for CE0 */
> +
> +	void (*set_4b)(struct aspeed_smc_chip *chip);
> +};

Otherwise looks good:
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
