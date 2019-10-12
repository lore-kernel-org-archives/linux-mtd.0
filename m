Return-Path: <SRS0=XqRS=YF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6402CC10F14
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 08:49:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336EA2087E
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 08:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OWJn9i+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336EA2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDLLADSKAopN3EGDnr/8lTmmPpvd2EGi6tf3WP3FNic=; b=OWJn9i+1K2PCJ4
	uFp+9uP/C6hJe8L14eHVImWSrNIPKU9uoRJNzseWftSu+cHKlhpZoTKQFqvvXO6jKzy58SnVEXbVP
	Tx5P+e1CpzMW1ko1cwCsCHkPFvIc3A0JAjUpCixRZbyfbIVRBDHK7SNaTmPIrkh97lC0NnjiH5yMf
	V9MI/IkicmHxrDb8PWUPl72NJXvnujUC/QovIXa7NjIRihgBl60c2x45gRc9IvNr98iO7z2TR4FYZ
	OyaM/NTCJO+dAv5GDQycPfsi3PyvGyQB/+SAl2OtNswYCY6H4hhMHVG+khkRGVI/BEtd1R4URYehl
	UIKtSC2Gh+6Gpf4c5pLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJD5E-00015e-Fo; Sat, 12 Oct 2019 08:49:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJD55-0000xk-Mf; Sat, 12 Oct 2019 08:48:57 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3067328F4B7;
 Sat, 12 Oct 2019 09:48:54 +0100 (BST)
Date: Sat, 12 Oct 2019 10:48:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 02/40] mtd: rawnand: Add an invalid ECC mode to
 discriminate with valid ones
Message-ID: <20191012104851.760bc944@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190919193141.7865-3-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_014855_870941_D6A21F40 
X-CRM114-Status: GOOD (  18.30  )
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

On Thu, 19 Sep 2019 21:31:02 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> NAND ECC modes (or providers) have their own enumeration but, unlike
> their algorithms counterpart, there is no invalid or uninitialized
> value to discriminate between an error and having chosen a no-ECC
> situation. Add an "invalid" entry for this purpose.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 2 +-
>  include/linux/mtd/rawnand.h      | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3bf2d56eced2..e6c483ec191a 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4851,7 +4851,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
>  	if (err < 0)
>  		return err;
>  
> -	for (i = 0; i < ARRAY_SIZE(nand_ecc_modes); i++)
> +	for (i = NAND_ECC_NONE; i < ARRAY_SIZE(nand_ecc_modes); i++)
>  		if (!strcasecmp(pm, nand_ecc_modes[i]))
>  			return i;
>  
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index cd834e9f7e78..ccdc0c314acc 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -84,6 +84,7 @@ struct nand_chip;
>   * Constants for ECC_MODES
>   */
>  enum nand_ecc_mode {
> +	NAND_ECC_INVALID,

Just nitpicking, but I feel -1 would be better fit for this INVALID
value.


	NAND_ECC_INVALID = -1,
	NAND_ECC_NONE = 0,

Unless you plan to add an entry for ECC_INVALID in nand_ecc_modes, of
course, in which case you indeed want to start at 0.

Regardless of that, the change looks good to me:

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  	NAND_ECC_NONE,
>  	NAND_ECC_SOFT,
>  	NAND_ECC_HW,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
