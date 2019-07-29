Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6640FC7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 07:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA6720693
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 07:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2z1KSBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CA6720693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02ZC5gRkHTn05wbJrBw3KDhR7GfGGVKHeVtmNMOe0PU=; b=A2z1KSBLFv/j4l
	Wtc09cX2CCPsRPLWxyR1CoLKMBqPLk3FaS2wBW17az4hWxltKdjLttonJOB9wNKikOYT5T6C9/N6S
	G/Cs/ToHF6eLLd6hFNl/pjH3XdFRHJqVz9RKkAvcMVMnW7Rh6i6I3/T12s2eBgvbNgAZo7McOCiTn
	BA06L/hAsn5u4FaMQNYnIp6n02mMtQ/os3bMd8PbNjeJBFdeure8nlqvFkHSu2lMdWO07Hl2V/rDq
	nvJOZ3gWwroovdMP6CW+ldqGNSJjvPRNyPi7Z84su8LFnToacWq6a1xa0EJVcqpKUFrh+NmUGAiDE
	OUPtvifwCSw8tCmOChwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs0X8-00019x-8v; Mon, 29 Jul 2019 07:57:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs0X4-00019S-ID
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 07:57:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2875528A6AB;
 Mon, 29 Jul 2019 08:57:19 +0100 (BST)
Date: Mon, 29 Jul 2019 09:57:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2] mtd: rawnand: micron: handle on-die "ECC-off"
 devices correctly
Message-ID: <20190729095715.2de79aea@collabora.com>
In-Reply-To: <20190729070652.12629-1-m.felsch@pengutronix.de>
References: <20190729070652.12629-1-m.felsch@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_005722_736228_2A8D1DA5 
X-CRM114-Status: GOOD (  23.39  )
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
Cc: richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, stable@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jul 2019 09:06:52 +0200
Marco Felsch <m.felsch@pengutronix.de> wrote:

> Some devices are supposed to do not support on-die ECC but experience

		^ are not supposed to support

> shows that internal ECC machinery can actually be enabled through the
> "SET FEATURE (EFh)" command, even if a read of the "READ ID Parameter
> Tables" returns that it is not.
> 
> Currently, the driver checks the "READ ID Parameter" field directly
> after having enabled the feature. If the check fails it returns
> immediately but leaves the ECC on. When using buggy chips like
> MT29F2G08ABAGA and MT29F2G08ABBGA, all future read/program cycles will
> go through the on-die ECC, confusing the host controller which is
> supposed to be the one handling correction.
> 
> To address this in a common way we need to turn off the on-die ECC
> directly after reading the "READ ID Parameter" and before checking the
> "ECC status".
> 
> Cc: stable@vger.kernel.org
> Fixes: dbc44edbf833 ("mtd: rawnand: micron: Fix on-die ECC detection logic")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> v2:
> - adapt commit message according Miquel comments
> - add fixes, stable tags
> - add Boris rb-tag
> 
>  drivers/mtd/nand/raw/nand_micron.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index 1622d3145587..fb199ad2f1a6 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -390,6 +390,14 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>  	    (chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MASK) != 0x2)
>  		return MICRON_ON_DIE_UNSUPPORTED;
>  
> +	/*
> +	 * It seems that there are devices which do not support ECC official.

								    ^officially.

> +	 * At least the MT29F2G08ABAGA / MT29F2G08ABBGA devices supports
> +	 * enabling the ECC feature but don't reflect that to the READ_ID table.
> +	 * So we have to guarantee that we disable the ECC feature directly
> +	 * after we did the READ_ID table command. Later we can evaluate the
> +	 * ECC_ENABLE support.
> +	 */
>  	ret = micron_nand_on_die_ecc_setup(chip, true);
>  	if (ret)
>  		return MICRON_ON_DIE_UNSUPPORTED;
> @@ -398,13 +406,13 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>  	if (ret)
>  		return MICRON_ON_DIE_UNSUPPORTED;
>  
> -	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> -		return MICRON_ON_DIE_UNSUPPORTED;
> -
>  	ret = micron_nand_on_die_ecc_setup(chip, false);
>  	if (ret)
>  		return MICRON_ON_DIE_UNSUPPORTED;
>  
> +	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> +		return MICRON_ON_DIE_UNSUPPORTED;
> +
>  	ret = nand_readid_op(chip, 0, id, sizeof(id));
>  	if (ret)
>  		return MICRON_ON_DIE_UNSUPPORTED;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
