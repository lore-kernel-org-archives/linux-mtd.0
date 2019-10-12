Return-Path: <SRS0=XqRS=YF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF0FC10F14
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74EB4206A1
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijNKfFXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74EB4206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okJjft+vmgBfNCGk6mQlM4VtHRCDsuf/ezwC7G0t4a0=; b=ijNKfFXQ/FQCOc
	crotNAap7h9YmeLDxlQUspatz9Aj2vFXYvqN+PfydgzbMuXAeRhkAoefmtxEwdSTczfMfNJPKucfE
	LFobSeBVp3EVVZc/zcHPOgFjSOmvi1XebP1wbjsidE8K9Ax6IO84c4vk8qghVXLO6NtMnI6x4QIxh
	vwYGJqjJyZhyeqnvoF8/D2ijGIOoU+g61OMuwH3qK5hF90TY0sw5+8auVrt4KKD0Avu+CULZYXy02
	lr9sCtw5JCNlp8mmfA8gpGRf4QFu/SFJWXsgz5MebzE3ypS0Hq7ZY/sjwHmRb6/jiqCVEse3xdnbk
	zsYlJcdgDj59GgUIItwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJE7m-0004vt-MX; Sat, 12 Oct 2019 09:55:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJE7e-0004og-4Y; Sat, 12 Oct 2019 09:55:40 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6002C2912E3;
 Sat, 12 Oct 2019 10:55:36 +0100 (BST)
Date: Sat, 12 Oct 2019 11:55:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 05/40] mtd: rawnand: Create a new enumeration to
 describe properly ECC types
Message-ID: <20191012115533.007e62cc@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190919193141.7865-6-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_025538_311244_A9378821 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 19 Sep 2019 21:31:05 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Now that the misleading mix between ECC engine type and OOB placement
> has been addressed, add a new enumeration to properly define ECC types
> (also called provider or mode).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c |  7 +++++++
>  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 9a05ebfc44d1..00a261284aad 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4842,6 +4842,13 @@ static const char * const nand_ecc_modes[] = {
>  	[NAND_ECC_ON_DIE]	= "on-die",
>  };
>  
> +static const char * const nand_ecc_engine_providers[] = {
> +	[NAND_NO_ECC_ENGINE] = "none",
> +	[NAND_SOFT_ECC_ENGINE] = "soft",
> +	[NAND_HW_ECC_ENGINE] = "hw",
> +	[NAND_ON_DIE_ECC_ENGINE] = "on-die",
> +};
> +
>  static const char * const nand_ecc_engine_oob_placement[] = {
>  	[NAND_ECC_SYNDROME_OOB_PLACEMENT] = "hw_syndrome",
>  	[NAND_ECC_OOB_FIRST_PLACEMENT] = "hw_oob_first",
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 1b462fb2ab77..23feab162bc2 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -93,6 +93,22 @@ enum nand_ecc_mode {
>  	NAND_ECC_ON_DIE,
>  };
>  
> +/**
> + * enum nand_ecc_engine_type - NAND ECC engine type/provider
> + * @NAND_INVALID_ECC_ENGINE: Invalid value
> + * @NAND_NO_ECC_ENGINE: No ECC correction
> + * @NAND_SOFT_ECC_ENGINE: Software ECC correction
> + * @NAND_HW_ECC_ENGINE: Hardware (controller side) ECC correction
> + * @NAND_ON_DIE_ECC_ENGINE: Hardware (chip side) ECC correction
> + */
> +enum nand_ecc_engine_type {
> +	NAND_INVALID_ECC_ENGINE,
> +	NAND_NO_ECC_ENGINE,
> +	NAND_SOFT_ECC_ENGINE,
> +	NAND_HW_ECC_ENGINE,
> +	NAND_ON_DIE_ECC_ENGINE,
> +};
> +

No that I know where you're going, I'd recommend moving those
definitions to the generic NAND layer (or the generic ECC layer you're
about to introduce). Actually, re-ordering patches to put rawnand
changes after the introduction of the generic ECC layer might even be
simpler.

>  /**
>   * enum nand_ecc_engine_oob_placement - NAND ECC engine OOB placement
>   * @NAND_ECC_DEFAULT_OOB_PLACEMENT: Standard layout, or not specified


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
