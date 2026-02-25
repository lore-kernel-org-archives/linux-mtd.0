Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0356FD3774
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTfR1vu4P+Bw2HazrmtjPA9viUtAT7WYZsZ+h4xaLI8=; b=WqsBqTI/RPwVh4
	tkLKri/3fyiYP1rGKaO1Ixr7JaaFeoJ3FznANFOVGvegIZsWAbVoYjwXgzkmAGR90OnDV5IMU4mU9
	R/3jjOfwaUWVL+htNFcemdDYxdh25jsMEWMVOz20zeJFOJpvlPOmdB4vQhIv/tS88jhR5qB5XWFwZ
	iJOmmpqpA1UoirvWw0V9uHBucrgq0uYWcLNW8wBwSeqHJTjqjVzKdQf9b2K+QwKDtTRe3EGFHLBjK
	LPZ1BGAGULjp/eWa0OLW9OOcBrkQHXmu6eRzew3NyZlHD5YDv0D1GD0lQW/3univEVU//E0bn2xIL
	FYyUqkdwbZBQjOb9dlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI0I-00000004YaM-45FN;
	Wed, 25 Feb 2026 16:44:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI0G-00000004YZZ-0tJy
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:44:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 504D34E41120;
	Wed, 25 Feb 2026 16:44:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0869F5FDE6;
	Wed, 25 Feb 2026 16:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EAA910369259;
	Wed, 25 Feb 2026 17:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772037885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LXpj9HUXsze7oP+57VxZ9qCbaqrfD0WS/k/4zVtcbmg=;
	b=UlVajrMd1oWpN21eRe2SKjnxzrrot+dVp8ih/Ulon4PhLvMCiliQ+YOC/foCe0N/KpRq5q
	/U7M+ou8yTISa69IC5UNTYweLnyIKGrsgSmvsh+FdX2w27rfMw23iQRJdUcDdvhI3RAa8L
	cKTthBNHoMVBVcv21Hb/o7HQREhBj7WUWfc6f3SdIpcvGUws+VSuL3vJI82+hJL/OEf2f2
	74NZNphpGcN5+nqafxlZYN0GsiPU/NnolEwbp3s42Wwh2KAN1JqMuGcoC7E2/tWxcg/j5n
	0ByCnBqIjIkJFv3qUSJ8m/v8l54/sxM4JNkcKUn33+Ystfh2QbmwuptMHYV8Ww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	takahiro.kuwano@infineon.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MAINTAINERS: SPI NOR: maintainer and reviewer updates
Date: Wed, 25 Feb 2026 17:44:35 +0100
Message-ID: <177203780705.1983427.17146838755296719140.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_084448_384335_FB2095A2 
X-CRM114-Status: GOOD (  11.52  )
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

T24gRnJpLCAxMyBGZWIgMjAyNiAxNzowMjozMiArMDAwMCwgVHVkb3IgQW1iYXJ1cyB3cm90ZToK
PiBUaGlzIHNlcmllcyB1cGRhdGVzIHRoZSBNQUlOVEFJTkVSUyBmaWxlIGZvciB0aGUgU1BJIE5P
UiBzdWJzeXN0ZW0uCj4gCj4gRmlyc3QsIEkgYW0gc3RlcHBpbmcgZG93biBhcyBhIG1haW50YWlu
ZXIgZm9yIHRoZSBzdWJzeXN0ZW0uIE15IGN1cnJlbnQKPiBwcmlvcml0aWVzIGhhdmUgc2hpZnRl
ZCwgYW5kIEkgd2FudCB0byBlbnN1cmUgdGhlIHN1YnN5c3RlbSBpcyBtYW5hZ2VkCj4gYnkgdGhv
c2Ugd2hvIGNhbiBkZWRpY2F0ZSB0aGUgbmVjZXNzYXJ5IHRpbWUgdG8gaXQuIEl0IGhhcyBiZWVu
IGEKPiBwbGVhc3VyZSB3b3JraW5nIHdpdGggdGhlIGNvbW11bml0eSwgYW5kIEkgYW0gY29uZmlk
ZW50IGxlYXZpbmcgdGhlCj4gdHJlZSBpbiB0aGUgY2FwYWJsZSBoYW5kcyBvZiBQcmF0eXVzaCBh
bmQgTWljaGFlbC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIEkgd2lsbCBxdWV1
ZSB0aGVzZSBwYXRjaGVzIHRocm91Z2ggYSBmaXhlcwpQUi4gVGhhbmsgeW91IGFnYWluIFR1ZG9y
IQoKWzEvMl0gTUFJTlRBSU5FUlM6IHJlbW92ZSBUdWRvciBBbWJhcnVzIGFzIFNQSSBOT1IgbWFp
bnRhaW5lcgogICAgICBjb21taXQ6IDJiNDc2NzM5ZjkzZDI4NmRjN2MyYjlkMTQzMDFlYWNjY2Nk
Nzg5ZDMKWzIvMl0gTUFJTlRBSU5FUlM6IGFkZCBUYWthaGlybyBLdXdhbm8gYXMgU1BJIE5PUiBy
ZXZpZXdlcgogICAgICBjb21taXQ6IDgyZDkzOGQ1MjY2MjU2ZDJmNGQ5MGVkMzczM2E0MjE0OTNl
YjM2MjMKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
