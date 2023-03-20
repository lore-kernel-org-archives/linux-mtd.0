Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C612BC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DLOyuVtIN/60ASnox8lvIkgcaU39Yi0kiKNssz1dM8=; b=UBbhA4q/m3xiMOOKnZbCdMQcGS
	t75PbPSj2cr+6Tg8fu/kgHXTexMKpDZ7mAX7pEZqLPzn6BYQ84u9u1xlEOj3V0jYnSwfTqEzYhfjM
	9V2mxFIwP+5eGrY4ZTerSBnltF53OF2vt7C0br7v3D1XmNYaAyeqyIQZXeZwEwfQdJIYVDf7tU8uf
	YAEjA1HlVLS8ylWk4tIUt+gNDPkru9iYiMp1VGdPUn/ZAyU5SMqb6cPyXI3X4BzB78Hdu/d7Zmmgy
	bgsPcWbb0fx8cPWj12So1eivREL8YSR1KZl+BVMTSfUtwvPLWM6fEIBvZE1osREdU4FStwJZI4K9F
	mqAqUBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe5WD-007wE4-2d;
	Mon, 20 Mar 2023 02:45:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe5W7-007wCq-18
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 02:45:01 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PfzWv0nVnzSkgs;
	Mon, 20 Mar 2023 10:41:31 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:44:52 +0800
Subject: Re: [PATCH] mtd: ubi: eba.c: fix return value overwrite issue in
 try_write_vid_and_data()
To: Wang YanQing <udknight@gmail.com>, <miquel.raynal@bootlin.com>,
	<bbrezillon@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230217165442.GA28288@udknight>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8fbae9fa-f61b-e951-6a13-0629e458c48e@huawei.com>
Date: Mon, 20 Mar 2023 10:44:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230217165442.GA28288@udknight>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_194459_559074_11106075 
X-CRM114-Status: GOOD (  17.16  )
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

Good catch. Maybe many of history happened unconsistent ubifs images 
have related to this point. One small nit below.

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
>   drivers/mtd/ubi/eba.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 09c408c..4e32b25 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -981,10 +981,17 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
>   out_put:
>   	up_read(&ubi->fm_eba_sem);
>   
> -	if (err && pnum >= 0)
> -		err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
> -	else if (!err && opnum >= 0)
> -		err = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
> +	if (err && pnum >= 0) {
> +		if (ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1) != 0) {

Could we also add error code returned from ubi_wl_put_peb() in warning 
message? Same with next ubifs_warn.
> +			ubi_warn(ubi, "failed to return physical eraseblock %d",
> +				 pnum);
> +		}
> +	} else if (!err && opnum >= 0) {
> +		if (ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0) != 0) {
> +			ubi_warn(ubi, "failed to return physical eraseblock %d",
> +				 opnum);
> +		}
> +	}
>   
>   	return err;
>   }
> 




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
