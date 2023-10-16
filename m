Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A7DCDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEbC/GkLCR1+qU1LjA8H0uBq0B7aszrOK1oj5gr/Aw8=; b=wf2H3IF4/qbPLX
	Hqrs/LkPCxAoqLnLpPnBEWbVXPxCnDN4vw7LTpoFJNkE3ZZ4S3Z2nh7+K447NPE/zOizmnYi0mSSw
	Wh0E6UE8z2EQ05lDNU4k0SeBYEoT8qi66RrVn2QumGDt+GFsVFJDkGjqNA2jausd+y0TTg6gpLTGL
	xDPaJe3ibJoKN5zL3iyWtY16BpL2ToXw2dFcNhOMg1hmEtfiGvzPWP5TRsdEKUEjH2dC74+c7qIV3
	zuYCsKFLtFZ8BMdDJjP6pNSectnkKoOklM+DTzaVpJQgc8ln4jy3cbhyQeGgyJUIeuSL0uAkH/p0/
	Hrq0R1SmOS/Ddel/C5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJsz-008zWV-1s;
	Mon, 16 Oct 2023 09:27:41 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJsw-008zSo-1b
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:27:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D2AF2000A;
	Mon, 16 Oct 2023 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gg7CuGNJJcfSsD4QH5msuOl5hQQoW1WUvsuE9INOHBo=;
	b=mhDDNsHVGlAgH3zTLKhMzDP3kmn6vQnZupor8nRSMf94men/ZMFRX+JeEwL1m7izUkKoaH
	AwC2nikgEb3xP/VKLjXvF3wOULdsmUwcnNp4qM7lqlTYfM/QbkQ/Mloam4+BuQUZkOCGX8
	yKh3bcVZp/ybd+OKIoVMXHcbOaJkyXbR0Q3ANnecHZe7WPEfYBZncuEbhI3R4NkJxNOR7b
	ZS3oTtpZev5alUjOHKy9M6PWICxJFTc86+Bb2RFtYRfK+vgvsUGgI6qcxNMuQVCWQbxXDh
	Rh5UY/pnZN5HryTIyT4nZKoNMr9Icfr17jm/NtF9oPEpdtquP2+l1ReTWrZT1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 15/20] mtd: maps: pxa2xx-flash: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 11:27:33 +0200
Message-Id: <20231016092733.288451-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008200143.196369-16-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a105291c90a5838b75c524a5c922b0431cd8d4f7'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022738_666933_5AA7D79D 
X-CRM114-Status: GOOD (  11.11  )
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

T24gU3VuLCAyMDIzLTEwLTA4IGF0IDIwOjAxOjM4IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
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
