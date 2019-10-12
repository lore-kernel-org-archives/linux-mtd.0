Return-Path: <SRS0=XqRS=YF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EDC4360C
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1172C21850
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="euEANLos"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1172C21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPMYW3cWjzDGiknl6m7QTu8RVEyTyQPJ2/eHrzcOfJ8=; b=euEANLosa4nYay
	q4kwbr/cjsaH6X759L0C1lm6zLrwvbGsb4475+hen1G+yXdBNF6tMwQOKO4pReGc8y2Bc1VVsYN9a
	Sspm6tLAA9b/p3bcS4DmyZ3vSByqmrXTEAVEFNl6aULt7TAF8zwE6zejS0DNtkT2uylo2InEVrrnq
	TEv91f/aQMAjRm9rL6jxyDssS1Xrp8Bw7CGEm4sORS9o+rDU75FWi2TB0cDEJMhh4Os+nUpWa0KWr
	V1hjyFPzbyrL95pg5keF4pmAwsWMIP5sRfXkK0DxfmKvxDa5OlMsP17Ae534eZ7fqG0EG/Pi6AdAf
	EPyT5cq5sq14dVryuwRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJDig-00033l-7p; Sat, 12 Oct 2019 09:29:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJDiW-0002vG-W2; Sat, 12 Oct 2019 09:29:42 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 75EEC28EDBF;
 Sat, 12 Oct 2019 10:29:39 +0100 (BST)
Date: Sat, 12 Oct 2019 11:29:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 07/40] mtd: rawnand: Drop the legacy ECC type
 enumeration
Message-ID: <20191012112936.6c6fbea8@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190919193141.7865-8-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_022941_160270_F46750A3 
X-CRM114-Status: GOOD (  16.64  )
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

On Thu, 19 Sep 2019 21:31:07 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Now that all files have been migrated to use the new enumeration, drop
> the old one which is unused.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c |  9 ---------
>  include/linux/mtd/rawnand.h      | 13 -------------
>  2 files changed, 22 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index ad0b892c2523..c313fe4fc16c 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4833,15 +4833,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	return ret;
>  }
>  
> -static const char * const nand_ecc_modes[] = {
> -	[NAND_ECC_NONE]		= "none",
> -	[NAND_SOFT_ECC_ENGINE]		= "soft",
> -	[NAND_ECC_HW]		= "hw",
> -	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
> -	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
> -	[NAND_ECC_ON_DIE]	= "on-die",
> -};

You can't really drop that one, for DT backward compat.

> -
>  static const char * const nand_ecc_engine_providers[] = {
>  	[NAND_NO_ECC_ENGINE] = "none",
>  	[NAND_SOFT_ECC_ENGINE] = "soft",
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 08964ce8b65f..6c9be596a2d1 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -80,19 +80,6 @@ struct nand_chip;
>  
>  #define NAND_DATA_IFACE_CHECK_ONLY	-1
>  
> -/*
> - * Constants for ECC_MODES
> - */
> -enum nand_ecc_mode {
> -	NAND_ECC_INVALID,
> -	NAND_ECC_NONE,
> -	NAND_ECC_SOFT,
> -	NAND_ECC_HW,
> -	NAND_ECC_HW_SYNDROME,
> -	NAND_ECC_HW_OOB_FIRST,
> -	NAND_ECC_ON_DIE,
> -};
> -

You can drop the enum though, assuming you have a way to convert
ecc_modes strings into engine_type+placement pairs.

>  /**
>   * enum nand_ecc_engine_type - NAND ECC engine type/provider
>   * @NAND_INVALID_ECC_ENGINE: Invalid value


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
