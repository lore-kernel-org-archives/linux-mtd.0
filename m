Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFFDC7EE32
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6ruxzCyRY9dAkwQpCE4Pt7llsVjSXzijxjCDjgdUrc8=; b=yNtBU4qA5aIhlCUVEaZBiaw2RC
	llw0a/R/Lyrk1WvpArati9l181QTOa2/5oAw2SyAvERxBUczvTAzz+1xHlETWFBtWXgtWLFj9bnLS
	NStlm9paQELqydMlFrYUncCvBXMCxCJEFt9vqWuS/GsR47vfTJedV7+/aeCinH5F4dYvoWsrnSaMF
	l4dNz2mbpltcH0Kk6LkTGNhMVS694Kc7iwcLMSuQq7tYpnrvU+/AMATQ7dc5q18HiPXZ3G4UOK3wt
	dCYA656+HYd88q3/OZCjFinKaaJgq3HWg92ko9bW42iAeoYrs8+oOteuVFXPcTrDUlIg4CsW1NVLi
	xNGLCGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHTm-00FPc3-L5; Wed, 01 Mar 2023 08:06:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHTf-00FPaH-14
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2023 08:06:23 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BA09E6382EFB;
	Wed,  1 Mar 2023 09:06:05 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zrNmv9WCWaJ6; Wed,  1 Mar 2023 09:06:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 28CD56382EFF;
	Wed,  1 Mar 2023 09:06:05 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id isM9H1l8qKaD; Wed,  1 Mar 2023 09:06:05 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 000806382EFB;
	Wed,  1 Mar 2023 09:06:04 +0100 (CET)
Date: Wed, 1 Mar 2023 09:06:04 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <34189394.187159.1677657964794.JavaMail.zimbra@nod.at>
In-Reply-To: <9121ae91-5b4f-4b10-46fc-6cc0683c949d@huawei.com>
References: <20230215022507.2363193-1-chengzhihao1@huawei.com> <9121ae91-5b4f-4b10-46fc-6cc0683c949d@huawei.com>
Subject: Re: [PATCH v2] ubifs: dirty_cow_znode: Fix memleak in error
 handling path
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: dirty_cow_znode: Fix memleak in error handling path
Thread-Index: X90c9wAR7xc40YmoflX3D/iimRonEw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_000619_265177_260EB349 
X-CRM114-Status: UNSURE (   4.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEp1c3QgYSByZW1pbmRlciB0byBub3RpZnkgdGhhdCB0
aGlzIGlzIGEgdjIgZml4IHRvIHJlcGxhY2Ugb3JpZ2luYWwKPiBzb2x1dGlvbiAod2hpY2ggaXMg
aW4gbmV4dCBicmFuY2gpCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xp
bnV4LW10ZC9wYXRjaC8yMDIyMTExODA5MDIzNi42NjQyNDQtMy1jaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbS8uCgpXZSBjYW5ub3QgcmVwbGFjZSB0aGUgcGF0Y2ggaW4gbGludXgtbmV4dCwgdGhlIG1l
cmdlIHdpbmRvdyBpcyBhbHJlYWR5IG9wZW4uCkEgZm9sbG93IHVwIGZpeCBpcyBwb3NzaWJsZSBh
ZnRlciA2LjMtcmMxIGlzIGRvbmUuIFNvLCBuZXh0IHdlZWsuCgpUaGFua3MsCi8vcmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
