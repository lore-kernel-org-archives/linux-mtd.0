Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF19C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8BF2084C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jLjNLOuH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A8BF2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdFOyCNlu8vMGcv9dtuDoMfPCnl7GqnVUBh2MuuQb8o=; b=jLjNLOuHpUA5ZD
	FaToGyxqw2M/ocioY+xbyqQ3dvsp/I/4vuNAr4xk7S1iBGQZlXhEmCCwWrX3xK/Q83QupVpyLzN53
	64nJVajlzV/IH6KOXzjXe/g4qSGxIIlg8oiYInMDLCUWtDK1xo5Xf9nu7lv3sWQ/oCYG57kGEtrE5
	QKbxeFFCIz7umAdIkroEjVtdp/Ek1UuMCIlb3Xznb8IIDROnSD0uMloW3IMDEyqC0Pb2J7Kjp0KxO
	c1k6l7iah9ow9tqvjueH6U8Q2wc8XH1Ark6/aKsKYy8xFsn8+J9mU5J5mF21U8ke8t1sVES7Ny7Jt
	eXwHeea6y0UjqErRqjCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJcG-0004Ea-Fd; Thu, 28 May 2020 14:34:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJc4-00045a-GO; Thu, 28 May 2020 14:34:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CDF1F2A3FA6;
 Thu, 28 May 2020 15:34:26 +0100 (BST)
Date: Thu, 28 May 2020 16:34:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 14/18] mtd: nand: Add more parameters to the
 nand_ecc_props structure
Message-ID: <20200528163424.6677597c@collabora.com>
In-Reply-To: <20200528113113.9166-15-miquel.raynal@bootlin.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
 <20200528113113.9166-15-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_073428_812094_7367C3AA 
X-CRM114-Status: GOOD (  20.62  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Weijie Gao <weijie.gao@mediatek.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 28 May 2020 13:31:09 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Prepare the migration to the generic ECC framework by adding more
> fields to the nand_ecc_props structure which will be used widely to
> describe different kind of ECC properties.
> 
> Doing this imposes to move the engine type, ECC placement and
> algorithm enumerations in a shared place: nand.h.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/nand.h    | 52 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h | 44 -------------------------------
>  2 files changed, 52 insertions(+), 44 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 6add464fd18b..2e9af24936cd 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -127,14 +127,66 @@ struct nand_page_io_req {
>  	int mode;
>  };
>  
> +/**
> + * enum nand_ecc_engine_type - NAND ECC engine type
> + * @NAND_ECC_ENGINE_TYPE_INVALID: Invalid value
> + * @NAND_ECC_ENGINE_TYPE_NONE: No ECC correction
> + * @NAND_ECC_ENGINE_TYPE_SOFT: Software ECC correction
> + * @NAND_ECC_ENGINE_TYPE_ON_HOST: On host hardware ECC correction
> + * @NAND_ECC_ENGINE_TYPE_ON_DIE: On chip hardware ECC correction
> + */
> +enum nand_ecc_engine_type {
> +	NAND_ECC_ENGINE_TYPE_INVALID,
> +	NAND_ECC_ENGINE_TYPE_NONE,
> +	NAND_ECC_ENGINE_TYPE_SOFT,
> +	NAND_ECC_ENGINE_TYPE_ON_HOST,
> +	NAND_ECC_ENGINE_TYPE_ON_DIE,
> +};
> +
> +/**
> + * enum nand_ecc_placement - NAND ECC bytes placement
> + * @NAND_ECC_PLACEMENT_UNKNOWN: The actual position of the ECC bytes is unknown
> + * @NAND_ECC_PLACEMENT_OOB: The ECC bytes are located in the OOB area
> + * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout, there are ECC bytes
> + *                                  interleaved with regular data in the main
> + *                                  area
> + */
> +enum nand_ecc_placement {
> +	NAND_ECC_PLACEMENT_UNKNOWN,
> +	NAND_ECC_PLACEMENT_OOB,
> +	NAND_ECC_PLACEMENT_INTERLEAVED,
> +};
> +
> +/**
> + * enum nand_ecc_algo - NAND ECC algorithm
> + * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
> + * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
> + * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
> + * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
> + */
> +enum nand_ecc_algo {
> +	NAND_ECC_ALGO_UNKNOWN,
> +	NAND_ECC_ALGO_HAMMING,
> +	NAND_ECC_ALGO_BCH,
> +	NAND_ECC_ALGO_RS,
> +};
> +
>  /**
>   * struct nand_ecc_props - NAND ECC properties
> + * @engine_type: ECC engine type
> + * @placement: OOB placement (if relevant)
> + * @algo: ECC algorithm (if relevant)
>   * @strength: ECC strength
>   * @step_size: Number of bytes per step
> + * @flags: Misc properties

I'd like to hear more about that one. What is this about? I'd rather
not add a field if it's not needed.

>   */
>  struct nand_ecc_props {
> +	enum nand_ecc_engine_type engine_type;
> +	enum nand_ecc_placement placement;
> +	enum nand_ecc_algo algo;
>  	unsigned int strength;
>  	unsigned int step_size;
> +	unsigned int flags;
>  };
>  
>  #define NAND_ECCREQ(str, stp) { .strength = (str), .step_size = (stp) }
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index c3411a08ce61..8f7f1cce3b4b 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -92,50 +92,6 @@ enum nand_ecc_mode {
>  	NAND_ECC_ON_DIE,
>  };
>  
> -/**
> - * enum nand_ecc_engine_type - NAND ECC engine type
> - * @NAND_ECC_ENGINE_TYPE_INVALID: Invalid value
> - * @NAND_ECC_ENGINE_TYPE_NONE: No ECC correction
> - * @NAND_ECC_ENGINE_TYPE_SOFT: Software ECC correction
> - * @NAND_ECC_ENGINE_TYPE_ON_HOST: On host hardware ECC correction
> - * @NAND_ECC_ENGINE_TYPE_ON_DIE: On chip hardware ECC correction
> - */
> -enum nand_ecc_engine_type {
> -	NAND_ECC_ENGINE_TYPE_INVALID,
> -	NAND_ECC_ENGINE_TYPE_NONE,
> -	NAND_ECC_ENGINE_TYPE_SOFT,
> -	NAND_ECC_ENGINE_TYPE_ON_HOST,
> -	NAND_ECC_ENGINE_TYPE_ON_DIE,
> -};
> -
> -/**
> - * enum nand_ecc_placement - NAND ECC bytes placement
> - * @NAND_ECC_PLACEMENT_UNKNOWN: The actual position of the ECC bytes is unknown
> - * @NAND_ECC_PLACEMENT_OOB: The ECC bytes are located in the OOB area
> - * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout, there are ECC bytes
> - *                                  interleaved with regular data in the main
> - *                                  area
> - */
> -enum nand_ecc_placement {
> -	NAND_ECC_PLACEMENT_UNKNOWN,
> -	NAND_ECC_PLACEMENT_OOB,
> -	NAND_ECC_PLACEMENT_INTERLEAVED,
> -};
> -
> -/**
> - * enum nand_ecc_algo - NAND ECC algorithm
> - * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
> - * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
> - * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
> - * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
> - */
> -enum nand_ecc_algo {
> -	NAND_ECC_ALGO_UNKNOWN,
> -	NAND_ECC_ALGO_HAMMING,
> -	NAND_ECC_ALGO_BCH,
> -	NAND_ECC_ALGO_RS,
> -};
> -
>  /*
>   * Constants for Hardware ECC
>   */


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
