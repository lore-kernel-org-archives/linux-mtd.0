Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F348BC6FA99
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33kRxbWxzQQWmM+fmiEwkWXa5RpH8RK3lppHsSol0tY=; b=EG+rszOL7I1E9HMNNXRzP9H6vp
	vHiQk4v3bX47jvasEuhERI4bdq3VgODo0s70AhW81/VDAJs86llRB9YP7epCXIqD3BeJn4Zd8EAU3
	9mz7URpas/c02M7/Ne0XOPJO/q/UoMGMaVbIF3dKIwyFuBxQKpxxLmIyW4omEvTAPvLjeIpuCSit5
	sVCVAhOMi5PkXKWQy8pFW3op8RfSRyKNhplBupwXKCNiR8qfeNNGpc3KfFJZyEVjtpigN3VJLeAt9
	j2CwlM4BeORny7PPImwGEIdzLd5kyqyaG1x8vTHf7ONK1N98OSOHE/pihYvA+OY4q4I2S6TGQsKHF
	o/59nhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeG1-002QMa-UL; Tue, 07 Mar 2023 20:50:01 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeFy-002QME-D7
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 20:49:59 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D95EC164F;
	Tue,  7 Mar 2023 21:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678222195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Np+MDOSSlpkp1Rq4TktNEvvAl/yCZYPzzy7E0o+mWh4=;
	b=qilZoms0NZPHL0qz3yLstROfQ647WdWOcVeyNYrmA0l1rqR03Kr8XiRnxpYme6E4Iu4t55
	3xEEblVp8PaSXiVu6QEh8fzFnSkHTy1uuk2XtPl9wBSi6e38vkSU2ciGhn06bEyFtEzSLG
	ghTREMXmOEgC4qIKdnqW/QrtQOT02/Fn0PvbkLzLp9Kx2lwK7uhek76ZE+NmnGVAgmiuwB
	Oc23TGhqY7qgt05kUz3AFNgCEAuUVwwadydQpims2y7SytcJQQjQ0zfANNoJpaQwFDPF3H
	M67DahwCBSEABxSzpCk5cCGS7OLSpr1obSAXl75vSlJK7D9Kx9FqgEW0d2TuBg==
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 21:49:55 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: core: provide unique name for nvmem device, take
 two
In-Reply-To: <20230306125805.678668-1-michael@walle.cc>
References: <20230306125805.678668-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b112b0b996e6f60140aff8944428dc2c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_124958_628385_8A42EB84 
X-CRM114-Status: GOOD (  21.76  )
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

Hi Miquel,

Am 2023-03-06 13:58, schrieb Michael Walle:
> Commit c048b60d39e1 ("mtd: core: provide unique name for nvmem device")
> tries to give the nvmem device a unique name, but fails badly if the 
> mtd
> device doesn't have a "struct device" associated with it, i.e. if
> CONFIG_MTD_PARTITIONED_MASTER is not set. This will result in the name
> "(null)-user-otp", which is not unique. It seems the best we can do is
> to use the compatible name together with a unique identifier added by
> the nvmem subsystem by using NVMEM_DEVID_AUTO.
> 
> Fixes: c048b60d39e1 ("mtd: core: provide unique name for nvmem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/mtdcore.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 0feacb9fbdac..3fe2825a85a1 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -888,8 +888,7 @@ static struct nvmem_device
> *mtd_otp_nvmem_register(struct mtd_info *mtd,
> 
>  	/* OTP nvmem will be registered on the physical device */
>  	config.dev = mtd->dev.parent;
> -	config.name = kasprintf(GFP_KERNEL, "%s-%s", dev_name(&mtd->dev), 
> compatible);
> -	config.id = NVMEM_DEVID_NONE;
> +	config.name = compatible;

Damn.. although the commit message says it using NVMEM_DEVID_AUTO,
this is missing here. :/

Since you already picked it, should I send a follow up patch or can
you just drop this patch and I'll resend it?

-michael

>  	config.owner = THIS_MODULE;
>  	config.type = NVMEM_TYPE_OTP;
>  	config.root_only = true;
> @@ -905,7 +904,6 @@ static struct nvmem_device
> *mtd_otp_nvmem_register(struct mtd_info *mtd,
>  		nvmem = NULL;
> 
>  	of_node_put(np);
> -	kfree(config.name);
> 
>  	return nvmem;
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
