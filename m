Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED33FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnZHQ2iPF1DpGzqcGwQOEFAKFZw2onNHSSGDUUimRvI=; b=LK1DZGXlQqCDeX
	rSdyqNb8JOqgLLCMlWf+As/uYKNUPFrQ6/HflbQk03ABT8AOW/gwkNHzY2g6rFlWCB7y7t7lBIWwf
	JzEgLtSZU3ClKWfdQZgmwWwE7r3nYmEBeDca6irK/QPG87EhFu1BUtKzs5FDkNwm3HrdQH9E8Qiiw
	1Xijv7UqrPvunJrkcGiked3cagiMWg+dBSJYZELc1kbTT5L0WBJjixN4tW07Cj1aCkJ80FXFBr0fS
	Bt67mnjCkQQniflKFW4b6qTTPmhIGzl4bXBYgcxNBEjM6ivw6DHBYUbHXd7vDFEYIRKOntENYGR7d
	0xlznnxyy0wKyTkJbUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFxE-0098TU-Gm; Fri, 15 Apr 2022 07:01:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFxA-0098Sf-RC
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 07:01:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3B8C81F47DA4;
 Fri, 15 Apr 2022 08:01:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650006061;
 bh=oDcnz0m1mddcgO5NTlXqk8XUEUGT5espCP0WO07gMYU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BqoNpi73XsRvh2WdiBmbhYZ5vFnRU5vebFpBxD/SKyw977vSyO9VpL23vPM4gmFvt
 zBA8w74ae/N+oLLB2g6MtNK5UxWSgsvGC4qVrHDtoaJEfIy8otJdhn8t0L1tItMaAT
 vWHFPwRPA7vkZnA/KaFCLY9eKqNwSxEHLtHwamW6k7r8OWOujpJaUp5Luv2jPd466C
 VB/0KSlvHxcwhHsdanmzpHZhUyIPu4x+iXWhDQChp1ai6qzfGyMf5FAS7VjjvggIK3
 yY/T88bYcKPSIix8MacYKu9C3eVni8nI0CsFF7ulNyOH1qM7c1h+MbUuxEov6zzzoD
 2VMyiKsmCtvZA==
Date: Fri, 15 Apr 2022 09:00:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, Daniel
 Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 2/3] mtd: spinand: add support for detection with
 param page
Message-ID: <20220415090058.5044ae17@collabora.com>
In-Reply-To: <20220415034844.1024538-3-gch981213@gmail.com>
References: <20220415034844.1024538-1-gch981213@gmail.com>
 <20220415034844.1024538-3-gch981213@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_000113_061425_07134568 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, 15 Apr 2022 11:48:43 +0800
Chuanhong Guo <gch981213@gmail.com> wrote:

> +
> +static const struct spinand_manufacturer *spinand_onfi_manufacturers[] = {};

Do we really need a separate manufacturer array? Looks like we could
re-use the one we have in core.c and do the matching against it (we
just need an extra NULL sentinel to detect the end of this array).

> +
> +static const struct spinand_onfi_info *
> +spinand_onfi_chip_match(struct nand_onfi_params *p,
> +			const struct spinand_manufacturer *m)
> +{
> +	size_t i, j;
> +
> +	for (i = 0; i < m->nchips; i++)
> +		for (j = 0; m->onfi_chips[i].models[j]; j++)
> +			if (!strcasecmp(m->onfi_chips[i].models[j], p->model))
> +				return &m->onfi_chips[i];
> +	return NULL;
> +}

> +/**
> + * struct spinand_onfi_info - Structure used to describe SPI NAND with ONFI
> + *			      parameter page
> + * @models: Model name array. Null terminated.
> + * @flags: OR-ing of the SPINAND_XXX flags
> + * @eccinfo: on-die ECC info
> + * @op_variants: operations variants
> + * @op_variants.read_cache: variants of the read-cache operation
> + * @op_variants.write_cache: variants of the write-cache operation
> + * @op_variants.update_cache: variants of the update-cache operation
> + * @select_target: function used to select a target/die. Required only for
> + *		   multi-die chips
> + *
> + * Each SPI NAND manufacturer driver should have a spinand_onfi_info table
> + * describing all the chips supported by the driver.
> + */
> +struct spinand_onfi_info {
> +	const char **const models;
> +	u32 flags;
> +	struct spinand_ecc_info eccinfo;
> +	struct {
> +		const struct spinand_op_variants *read_cache;
> +		const struct spinand_op_variants *write_cache;
> +		const struct spinand_op_variants *update_cache;
> +	} op_variants;
> +	int (*select_target)(struct spinand_device *spinand,
> +			     unsigned int target);
> +};

Can't we just extend spinand_info instead of defining a new struct.
AFAICT, the only difference is that model is replaced by a model array,
and devid is dropped, and I think we can rework the existing ID-based
matching logic to return ->models[0] instead of ->model.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
