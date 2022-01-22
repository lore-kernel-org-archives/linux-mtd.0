Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8657FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jan 2022 02:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGvFEb93ViYM8InxEBBsht66YVg4CcLzsbG5ctrhwGQ=; b=rnBiZpZYZu5qmtUGBZwSnjkH2p
	X/mJyOZD0KHavVUEmHsQjZ6KfgjyzEzzwOCzqWmTielW8Ao1I19Dj0+BivohfHq67x1o/rp80qp7b
	S2NYfaKjc9OCRlyrIFqCN/n6/gUFMuaCePXEXu3Cxnf2wU1/5cmgG//HtFsaAUIyf1tq5YQIfZEM9
	d1zONcNONKxmtrPOr4WGQZQOf6tlGokfxt9SX43cCrnQO9fUfnGKGwNEKUG1tDGG0L8BN+xSXjedA
	Gy/5MddgI7pwIoANa20N76QNtd1ygpKsIRj7Jv1HnijqpGUMDGCKSckEEyohq1xJQ80S1Z5K+bSOv
	HFIy+6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB6NB-00GPue-JL; Sat, 22 Jan 2022 02:43:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB6N7-00GPu7-HN
 for linux-mtd@lists.infradead.org; Sat, 22 Jan 2022 02:43:23 +0000
Received: from kwepemi100015.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JggSH0H9VzZfcs;
 Sat, 22 Jan 2022 10:39:27 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 kwepemi100015.china.huawei.com (7.221.188.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 22 Jan 2022 10:43:15 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 22 Jan 2022 10:43:15 +0800
Subject: Re: [PATCH] mtd: phram: Prevent divide by zero bug in phram_setup()
To: Dan Carpenter <dan.carpenter@oracle.com>, Joern Engel
 <joern@lazybastard.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <kernel-janitors@vger.kernel.org>
References: <20220121053836.GA27293@kili>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <00cdcbbc-c74e-e7d1-f751-93aac5113eee@huawei.com>
Date: Sat, 22 Jan 2022 10:43:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20220121053836.GA27293@kili>
Content-Language: en-US
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_184321_800653_F5C32C53 
X-CRM114-Status: GOOD (  17.38  )
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

Thanks for the fix!

Reviewed-by: yangerkun <yangerkun@huawei.com>

On 2022/1/21 13:38, Dan Carpenter wrote:
> The problem is that "erasesize" is a uint32_t type so it might be
> non-zero but the truncated "(uint32_t)erasesize" value *is* zero. That
> would lead to the divide by zero bug.
> 
> Avoid the bug by delaying the divide until after we have validated
> that "erasesize" is reasonable.
> 
> Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/devices/phram.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 6ed6c51fac69..d503821a3e60 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -264,16 +264,20 @@ static int phram_setup(const char *val)
>   		}
>   	}
>   
> -	if (erasesize)
> -		div_u64_rem(len, (uint32_t)erasesize, &rem);
> -
>   	if (len == 0 || erasesize == 0 || erasesize > len
> -	    || erasesize > UINT_MAX || rem) {
> +	    || erasesize > UINT_MAX) {
>   		parse_err("illegal erasesize or len\n");
>   		ret = -EINVAL;
>   		goto error;
>   	}
>   
> +	div_u64_rem(len, (uint32_t)erasesize, &rem);
> +	if (rem) {
> +		parse_err("len is not multiple of erasesize\n");
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
>   	ret = register_device(name, start, len, (uint32_t)erasesize);
>   	if (ret)
>   		goto error;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
