Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516C0C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D0F2065C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVNGguXc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D0F2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCJN0PEALUq0YOWWQhEjv7G97xWiohcleRk3YVphfmU=; b=WVNGguXct+dPlw
	cU3p3g2+wv8j7SqcIQtODzaxcSJY3AqEIwvOBokKthfOfg4SuD1QdsXRhkywGBdbDirHtfjXPhvfl
	q5AtzZApq1QLpzP1qgUsqB30mLVJAPCxiVRNxOg50WHS9Uk1Nv7QhWYRr0SqXz9SGCogIKAykI3WO
	oFwXsv6TYviO+psIU+S1H1UyZ0J/HEzIyRzfGCHBUiRYkVp/MlfUgMPVquBfWc0wD+kd+tQDgAjrk
	iT7+sZo+wJlklW0+SABr8acNzSIHM94U/Fqqp5SYT3HkTHEEG3oAAI6/fFxIhqWP4f2Nqkn7Nji6Z
	W3uSMry8aq8x4igyPDNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9L1-0005t6-U9; Tue, 02 Jun 2020 16:00:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg9Ku-0005ma-Pu; Tue, 02 Jun 2020 16:00:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6C20C2A1AC0;
 Tue,  2 Jun 2020 17:00:19 +0100 (BST)
Date: Tue, 2 Jun 2020 18:00:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v9 4/9] mtd: rawnand: Use nanddev_get_ecc_requirements()
 when relevant
Message-ID: <20200602180016.2adefd73@collabora.com>
In-Reply-To: <20200602143124.29553-5-miquel.raynal@bootlin.com>
References: <20200602143124.29553-1-miquel.raynal@bootlin.com>
 <20200602143124.29553-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_090020_968995_E26F48F3 
X-CRM114-Status: GOOD (  12.50  )
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

On Tue,  2 Jun 2020 16:31:19 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:


> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 1ce2cbe72e4c..e8e22d79f422 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4725,6 +4725,9 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
>  static bool find_full_id_nand(struct nand_chip *chip,
>  			      struct nand_flash_dev *type)
>  {
> +	struct nand_device *base = &chip->base;
> +	struct nand_ecc_props *requirements =
> +		(struct nand_ecc_props *)nanddev_get_ecc_requirements(base);

Ouch, that sounds wrong. How about introducing a
nanddev_set_ecc_requirements() helper instead? The same applies to all
places where you have this cast.

> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index e572d1600f63..0b89da54bef2 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -527,7 +527,7 @@ nanddev_get_ecc_conf(struct nand_device *nand)
>   *                                  device
>   * @nand: NAND device
>   */
> -const struct nand_ecc_props *
> +static inline const struct nand_ecc_props *
>  nanddev_get_ecc_requirements(struct nand_device *nand)

Looks like this should be squashed in patch 2.

>  {
>  	return &nand->eccreq;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
