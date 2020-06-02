Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C52C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 356802067B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/5WztBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 356802067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok//tGxBYfisGoB3W8lpOKOlDk6QdaNz1R3CmcUDQps=; b=K/5WztBUlbfVM5
	Yh793podiNUOmr9GjgHlCVfbsPNe/pkpEVopNaBXfVWM8MqXkYq3bznJzMYFdbqz3+pX6xS+fIzXT
	bNVrESJPs0f+MUGSBLot4mSStZMtD2VY/epN823gnGQ1aSNYYnyA/uSILB7dGtGF/rVAvyz89a1qK
	vMUrhQfDaC92zocyZn4Ttmc9XLi1fP3DoraN/ZZKrYrX0EaZAtHyGJAow9A1/x+Tkpamc6kdEQASr
	1TuG2DG+dtwyibT7fvxANGMjgfN5zQ7e7tRaS1U/oTt1SlgOwuK3XFOB8Pq6VsGk3Fvei8jCOoGtD
	5KrwitzxASBjwL9ZE/mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9g5-0006Gt-KL; Tue, 02 Jun 2020 16:22:13 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg9fv-00067i-3s; Tue, 02 Jun 2020 16:22:04 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3DA262A338E;
 Tue,  2 Jun 2020 17:22:01 +0100 (BST)
Date: Tue, 2 Jun 2020 18:21:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v9 9/9] mtd: rawnand: Move the user input parsing bits
 to the ECC framework
Message-ID: <20200602182157.26716f89@collabora.com>
In-Reply-To: <20200602143124.29553-10-miquel.raynal@bootlin.com>
References: <20200602143124.29553-1-miquel.raynal@bootlin.com>
 <20200602143124.29553-10-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_092203_305778_C8023007 
X-CRM114-Status: GOOD (  10.18  )
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

> +void nand_ecc_read_user_conf(struct nand_device *nand)

This function is not introduced in this patch, but I'm commenting here.
Looks like it only operates on an OF node, so how about naming it
of_get_nand_ecc_config().

> +{
> +	struct device_node *dn = nanddev_get_of_node(nand);
> +	int strength, size;
> +
> +	nand->ecc.user_conf.engine_type = of_get_nand_ecc_engine_type(dn);
> +	nand->ecc.user_conf.algo = of_get_nand_ecc_algo(dn);
> +	nand->ecc.user_conf.placement = of_get_nand_ecc_placement(dn);
> +
> +	strength = of_get_nand_ecc_strength(dn);
> +	if (strength >= 0)
> +		nand->ecc.user_conf.strength = strength;
> +
> +	size = of_get_nand_ecc_step_size(dn);
> +	if (size >= 0)
> +		nand->ecc.user_conf.step_size = size;
> +
> +	if (of_get_nand_ecc_maximize(dn))
> +		nand->ecc.user_conf.flags |= NAND_ECC_MAXIMIZE;
> +}
> +EXPORT_SYMBOL(nand_ecc_read_user_conf);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
