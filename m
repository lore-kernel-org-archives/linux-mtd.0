Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B717CDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 01:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVaAcbxhLvDgtK4GgtvZHlcqH/gmPckSIK7aUTqFvcg=; b=nCThsfnHC0cIwb
	sSz4Z6LwgudNusy0hAd7jzZUOQRED7ef3waVfUqw+xEcpFmSXD8wNAi5LcBc/g/GAqHhP97VRryRC
	GBkBRF97TCcyE1hZdu3KS66ES1FN9vkwQ5sarUVou+2sLIkrYiQzrqmMWmjSV6Mj4qtFfp7XBUhU/
	lCSORyz/7FIXtH4FfGp0bs/lhnpazT+3KH21NmS20JdmLJtvrWGgVwrYo6T/BYsU2mTF2K9a5rpxg
	kKvuiofKxYoj+0jqgHjWV3qXWwsFbP2QVbo1xl9Ej93lvum9Pt9z2nWTTDwz6M5UU8Yr1LxYW+RVW
	EHZRv5sjgpiZdxYgdOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHeK-00G30j-2N;
	Thu, 19 Oct 2023 01:16:32 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHeE-00G2xb-2h
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 01:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697678180;
	bh=WTKHc8k9e1k6oAAPlUBGsSr/qDu6nL0+e9yR3HjsIXg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ny8MUdWrEpt3TzloqlcGQqFJYCMsZ4sf0+wb6FT6ZSNOiyOm4g2stVOaUGv5kOHVX
	 92Rq1E1i/BHe8Sxu5IW58UUUa8AUzvhLIXp1SMrBpNdrnf8UueVkh3sqovpG+KmROQ
	 IkGfQEeZIHn6VpeGAW41aiyZt+Babb9/fsj1T2WKXg0FI9Oe+0xlV548QbuyTphxKK
	 qhADApyQs+K5LuznQnTIdQCdqkFWFh7dnptAXppmIeuQUg9P6B1ary1lmHWejIkFh2
	 MT2eBMBvUEyoKDwuJDEv2teZMFTqO4MMZcGha0lMacLiwco9hPCP7ctYzJqFeyOpfx
	 rEd4K9jxJJM1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9qYF6B7Hz4xZm;
	Thu, 19 Oct 2023 12:16:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yi Yang <yiyang13@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, u.kleine-koenig@pengutronix.de,
 tudor.ambarus@linaro.org, robh@kernel.org
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] mtd: powernv_flash: check return value of devm_kasprintf()
In-Reply-To: <20231018092728.315071-1-yiyang13@huawei.com>
References: <20231018092728.315071-1-yiyang13@huawei.com>
Date: Thu, 19 Oct 2023 12:16:17 +1100
Message-ID: <874jin76ou.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181627_083025_54DD0317 
X-CRM114-Status: GOOD (  14.81  )
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

Yi Yang <yiyang13@huawei.com> writes:
> The devm_kasprintf() returns a pointer to dynamically allocated memory.
> that will return NULL when allocate failed.
> Fix it by check return value of devm_kasprintf().
>
> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index 66044f4f5bad..b305e555ddbf 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -207,6 +207,10 @@ static int powernv_flash_set_driver_info(struct device *dev,
>  	 * get them
>  	 */
>  	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
> +	if (mtd->name) {

That seems like the wrong check?

cheers

> +		dev_err(dev, "failed to allocate mtd->name\n");
> +		return -ENOMEM;
> +	}
>  	mtd->type = MTD_NORFLASH;
>  	mtd->flags = MTD_WRITEABLE;
>  	mtd->size = size;
> -- 
> 2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
