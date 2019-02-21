Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F688C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE392084F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dX5QYP+E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EQpxL3iF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGEmSuJn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE392084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=my707UA5yHwy+W3L2hgwSxJ0wO6RObFnlTARXZmbiLU=; b=dX5QYP+E57Q1XS
	vhvzGWL8SvP/Xe+0WXGUS+Gwihm54QBAzAQqAMQ4cu+eG49NDmOT5wHiQ5fv22wmrvXmXaZwyhcEu
	XAQp50Z1XiTXmQNlOcw7a/RRZMeAag0e4a6xrmhUI2K1zPFAJNxN+sZU1CnPzBNaVgVmBG0/qJaGg
	YrWkQgFPs9c7ian14EqeTqqzmRB4ajurZqwlEodf6x1CdMQFU/GT4t0tOwXD+ian6U5W/H6MGL97c
	VPwsnCBD/xafdU4bN+QIR8k8rXHySV//AUhnWJ7SkMRZzGftZtdLde6HJtoNyKg4NwlgavJokwkYp
	lzN5z76H9/rz31h23Gtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwoCN-0008EA-N0; Thu, 21 Feb 2019 13:15:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwoCD-0006dy-9Y; Thu, 21 Feb 2019 13:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9dUS41GuBUBlWRxClOPwdAtiQDOo3x46A0HHc6/jkA=; b=EQpxL3iFeGZ/XeJoLs2pHgGndr
 0sUGMPowo0zGl8Wz9VRpR8uGajI2bgcHa/A1dA0PcqbS5pklB98aqeF2HfvoLj326vDevW5AXoSoz
 I8Ks5RbeIimMCGK7ARSo/v45jBKHvUTP65c2QlXkgqL3JPEDag7m/F3zaLFIiWoTLztNeeZGBykWh
 5UrOLnJyMy/XTHlK+7qgFGOiKXDdylccwq2Cta6zbXsoNqdPXJmW3xeBT6kxlZ8cvkAAmNGsohY/W
 FRZDcrX8rr0CbfiVpK2YaDDwK5P0MC2fijwSc4oX/RLt/yLHSm7O5sguDDv2oc4Ut3ICu1NCHjF1X
 uDatEvZA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwnyO-0000Wj-P0; Thu, 21 Feb 2019 13:01:13 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 245D92070B;
 Thu, 21 Feb 2019 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550754067;
 bh=pcit4odRQ5yNHQ0Uehrb1B7MsjC5zKgdhSN3hsFdhQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nGEmSuJnxIHy6OKrOeu4OhmCWSUZ5Rgq88QE1ApVrUlaHrCjvjU8+TzgZ+WgSHd62
 leDW3BP1dNkBNgXcDiDD8fUB2b6keQmt98E8Q4SNSaUYGeC59qi0uRWch3EWP7A6id
 5U+qwm2dkG7P23IRkBUrm+Fqs88ieSUqmUodWu6E=
Date: Thu, 21 Feb 2019 14:01:01 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mason Yang
 <masonccyang@mxic.com.tw>
Subject: Re: [RFC PATCH 10/27] mtd: rawnand: Get rid of chip->ecc.priv
Message-ID: <20190221140101.657cc910@kernel.org>
In-Reply-To: <20190221100216.25255-11-miquel.raynal@bootlin.com>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
 <20190221100216.25255-11-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_130109_218741_F493520A 
X-CRM114-Status: GOOD (  21.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>, Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 11:01:59 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> nand_ecc_ctrl embeds a private pointer which had only a meaning in the
> sunxi driver. This structure will soon be deprecated, but as this
> field is actually not needed, let's just drop it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++---------------
>  include/linux/mtd/rawnand.h       |  2 --
>  2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index b56f89c992f3..d05f71f33b5c 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -230,6 +230,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>   *			this NAND controller
>   * @complete:		a completion object used to wait for NAND
>   *			controller events
> + * @ecc:		ECC controller structure
>   */
>  struct sunxi_nfc {
>  	struct nand_controller controller;
> @@ -243,6 +244,7 @@ struct sunxi_nfc {
>  	struct list_head chips;
>  	struct completion complete;
>  	struct dma_chan *dmac;
> +	struct sunxi_nand_hw_ecc *ecc;

It's a per-chip object, not a per-controller one, should be moved to
sunxi_nand_chip.

>  };
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
