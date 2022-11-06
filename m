Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64348C433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Nov 2022 22:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bag8qnsAEiCLgGPCM3Cto8tN3rbL5Jx8fhbEudkegII=; b=jg1SepC8Pu0HdA
	rF9o/aZb8p44scVEIBda2AnJr8dk9q4eulDayRQEwcTcYzm5XxPx8gV4klXCC9C+Wp+lEkgA/LXNH
	vhCrrUC7Z5Gre0F/kpOhwLHS1BYO9XJ/EdKaxGWEs302SUC+Kk0U4izeVhk3VPclo2TXysnVWItUJ
	fBBegvjPDjnJ7WJc7TiRgplS58EGSUGXnI9jfAi0Jgkav/OzthNhFY+Xlv6vNKnb0U3vCSdxYcFgY
	UYF01rcOaCuYSC+nzwvK/MU5qynArh+9KoAgNrVDAiiA1iUFDAW5Yi4MZtlSxpLBZa7cQ3mhqw/ER
	+ApiWclsXqTq9VCIsrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oroX0-00AK7d-O1; Sun, 06 Nov 2022 22:54:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oroWo-00AK5q-Ch; Sun, 06 Nov 2022 22:54:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83B1E60BA0;
	Sun,  6 Nov 2022 22:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8997CC433D6;
	Sun,  6 Nov 2022 22:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667775248;
	bh=CCOXKsk1YG6cytIhCugUYJ5LpHswjB66YukQZnjJrb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHI5IDuxp1uLkeFTUcpRH3bRKYCLaI4GmrmUFk/iFG3nvE5gcAwQBdoS7zh+QeLu1
	 7f5/j4eVo3ADiBkrPFu/GxybEOmWlwVtRjHWfwrTC/46ZDNAN6kUIpmNY3kZksY90I
	 OdbFe6BYMYjJZALw9ciO/Hcb6dxTBoyEIn3mcecQIwDIH6TpGF6FYqMhLX+OckU8ym
	 aF3Ikni8lpbyq1Qcy/7iN3Mlil65LlBdW0XSvo3nc+SnRQo7v+czAs1Esld+tX+W5A
	 TgFsXXSFhLpPhzCfLZnEwLMjU1Sp615Ol+5fZZSPZV1vBPaTavbDBf4MfVNUxdNb0X
	 hebEDEeu3Bj9w==
Date: Sun, 6 Nov 2022 23:54:06 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Bayi Cheng <bayi.cheng@mediatek.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix the number of bytes for the dummy
 cycles
Message-ID: <20221106225406.o36syeso4prdi7yn@yadavpratyush.com>
References: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_145410_505962_D4491D00 
X-CRM114-Status: GOOD (  18.59  )
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

On 31/10/22 08:46PM, Allen-KH Cheng wrote:
> The number of bytes used by spi_nor_spimem_check_readop() may be
> incorrect for the dummy cycles. Since nor->read_dummy is not initialized
> before spi_nor_spimem_adjust_hwcaps().
> 
> We use both mode and wait state clock cycles instead of nor->read_dummy.
> 
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Co-developed-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6c921eb3fadb..8b9c318a0ad4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1914,7 +1914,8 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>  	spi_nor_spimem_setup_op(nor, &op, read->proto);
>  
>  	/* convert the dummy cycles to the number of bytes */
> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
> +			  op.dummy.buswidth / 8;

Good catch!

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>  	if (spi_nor_protocol_is_dtr(nor->read_proto))
>  		op.dummy.nbytes *= 2;
>  
> -- 
> 2.18.0
> 

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
