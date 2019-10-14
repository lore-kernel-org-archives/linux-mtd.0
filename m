Return-Path: <SRS0=jzn5=YH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AE2ECE587
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 12:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65466217F9
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 12:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLCWROvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65466217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCzzRUTbcG692xYQAJ/QsmK1ZxSw2al6ivTup8Oh0jI=; b=CLCWROvbZhHPWo
	55DJeC8DbKtWprXqkC3nz2+8itwAr5V35Jr9RCM/L4zkG9te2+KyJU6+6lsKN9BKZHqklVor7jWYW
	ESe0ywQm9aFUb+VJeZACSKbrrl6oixlaaz6GyXT3/cdoQs6Y++8e7wa/X/GtfiIJ1wKI+0PRYHX5Y
	Qsyp6vDIkhpqpBY6gxMFhyrLnlRtL54GkbchRaBNuQWcinMUMLDYg8fZYMhqdi10/fqmSTlPeqtXo
	DpgtwBjrYL4/zpcMw6AadgV4ZDq8ethHS9vLqQocRQEAqkri4N1ZX1A1Fr65m4cMIWANUgMbp9icc
	+4eKDM8z6Tdfnyi5c9DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJzSI-0002ct-3s; Mon, 14 Oct 2019 12:28:06 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJzNk-0006Nz-87
 for linux-mtd@lists.infradead.org; Mon, 14 Oct 2019 12:23:26 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 62D7E85A4EB35767CA85;
 Mon, 14 Oct 2019 20:23:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.14) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 14 Oct 2019
 20:23:13 +0800
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: don't free cfi->cfiq in error path
 of cfi_amdstd_setup()
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>, <richard@nod.at>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>,
 <computersforpeace@gmail.com>
References: <20191008023637.133416-1-houtao1@huawei.com>
Message-ID: <6495a25a-a779-06e6-3abb-30a1351bba0a@huawei.com>
Date: Mon, 14 Oct 2019 20:23:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20191008023637.133416-1-houtao1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.177.31.14]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_052324_574253_6DB0848E 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping ?

On 2019/10/8 10:36, Hou Tao wrote:
> Else there may be a double-free problem, because cfi->cfiq will
> be freed by mtd_do_chip_probe() if both the two invocations of
> check_cmd_set() return failure.
> 
> Also check cfi_intelext_setup() & cfi_staa_setup() to find out
> that cfi->cfiq is not freed as well in these functions.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index cf8c8be40a9c..7eaa4b523197 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -785,7 +785,6 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
>  	kfree(mtd->eraseregions);
>  	kfree(mtd);
>  	kfree(cfi->cmdset_priv);
> -	kfree(cfi->cfiq);
>  	return NULL;
>  }
>  
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
