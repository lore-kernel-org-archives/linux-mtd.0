Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3229CCF2D5
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ai/WEW1iGQRWaUA9e91AfP/h3BeAj6WcrkrcnN2SRQo=; b=gncypPhOSS+aqx
	HVz8nObsyD4YEhxXZZXrAccmgtdX7T/T7efT4fhx1PLg52/eeLKKUoYHN4c6W5zbWA7CrWtC7cfqk
	K4LUAIp5lSkusZZtOPdqa8+t9dOajAp1s9lcrxeo48ryT0jABDx6zUU4kqL+9Yi1+TVW+Ondy2jzo
	p8RETuGwIk/uA22qTNEI1PsKngQsm2oNVxxzx0336Nwy5l2GnUPgFYSWr8+QK4KMzuyCm0dCvnQqD
	hObNuGDh2UV4Ye0YFxIzfkTNZkhQ0ByP6qlQPMaKXMmOzAZBSrfL6LQJWDxkfVkuC3GQfS+Vboe/m
	ZZ9VmWiaNh8VYVv5Ue7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmFI-00000001j77-0kRO;
	Mon, 19 Jan 2026 10:12:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmFB-00000001j6p-2obC
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:12:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6037D1A2941;
	Mon, 19 Jan 2026 10:12:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22C3E60731;
	Mon, 19 Jan 2026 10:12:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3647E10B68476;
	Mon, 19 Jan 2026 11:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G40N5IFm8Tlyjgkp04uECGsYb2DZSUbVAe+wFNscRyo=;
	b=YE4p5C6HIic39xwcEmzATYBqXLCsZwQgvlr3k2bdFT0YPfGLRXz/SVPKYE8pSxSHiYB2iz
	7fFmAmB47lc8X3NCsDSfQIzn6+NAEUMfhH7bjBL2yO1TqgNWlaIbO2ZUnHbgSfsIinixI7
	ritfNiY13WiwKfbdmYqHCSxS5LQ926JUcQonf86dmYvHKRXmU7t6qax03rmQZoCCPx8li1
	A7tbdvmAQ6AUmonhnqvc8Jj9dIhKnXzLNtAoS93jWquAWWl2lDTAKcu4TLerMOAYgbuC3r
	CwP1w8qkMLfHvLQelg5tt/UESFL1N1Q/IEZ55j+L4TZpflC/wBVJmcD7i4FcUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20251209071604.36482-1-naseefkm@gmail.com>
References: <20251209071604.36482-1-naseefkm@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Dosilicon
 DS35Q1GA/DS35M1GA
Message-Id: <176881753304.2430399.14630278262791137800.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:12:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021221_860088_718783A3 
X-CRM114-Status: UNSURE (   6.75  )
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

T24gVHVlLCAwOSBEZWMgMjAyNSAxMToxNjowMiArMDQwMCwgQWhtZWQgTmFzZWVmIHdyb3RlOgo+
IEFkZCBzdXBwb3J0IGZvciBEb3NpbGljb24gRFMzNVExR0EgKDMuM1YpIGFuZCBEUzM1TTFHQSAo
MS44VikgU1BJIE5BTkQuCj4gCj4gVGhlc2UgYXJlIDFHYml0ICgxMjhNQikgZGV2aWNlcyB3aXRo
Ogo+ICAgLSAyMDQ4IGJ5dGUgcGFnZXMgKyA2NCBieXRlIE9PQgo+ICAgLSA2NCBwYWdlcyBwZXIg
YmxvY2ssIDEwMjQgYmxvY2tzCj4gICAtIE9uLWRpZSA0LWJpdCBFQ0MgcGVyIDUxMiBieXRlIHNl
Y3Rvcgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiBzcGluYW5kOiBhZGQgc3VwcG9ydCBmb3IgRG9zaWxpY29uIERTMzVRMUdBL0RTMzVNMUdBCiAg
ICAgIChubyBjb21taXQgaW5mbykKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
