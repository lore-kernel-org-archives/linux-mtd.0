Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB641C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A871721872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1UJhYMU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w8EKL/an"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A871721872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjKBR3A0wSaOEOQk7WhzPI7FSG9DUJE6P3R8NebbC1o=; b=Y1UJhYMUvxlOeN
	ViuL//YeLcGRMyHzyOxqq0uMHSWmOwXXlE1KoPMsZdWWFDwhmAlPspiQz2E/riql3NJRUvUXFNrcg
	Yi6PLblA/JVERRCPu89FaKcKRsfNXF8+9vvb2dislqTq0Nu02I5iLM9Lc7GMIYWY3m+Qq0X7xbDPn
	uHa4KRPVIExmwhdTdMkKpBtL/5Nhj3bdCCP77yjqUgds+jPeYLEnoP7Hj+WCxAE5j+44HWhJ3uCAj
	QIpj1XuZdc9+68K+ZnLQ37NIfAum0l9ZguKP3jCb7JfCKSzJJFC8lSIZpyv2DCxMDFk7cwFYcnuj6
	hF6CMvr/37uUg66PNyfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmgV7-0004PH-La; Thu, 24 Jan 2019 15:01:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmgV0-0004OP-9k
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:01:04 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 602D621872;
 Thu, 24 Jan 2019 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548342057;
 bh=7GO927NVdjxAU7TuJ/Pe/QGB7sFlePmjsQMNCa+HFtk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=w8EKL/anIIpBhS1mJPYs2VrX49Fic9Yigok6eHlWFz7w9u7WhnUYDHvIakk93ChLc
 L+by6TU40Ky7thAyjVKvmfbid9FXDM5/I14kC8DRU31Nf5EDf318GvqCOUTycDbXaS
 gj9i1uOHlm9r5DFoFPFZnN3JzjhU9Ow1G2mWyUoc=
Date: Thu, 24 Jan 2019 16:00:47 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v3 -next] mtd: docg3: Fix a possible memory leak of
 mtd->name
Message-ID: <20190124160047.6091b3e3@bbrezillon>
In-Reply-To: <20190123092819.5020-1-yuehaibing@huawei.com>
References: <20190123092819.5020-1-yuehaibing@huawei.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_070058_353844_68CEAEA5 
X-CRM114-Status: GOOD (  14.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: robert.jarzmik@free.fr, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, richard@nod.at, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 17:28:19 +0800
YueHaibing <yuehaibing@huawei.com> wrote:

> In case DOC_CHIPID_G3, mtd->name is not freed in err handling path,
> which is alloced by kasprintf(). Fix this by using devm_kasprintf().
> 
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v3: use devm_kasprintf
> ---
>  drivers/mtd/devices/docg3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 4c94fc0..59ca4f5 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1767,8 +1767,8 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
>  
>  	switch (chip_id) {
>  	case DOC_CHIPID_G3:
> -		mtd->name = kasprintf(GFP_KERNEL, "docg3.%d",
> -				      docg3->device_id);
> +		mtd->name = devm_kasprintf(docg3->dev, GFP_KERNEL, "docg3.%d",
> +					   docg3->device_id);

You forgot to remove the kfree() in the ->remove() path.

>  		if (!mtd->name)
>  			return -ENOMEM;
>  		docg3->max_block = 2047;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
