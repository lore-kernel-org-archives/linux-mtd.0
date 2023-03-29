Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3841FC76196
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 01:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+hoIFzm+VcgsWAem+x+Fa1ggK28Df9Ycnoliffqczk=; b=kmKKVbMxPgdhGk54p+dxr4OVMd
	O9aIaGFg2cxLwOkTrrNL4ujvM3b5XAPUCmEqodwVKJyR3Au7+A2M3CGctztSVkyukFqiqwtOK3mIU
	81CFE6iWEBGM+cOO6ZQeSLq9F4rM5ag5Y8zt7VAQ1OThP32vldyyWcZzMurKxQl/rF5XpUxvhc52R
	ILk5/PL1izcDilWgfUMaO+gWbng/M8UoNkTzzBpLto5X3ctFSBuFaXloO5GNFpVidMAMML/ayrZxa
	ePDrIsC05V73i8vj5350HPDRsafNUgyCVswqvTfbmFu51/5cKxYeKDWNlv0liyyuwuqo/aNJ6UeDb
	WToHwS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phKOf-00GFVm-0t;
	Wed, 29 Mar 2023 01:14:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phKOU-00GFUv-0C
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 01:14:32 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PmT5L4xL9zgZQS;
	Wed, 29 Mar 2023 09:11:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 09:14:17 +0800
Subject: Re: [PATCH v2] mtd: ubi: eba.c: fix return value overwrite issue in
 try_write_vid_and_data()
To: Wang YanQing <udknight@gmail.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <bbrezillon@kernel.org>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230328153534.GA12409@udknight>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8f312163-f809-9271-3f1d-792d23d1bdfa@huawei.com>
Date: Wed, 29 Mar 2023 09:14:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230328153534.GA12409@udknight>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_181430_286865_D9E2F39F 
X-CRM114-Status: GOOD (  19.73  )
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

> The commit 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")
> adds helper function, try_write_vid_and_data(), to simplify the code, but this
> helper function has bug, it will return 0 (success) when ubi_io_write_vid_hdr()
> or the ubi_io_write_data() return error number (-EIO, etc), because the return
> value of ubi_wl_put_peb() will overwrite the original return value.
> 
> This issue will cause unexpected data loss issue, because the caller of this
> function and UBIFS willn't know the data is lost.
> 
> Fixes: 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>
> ---
>   Changes v1-v2:
>   1: add error code in warning message, suggested by Zhihao Cheng
>   
>   drivers/mtd/ubi/eba.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 09c408c..4e1d807 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -946,7 +946,7 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
>   				  int offset, int len)
>   {
>   	struct ubi_device *ubi = vol->ubi;
> -	int pnum, opnum, err, vol_id = vol->vol_id;
> +	int pnum, opnum, err, err2, vol_id = vol->vol_id;
>   
>   	pnum = ubi_wl_get_peb(ubi);
>   	if (pnum < 0) {
> @@ -981,10 +981,19 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
>   out_put:
>   	up_read(&ubi->fm_eba_sem);
>   
> -	if (err && pnum >= 0)
> -		err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
> -	else if (!err && opnum >= 0)
> -		err = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
> +	if (err && pnum >= 0) {
> +		err2 = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
> +		if (err2) {
> +			ubi_warn(ubi, "failed to return physical eraseblock %d, error %d",
> +				 pnum, err2);
> +		}
> +	} else if (!err && opnum >= 0) {
> +		err2 = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
> +		if (err2) {
> +			ubi_warn(ubi, "failed to return physical eraseblock %d, error %d",
> +				 opnum, err2);
> +		}
> +	}
>   
>   	return err;
>   }
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
