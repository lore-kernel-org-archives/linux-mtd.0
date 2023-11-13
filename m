Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7811C4167D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5HTKSuen1ZGYN+ryOSeaFavWlDfK+jUaqLLj91pz9Y=; b=MVy9DXV2F1Avmw
	HmLcblAO1dXsZNu5e72iJrsOQv8Ylo3FQpYAeQiASSm6t1KQgbxiXcV95BGTbHnVMusvN9ulApArn
	GqvLEC6ndN9bV3Im8Zzz2aFINLNhGLoxJOolt+vosxBKzAh280Bp4y2XT0mHniVHmAI/zLAeoavLs
	FJABuDBgSW/e4xoSQI2HZZ9FyeagVsxICjUz0c+ueFQ97+/GrKL5HToauL6vNPGgxUh2Ts2xix4OX
	yAVq5dr8Pr1b7Ui41ILyukEES8KCVwF+YPRzxnvk4rFJQzFjlk+xOrYLkF7wv/nQndNrOYAhWJsbW
	HthUlqLCKZRKIDy7/w/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Us0-00DhjC-27;
	Mon, 13 Nov 2023 11:12:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Urx-00Dhhk-1H;
	Mon, 13 Nov 2023 11:12:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D03D5E0014;
	Mon, 13 Nov 2023 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699873959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L5uKucbE1Tk3o8xyE+hpKK8uiirb33ZziNHygK2GI4=;
	b=f45Z4MSMNUdxz0Ac5ewqJuMmM3KCpq7WLrgTZrBVkGn5GHIHkKi3flnINTntXZgqKQWKsC
	xMO5IePn/GS4cmKCFdAFG1bV8lRcznlcQc5MWcZWtnRJr+gPZ3+G9kxkr66vCfAMQ42OBy
	+a1MLkkNjTLHyVZuK+mljh35lLbPQrmo1rCTXVXbdskdp+TuvCCvZnGgi0Fzr2iLvjE4S9
	soF/Xv+zvVllMrQeisEBZ8EbD2JWC1Efo1VfijeOkuhw60RHGIwz65bK4kccWSKDxUMSLW
	LO6gejGASHsErdCvYIzYmEQVbO4oZGGHyj8mSgXkag4O7Q4xMkDXDWVEnv0p2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Richard Weinberger <richard@nod.at>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?b?UmFmYcWCIE1p?= =?utf-8?b?xYJlY2tp?= <rafal@milecki.pl>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 1/4] mtd: rawnand: brcmnand: Convert to platform remove callback returning void
Date: Mon, 13 Nov 2023 12:12:38 +0100
Message-Id: <20231113111238.464609-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102220246.3336154-7-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'215283a1a4833f441778580359aea768642c56af'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_031241_578240_9FD0232A 
X-CRM114-Status: GOOD (  12.82  )
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

T24gVGh1LCAyMDIzLTExLTAyIGF0IDIyOjAyOjQ4IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
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
ZW5hbWVkIHRvIC5yZW1vdmUoKS4KPiAKPiBCeSBjaGFuZ2luZyB0aGUgZnVuY3Rpb24gYnJjbW5h
bmRfcmVtb3ZlKCkgdG8gcmV0dXJuIHZvaWQgc2V2ZXJhbAo+IGRyaXZlcnMgdGhhdCB1c2UgdGhp
cyBmdW5jdGlvbiBhcyByZW1vdmUgY2FsbGJhY2sgY2FuIGJlIGNvbnZlcnRlZCB0bwo+IC5yZW1v
dmVfbmV3KCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiBSZXZpZXdlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8
Zmxvcmlhbi5mYWluZWxsaUBicm9hZGNvbS5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0
LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
