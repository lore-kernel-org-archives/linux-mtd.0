Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72CFC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E3E20801
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jc1YNoy3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="TFqgm4WJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E3E20801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ldnb+km1ZrWDUM/CHgj5eVRxlV5VF8vrtJ9SILECleM=; b=Jc1YNoy3udkdU3WEWqCz1kWmk
	gYT9XB6dL0nC1ZSrwmSqLIL+QeUBg0pl6p6K9+lZKzdtHLcVT7i1nGzMDBVFg9yhYWzGho2QacPQh
	jphc6IaIQwYrj5fg+6p5ZPFdcYw2wYyjCnUPtq6a7twSx98nS/BaTO1dZfOm3VdyVKzWTkI/phGup
	8sTnshIWfcJK1bZYSY32RGJHwkxaEw9KiuyDwxqlMjXOxAbm1WizA6WuJaUADKaTnYvm+r3NkcIF1
	QW8qGuPdj+Fj/uSxKyp88kBbxzLsnnMyU2xyMEW11EXme8Lls0PqlSAr22apRCVIq452kKWi5IYPn
	WEUSjhxfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY5kF-0002sE-Ac; Mon, 11 May 2020 10:33:11 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY5kC-0002ro-Du
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 10:33:09 +0000
Received: by mail-lj1-x241.google.com with SMTP id f18so8863167lja.13
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+1K32KIY0+D0cdH+ZG19X0zfUfusxMY2hZTNeNyITA=;
 b=TFqgm4WJnGM4q5y9yg36PO6LxGg87S2BRDDzal6bpM9nJLb13VxGWkQLgkVvkgwEZD
 tlwgx8jJNYAOlBa8tEYHw3Fxp+H27Z1UYNGf+BolHXtz2IGprWJwm89/8c/7QDLLH93w
 mvt2jF4CumkJ4Bc6B6PV9n8OhweYDhGtlbU1oFt4+sR7lR5tf3Ma36dpTg6hnv53tOuU
 lyWBigI/1TMwD2swdMyHx6AxpKQX9WIIFUqd+glHrAAeSj0iGVSwdL9XV0SsDfgPcoJj
 DNnkEkK69pzOTt0NuJAA9ZTFi+XcY6O+fC5rbUZvgpRUgUTZwbNzjnsUc+ZFygnSmwjj
 3ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+1K32KIY0+D0cdH+ZG19X0zfUfusxMY2hZTNeNyITA=;
 b=tcfSmWSyqm6zg0E6CKtG6HS7p1+rKX40h0AfeRPOo25KEach6cVErc8VOC3fsiKLms
 OK+QBygkoHXJqJH0/sh1SXoRE+E17l/fdwQSdpPDzWxaRIhCzxfRS5TlY0OdlX/O2iS+
 EVP2MteELHV689ptAcTvZ1styCijuGEW9Vfz8k8X2yke3QRhYBHxortwm1DbY5STjdp1
 a64lEQ3kz2JEaXaYoGYHwp2bNh6UnBClaNMdvdi3OKohyUuO4/VS6an/7fVXs3+t0N5y
 uONEAmlyqvMrMyUU0w+hVBSlEdwVEGg1Ym8qTQ9YJ1OGwsVu4A/R5XnOs2951w9p6DhM
 x4Sg==
X-Gm-Message-State: AOAM532zCU9y8hvYN8F92nxy2K7Y4rThbdCUIpknR7ux65kxGhR0NhMU
 zZtgYlv4YBKyCQfEFNdkPepVsg==
X-Google-Smtp-Source: ABdhPJxfajGjLoQ9ufrLEHjR8YuRDMuOxu0hYmIpd7uQzggl+TQeVVQctkULD1OIdIcWFnHDU3+V1A==
X-Received: by 2002:a2e:b885:: with SMTP id r5mr9625234ljp.118.1589193185672; 
 Mon, 11 May 2020 03:33:05 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:482:2677:ba:b682:3c24:214e?
 ([2a00:1fa0:482:2677:ba:b682:3c24:214e])
 by smtp.gmail.com with ESMTPSA id q6sm9703965ljg.67.2020.05.11.03.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 03:33:05 -0700 (PDT)
Subject: Re: [PATCH 45/62] mtd: rawnand: r852: Stop using nand_release()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
 <20200510121220.18042-46-miquel.raynal@bootlin.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fd705f87-2d40-bb2f-99cb-6583e775e2c5@cogentembedded.com>
Date: Mon, 11 May 2020 13:33:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510121220.18042-46-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_033308_670832_7374403D 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello

On 10.05.2020 15:12, Miquel Raynal wrote:

> This helper is not very useful and very often people get confused:
> they use nand_release() instead of nand_cleanup().
> 
> Let's stop using nand_release() by calling mtd_device_unregister() and
> nand_cleanup() directly.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> ---
>   drivers/mtd/nand/raw/r852.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
> index 77774250fb11..f865e3a47b01 100644
> --- a/drivers/mtd/nand/raw/r852.c
> +++ b/drivers/mtd/nand/raw/r852.c
> @@ -651,7 +651,8 @@ static int r852_register_nand_device(struct r852_device *dev)
>   	dev->card_registered = 1;
>   	return 0;
>   error3:
> -	nand_release(dev->chip);
> +	WARN_ON(mtd_device_unregister(nand_to_mtd(dev->chip)));

    Sometimes you declare a variable to receive the result, sometimes (more 
seldom) you don't... What guides you?

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
