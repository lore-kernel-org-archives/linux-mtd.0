Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B260DC71135
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jun 2025 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ancIQsFgi3lUjxkHgFOlap5eG6EnhRjRIf7QW9BgFVs=; b=Rl2UuSbDV8oXvcOXvZSu9SRcTh
	jr09S9+dpnXw2iP5cRIgaZGVjkZvfG8CB7S9OCLCW/J0k7Ek653qD8gJ+scdtcs9RobwR22X4FLWA
	xTOqh/G/old4tjyImMcw//gxO7r9g0G+KeQyjMnfKAxrSXVt0iJOBZwWKR2tL5AnzMo2f09mkfE7u
	XYhWrIRFc5YHUfLAcMzuxHtz6rQWbJUw8PntvsRo+06MTWjESp3YX6nB8Lw+CAbEo804URDtJVMKs
	z4fGVZoYaotfwjFtUREHBwpcpzjpZzwufgLScwwU5NiGEK50BA50WpGt3BcPeWmcJFaan+nSauaOM
	t8X2Ylkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5rn-00000003ss8-1BVt;
	Mon, 16 Jun 2025 09:10:59 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR56U-00000003mFt-1uWI
	for linux-mtd@lists.infradead.org;
	Mon, 16 Jun 2025 08:22:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B18A32A7F58;
	Mon, 16 Jun 2025 10:21:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id FoJ-62Xq6UYE; Mon, 16 Jun 2025 10:21:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 69EFE2A7F57;
	Mon, 16 Jun 2025 10:21:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SFSkIO309c9c; Mon, 16 Jun 2025 10:21:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 49452298567;
	Mon, 16 Jun 2025 10:21:54 +0200 (CEST)
Date: Mon, 16 Jun 2025 10:21:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>
Message-ID: <1923752382.134392168.1750062114160.JavaMail.zimbra@nod.at>
In-Reply-To: <b16dbc82976e2454afb6aa53ea97bd0f@kernel.org>
References: <20250613180722.1268159-1-miquel.raynal@bootlin.com> <b16dbc82976e2454afb6aa53ea97bd0f@kernel.org>
Subject: Re: [PATCH] Revert "mtd: core: always create master device"
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: Revert "mtd: core: always create master device"
Thread-Index: p1vLiHmh0/ANsxDSjqIRFjO0MZFTSg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_012206_635770_D01AA961 
X-CRM114-Status: UNSURE (   2.59  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhZWwgV2FsbGUiIDxt
d2FsbGVAa2VybmVsLm9yZz4KPj4gVGhpcyByZXZlcnRzIGNvbW1pdCAwYWE3YjM5MGZjNDBhODcx
MjY3YTIzMjhiYmJlZmNhOGIzN2FkMzA3Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAKPiBTaG91bGQgdGhpcyBoYXZlIGEg
Rml4ZXMgdGFnPwoKU2luY2Ugd2UncmUgaW4gdGhlIHNhbWUgcmVsZWFzZSBjeWNsZSBubyBiYWNr
LXBvcnRpbmcgaXMgbmVlZGVkLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
