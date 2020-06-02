Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9014DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 15:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A4E2067B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 15:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CukSlwcz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A4E2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moP3Bu64Vo6bUvEUfuE1SAZCB2xCrxUBMY5II8+6qyM=; b=CukSlwcz2XmxuN
	c1Kd/M1mweBy4Uw4aXvMmNBGihPRfsgK0yZeAhVrjm+wuhzII1yJXhA62befiPAM/WT83c33Oz7rT
	aFhAJYzG3fe0nFKWQEAF7CJrdx2TzLeHhpqxfCzcdG3a1WDg3/v/y8USHO2clkEI5R2yKDVYM/mKo
	j3mqTKJMlIE55zJClA0crV7y+rT1e6klibpEqUT35Ta3voeQ2fF1vlJiXZ80RxeIhN3UAbCdbJmna
	payq4Fgw/zybb75K/cAtWcGGE0ult+KvmV6WSndNEiDXF2kjwwCKFCM6ts0TBCve9mN8ddnnDsY2V
	45+Ir9rpyFAWem+0sNew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9D1-0007Vm-N9; Tue, 02 Jun 2020 15:52:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg9Ct-0007O2-FD; Tue, 02 Jun 2020 15:52:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4B5BF2A2E68;
 Tue,  2 Jun 2020 16:52:01 +0100 (BST)
Date: Tue, 2 Jun 2020 17:51:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v9 1/9] mtd: nand: Create a helper to extract the ECC
 configuration
Message-ID: <20200602175157.438e30bc@collabora.com>
In-Reply-To: <20200602143124.29553-2-miquel.raynal@bootlin.com>
References: <20200602143124.29553-1-miquel.raynal@bootlin.com>
 <20200602143124.29553-2-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_085203_637130_F0F94FA0 
X-CRM114-Status: GOOD (  16.59  )
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

On Tue,  2 Jun 2020 16:31:16 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Despite its current name "eccreq", this object first stores data that
> is meant to be the requirements, and then this data gets eventually
> updated and becomes the actual configuration.

Despite its current name, the eccreq field actually encodes both the
NAND requirements and the final ECC configuration. That works fine when
using on-die ECC since those 2 concepts match perfectly, but it starts
being a problem as soon as we use on-host ECC engines, where we're not
guaranteed to have a perfect match.

> Abstracting this
> indirection will help us clarify the structures in a future change.

Let's hide the ECC configuration access behind a helper so we can later
split those 2 concepts.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/nand.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 2f838394b5f7..7fd0d492073b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -512,6 +512,16 @@ nanddev_get_memorg(struct nand_device *nand)
>  	return &nand->memorg;
>  }
>  
> +/**
> + * nanddev_get_ecc_conf() - Extract the ECC configuration from a NAND device
> + * @nand: NAND device
> + */
> +static inline const struct nand_ecc_props *
> +nanddev_get_ecc_conf(struct nand_device *nand)
> +{
> +	return &nand->eccreq;
> +}
> +
>  int nanddev_init(struct nand_device *nand, const struct nand_ops *ops,
>  		 struct module *owner);
>  void nanddev_cleanup(struct nand_device *nand);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
