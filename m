Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4420AC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dy7VnaERHZMA0YSJKIBWdZh8SoYGwWNoAgKVfGwLkq8=; b=YCjlMRUGgYr6x1a7iFgFGPxjoS
	NRG+Y1icrgf59zAIyZlsbl1K0xBoU23mxrKyQPlGhnHSF/P6BVfOm8lhorYqifvhqqpkFPbgiSHt+
	VE0cI8qLKqK10VClbss9aMsHdBbb+MLWnEJBmSOTXgf2oiYOtHZELKJ1veOQY4uzEM2cRlEBKOFlY
	jQw5s9BFsX6sxqdiCZPaxJ+SngNuWBZNJpDUJ99aNuFxGBRyBJHOze2U8Q2h198ylldgtAJyloC0W
	LSbw/1mUYn0J3RPijLQzusdQjWFK8Fwt+WWvLadmAZHprUqs6Aihb/Pnn4Hh96IQwU2ZYfVgoxdgF
	j/CCWIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFW0J-00DOK3-1V;
	Tue, 19 Dec 2023 09:03:07 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFW0G-00DOIs-2h
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 09:03:06 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5CACC4FB;
	Tue, 19 Dec 2023 10:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702976577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OiuFF9szaBacxMxyNGTp+FGXQiTX0Zl8FfT3aH/h2s=;
	b=AkQKNBVJFtSm10ThkD+o3/tcguMabt/ZueDBJMpPRGE/06R9ew1N2l1lIKpCTX2/NabtK9
	c9XrfYjkmXu4ZWxwYmlYtmJ+1EB061FzX9Y7rIORwD2m9ir01p5S7AcFS/9Vg2zFY6X9y6
	z32MY3IMijR6D6LEUgOyzF9+PX7EP8UA4uowPbm0BSwcysX0G8sRpUAJnnjjaCIcNjieAP
	IoKQLlTOPlNmdEt1cay/uL3lon/Ww013EbwM7aIoEzggJh7oTPAK3oJEi3eHl1pOmItoNw
	pb010eKReqQbXPqmbc0VjeqxhnLIqG0LRm5Ax6u/e3bBwquvZ76pzu/Mq+RoYQ==
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 10:02:57 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: core: Discard HW capabilities if no enable
 function
In-Reply-To: <20231215073413.71443-1-jaimeliao.tw@gmail.com>
References: <20231215073413.71443-1-jaimeliao.tw@gmail.com>
Message-ID: <6eeb2dbb4f0ee4e0c8bfe381aa28ef3f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_010305_205283_37C3A1C0 
X-CRM114-Status: GOOD (  18.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Discard corresponding HW capabilities to prevent carrying the
> wrong protocol if no QUAD/Octal DTR enable function hooked.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c  | 13 +++++++------
>  include/linux/mtd/spi-nor.h |  3 +++
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1c443fe568cf..a3988e8768b3 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2621,6 +2621,13 @@ static int spi_nor_default_setup(struct spi_nor 
> *nor,
>  	 */
>  	shared_mask = hwcaps->mask & params->hwcaps.mask;
> 
> +	/* Mask out Octal DTR if no enable function */
> +	if (!params->set_octal_dtr)
> +		shared_mask &= ~SNOR_HWCAPS_X_X_X_DTR;

please also create a new SNOR_HWCAPS_8_8_8_DTR. While this is
the same for now, I suspect the SNOR_HWCAPS_X_X_X_DTR is might also
carry the 2_2_2_DTR and 4_4_4_DTR flags, just like SNOR_HWCAPS_X_X_X.
In any case, it's easier to read and more consistent with the code
below if you use SNOR_HWCAPS_8_8_8_DTR.

> +
> +	if (!params->quad_enable)
> +		shared_mask &= ~SNOR_HWCAPS_4_4_4;
> +
>  	if (nor->spimem) {
>  		/*
>  		 * When called from spi_nor_probe(), all caps are set and we
> @@ -3093,9 +3100,6 @@ static int spi_nor_set_octal_dtr(struct spi_nor 
> *nor, bool enable)
>  {
>  	int ret;
> 
> -	if (!nor->params->set_octal_dtr)
> -		return 0;
> -

I'd keep these checks, just in case.

>  	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
>  	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
>  		return 0;
> @@ -3123,9 +3127,6 @@ static int spi_nor_set_octal_dtr(struct spi_nor 
> *nor, bool enable)
>   */
>  static int spi_nor_quad_enable(struct spi_nor *nor)
>  {
> -	if (!nor->params->quad_enable)
> -		return 0;
> -

same here.

Otherwise looks good.

-michael

>  	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
>  	      spi_nor_get_protocol_width(nor->write_proto) == 4))
>  		return 0;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d..c421018dadf7 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -266,6 +266,9 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_PP_8_8_8		BIT(22)
>  #define SNOR_HWCAPS_PP_8_8_8_DTR	BIT(23)
> 
> +#define SNOR_HWCAPS_4_4_4	(SNOR_HWCAPS_READ_4_4_4 |	\
> +				 SNOR_HWCAPS_PP_4_4_4)
> +
>  #define SNOR_HWCAPS_X_X_X	(SNOR_HWCAPS_READ_2_2_2 |	\
>  				 SNOR_HWCAPS_READ_4_4_4 |	\
>  				 SNOR_HWCAPS_READ_8_8_8 |	\

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
