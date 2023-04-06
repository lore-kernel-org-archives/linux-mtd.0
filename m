Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC51C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrmZGBersEkSvpOG1xUG8JJsUIeHtIZhlt6bt2asdLk=; b=sIlhf/VgB5yxY+RDzgkrjA06yd
	+v0jCCnxefgbWjT2f5PXd7hTS12u78qUVgYeYGw22vf23SZHlx/q9OASawpYgc5ypkPjQ4OPREDJ0
	K5Sr7KK/7yiR/eaipdCAxuKGtjq44vOuvld1STbKNZk7DVY7p5TzxT7nZBtZVvGHKZOjIAtZwdjIT
	TY188AwYjD0vg9CmbBMYCToo2Vl5DRBzeOl4TvKeGsh1kiUBXS/7zb0oHAnscddjMmaym3giIWsWU
	5QBYw+5vWLgUr9avJoIKW7wi1UX7bI8LqizasugNnXEiUmp3fqJrRjMFApPz3Aa+OfnFbeCE7m/RA
	a+YoRHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOA5-007DcQ-33;
	Thu, 06 Apr 2023 11:52:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOA2-007DbZ-0F
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 11:52:16 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Psfvq2xtWzrS37;
	Thu,  6 Apr 2023 19:50:47 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 6 Apr 2023 19:52:03 +0800
Subject: Re: [PATCH 2/2] ubi: Correct the number of PEBs after a volume resize
 failure
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
 <20230406071331.1247429-3-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a7de7544-7e81-587f-6d84-5cb2774c6c14@huawei.com>
Date: Thu, 6 Apr 2023 19:52:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230406071331.1247429-3-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_045214_285013_018C3F3E 
X-CRM114-Status: GOOD (  14.41  )
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

> In the error handing path `out_acc` of the ubi_resize_volume(),
> when `pebs < 0`, it means that the volume table record fails to be
> updated when the volume is shrinked. In this case, the number of
> ubi->avail_pebs` and `ubi->rsvd_pebs` should also be restored,
> otherwise the UBI will display an incorrect number of available PEBs.
> 
> Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

> ---
>   drivers/mtd/ubi/vmt.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 97294def01eb..990571287e84 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -515,13 +515,12 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
>   out_acc:
>   	spin_lock(&ubi->volumes_lock);
>   	vol->reserved_pebs = reserved_pebs - pebs;
> -	if (pebs > 0) {
> -		ubi->rsvd_pebs -= pebs;
> -		ubi->avail_pebs += pebs;
> +	ubi->rsvd_pebs -= pebs;
> +	ubi->avail_pebs += pebs;
> +	if (pebs > 0)
>   		ubi_eba_copy_table(vol, old_eba_tbl, vol->reserved_pebs);
> -	} else {
> +	else
>   		ubi_eba_copy_table(vol, old_eba_tbl, reserved_pebs);
> -	}
>   	vol->eba_tbl = old_eba_tbl;
>   	spin_unlock(&ubi->volumes_lock);
>   out_free:
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
