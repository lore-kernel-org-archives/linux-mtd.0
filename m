Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59581C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:31:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B4C23332
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B4C23332
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VOYugp0eX4S8BXqwPwB9H8+iEI2PcbygFMS+izmd7jk=; b=Tm3WBGG2Ryw3mzJNUlzeSV9+k
	MYzyuvnUZqS9Jyc3PCREfw5sd9eeR7R5iRMkd3VY1VamWcHHQlCEfSAAK2rX5efhHkqs79M58/kBV
	UO6hBFodFnoitKjxt8C2vaK9sjEhDG4g4tt4CnC3E7tXWzmSjELFkUA1EgudK3LV3Wx0trsDPs+ru
	Mu5u0Ykrv1P1yXltiI9EVGzevLm/gm4r6HZ/a0dzxqf7T2a5ql/t7WKwPIefQF5QLBOBs+VQs+Yo1
	SwB+QjOfuWvx7RcnPLH7gJZ3hwa+xraUneqXYGeos2WJFLXoYyLHPQ5h1r4jBLs97EeBrBynRELwr
	hdOLoEpyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Akq-0001AH-8T; Wed, 20 Jan 2021 10:30:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Akl-00018t-V0
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:30:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D8CF81F455F0;
 Wed, 20 Jan 2021 10:30:12 +0000 (GMT)
Date: Wed, 20 Jan 2021 11:30:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: Add a helper to retrieve the number
 of ECC steps
Message-ID: <20210120113009.7687efde@collabora.com>
In-Reply-To: <20210120101750.1163-2-miquel.raynal@bootlin.com>
References: <20210120101750.1163-1-miquel.raynal@bootlin.com>
 <20210120101750.1163-2-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_053020_096292_BEBAC165 
X-CRM114-Status: GOOD (  18.98  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, ladis@triops.cz,
 linux-mtd@lists.infradead.org, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 Jan 2021 11:17:49 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This operation is very common and deserves a helper. It of course only
> works after the ECC engine initialization.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/nand.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 414f8a4d2853..27e87c02971c 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -585,6 +585,18 @@ nanddev_get_ecc_conf(struct nand_device *nand)
>  	return &nand->ecc.ctx.conf;
>  }
>  
> +/**
> + * nanddev_get_ecc_nsteps() - Extract the actual number of ECC steps
> + * @nand: NAND device
> + */
> +static inline unsigned int
> +nanddev_get_ecc_nsteps(struct nand_device *nand)
> +{
> +	const struct nand_ecc_props *conf = nanddev_get_ecc_conf(nand);
> +
> +	return nanddev_page_size(nand) / conf->step_size;

Some ECC engines might cover OOB bytes too, so you can't really guess
the number of steps with a simple page_size / step_size division. I
think it's safer to store the number of steps and step_size directly in
the conf and let the engine fill those.

> +}
> +
>  /**
>   * nanddev_get_ecc_requirements() - Extract the ECC requirements from a NAND
>   *                                  device


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
