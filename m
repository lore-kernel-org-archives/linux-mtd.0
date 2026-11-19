Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFB606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yikf0Qje;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lVOzcWV8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vFN6ART/ywiP0i+q30GW0IH1gqvkQG8Up31JdQEIZ2E=; b=Yikf0QjeL8OXjLKcU8Wxe2FLsN
	s9Ekb99ARw/KgzqMtQAUlviGzA4xCjSKC8tQCT3ChVd12sJ033E7HVqb1CYMuKsPsZ3nppfoRmNoT
	kCNQdFLNwD9T4M64ncWEI+olfV3exhNFFupiNvQtytLHLTkadAxJqZ8EjlspVCMeP9n9/tfvv/dmu
	yaFo43xL0ciJiAKQuRf7InblOU48x0iDlqj2tFbbEjEpxoULVrNRVUwHmBEhi2E43fmwCkG9i5oY/
	Hvq/w1/G28FDlKOiamOQ5KC9hEHjELuuRoLfvGk/3zAlivsYNY6RlXYNexT4JkmqAuwZLw3e/UUHD
	EYMQGLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0me-0000000Blac-3xEh;
	Thu, 19 Nov 2026 11:58:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0mc-0000000BlZZ-1UHq
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 11:58:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 953DDC4CBEF;
	Thu, 19 Nov 2026 11:58:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 490C860237;
	Thu, 19 Nov 2026 11:58:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFB3011BC04AA;
	Thu, 19 Nov 2026 12:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795089502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8pKyecCVKJ3P2/DllSf4QADgUTwIySkDcGXpaKJszRo=;
	b=lVOzcWV8O+0BgL+87QRl2KBYiDz9tcVvNzQIeJ2CmmtYY33VlT0tOKm6VnE+mN33wFsbuc
	BNRv49hvyR2Bqs4xtfCAMpVgd4g9dQ3z45YF4zAqM9xPatZMW+DqgqGq3n6NfIcYNjeDdT
	UdkJCCT9HH1zPxl8/eaJ1M2tGB+h4xeIDwbwjwtuG73TE1SPFoqvKn6fHzl2dEnEF1eunF
	KOyB9zBildxT/9RVuq/xhbsVmUBQfiXLfmjTfmwvE4y0EzM3KZEs+x9kPKbfWa6q6MOg30
	EpmxuiZuHIW6cslkUH5GSfCuflQvoIWWcAVomu0VhKi8Gocm96CFWoMqFlusUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
  Clark Williams <clrkwllms@kernel.org>,  Steven Rostedt
 <rostedt@goodmis.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland
 <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,  Richard
 Genoud <richard.genoud@bootlin.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Masahiro Yamada <yamada.masahiro@socionext.com>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rt-devel@lists.linux.dev,  devicetree@vger.kernel.org,  Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v10 04/26] mtd: rawnand: sunxi: reject pages exceeding
 the ECC step limit
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-4-dca1f6ed29a8@gmail.com>
	(James Hilliard's message of "Thu, 05 Nov 2026 11:55:20 -0700")
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
	<20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-4-dca1f6ed29a8@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 12:58:13 +0100
Message-ID: <87ik1tdodm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_035830_535783_A81B0F38 
X-CRM114-Status: GOOD (  20.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 at 11:55:20 -07, James Hilliard <james.hilliard1@gmail.com> wrote:

> The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
> Hardware-ECC setup checks the strength and available OOB space, but does
> not check that the page fits those slots. NAND identification can supply
> a larger page size, and the NAND core does not enforce this
> controller-specific limit.
>
> If enough OOB space is available, an unsupported geometry can pass attach
> and reach DMA code that indexes status and user-data registers by ECC
> step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
> number of steps must fit the controller even when their user data fits
> the register bank.
>
> Reject excessive step counts before allocating user-data lengths or
> installing the hardware-ECC callbacks. Check the final step size, after
> strength maximization and the conversion from 512-byte to 1-KiB steps,
> so valid geometries retain their existing layout. This also keeps PIO
> fallback from accepting a page that the controller cannot handle.
>
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 662d96fc2535..1a61f608ad91 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2223,6 +2223,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>  	ecc->bytes = ALIGN(ecc->bytes, 2);
>  
>  	nsectors = mtd->writesize / ecc->size;
> +	if (nsectors > nfc->caps->max_ecc_steps) {
> +		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
> +			nsectors, nfc->caps->max_ecc_steps);
> +		return -EINVAL;
> +	}

I'm fine with this patch, but if your manual says that the controller
support chips with pages up to 32k and you wire a chip -that does not
exist on earth yet- with a larger page size, screw you? This is again
one of those over defensive approaches...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
