Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F952C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gv1el4qcNqKnIAWpmT3v3CoSZZRojVkgeYQpcG9HUSc=; b=a3ELLtyw5uLotO
	6Lm0dGMdY/Pn+76VkcxYfr+XYPBz7lM59yJemdy3mBCQ0b+vcRjdm2zsMtZxKTHAFqwaTJch4Ml8x
	vcxJyygFKrbgCIKrbqO5bLtUjooHgmiy4zJZXmyoMn8yq72PkTBsvfr2bOLsytz3tTemdotXOYDyB
	1Z+BuNJBIFfEgRxvY5Y90yqb/raWK/3t0DnjCELnWtLbbKj5kDACR2hzlTUQAGV4/4drYK2Hntx3F
	rTV19cYwpHdT35HEtioq/m1DK8l1LgrHD5uPmDnNrVdYR7RaJGpNNw0bDON+CPLCqLcNfa5a3T3TF
	/t2Z/yQoi5VeWJKrVECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvq-00Gr6x-0U;
	Fri, 27 Oct 2023 17:47:38 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvm-00Gr3Z-02
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 17:47:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 827EBC0003;
	Fri, 27 Oct 2023 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOYLIEH/QzZ5fqFZlQHboq/fqbBoEl5Gd1L6uPe1G4Q=;
	b=cj9ay+OwoXZRjNtuQsPMhxV31LZebUNaPTTmItRtqF6fxa8wQe3+6efwHhiE0fWb1AGR7G
	JwyGplCFWUTKspEaOxScdyZxDapMoop6Fj7wczPMtHLrJ18WusVb2b0j7mUYkL9t/ZJy9E
	UHYu1Wu/zOdkSaLftJG3a9dkzaLyl+vSu2L2h6pD9iQg+DPhgcFiD1XCY5b5UNjCDnEghC
	ywqVfzN3hJccOsTqwRf0RbsQAOwfhoYOQxngnxq/AmRRxTV5Yfs9iRsBdElFZnbNBDBLYm
	XZvLtGNGceLBJpiJ8Xw1SXiEDhYNK6fBXwdC59zrzQzFTvXM2QaYcgibJ4k5tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangtao Li <frank.li@vivo.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: rawnand: sh_flctl: Convert to module_platform_driver()
Date: Fri, 27 Oct 2023 19:47:26 +0200
Message-Id: <20231027174726.370059-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016103540.1566865-2-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'60ec53ace2cb8a6f5678af1ea614f8582e32c081'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104734_209569_03332CCE 
X-CRM114-Status: UNSURE (   9.12  )
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

T24gTW9uLCAyMDIzLTEwLTE2IGF0IDEwOjM1OjQxIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSBkcml2ZXIgZG9lc24ndCBiZW5lZml0IGZyb20gdGhl
IGFkdmFudGFnZXMgdGhhdAo+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSBhbGxvd3Mg
KGkuZS4gcHV0dGluZyB0aGUgcHJvYmUgZnVuY3Rpb24KPiBpbiAuaW5pdC50ZXh0IGFuZCB0aGUg
LnJlbW92ZSBmdW5jdGlvbiBpbnRvIC5leGl0LnRleHQpLgo+IFNvIHVzZSBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKCkgaW5zdGVhZCB3aGljaCBhbGxvd3MgdG8gYmluZCB0aGUgZHJpdmVyCj4gYWxz
byBhZnRlciBib290aW5nIChvciBtb2R1bGUgbG9hZGluZykgYW5kIHVuYmluZGluZyB2aWEgc3lz
ZnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1p
cXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
