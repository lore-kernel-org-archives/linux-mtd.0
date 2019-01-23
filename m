Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDDFC282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFBAC20870
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVaIzavI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0uBVJLYw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFBAC20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kieCDZxvL9l3SKT/TPCoVwL4a94FabVm49miJL60HYU=; b=rVaIzavIk4QDS3
	gXH/TfxQthelGFWjuz5AA5j2exXzzP3NljEUsM3McyB3yXh+5QATUb01rWlsD/QuO14g6/G/UI/a0
	JfD6a12LzGgcBdHeue6vocCReSOf+XSyj6a8PJt50lHqFUlKQWUHkRDWsAocDKaRMaKj/5dVwRrwp
	fqjVXKxjo70HU757hAJk1HTr1IN8PAw2kLc7Iff9QLenzyYj3UnBW48Xofh+6/jmW8jIUPjpyeAf+
	KqThll/GUBLSsuQAXsQtnsAZlAo1hcLZH6H6+Kej0BWUbWPHCjBEObd1mJTuHw+P9Vlf0QZYhVhX6
	2lh48wzayyh+S4GaXf8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEam-0002bs-TX; Wed, 23 Jan 2019 09:13:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEak-0002bV-Cd
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:13:03 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7301B20870;
 Wed, 23 Jan 2019 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548234781;
 bh=8Enx+9BncfPCChr/HjRpTG0ZOZvtCrx57UOvXZ5Q7SE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0uBVJLYwQhM0/DUctNNB5CKB9nZIetZILpcatLt4Q2yhHvkIDi/Ec0ZL/LU53IDsP
 bDnd0RAFv/2AFYbj6xv8P0aERt+8ojaaWxAIYO6llHKhbdq6uc0PkeyjSn5F5eabV4
 B8dYC/cxZVJZBPyZT1/ME9ZLKZyy+XE89uYFOdgI=
Date: Wed, 23 Jan 2019 10:12:53 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: docg3: Fix passing zero to 'PTR_ERR' warning
 in doc_probe_device
Message-ID: <20190123101253.243add9d@bbrezillon>
In-Reply-To: <20190123065827.16748-1-yuehaibing@huawei.com>
References: <20190123065827.16748-1-yuehaibing@huawei.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_011302_529617_694F4569 
X-CRM114-Status: GOOD (  15.38  )
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

On Wed, 23 Jan 2019 14:58:27 +0800
YueHaibing <yuehaibing@huawei.com> wrote:

> Fix a static code checker warning:
> drivers/mtd/devices/docg3.c:1875
>  doc_probe_device() warn: passing zero to 'ERR_PTR'
> 
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/mtd/devices/docg3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 4c94fc0..60ddc38 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1872,7 +1872,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>  nomem2:
>  	kfree(docg3);
>  nomem1:
> -	return ERR_PTR(ret);
> +	return ret ? ERR_PTR(ret) : NULL;
>  }
>  

This is not the right fix, you should instead set ret to -EINVAL:

--->8---
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 4c94fc096696..6b84db411232 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1842,7 +1842,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
        chip_id = doc_register_readw(docg3, DOC_CHIPID);
        chip_id_inv = doc_register_readw(docg3, DOC_CHIPID_INV);
 
-       ret = 0;
+       ret = -ENOMEM;
        if (chip_id != (u16)(~chip_id_inv)) {
                goto nomem4;
        }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
