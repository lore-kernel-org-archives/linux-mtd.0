Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEE1C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B90760F41
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B90760F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4R2VjKcI20VA6tjME0fkQTphTBfhSegL/5dGz1w7ZSk=; b=ukCuFZDcmaglR6
	7h1vh88uui6F+77PkuYiZhF8qqpbeRRY00Iz9zTTFJqKJqRYzO3tBGFfkJutSP9vVIBkV/0BRUdAM
	0SxTP+jwCMF0o/DXj8YA/KKTSDetEs/i8t51meHsB4LwfuUdKdep0vB08zw25WuAUEAIrnvGIrnsw
	aouCD73IwSYnbsjkMReKSs2G9TuZSOWHoU2hSn4DcZ813wFsb/6yqrQHGvOTPC8+HL2sKGJd9qrpK
	V+2Io0t70iIL3tct6tREoW2ZDwbFbwTMg2+4wONb7kO+48VlHeg72ZC9FyZXJfhB/AoEEO5TyPqmV
	Yo4sc1V9fJ30l6kq77WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbH7j-005cNP-OC; Fri, 15 Oct 2021 06:55:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbH7g-005cL5-S6
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 06:55:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 651671F4502B;
 Fri, 15 Oct 2021 07:55:17 +0100 (BST)
Date: Fri, 15 Oct 2021 08:55:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: core: protect access to MTD devices while in
 suspend
Message-ID: <20211015085511.0e2ac916@collabora.com>
In-Reply-To: <20211011115253.38497-2-sean@geanix.com>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011115253.38497-2-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_235521_086267_FE8BCDB8 
X-CRM114-Status: GOOD (  22.07  )
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

On Mon, 11 Oct 2021 13:52:51 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

>  struct mtd_info {
> @@ -476,10 +478,49 @@ static inline u32 mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
>  	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
>  }
>  
> +static inline void mtd_start_access(struct mtd_info *mtd)
> +{
> +	struct mtd_info *master = mtd_get_master(mtd);

mtd_start_{access,end}() should only be called on master devices, so I
guess you can drop the mtd_get_master() call and use mtd directly.
Maybe add a WARN_ON_ONCE(mtd != mtd_get_master(mtd)) so we can
easily catch silly mistakes.

> +
> +	/*
> +	 * Don't take the suspend_lock on devices that don't
> +	 * implement the suspend hook. Otherwise, lockdep will
> +	 * complain about nested locks when trying to suspend MTD
> +	 * partitions or MTD devices created by gluebi which are
> +	 * backed by real devices.
> +	 */
> +	if (!master->_suspend)
> +		return;
> +
> +	/*
> +	 * Wait until the device is resumed. Should we have a
> +	 * non-blocking mode here?
> +	 */
> +	while (1) {
> +		down_read(&master->master.suspend_lock);
> +		if (!master->master.suspended)
> +			return;
> +
> +		up_read(&master->master.suspend_lock);
> +		wait_event(master->master.resume_wq, master->master.suspended == 0);
> +	}
> +}
> +
> +static inline void mtd_end_access(struct mtd_info *mtd)
> +{
> +	struct mtd_info *master = mtd_get_master(mtd);
> +
> +	if (!master->_suspend)
> +		return;
> +
> +	up_read(&master->master.suspend_lock);
> +}
> +
>  static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
>  				     loff_t ofs, size_t len)
>  {
>  	struct mtd_info *master = mtd_get_master(mtd);
> +	int ret;
>  
>  	if (!master->_max_bad_blocks)
>  		return -ENOTSUPP;
> @@ -487,8 +528,12 @@ static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
>  	if (mtd->size < (len + ofs) || ofs < 0)
>  		return -EINVAL;
>  
> -	return master->_max_bad_blocks(master, mtd_get_master_ofs(mtd, ofs),
> -				       len);
> +	mtd_start_access(mtd);
> +	ret = master->_max_bad_blocks(master, mtd_get_master_ofs(mtd, ofs),
> +				      len);
> +	mtd_end_access(mtd);

Please pass the master to those functions, there's no point walking the
parent chain again in the start/end_access() functions if you already
have the master retrieved in the caller. Oh, and there seems to be a
common pattern here, so maybe it's worth adding those macros:

#define mtd_no_suspend_void_call(master, method, ...) \
	mtd_start_access(master); \
	master->method(master, __VA_ARGS__); \
	mtd_end_access(master);

#define mtd_no_suspend_ret_call(ret, master, method, ...) \
	mtd_start_access(master); \
	ret = master->method(master, __VA_ARGS__); \
	mtd_end_access(master);

I don't really like the helper names, so feel free to propose something
else.

> +
> +	return ret;
>  }
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
