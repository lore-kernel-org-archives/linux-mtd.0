Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AACC4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5L9sRCtJEBY3K4RvZ5JWuFyW7OWUx8nMhTlF3+f1w8=; b=RMNFkcOPkS5PKUmdKq44OdQLaM
	BYTGi9ilr5kY/pkR67UKoRH6cwqnvdTdEbbUMbz3h0dkFHoMYFNmkm7N6l9h86Fmh6T6d/M7Ef29n
	GKBEJay3GDiH3syjo8R6ScxQQOzAkKy/O2A7e8B5cQ1Iu+lnFviWZ2E/hsMzP0RXmMzHFvlasqNlo
	J8M7RpgSdLSCXuD1sBNgfbz7YLPZiYfwQnXoX1p9VVEgYh/Mk6oWeGA+feFFpwyKAD0NtSWZ6ft4e
	LmV47ypkLwlldacOzrdnWrc5hhaL6giEVEtPhEWYaDfy1wDDGmbrINGEhgl04pt6iRLzTO+4M10oc
	PY8OL+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8d5J-00AINN-2A;
	Thu, 30 Nov 2023 09:11:49 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8d5H-00AIMu-10
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 09:11:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7DFCF8CD;
	Thu, 30 Nov 2023 10:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701335499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apVhE6KEJPHw1REtoXYQT08s8pzGtJZSrj9jxBMAzpY=;
	b=oOUgzuZa/ambE49sIusJ0QhvoRM4F7K8Z5Ki2U7DcOi0Rr89mUpuXY1+eaHuFRH6rmU6ZG
	xc7RpW9A1o2VSlQV+6/P5wpGgm05TnFmztaQiJRNMjv3EowJ+WOGeuJuYLalxazlQx+BpO
	H5al9ZYmBylygTAZorVnh5z9GP5Sz02eOlcbJUu+0bk5B2ACAFAgkgahEZPfW0+Za8opJA
	7afS866BdSXbLHZJJukQ5HVzQQ+ydcHY8Wmf0zs0BLR/2Slz0Kau5cWacjMxs0J4hMAXwZ
	AXHuL/5MgUmGZdzhkrHYcEKyinW5xmtkRxD8ZpyT8s/t2ELX0BI9I01xPTbLZg==
MIME-Version: 1.0
Date: Thu, 30 Nov 2023 10:11:39 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
In-Reply-To: <20231130083854.55221-6-jaimeliao.tw@gmail.com>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com>
Message-ID: <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_011147_738591_ED1528FC 
X-CRM114-Status: GOOD (  14.65  )
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

Hi Jaime,

> Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> configured in Octal DTR mode. It means data format D0 D1 D2 D3
> would be swapped to D1 D0 D3 D2. So that whether controller
> support swapping bytes should be checked before enable Octal
> DTR mode. Add swap byte support on a 16-bit boundary when
> configured in Octal DTR mode for Macronix xSPI host controller
> dirver.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/spi/spi-mxic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 60c9f3048ac9..085c9037d6f5 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -572,6 +572,7 @@ static const struct spi_controller_mem_ops 
> mxic_spi_mem_ops = {
> 
>  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
>  	.dtr = true,
> +	.dtr_swab16 = true,
>  	.ecc = true,
>  };

I'm confused. How can this swap the bytes depending on the flashes
requirements? I.e. the controller should look at the spi-mem operation
and either swap the bytes or it should leave them as is.

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
