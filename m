Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06BFC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:52:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C98561C47
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C98561C47
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F0lVAk7hqb2KDSEiKULSV1pwILzrX6dr29Lh2fI6ozY=; b=EAoqKKJpdqVWSISLiEfLy8fqD
	qt6Bv/nyrKxCpscJorJr/t4mVtY27C90033Agb4+ulglJxwAYJ8NJZyVbFx23g2mtrQKQOXjjZ/Vb
	8KsvcJahG07V5pxTbjK1AtL+V/ovuv9Xf3MPjW1aiIhWGU+JhjcsEf78eUXww9/0QPlBnaug9NVdk
	C7jfjpYwE68E8qSGkhLeIcudEYj34nMl5f6ZvaCw/2vYlLwhuHT4tMd+FVvYg9X0itKVizdCEUIfO
	TtlC/+NOOoVG/cqTk6JbuaYEHE57C4o7Mys1mKg8kT25karoVisyjEHOpbK8pUdyrkd3qvCX+GD6H
	bHDJg1mKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Vl-00E0OD-Uw; Mon, 10 May 2021 10:51:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Nx-00DyxN-1t
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ryiWgnoyyXDN9pDKEcBMIFwaXfBZGIv1h6jJ3zNpwmM=; b=mp5FPELmS649BfxpaGcfH+v/ST
 i/JiXzS0/KN2aRXrX5MGyzuyK8/EZc4YbbO8dvxgRhm3DZl6EBOgp2398bttIOtfs/tbMpBFXlALa
 NhioiUQoYGtT67GiOHgJE8+FhqBIZl98X2e9ZpoUXZ/SaHtH+CKMFrUgyuQIAAMRS0bAru5N4Nvh0
 SWxPU8hBg+PGCCcRRf9pvSVcO4FxRw8/X1ldBpy9+N15L6/Deeyo9XngK+tPbIeFysrpWc7Cf6p9q
 gtVfe5f0XfYm9X1dCMZF3FPfJZCK1TPgZhr55kTNtvCHOpnGV0X0D/EzJAPKwhdcFdFTCjnqLPK2G
 nz2yIOJQ==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Nu-008Ypr-3h
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:43:35 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7E09F24000B;
 Mon, 10 May 2021 10:43:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Shubhankar Kuranagatti <shubhankarvk@gmail.com>, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: mtd: sm_ftl.c: Fix alignment of block comment
Date: Mon, 10 May 2021 12:43:31 +0200
Message-Id: <20210510104331.10755-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210504062059.mywqzwveyjfawreg@kewl-virtual-machine>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f58997881dc4a2626ce3f363bb8305974164c67b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034334_301664_CC4FB569 
X-CRM114-Status: UNSURE (   6.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2021-05-04 at 06:20:59 UTC, Shubhankar Kuranagatti wrote:
> A star has been added to subsequent line of block comment
> The closing */ has been shifted to new line
> This is done to maintain code uniformity
> 
> Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
