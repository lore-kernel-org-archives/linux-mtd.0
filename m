Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D554CDB483
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpN0msXmZpUMWGd2mlSNr+hJhvRXnrUsl+YuSQU4Q4M=; b=2dpiACXMWE26YN
	E6t+RNkalT+/BXWaB4EuuB97D6LtUlQ8yGYt8xFL4xTh4TaQ5DMy271w1ND6OiDWcn9EU78eCv95V
	r+sRWIOg3mNwY+68HGpLcUmSpDZCjgCRUX3d2D/whiuZFgmvpQ831bh2vN6OVFiGi2Nh9MFhQ/mja
	pBPWL5fVqcOnM1ONDWKtuJIYwS1uzKIdFDospccODtNcHIKgQCw1b5Am05+T4BdG/ebBDmLiA63bL
	TtcU1LqzlOZzYz/6NdTCn/jQv/69ikTZhlwrbGyL9zpUZMJwv38gZEKho1cqATKEh4s6tdezxNCXb
	HgUqJ3uHCasgOvWUzhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKrX-009JCn-0K;
	Mon, 16 Oct 2023 10:30:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJto-00907U-2E
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+ps+X22leEja8vkUmCgcXji/W26/XvFiuUlYrGIalqY=; b=Ygt2qFroY8zk2pMjpAKTuryjnT
	lFeHirVkHXxJKW4/8VGe0VKJ7CAbvEgWq+1rVkNuRpa6ZRQrXQ4Ra5skkuo2fAWlFx3/nhzIflSsX
	DBjcmEa3fT1TGUQNEWdjK0Q5mOAwPx6ni4ouLQaVmfqMiPAMzqDer/bX45eqgNxQNdEt8tV0rzgAC
	51UgPKpx017hlhBLvylPoFrHH1tQq2ONMuoHrrq9MpvKOx9WGPj8TmHskNeuZJqYN5zAxhm/cx9j5
	US+FhIAiro3x7ehG1OflG65DmUbq+4oEZqDHnuwOp1Q3crZ345E0PEFWkb80gYZgui7fEu4eQr297
	4wP04V3Q==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qsJtj-005EBk-Tp
	for linux-mtd@lists.infradead.org; Mon, 16 Oct 2023 09:28:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6A3D1C000C;
	Mon, 16 Oct 2023 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ps+X22leEja8vkUmCgcXji/W26/XvFiuUlYrGIalqY=;
	b=Kjdm3AURlEPuTLyaAv0cvJ2JeWIg5pp6vGscoOQt3l1O0uGRfmX3f/fiOlyXBF7q3gJ3Ai
	dH7AdA6/qOX5xdHrUMr8efaTRcc6zoKv5zO7yWF/KvHcuRtcuNK70nruAO0AYP4IHt/Alx
	rEIJgokpWuxhBKQPLcTZA8KXu6R7HMyQTItAUG0ACo5PI5kUUI7BqvlnDlCOP7eKZNYCxg
	BnFc83ahdcJ7/txZma6l7VvhFbKvF144ovkmch5YRDR3zc1KLBb1IkOvtzHCWFMb1lxDSv
	RwpeYdC84xXU3fBAZDbKY5HROwqzMyAbzMxryyxVWBxsZGL9jfjAN77p8RbwXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Joern Engel <joern@lazybastard.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 05/20] mtd: phram: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 11:28:19 +0200
Message-Id: <20231016092819.288764-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008200143.196369-6-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'09a8b9ccffe7ff80cdd04930e0d2b45d34a19f74'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102827_987452_302AD453 
X-CRM114-Status: UNSURE (   8.89  )
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

T24gU3VuLCAyMDIzLTEwLTA4IGF0IDIwOjAxOjI4IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZv
cm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9y
cyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4g
cmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGln
bm9yZWQgKGFwYXJ0Cj4gZnJvbSBlbWl0dGluZyBhIHdhcm5pbmcpIGFuZCB0aGlzIHR5cGljYWxs
eSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLgo+IAo+IFRvIGltcHJvdmUgaGVyZSB0aGVyZSBp
cyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4KPiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8K
PiAucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBh
ZnRlciBhbGwgZHJpdmVycwo+IGFyZSBjb252ZXJ0ZWQsIC5yZW1vdmVfbmV3KCkgd2lsbCBiZSBy
ZW5hbWVkIHRvIC5yZW1vdmUoKS4KPiAKPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZlciBm
cm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2FsbGJhY2sgdG8gdGhl
IHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBt
dGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
