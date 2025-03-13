Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFF5C28B28
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjQi25KB7De+HRmgeD6FILxiBjP0ynaYGMEdUSaKEU0=; b=n0KZr+FTCWrhWI
	H/oZeDy5grhs7Ws4MSswoIxmw5kWR/fxaTwGnzVYNBZFRFHPN6HHoKNrPQEfX8MXM7h8rcdwweO7O
	cwJOXxQXrE1UbjXK7IAAyL69gHFTJB7OtFs14Guu0RQINQ1P/Dhvm39aIrSNrZw544cy/ssiTDs/L
	vp/Q70dB9JWivX0+QLYHKX74FTbHsNLc/wA7ZF0p2JiTNT7Yb/TCLT2WOK+R/FsAj6PGTZyLR78io
	8r92RftVQhWBF3SYTSB5dYWomrqyW1AO31VNf3vo8lOQCFNC3HT2XsskguUJ+HvhmsVrvyjkxmrTP
	2UhViTviwRw51G6tmRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfA1-0000000Algx-06cW;
	Thu, 13 Mar 2025 09:47:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsf9y-0000000Alg5-38w4
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 09:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F5DFA46868;
	Thu, 13 Mar 2025 09:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF35DC4CEDD;
	Thu, 13 Mar 2025 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741859245;
	bh=Qup0lTCmW1iNqV8AqsFH1fnQQjom+z+/RUgaV70lD/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=py1khyo4coU3MtgwSglyKuz0L+klp+rUNbHCvReBZSA+hP1aIfvH/uIjI/fLRnTBM
	 8hcHrUlpV45h8ompLl6MasTkz+AtMJDu6UY1kK36Qj1K3BrPvWj2/CEsIdJ1F0nICY
	 wUo4Isc0StGtEPorXqbCE8H2XnOryaOTKh1Xo8ok=
Date: Thu, 13 Mar 2025 10:47:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: richard@nod.at, chengzhihao1@huawei.com, miquel.raynal@bootlin.com,
	vigneshr@ti.com, logang@deltatee.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: fix error handling in uif_init()
Message-ID: <2025031334-paving-jolliness-3383@gregkh>
References: <20250313091609.308724-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250313091609.308724-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_024726_873210_D5081F86 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 13, 2025 at 05:16:09PM +0800, Ma Ke wrote:
> Once cdev_device_add() failed, we should call put_device() to decrement
> reference count for cleanup. Or it could cause memory leak.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 493cfaeaa0c9 ("mtd: utilize new cdev_device_add helper function")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/mtd/ubi/build.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index ef6a22f372f9..ca4c54cf9fd4 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -486,6 +486,7 @@ static int uif_init(struct ubi_device *ubi)
>  	kill_volumes(ubi);
>  	cdev_device_del(&ubi->cdev, &ubi->dev);
>  out_unreg:
> +	put_device(&ubi->dev);

Oh wow.  No, that's not going to work.

This driver is broken in that there are two different reference counted
structures attempting to manage the same chunk of memory.  Things will
break as your patch here shows.

Please fix this all up to work properly instead, don't think that this
change will actually fix anything :(

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
