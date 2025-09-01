Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CF8CA1002
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRyWTFZ7ch+AVYkMclwoPIXFTizO5749RKr02RualRY=; b=sbv5hJS2eSaHF4
	Qo8cUqVMzeK8lK2/wg9hsrOGJPCU8/lKd5fHJ7FYXblm2qYvSpuwQ4sWR4fQXOmbXHJtAHN8r0sv3
	iJvdp/2o15kdIQ3VCF+C41DR414zi+ri4nEi7pz21e2TrSnZyraTHPUIHVQ/VsZUg1zX7n6s5AW/I
	8L0p4XGg8jJ14VBtMO2CA3CWBnTN2Pp6Q327WJglskJ8vGyYLn36TjRmkU/RzTl/CLn3YWT/n5C0M
	03v/ibDRv5tNh3o1eCJxv36EjbVPTaZDtFlC/NnLzt8kil3cBI877A0tDudNnlGT+niGsOlaKweVV
	tB46iRRSClpCMdRL/CeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDms-0000000EHj6-31zE;
	Mon, 01 Sep 2025 23:18:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut85j-0000000DQYf-37Ku
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 17:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7544140C15;
	Mon,  1 Sep 2025 17:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CC2C4CEF0;
	Mon,  1 Sep 2025 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746795;
	bh=b3vKI8fFpk4ot7c3L2An3wZn2xJ1jPwGfNQAQJFKjUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VH5BhxLSvCeDnQIDJA/+lgFpzLOxgPlOehPOAmn9iNcFOT2N+BnIay5THpb/avmdA
	 yxSe5uXrH65Yczllm2KpPJ6Ox3P+G4y6sntuQBCdLyoNt/AbhfYzw1p6TF8RfqlMVE
	 unQPpp2g8raUacjHZHtkaqjW3vWVo1pNtgb4eUqb6kW/1G5JLSRPIWGoFYLoHm5L74
	 wMeCoYv+6H7XRm0lvAmLaR+CknreZUoeI1sFNUK+j8EfaXjMeI82qc44N5khYr9luX
	 0mL9b5l859W4ZnXwiEWwwEkDEiA2+Rp/QTR72s2fWIDv7z4qU+QBqjhusziE12+kzm
	 y2wXBdrr0T1Yw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for is25wx01g
In-Reply-To: <20250901164218.11165-1-flaviu.nistor@gmail.com>
References: <20250901164218.11165-1-flaviu.nistor@gmail.com>
Date: Mon, 01 Sep 2025 19:13:12 +0200
Message-ID: <mafs0cy8aw0yf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_101315_808170_C88F4C6F 
X-CRM114-Status: GOOD (  17.25  )
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

Hi Flaviu,

On Mon, Sep 01 2025, Flaviu Nistor wrote:

> Add support for the IS25WX01G 128MB (1Gb) ISSI Serial Flash Memory.
>
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 18d9a00aa22e..e4997f9bd557 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -126,6 +126,9 @@ static const struct flash_info issi_nor_parts[] = {
>  		.flags = SPI_NOR_QUAD_PP,
>  		.fixups = &is25lp256_fixups,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +	}, {
> +		/* IS25WX01G */
> +		.id = SNOR_ID(0x9d, 0x5b, 0x1b),

It seems the flash needs no special configuration. IIUC it can be driven
entirely based on SFDP data. In that case, I don't think there is a need
for an entry at all. The generic SFDP-based driver should already be
enough for your flash. Just add a "jedec,spi-nor" node to your DT and it
should work.

>  	}
>  };

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
