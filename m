Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F9C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTurSnzBB9Mn5BfbdOMFkE3xAT2EJhz5zMggEHbnDYk=; b=0CoYqn5NSvtjcv
	dKF0/AGaIxzd9sjRQxdUOrCYAWxnh3NbRmqBtTYCse0I4/4Y7VgPr+e3Ea8M0E2BdLYzhougG0Lue
	ATzoCHlWPbDnrQ9R/7Sm6Qbgs5rgg8lGrFhwsG9YWSDhUJEjjmOcmOCZpJuStdo94AcyV3SmglsGY
	R3xwniuHU0LAjhUbquTKRuxS5+k4/Ge0crTUaPqiowSPguSgmOaWMJSFI7Tj+sHmG2r9EkBHT77Bd
	edopuHgoEpORwVBHHZA9tGwVAPNvLfIKx3MUDDiY6KkGGDVQk0S23+YnyBYECeuPqUKC2igxlE0ew
	67Ne9h5r4VeIcJDr+zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xrh-00000002tuq-2xpp;
	Fri, 04 Sep 2026 17:38:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xre-00000002tsI-1tpG
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB3A01A19B7;
	Fri,  4 Sep 2026 17:38:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FDCF6057F;
	Fri,  4 Sep 2026 17:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E21A11C78767;
	Fri,  4 Sep 2026 19:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gdFrR/0PYQhuKNVq/5wRD7o+eOPgVPi8iLcq8juRx/s=;
	b=u7nSyM9pPdRhpskIaRn+xHNOXZbIKRglqvcWTAwoEjEtbBtLtkBsgAan11HkQZMR4i1WHp
	RJcPCk4YCfM+XkEWkzqULzOGIK90Uj3pvXQhPqS9WJmdaEZQs5hZsiyqkQa/P1h7fVto6V
	75mwz8q3CXYiY2J5hYd2YW60Ps//e3ESNBNM5E3prrSvUiBDhZQWcU2xtD0dP4N5HTJgRR
	35OstITJFEXeAe4KQfM5FQ01twYDL+CksF2a4jsZ4NUV964L8VFx2MxV1uaXfSAbveGZcq
	IMLxb0GXFbCxkacDxLzakelYYuzIt9IZmQJt5TJ5VBfeAEXVO+Wnu8dYhVYyLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816163058.10099-1-kmehltretter@gmail.com>
References: <20260816163058.10099-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mtd: core: call _get_device() with the master MTD
Message-Id: <178854348328.1467647.1278963420039416340.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103810_637634_912A80D1 
X-CRM114-Status: UNSURE (   6.23  )
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

T24gU3VuLCAxNiBBdWcgMjAyNiAxODozMDo1OCArMDIwMCwgS2FybCBNZWhsdHJldHRlciB3cm90
ZToKPiBfX2dldF9tdGRfZGV2aWNlKCkgY2FsbHMgdGhlIG1hc3RlcidzIF9nZXRfZGV2aWNlKCkg
Y2FsbGJhY2sgd2l0aCBtdGQsCj4gd2hpY2ggbWF5IGJlIGEgcGFydGl0aW9uLiBfX3B1dF9tdGRf
ZGV2aWNlKCkgcGFzc2VzIHRoZSBtYXN0ZXIuCj4gCj4gVGhpcyBicmVha3MgZ2x1ZWJpIHBhcnRp
dGlvbnMgYmVjYXVzZSBnbHVlYmlfZ2V0X2RldmljZSgpIHVzZXMKPiBjb250YWluZXJfb2YoKSBh
bmQgdGhlcmVmb3JlIHJlcXVpcmVzIHRoZSBtYXN0ZXIgTVRELiBQYXNzIHRoZSBtYXN0ZXIKPiB0
byBfZ2V0X2RldmljZSgpLCBtYXRjaGluZyBfcHV0X2RldmljZSgpLgo+IAo+IFsuLi5dCgpBcHBs
aWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBjb3JlOiBjYWxsIF9nZXRfZGV2
aWNlKCkgd2l0aCB0aGUgbWFzdGVyIE1URAogICAgICBjb21taXQ6IDEyYjMxZDFhY2QyMGIzMTg1
YmI1ZjA3NDhkYjBjZjY4NzRjOGU5ZDEKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
