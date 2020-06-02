Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61759C433E1
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A6C2067B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IpKPZR0l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A6C2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nem9vi9TNpmViQhHDtJdNfuJwXkPi+r9T/CHJmRK5iI=; b=IpKPZR0lO1Vv50
	N4XTQiNwVpPMIFyyIU54PVZnKbERa7WfetgzT2VWLD0Nw5v6W25UG574YwDLrQj3++dNPNdP1IQyw
	XpGHWy3KPuCrDe8SRKtuVOFqhrGubIa9fXVAf9TkJRtfPn5mJ2qe3G1xRGeVEfifX9wYErtdjk2xX
	H65okRbZAkjWAoB00xMmbDsodKb3HpyLvTtj30+pR6gfkdhkJqTYbIdvwv6WNtoOuU/A48nU1zdQj
	evyQ+8OZKF5z2LbMkVm2phxXlH29jmpA/3ba8NOg/QhkWnGucwNoLsw1ktFx/i3EgWF1gcnhkaLmz
	5z3+MkGa8Qh04OBcGlUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9hU-0006ui-VR; Tue, 02 Jun 2020 16:23:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg9hJ-0006k2-9q; Tue, 02 Jun 2020 16:23:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C2A0D2A338E;
 Tue,  2 Jun 2020 17:23:27 +0100 (BST)
Date: Tue, 2 Jun 2020 18:23:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v9 9/9] mtd: rawnand: Move the user input parsing bits
 to the ECC framework
Message-ID: <20200602182324.03c29ca0@collabora.com>
In-Reply-To: <20200602143124.29553-10-miquel.raynal@bootlin.com>
References: <20200602143124.29553-1-miquel.raynal@bootlin.com>
 <20200602143124.29553-10-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_092329_503440_BF8A66DF 
X-CRM114-Status: GOOD (  17.97  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue,  2 Jun 2020 16:31:24 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Many helpers are generic to all NAND chips, they should not be
> restricted to be only used by raw NAND controller drivers. They might
> later be used by generic ECC engines and SPI-NAND devices as well so
> move them into a more generic place.
> 
> To avoid moving all the raw NAND core "history" into the generic NAND
> layer, we already moved certain bits into legacy helpers in the raw
> NAND core to ensure backward compatibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/ecc.c                       | 138 +++++++++++++++++
>  drivers/mtd/nand/raw/atmel/nand-controller.c |   3 +-
>  drivers/mtd/nand/raw/denali.c                |   3 +
>  drivers/mtd/nand/raw/nand_base.c             | 150 ++-----------------
>  drivers/mtd/nand/raw/sunxi_nand.c            |   3 +-
>  drivers/mtd/nand/raw/tegra_nand.c            |   5 +-
>  include/linux/mtd/nand.h                     |   7 +
>  include/linux/mtd/rawnand.h                  |   1 -
>  8 files changed, 166 insertions(+), 144 deletions(-)
> 
> diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
> index ad08a047dfc5..1ac7aaa6c6c2 100644
> --- a/drivers/mtd/nand/ecc.c
> +++ b/drivers/mtd/nand/ecc.c
> @@ -328,6 +328,144 @@ const struct mtd_ooblayout_ops *nand_get_large_page_hamming_ooblayout(void)
>  }
>  EXPORT_SYMBOL_GPL(nand_get_large_page_hamming_ooblayout);
>  
> +static enum nand_ecc_engine_type
> +of_get_nand_ecc_engine_type(struct device_node *np)
> +{
> +	return NAND_ECC_ENGINE_TYPE_INVALID;
> +}
> +
> +static const char * const nand_ecc_placement[] = {
> +	[NAND_ECC_PLACEMENT_OOB] = "oob",
> +	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> +};
> +
> +enum nand_ecc_placement of_get_nand_ecc_placement(struct device_node *np)
> +{
> +	enum nand_ecc_placement placement;
> +	const char *pm;
> +	int err;
> +
> +	err = of_property_read_string(np, "nand-ecc-placement", &pm);
> +	if (!err) {
> +		for (placement = NAND_ECC_PLACEMENT_OOB;
> +		     placement < ARRAY_SIZE(nand_ecc_placement); placement++) {
> +			if (!strcasecmp(pm, nand_ecc_placement[placement]))
> +				return placement;
> +		}
> +	}
> +
> +	return NAND_ECC_PLACEMENT_UNKNOWN;
> +}
> +
> +static const char * const nand_ecc_algos[] = {
> +	[NAND_ECC_ALGO_HAMMING]	= "hamming",
> +	[NAND_ECC_ALGO_BCH]	= "bch",
> +	[NAND_ECC_ALGO_RS]	= "rs",
> +};
> +
> +static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
> +{
> +	enum nand_ecc_algo ecc_algo;
> +	const char *pm;
> +	int err;
> +
> +	err = of_property_read_string(np, "nand-ecc-algo", &pm);
> +	if (!err) {
> +		for (ecc_algo = NAND_ECC_ALGO_HAMMING;
> +		     ecc_algo < ARRAY_SIZE(nand_ecc_algos);
> +		     ecc_algo++) {
> +			if (!strcasecmp(pm, nand_ecc_algos[ecc_algo]))
> +				return ecc_algo;
> +		}
> +	}
> +
> +	return NAND_ECC_ALGO_UNKNOWN;
> +}
> +
> +static int of_get_nand_ecc_step_size(struct device_node *np)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
> +	return ret ? ret : val;
> +}
> +
> +static int of_get_nand_ecc_strength(struct device_node *np)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
> +	return ret ? ret : val;
> +}
> +
> +static inline bool of_get_nand_ecc_maximize(struct device_node *np)

The inline is useless here, and I'm even wondering if we couldn't
inline the code of_property_read_bool() call directly.

> +{
> +	return of_property_read_bool(np, "nand-ecc-maximize");
> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
