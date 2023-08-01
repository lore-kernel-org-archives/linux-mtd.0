Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81149C001DF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 07:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A69FdTFW5PaNdG0iz+2FEDg6YDJZlqe6lT889aAfvhA=; b=pVAaxZPBSVd1PC35HpAGDpyYtX
	30D/uBZRMOgZV94T9ighYwb/3cwQVs6q5WZMOncoNQH69YnTdtDnDef0wldV44i0XU7w5Q+jT10LS
	x16chvTqiD2w1hgH/CwstjSXEin2rU3h7NoYrpHeeyRBooJYqQBx+xvujWtMiy1NUeXJI+JKRm/ch
	dPpu4IOikV2PRvpfoUmeC8Jc1pMWxccEdnFBZNYMEBnxKwq783+m5EmFjQXsh7S2gtWoUVJGT/Tac
	D+2O8OM1gQ4qOooMcXS56PdYzFzh8gIVMmejLkdcJ14bgMJe3oOD7V69NPhgr+OA30GFK4U5vSUIQ
	jiCoO3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQjaC-000XFi-39;
	Tue, 01 Aug 2023 07:14:16 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQja9-000XDM-2h
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 07:14:15 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 898BC5D1;
	Tue,  1 Aug 2023 09:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690874047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtne1oRy95jjB378HJsXyUADvrjcstZr+O9u6YT0B9I=;
	b=tbq/CepJ8AtWLx+C6gXI2AE4u64RKxNxntWUkBYdPp16wYrkzRRljwnGn2giTPi/AhTKHJ
	UQO1ydStgCDQLClUyPprXyZDNZJk1mjQJcQ2NTFdivZ/Bu63QniTaVvbRH4WR8IYIlK7m9
	+jqGeJlPZrzOHkEgkbVpJLQ9D44N4B/Ysc3LL2YB/39Jy28UvaDbMIoadmdDf5T3JIWwgK
	E5IE7w43QIt1E6Xchkw/GojVmIT3biea9BBbgRtn4dSA+Dh2lJYbBMUlVGHfJ384F5XWBq
	/BZo57Aa4Kx01InrCBtnpykZ7bzDsjC9n+jSoc/YD3TToSBoFUbVlmJ4o7UU6Q==
MIME-Version: 1.0
Date: Tue, 01 Aug 2023 09:14:07 +0200
From: Michael Walle <michael@walle.cc>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Wadim Mueller <wafgo01@gmail.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] SPI-NOR: Add support for Micron mt35x01g
In-Reply-To: <20230728150810.205656-1-wadim.mueller@continental-corporation.com>
References: <20230728150810.205656-1-wadim.mueller@continental-corporation.com>
Message-ID: <7ac5ad977aae9ba124d81588a8521cbc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_001414_338847_D3C9D515 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2023-07-28 17:08, schrieb Wadim Mueller:
> From: Wadim Mueller <wafgo01@gmail.com>
> 
> Currently only the mt35xu512aba and mt35xu02g are supported,
> support for the 1G version is missing. This patch adds
> the corresponding entry in the micron_parts structure.
> 
> Verification and tests were done on a custom NXP S32G2 board with the
> mt35xu01g qspi nor populated
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 4b919756a205..fe97583547fe 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -166,6 +166,11 @@ static const struct flash_info micron_nor_parts[] 
> = {
>  		MFR_FLAGS(USE_FSR)
>  		.fixups = &mt35xu512aba_fixups
>  	},
> +	{ "mt35xu01g", INFO(0x2c5b1b, 0, 128 * 1024, 1024)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +		MFR_FLAGS(USE_FSR)
> +	},

I guess this flash have SFDP tables. Please dump them according to [1].
If so, please have a look wether this flash works with the generic
driver [2]. No NO_SFDP_FLAGS() with new drivers. also the 4B_OPCODES
should *hopefully* be superfluous due to the 4bait SFDP table.

-michael

[1] https://lore.kernel.org/r/4304e19f3399a0a6e856119d01ccabe0@walle.cc/
[2] 
https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/mtd/spi-nor/core.c#L2019


>  	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
