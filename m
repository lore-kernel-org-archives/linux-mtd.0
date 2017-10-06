Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0ZWs-0001Zf-4H
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 20:47:32 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Linus Walleij <linus.walleij@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Jamie Iles <jamie.iles@oracle.com>,
 arm@kernel.org, Frans Klaver <fransklaver@gmail.com>,
 Gerhard Sittig <gsi@denx.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: gpio: Convert to use GPIO descriptors
References: <20170924173912.9199-1-linus.walleij@linaro.org>
Date: Fri, 06 Oct 2017 22:46:59 +0200
In-Reply-To: <20170924173912.9199-1-linus.walleij@linaro.org> (Linus Walleij's
 message of "Sun, 24 Sep 2017 19:39:12 +0200")
Message-ID: <87fuawf1h8.fsf@belgarion.home>
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

Linus Walleij <linus.walleij@linaro.org> writes:

>  #if defined(CONFIG_MTD_NAND_GPIO) || defined(CONFIG_MTD_NAND_GPIO_MODULE)
> +
> +static struct gpiod_lookup_table cmx255_nand_gpiod_table = {
> +	.dev_id         = "cmx255-nand",
Shouldn't the device name be "gpio-nand" instead ?
"cmx255-nand" is AFAIR a partition name, not a device name.

Cheers.

-- 
Robert
