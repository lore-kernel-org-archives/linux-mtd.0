Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cPTvMgW3PqSrN4a7Lw11Jq2JmCU3Cb9FD5ZY0Kf85QA=; b=pcsYXtr2GkMtE0
	o8TbD1pCmQoMLxD2WWGl+qvbb3q0SCTcTNCtrax7I9N4FnmCgwwyLJgVJNpuXOR7xm3jnGCs+lOeg
	FuV/m6BiFvnPGYtM32C9nV/AHESFWLfAUEVxg5txZj/DRWv28TK2PqhZ3of/+h+O7+cIJgJgmUhru
	AHsHbinz8Au/bARx3LSoAPDlXuKoMLL3A7a3OpJe9DUQ9f9lUE+SPEjpLA2el2vr0WxTPBgz9YyTK
	3+VheLNLOT18xkFmHg3rtl8yWa1p0+ssbBizxNnSFEDLLoHVcC+v9Ctj0S1gdMvU25QiOcEKR09ZO
	45ecKTtwMMHr8hJTWy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYk61-007fbu-BO; Mon, 28 Mar 2022 07:47:25 +0000
Received: from mail.ourpartnership.pl ([80.211.82.238])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYk5y-007fad-0V
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 07:47:23 +0000
Received: by mail.ourpartnership.pl (Postfix, from userid 1001)
 id DF22861EC4; Mon, 28 Mar 2022 08:46:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ourpartnership.pl;
 s=mail; t=1648453639;
 bh=M1ZVeu3q6Upppe+FUx/3rgI7MKJXh389NZDbgCK1SX4=;
 h=Date:From:To:Subject:From;
 b=iIEQU4Hv5EQ/T56cpcEYoP0niPdjJg4510eGltBORJTdr5SWLlWnV/AEPXw5Zh06g
 y2aMf2hGB7BCe1w3Z3pAFH352eGlJUfUYck4uuPyQiKICxB4NSBc0ZDXp1M+udK44L
 qOR7SkygLjREYF461BC/DLT9Fo+yL3NSliDNVyvw4QdlFgRE4TwRTfgTFRDOnOFqA4
 ivi9PGMf6RoHxteGNlLZwrwB/UTCRYXq3CjR5dB35SA7UMkHWDVpwNUySYayBSEmPV
 G2r++UghZeathQYHXeT8rO/3jEPANE/cdiYXAQlsovlVok/egzZqCtxzcVo6bSgI0U
 vrehMLUNkoxNQ==
Received: by mail.ourpartnership.pl for <linux-mtd@lists.infradead.org>;
 Mon, 28 Mar 2022 07:46:04 GMT
Message-ID: <20220328074501-0.1.9.29yf.0.u1i9lfvr7q@ourpartnership.pl>
Date: Mon, 28 Mar 2022 07:46:04 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@ourpartnership.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.ourpartnership.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_004722_216402_CE400267 
X-CRM114-Status: UNSURE (   1.68  )
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

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KCgpQb3pkcmF3aWFtCkFya2FkaXVzeiBTb2tvxYJvd3NraQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
