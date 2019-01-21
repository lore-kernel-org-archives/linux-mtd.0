Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A370C282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:51:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642F02084A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fcjGZSLO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWZpeOan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642F02084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8lvc9pxR/XFqGhqqaudPlc8Z/WBtIqzIX60P32cEYs=; b=fcjGZSLOmwjOxc
	wj9xPC6KOj6i3nhUjQqL7y99shPZ27EFgEoIOjzK7Xb7JoPcAFTf+ZWD9Fk6Rq7jA7vtJB8k9yyci
	dcEfE8zt6XOISEXFOXaX2OozZv3sUIxA6hf7J0VzWFIMvBVzx8TRAyxuYwqWIreSxiJ0mqRuQoX9j
	828vcVJjKiQrMeSafrg6006wUaBG4YrYu6XIP1KoYG+onyrL0LSB7hURFD51+zw2aEohUKa6elbc1
	g6njx+CciulxSewY8WKiYmotzyWYoE4NTWskRpmvI+NQy0jhg127Z5uusbfEZnuzwW2vmviNnapt6
	84mCRODTkMCwEHKM23ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glVIp-0001ug-Rz; Mon, 21 Jan 2019 08:51:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glVIn-0001pq-Pl
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 08:51:31 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78D512084A;
 Mon, 21 Jan 2019 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548060689;
 bh=vBq6il3ad0e0gur8KKHLyGGZcQMdlCOuBy87YnBQF4w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HWZpeOan9lXKtbL4wiWRJtZvJtOxdX1k8LtnASwoTjvrKAmvN9wg0rtLQvWce6o9M
 obfByqmEHBBPYxcQ2whOM43D512UOgdDc/VuIBGACd4da2Icks5qxHcA9pLz9g2O87
 wdGrJodqykDU5gHU1aGgmDBFtMDEboZ+sxvNf2rE=
Date: Mon, 21 Jan 2019 09:51:20 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rework partitions handling
Message-ID: <20190121095120.5d7850cb@bbrezillon>
In-Reply-To: <20190116162144.4458-1-miquel.raynal@bootlin.com>
References: <20190116162144.4458-1-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_005129_896183_867FEF82 
X-CRM114-Status: GOOD (  16.19  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 16 Jan 2019 17:21:44 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> @@ -457,13 +525,31 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
>  
>  static inline int mtd_suspend(struct mtd_info *mtd)
>  {
> -	return mtd->_suspend ? mtd->_suspend(mtd) : 0;
> +	struct mtd_info *master = mtd_get_master(mtd);
> +	int ret;
> +
> +	if (master->suspended)
> +		return 0;
> +
> +	ret = master->_suspend ? master->_suspend(master) : 0;
> +	if (ret)
> +		return ret;
> +
> +	master->suspended = 1;

It's not entirely clear to me whether dev->suspend() hooks can be
called simultaneously on several CPUs or not, if that's the case, we
should use an atomic_t for the ->suspended field and use the
atomic_add_unless() function when manipulating it.

	if (!atomic_add_unless(&master->suspended, 1, 1))
		return 0;

	ret = master->_suspend ? master->_suspend(master) : 0;
	if (ret) {
		atomic_dec(&master->suspended);
		return ret;
	}

> +	return 0;
>  }
>  
>  static inline void mtd_resume(struct mtd_info *mtd)
>  {
> -	if (mtd->_resume)
> -		mtd->_resume(mtd);
> +	struct mtd_info *master = mtd_get_master(mtd);
> +
> +	if (!master->suspended)
> +		return;
> +
> +	if (master->_resume)
> +		master->_resume(master);
> +
> +	master->suspended = 0;

Same here:

	if (!atomic_add_unless(&master->suspended, -1, 0))
		return;

	if (master->_resume)
		master->_resume(master);
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
