Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AA0C369A2
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 14:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNVy+RvarkyM/hJ3wpoBQ1uOk+R4rB/N9PsuCCq2Z1Y=; b=Bg7N4u669w0Pe1
	MojU8MT/Hs9U8jzkDhpAgly+vrH982xeDtnyrvmBAQf7B1cKP+NzrzowLgsje3/fVbq3VsICh5tR3
	N4Y9AMyqzjcdwVWPJ0CjeDuUxq9ZrPehJ5mDmgH2IxsIbSe1CLlaPBWrP3K7S9qzkzevzflNdgjyQ
	2Hh+XlvdXJ/5Xh8sH/GIw56i8q+IICiS6THzMF4jlYtKlu8pzhhPZ4BwpvhHYITgZpK/W9uGFjZWC
	0L/x9WQwK43icFAfGx9Xok+vOsG2uVLV8qgjGE3g2QoeXvJWaGX9WDMVz6fHXuv7rLerGi4Q7I6Wv
	6EVw5yrXLzhqeC9yD7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ALO-00000004TLS-0OuM;
	Tue, 08 Apr 2025 14:54:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AJ9-00000004Sug-3O93
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 14:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A23875C5655;
	Tue,  8 Apr 2025 14:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DD4C4CEE5;
	Tue,  8 Apr 2025 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744123930;
	bh=dkh/98yD4kXhtEKPe+HK8ikqP0ZY141EiqYtwVGcXm4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PW+18Ek3XAbcHQkGvhfLQ5tsAJ/zpAlfljO9hdR3BuLaI0Q2JH6C997h2WKNN+2MQ
	 xQ3Ejq06d3SZorw44irBRrDN0wKSEeCxVr91B8Z6Z8xMrwbVLBsZB5OZwgO9aq5SVI
	 ekMO6gMB+l6ZnrnXyvTsJdQ011xANihVY3an3fDWU8HIIRmtvXvsn/EWxM0VaOqe0m
	 WNSIhJkzlf4esKK7pbv9rWEcO7HFazR1ZbOrFWuhuqhyJTX7XIIU+hC9UER7HJpG80
	 49LWg2MRjAWDkT7KNXr5bkmt4l750hZyjrvrYj9CpTuV6zMIs3Prx7BA75ofD88G0y
	 6H9tKtSy2Fn2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: macronix: Add fixups for MX25L3255E
In-Reply-To: <20250407075400.1113177-4-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-4-linchengming884@gmail.com>
Date: Tue, 08 Apr 2025 14:52:07 +0000
Message-ID: <mafs0semipuy0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_075211_900210_31EE8F32 
X-CRM114-Status: GOOD (  19.74  )
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

On Mon, Apr 07 2025, Cheng Ming Lin wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> SFDP of MX25L3255E is JESD216, which does not include the Quad
> Enable bit Requirement in BFPT. As a result, during BFPT parsing,
> the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
> Therefore, it is necessary to correct this setting by late_init.
>
> In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
> address mode. However, since the 3-byte address 1-4-4 page program
> is not defined in SFDP, it needs to be configured in late_init.
>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 07e0bd0b70a0..4bbd3b651cec 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -58,6 +58,31 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int
> +mx25l3255e_late_init_fixups(struct spi_nor *nor)
> +{
> +	/*
> +	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
> +	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing,
> +	 * the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
> +	 * Therefore, it is necessary to correct this setting by late_init.
> +	 */
> +	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +
> +	/*
> +	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
> +	 * address mode. However, since the 3-byte address 1-4-4 page program
> +	 * is not defined in SFDP, it needs to be configured in late_init.
> +	 */
> +	struct spi_nor_flash_parameter *params = nor->params;

Please don't have variable declarations in the middle of the function.
It looks odd. Though neither checkpatch nor cc seem to complain about
this. I thought they did...

Anyway, no need for a new revision, this can be fixed when applying by
me or Tudor.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

> +
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
> +				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
> +
> +	return 0;
> +}
> +
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
