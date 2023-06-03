Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93ACC77B7A
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jun 2023 20:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5nRZCvaKDWZAVoJUPf3UP2JSCJO8axvvnlSlx9yFaM=; b=xQFy3skV+uZPX8
	7czR4MJW3Pn6ozSa4mER7WZJyxErOsF5FILkZniz3LZLP2JfDNcdAIJgxhMGfTlo9nRT8Ekpgz2pr
	z/g0pTqAer7ceZBUWpJIqgOq3vh3gBBAwKVN1DUt95nQGslN0pmhoTeJtujI/3sh6IiZSiqO3g+D6
	i2+Vu/VouAGmkAq8NgMx1ucmzO1by+bWBWDf9yrqy8ADVH1lvltGgm3dMJjw6dAysXiWHyg3XSAvM
	NznVqFZpVBEcJ2FviOPaTERuaFoqU11gjlE/AV84h7HHE42jhrKYLoJfjlrYz8CdWv4H6/u6jrad3
	g+BcZT0MI6naSdYmO7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5XkI-00AVrQ-2T;
	Sat, 03 Jun 2023 20:21:06 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5XkF-00AVqd-0m
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jun 2023 20:21:04 +0000
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 25f5af74-024c-11ee-b972-005056bdfda7;
	Sat, 03 Jun 2023 23:20:58 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Sat, 3 Jun 2023 23:20:57 +0300
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Jean Delvare <jdelvare@suse.de>,
	Liang Yang <liang.yang@amlogic.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 24/43] mtd: nand: add support for ts72xx
Message-ID: <ZHugqa697eGqHnr4@surfacebook>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601054549.10843-6-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601054549.10843-6-nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_132103_462737_954ABBB6 
X-CRM114-Status: GOOD (  16.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thu, Jun 01, 2023 at 08:45:29AM +0300, Nikita Shubin kirjoitti:
> Technologic Systems has it's own nand controller implementation in CPLD.
> 
> This patch adds support for TS-72XX boards family.

Use imperative mode, this is documented in the Submitting Patches,

...

> +/*
> + * Technologic Systems TS72xx NAND controller driver
> + *
> + * Copyright (C) 2023 Nikita Shubin <nikita.shubin@maquefel.me>
> + *
> + * derived: plat_nand.c

Derived from:

> + *  Author: Vitaly Wool <vitalywool@gmail.com>
> + */

...

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

+ Blank line?

> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/platnand.h>

...

> +		bits = readb(addr) & ~0x07;

GENMASK()?

...

> +	addr += (1 << TS72XX_NAND_BUSY_ADDR_LINE);

BIT() ?

...

> +	return !!(readb(addr) & 0x20);

BIT() ?

...

> +	struct ts72xx_nand_data *data;
> +	struct mtd_info *mtd;
> +	int err = 0;

Redundant assignment.

> +	/* Allocate memory for the device structure (and zero it) */
> +	data = devm_kzalloc(&pdev->dev, sizeof(struct ts72xx_nand_data),

sizeof(*data) and make it a single line.

> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;

...

> +	nand_set_flash_node(&data->chip, pdev->dev.of_node);

Hmm... wondering why this uses OF node instead of fwnode... But okay, this is
question to the subsystem maintaners.


> +	err = mtd_device_parse_register(mtd, NULL, NULL,
> +					NULL, 0);

There is plenty of space on the previous line.

> +

Redundant blank line.

> +	if (!err)
> +		return err;
> +
> +	nand_cleanup(&data->chip);
> +
> +	return 0;

This seems at least weird and rather broken.
To me it looks like

	if (err) {
		nand_cleanup(&data->chip);
		return err;
	}

	return 0;

has to be here.

> +}

...

> +	ret = mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);

WARN_ON()?! Why?

> +	nand_cleanup(chip);
> +}

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
