Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18033C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FZgn9iaykneUBePOz1sTYBmGZgJJiyYpLi1M5WjBEs=; b=o1s8qjOwNkIrBZ
	e4GyAhY8IJ5VdmSO56dR7bvGuneGQdyCPgfYrPuM7QBf/u9A9VE1kEmAL2IpYqsZzcm7vf78/fmTK
	PzWS/P6VgHF979KKar4k3D7o52J90vYcBKuMiqkV8HHoVHxo5qiVUXTx8ymCfAQKkep5Nli1RoJPE
	vyb/PPOcvEcKfQQlpi5+ZsBvfMimASV3l5UrCqGwkl9p8YOsG0jxkWY+aNyp8Fr2Jj5KgovWSUEg+
	BE1mHxtC05g7p0c3L0RMpwNFLovK4RkvoRocGivUnSpNDBVoDp7ssK5OUcnLEwEGrp9nW10zKwtgm
	hYTkCUaqfpI7u+VMc9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA63A-0000000DRrC-1amn;
	Fri, 25 Sep 2026 13:33:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA636-0000000DRq4-324B
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:33:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C96C1A1006;
	Fri, 25 Sep 2026 13:33:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DE676073B;
	Fri, 25 Sep 2026 13:33:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2B4710328CD2;
	Fri, 25 Sep 2026 15:33:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PjaiRlRH2Y8JceVC6/lC0OMOb3aYV85nZn1Sazlgkr4=;
	b=k7XLJijcDLcyf8iPSjDSE9Nl+hRkjAjW2cYnzlOLOe3dt3jd6pWxPhUBVjdBxX88tG88hB
	LFWHTah3TtleKhGCnr8fTAhuxhEcdH2As+QmVNZ6mW8FFIQsPDHqGqtwQnNv3PDmcJGRI6
	7ZsI9qpukupNrIMCasNUsyJLm8P/8kMvr0kUUaxyTstzH6RASMIA5bNO10EPg2rM5WlP3Q
	Q1F7WxqRx4MNWN+4MHfjSbPSWrED6qkvRH1f6kmSIH/Im3/ax5kx/viCh6U75FwfLP3GxE
	WLq+Rq0lNN/xAT3tAySBTqxtP1vhx7voFW4s8S6wgTo8T9l1E+Vg4bHP6V7o9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rosen Penev <rosenp@gmail.com>,  Thomas Gleixner
 <tglx@kernel.org>,  Sean MacLennan <smaclennan@pikatech.com>,  David
 Woodhouse <David.Woodhouse@intel.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ndfc: fix I/O mapping leak on remove
In-Reply-To: <20260915164204.2492099-1-lgs201920130244@gmail.com> (Guangshuo
	Li's message of "Wed, 16 Sep 2026 00:42:04 +0800")
References: <20260915164204.2492099-1-lgs201920130244@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 15:33:02 +0200
Message-ID: <87qzih4fsh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063313_084625_CE67191E 
X-CRM114-Status: GOOD (  11.88  )
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

T24gMTYvMDkvMjAyNiBhdCAwMDo0MjowNCArMDgsIEd1YW5nc2h1byBMaSA8bGdzMjAxOTIwMTMw
MjQ0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IG5kZmNfcHJvYmUoKSBtYXBzIHRoZSBjb250cm9sbGVy
IHJlZ2lzdGVycyB3aXRoIG9mX2lvbWFwKCksIGJ1dCB0aGUKPiByZW1vdmUgcGF0aCBkb2VzIG5v
dCBjYWxsIHRoZSBtYXRjaGluZyBpb3VubWFwKCkgYmVmb3JlIHRoZSBkcml2ZXIgaXMKPiByZW1v
dmVkLgo+Cj4gSWYgbmRmY19jaGlwX2luaXQoKSBmYWlscywgdGhlIHByb2JlIGVycm9yIHBhdGgg
Y29ycmVjdGx5IHVubWFwcwo+IG5kZmMtPm5kZmNiYXNlLiBIb3dldmVyLCBhZnRlciBhIHN1Y2Nl
c3NmdWwgcHJvYmUsIHRoZSBtYXBwaW5nIHJlbWFpbnMKPiBhY3RpdmUgZm9yIHRoZSBsaWZldGlt
ZSBvZiB0aGUgZGV2aWNlIGFuZCBuZGZjX3JlbW92ZSgpIG5ldmVyIHJlbGVhc2VzCj4gaXQsIGxl
YWtpbmcgdGhlIEkvTyBtYXBwaW5nIG9uIGRyaXZlciB1bmJpbmQuCj4KPiBDYWxsIGlvdW5tYXAo
KSBpbiBuZGZjX3JlbW92ZSgpIGFmdGVyIHRoZSBOQU5EIGRldmljZSBjbGVhbnVwIHRvIHJlbGVh
c2UKPiB0aGUgY29udHJvbGxlciByZWdpc3RlciBtYXBwaW5nLgo+Cj4gVGhpcyBpc3N1ZSB3YXMg
Zm91bmQgYnkgbWFudWFsIGNvZGUgaW5zcGVjdGlvbi4KPgo+IEZpeGVzOiBhODA4YWQzYjBkMjgg
KCJbTVREXSBbTkFORF0gbmRmYyBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogR3VhbmdzaHVvIExpIDxsZ3MyMDE5MjAxMzAyNDRAZ21haWwuY29t
PgoKTm8gbG9uZ2VyIGFwcGxpZXMgYWZ0ZXIgUm9zZW4gUGVuZXYncyBwYXRjaCwgY2FuIHlvdSBw
bGVhc2UgcmViYXNlIG9uIHRvcD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
