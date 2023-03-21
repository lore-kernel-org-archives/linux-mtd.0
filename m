Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460D7C7618D
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcb75FRIIbXiBICjElkXmh5wNV3TzMfPZ6qSbOeUtfM=; b=GyOxvdusHxZn9bigN5dpDoTIBC
	KYCMu0lqesvI/eEOUE46SGzMWfHwgBzH/p9xy8zLXDIRE1D7EU7aOTmhszFqLhnP5GIcyYT8oDdue
	maWKqxjuHIwujtAtOQ5if5bftQwcZiGdG7dqB8bhIOrEO8jn1s0W5Y63lvZoH+94Zzc92DMkFLxtZ
	7kB/ShoOWwboqy7c2P9l38Q1oKV3OkKf96OjxMHwpr6kCUpRAD6tIjjhIe7XgeOY7MQMK6bDkphIW
	M4W244n59Z0PTSZNS50qSTyG98zPeFAAV/GBSsqVk9YZQjImXq2EyiBeXCITt2A+P5yn+O469QScI
	0PPORt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWWh-00BXnm-0b;
	Tue, 21 Mar 2023 07:35:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWWd-00BXbr-1f
	for linux-mtd@lists.infradead.org;
	Tue, 21 Mar 2023 07:35:21 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PgjwL6MvWzKq3Z;
	Tue, 21 Mar 2023 15:31:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 15:34:02 +0800
Subject: Re: [PATCH] ubifs: remove return in compr_exit()
To: Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230321071136.68872-1-frank.li@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <61bd9c01-5e5d-76b0-103a-323a5bf0fa33@huawei.com>
Date: Tue, 21 Mar 2023 15:34:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230321071136.68872-1-frank.li@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_003519_737504_229070E8 
X-CRM114-Status: GOOD (  10.80  )
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

> It's redundant, let's remove it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/ubifs/compress.c | 1 -
>   1 file changed, 1 deletion(-)
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
> index 3a92e6af69b2..75461777c466 100644
> --- a/fs/ubifs/compress.c
> +++ b/fs/ubifs/compress.c
> @@ -217,7 +217,6 @@ static void compr_exit(struct ubifs_compressor *compr)
>   {
>   	if (compr->capi_name)
>   		crypto_free_comp(compr->cc);
> -	return;
>   }
>   
>   /**
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
