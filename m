Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66365CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQCjACj5j7Oco+T2wp9SNG8MTr+IFQbfd+B1VKSdn0E=; b=hk2m+amcBfMQPL
	Zl85B1pFunr5Z/76l5h1tZe0z8Tstg7XW6meqM0Ebu07hcjQKYFitST+PMNmOyHnwPfh0F/5o7YQe
	auqiyRcm+5psKSiu3FPzFltGMZZ7ShfMj9i/GhFExAqcHfM6CQoocgiihEsTq7Er1EooJrXjaZUci
	x3atnIDeJo00P+MGYgofTyqFdRa8zjsEMDA5/oTnOeEcGUJX3UG6+H0nKbDvYa1VtRxd0XPo3oyev
	E8YZl/nvHrSYhI6VqJGopJgaeSEm3j9+/BtJRiuWnHZwJ23rmXRVdxLBeWBKBy/0Aepk/k6wTCWUc
	HqAClKNM5ofVdzR+6SeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7n-00GZQk-0z;
	Thu, 19 Oct 2023 07:07:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7j-00GZPV-2d
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:17 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S9zDY2JnQzvPv1;
	Thu, 19 Oct 2023 15:02:21 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 19 Oct 2023 15:07:06 +0800
Message-ID: <9adbe147-95a6-a858-f65a-83028df4209d@huawei.com>
Date: Thu, 19 Oct 2023 15:07:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/2] Fix some bugs in ubi_resize_volume() function
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000716_096775_48C556D0 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

Please don't forget to discuss this issue.

V2
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=353394

Friendly ping.

Thanks
Zhaolong

> This series of patches does two things:
>    1. Rebase the patch commited by Guo Xuenan on the latest mainline.
>    2. Fixed an issue where the number of PEBs is incorrectly displayed.
> 
> Guo Xuenan (1):
>    ubi: fix slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130
> 
> ZhaoLong Wang (1):
>    ubi: Correct the number of PEBs after a volume resize failure
> 
>   drivers/mtd/ubi/vmt.c | 31 ++++++++++++++++++++-----------
>   1 file changed, 20 insertions(+), 11 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
