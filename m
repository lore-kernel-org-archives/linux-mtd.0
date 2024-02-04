Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDE3C48286
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Feb 2024 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Us4jH0mNXEt8zETFoK9LG6aB/oOEjLPrcKaRy0YyJ/o=; b=MfGh1xO1KcRSYN
	okslb1Lf5oW1nryqeVcaFZutb8kWrvLurNvaVizM9rIiFYs/X+6VI3EVFajMlzexW3lp4ySuQaBca
	AjBWT7XPuTX9Fck36DzxuXHQTXgAU9dxAB+pJBk0NtSm0HZ6JJHnrB7TLilq7pwZWirt/4riLHXLn
	sq0LaGhrPEQypb9qYppBMSCbGJPf9PhiojqxfkCYUs3WPdswRU/VXXW4YWlO6Gbv/18V5f4Xr6ABu
	XgETaZmnzwUuArVkGjtfwQr2LtbwKC6l7c4tfu6XQ1YwsjTg1YUxF1VDhPoC8H+A8CD0//CZ/cPzL
	8vrMcpR7Btds8asIp1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfgo-00000001AZD-1Pok;
	Sun, 04 Feb 2024 16:49:54 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfgm-00000001AYk-0PHi
	for linux-mtd@lists.infradead.org;
	Sun, 04 Feb 2024 16:49:53 +0000
Received: from localhost (88-113-26-30.elisa-laajakaista.fi [88.113.26.30])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 66ab6094-c37d-11ee-b3cf-005056bd6ce9;
	Sun, 04 Feb 2024 18:49:48 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Sun, 4 Feb 2024 18:49:45 +0200
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Daniel Golle <daniel@makrotopia.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Johan Jonker <jbx6244@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 20/39] mtd: rawnand: add support for ts72xx
Message-ID: <Zb_AKQEBUB4Yg7JI@surfacebook.localdomain>
References: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
 <20240118-ep93xx-v7-20-d953846ae771@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118-ep93xx-v7-20-d953846ae771@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_084952_322283_FD7A9F4D 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

Thu, Jan 18, 2024 at 11:21:03AM +0300, Nikita Shubin kirjoitti:
> Technologic Systems has it's own nand controller implementation in CPLD.

...

> +err_clean_nand:
> +	nand_cleanup(&data->chip);
> +err_handle_put:
> +	fwnode_handle_put(child);
> +	return err;
> +}
> +
> +static void ts72xx_nand_remove(struct platform_device *pdev)
> +{
> +	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &data->chip;
> +	int ret;
> +
> +	ret = mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);
> +	nand_cleanup(chip);

Missing fwnode_handle_put()?

> +}


-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
