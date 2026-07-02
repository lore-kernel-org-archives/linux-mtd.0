Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3B5C43602
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9Q8jzL3mFBrpM4Jq4Cn2aafDw89Rs8oPKDnnWLmyG0=; b=Af5Q9PcWUxAqHH
	RI92bV7dwOQ+I7hfNzUWxtSFvel6frBWeuliY9DAjZZE0nfvORbMCVE0ViI0C5aMm2DS1raqJKrCm
	L4IzyTSG4q4KN9yK713ucwRtyqFAru02LsotU7EGko98zQEqvgDWBVTSn4Vx558zigBJFXTMUYL5q
	BsTRDcCDRWv8kdKfBPHQQXz/A7vRWfnRFZnzcmb5RrJcu8Y8RTyIiUa5tGU3GEPRi9VvKQDW+9mCu
	gVnulGvkyBTMyVJU4oUZMNYUu4zmcjTit+aVPYSPQAAU3lj6LAETdnz+uRr/IgBKeDI7tOoLGNC9I
	wwjS25xrOPVCjJOE0cQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI88-00000004bQ4-3tIx;
	Thu, 02 Jul 2026 14:11:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI87-00000004bPo-2Ek7
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 14:11:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE4E0601EC;
	Thu,  2 Jul 2026 14:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B751F000E9;
	Thu,  2 Jul 2026 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783001462;
	bh=eGN0W9GqOz+nTHlByNW+rSC+GtM2Q7ANNhzo3cBVLxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TCT7nv6ZJK04r7SlRBVwdWAOw5vhfcXg9oBSIgrQCLeR/5IVs8sXPjpvpPDwGnzlA
	 ulnzSuQJhkScm77eNGaEt8zK3ZcBv2z6oRU04E41iujQ85yJDODnoSr13yDMz5rPLu
	 UmMiMkfMLz/glciTOR+VrtZYLPTz/gzZ7rsCHD6I=
Date: Thu, 2 Jul 2026 16:11:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: stable@vger.kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org,
	mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 6.6.y v2 0/2] mtd: spi-nor: macronix: backport Quad Input
 Page Program fixups
Message-ID: <2026070239-proponent-lazily-990a@gregkh>
References: <20260702021842.2771498-1-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702021842.2771498-1-linchengming884@gmail.com>
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

On Thu, Jul 02, 2026 at 10:18:40AM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> This is a backport of two upstream commits to 6.6.y:
> 
>   commit 798aafeffb36 ("mtd: spi-nor: macronix: Add post_sfdp fixups
>   for Quad Input Page Program")
>   commit 797bbaa7531f ("mtd: spi-nor: macronix: add support for
>   mx66{l2, u1}g45g")
> 
> Neither commit was tagged for -stable when merged. 6.6.y also predates
> commit 09e5a29fa3ad ("mtd: spi-nor: macronix: convert flash_info to new
> format"), which landed in v6.10, so drivers/mtd/spi-nor/macronix.c is
> still in the old INFO()/NO_SFDP_FLAGS()/FIXUP_FLAGS() macro-based
> format. Both patches have been adapted to that format with no other
> functional change; patch 2 depends on the macronix_qpp4b_fixups hook
> introduced by patch 1.

Why not just move to a newer kernel to get support for these newer
devices instead?  That's much simpler and I'd prefer that over taking
much-different patches instead.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
