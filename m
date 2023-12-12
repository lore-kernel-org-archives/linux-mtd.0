Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDC1C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nzNMv5cAIxVhMYb0q3x7rsKsYHWcYcP+kZOu6Wo++M=; b=ZaOQ49eebktNeY
	2ASTQonvk76I/Zgnvva5D84S1OMIMTcsWHr12UZaNvJC6CUC+dpw8UybabWKGKjwfcAiGRjJW1NBH
	lX0ZhD4I5nF8NoWs9i3L4bVLKfS/A0KvTPQlocCfABq1fSDVdIUWEeAIDtJZKE8XZTdiB9HtEWWQQ
	jgX3NRJlY5sNZaM0uLdXizki0DeWHyvZEFyv3XE++a9VTYQ0r0LcPrX5QKuV+rr8eSOy2vuWJhmIV
	gIFb+XvyNH3IxVzsYQ4kQse8Q7k7mTHM6vp2aJcRN9N+T6q43g5qr2iuBc9E7e1PyCYkle9kkjTrz
	/4ElvvvY7K7AFYvNM7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCy9h-00B3lq-2A;
	Tue, 12 Dec 2023 08:30:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCy9d-00B3ku-1b
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 08:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6639CE11E6;
	Tue, 12 Dec 2023 08:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5A6C433C7;
	Tue, 12 Dec 2023 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702369811;
	bh=OBpRdN0eEvuNt0h+qruB6z/fQi2iOsF3hWkodHHSVPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZNhOMNNza3SZ7r1OO/hGEdpRUswF4DtFxtQ5FvZBkM3P1yVJv1RklxLZssjIui2Y
	 F0St+QlfnN+emxxB0p1PL69TZVpEJY7z0II+lmFg439aulZxbI49uSjdSxkx4Jg4tP
	 Wzn+4t3g7qJeFEJpWfVZNT0U1NoaXMThJv0wIvzE=
Date: Tue, 12 Dec 2023 09:30:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nikita.shubin@maquefel.me
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 20/40] mtd: rawnand: add support for ts72xx
Message-ID: <2023121220-shine-caviar-68dc@gregkh>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
 <20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_003013_731508_B8150880 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, Dec 12, 2023 at 11:20:37AM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Technologic Systems has it's own nand controller implementation in CPLD.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/mtd/nand/raw/Kconfig                       |   7 +
>  drivers/mtd/nand/raw/Makefile                      |   1 +
>  drivers/mtd/nand/raw/technologic-nand-controller.c | 220 +++++++++++++++++++++
>  3 files changed, 228 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index cbf8ae85e1ae..3937c10dea1c 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -449,6 +449,13 @@ config MTD_NAND_RENESAS
>  	  Enables support for the NAND controller found on Renesas R-Car
>  	  Gen3 and RZ/N1 SoC families.
>  
> +config MTD_NAND_TS72XX
> +	tristate "ts72xx NAND controller"
> +	depends on ARCH_EP93XX && HAS_IOMEM
> +	help
> +	  Enables support for NAND controller on ts72xx SBCs.
> +	  This is a legacy driver based on gen_nand.

Why is a new "legacy driver" being written these days?  Why not do it
properly?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
