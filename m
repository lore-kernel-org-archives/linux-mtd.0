Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA56C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A052184B
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9+UKKTr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lxv7R+jF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A052184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTwiXNxFLm+lU0GoVJ0laArudIBmDJF6CzOAohJvN18=; b=p9+UKKTrTsZS+M
	UjOpnGIMGIC8h13VLqjpaKpSLKBu5pCyxpnbrkoVyuekXfHglZEP6tfFfq3rWmx4MzIYjur+ygKYM
	uQspM1Cjiuwb3cSQaZDy3ogCtbYfSnAv0bVTNEhYwxUT2vyoMLjpWtZVYLTAMfWzFvCSwOUqnBcv4
	DTYeYJhW4ArIK1UZgjXQz+c4t0/BF1mBQCHhzYCi0b9+0aVV+b7+VaswCa+BVvKZR4y/32poyZsEr
	UbxG8gudxCmlmYYrE9RiMy1Ks3gzKf39BsRrU8tyDP1uGO15FzSXiBYVHY45DYHHCR94xHs21+Qhl
	eIIbOsrOMwcTAy1Jtarg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEBU-0000Wi-H1; Wed, 23 Jan 2019 08:46:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEBR-0000W5-NA
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 08:46:54 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0650E20861;
 Wed, 23 Jan 2019 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548233213;
 bh=CA1tFwjafTrpMpiXu8TULEfduC4eQisyeYGlcekx0tQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lxv7R+jFHDvN/61Dzlm+UIMN4Q57Ou4E3E885mw1nBKrBHsMHR87TbFhjhIIJlz42
 iWqI6VCqq3aiuD7ee3EK2QDx90Ae7xrBUnJP6jMkPDnobnmqR4H0okamUdC9rN53f+
 +VWJNbgbF2bk+hpAusXu9tNuhFZz2c8Ako1HSzsQ=
Date: Wed, 23 Jan 2019 09:46:44 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: docg3: Fix a possible memory leak of mtd->name
Message-ID: <20190123094644.23f27c3e@bbrezillon>
In-Reply-To: <20190123065943.5868-1-yuehaibing@huawei.com>
References: <20190123065943.5868-1-yuehaibing@huawei.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_004653_768109_E10B10D9 
X-CRM114-Status: GOOD (  12.38  )
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

On Wed, 23 Jan 2019 14:59:43 +0800
YueHaibing <yuehaibing@huawei.com> wrote:

> In case DOC_CHIPID_G3, mtd->name should be freed in the
> err handling path, which is alloced by kasprintf.
> 
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/mtd/devices/docg3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 60ddc38..cbd25f9 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1867,6 +1867,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>  
>  nomem4:
>  	kfree(docg3->bbt);
> +	kfree(mtd->name);

Please use devm_kasprintf() instead.

>  nomem3:
>  	kfree(mtd);
>  nomem2:


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
