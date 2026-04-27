Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232F3FF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjfc/YTNd8JQ+9QbIrxsnJox0IxCjUCnMutcuAx393g=; b=fTS4hA3aQLc9hd
	xAUpc+mCI8UqCTidjAehtCqPdVXxfNLApyjZan/qfFU7qWqPuMt81kp69uOtalgXv8/Qv6fIQgw6F
	of0gYnNU3kqcvLwa88yop/XnH+yWqu3qk5zhZDNf0sAQJK5kUt60aZh3+DEUDvrd0avWTtF9HtTFI
	UeInbmM1euMFvMn8aaB1W4eo6qm5HVxHUnDQmzu/2DndMCllyQY1CCARCA05vzgKPY5XUyd9f6lLk
	X3JXXI6aGtEmJA6iWtkTXdI/bOoX0ijPsE1TTi8Xm2UGmgzU0UbN78xCfiCeS8CiJMx5dtrKT4O3q
	N5V9VfK2srjeeQkbT+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNYE-0000000HAA7-0wJ7;
	Mon, 27 Apr 2026 15:07:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNYA-0000000HA8v-3DhA
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 15:07:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D117C5CD4B;
	Mon, 27 Apr 2026 15:07:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 155A0600D1;
	Mon, 27 Apr 2026 15:07:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD5101072822D;
	Mon, 27 Apr 2026 17:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777302423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gMNoBFW05PGN89Lx84+WtOyYzlPOjlTQR1HX96yjry0=;
	b=iPoYCp2Q3BZkyngYDlFdBLey+pjeV/cHso3bV3Ev9SH7ZwK/Ph+ThDhIUdsWAjIAidna+P
	3ehE4OUWBkBeKBsPept5h7+UjFJzC43vdRtPcS96/UMSKc6bI+/tMOrjn24RH0o/Qh8kSD
	ZYtvR1xkxPRrY4Nsl/81kzq3IhHUryb2uOY5HyGXnLnAwdi1FbIjmI/uHhWICwuCBTm/kb
	yb7adJu6DrK7iNdh/R+YnenQBw4gou837NPLjsNfQOhpCepJ2/IBELq39GzhJcDWDA4TzT
	+Ya6hjdPjMRUOuKiiMpXfEvb7bzdeKRXDuUGyynMQiloNDU44Rg6DhKNUTjYBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
In-Reply-To: <20260424-worried-renewal-924d34ed945c@thorsis.com> (Alexander
	Dahl's message of "Fri, 24 Apr 2026 12:56:27 +0200")
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
	<20260105-at91-probe-v3-3-594013ff2965@kernel.org>
	<20260423-stoke-ocean-139dbe306256@thorsis.com>
	<20260424-worried-renewal-924d34ed945c@thorsis.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 17:07:01 +0200
Message-ID: <87tsswfnmy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080706_979629_A5039E79 
X-CRM114-Status: GOOD (  13.33  )
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

SGkgQWxleGFuZGVyLAoKT24gMjQvMDQvMjAyNiBhdCAxMjo1NjoyNyArMDIsIEFsZXhhbmRlciBE
YWhsIDxhZGFAdGhvcnNpcy5jb20+IHdyb3RlOgoKPiBIZWkgaGVpLAo+Cj4gYWZ0ZXIgZmV3IGhp
bnRzIGluIElSQyB5ZXN0ZXJkYXksIEkgdHJpZWQgdG8gdW5kZXJzdGFuZCB3aHkgbmVpdGhlcgo+
IHRoZSBlYmkgZHJpdmVyIG5vciB0aGUgbmFuZCBkcml2ZXIgYXJlIHByb2JlZCwgYnV0IEkgZmFp
bGVkLiAgU2VlCj4gYmVsb3cuCgpKdXN0IHRvIGJlIGNsZWFyLCBJIHdvdWxkIG5vdCBleHBlY3Qg
dGhlIE5BTkQgZHJpdmVyIHRvIHByb2JlICJhbG9uZSIsCml0IGlzIGRlc2NyaWJlZCBhcyBhIGNo
aWxkIG5vZGUgb2YgdGhlIEVCSSBjb250cm9sbGVyIHdoaWNoIGhhcyBpdHMgb3duCmNvbXBhdGli
bGUuIEFzIGEgcmVzdWx0LCBvbmx5IHRoZSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIGF0IHRoZSBl
bmQgb2YKdGhlIHByb2JlIG9mIHRoZSBFQkkgY2FuIGxlYWQgdG8gdGhlIE5BTkQgY29udHJvbGxl
ciB0byBwcm9iZS4gVGhlIEVCSQpub2RlIGJlaW5nIGEgY2hpbGQgbm9kZSBvZiBhICJzaW1wbGUt
YnVzIiwgdGhpcyBpcyB0aGUgb25lIHdlIHNob3VsZApmb2N1cyBvbiwgYmVjYXVzZSBpdCBzaG91
bGQgYmUgcHJvYmVkLgoKT25lIHJlYXNvbiAodHJ5aW5nIHRvIGJlIGNyZWF0aXZlKSBjb3VsZCB0
aGUgdGhhdCBSb2IncyBwYXRjaCBpcwpkcm9wcGluZyBhbiBleHBsaWNpdCBwb3B1bGF0ZSB0aGF0
IG1heWJlIGtpbmQgb2YgYnlwYXNzZXMgY2hlY2tzIHRoYXQKdGhlICJvZmZpY2lhbCIgcG9wdWxh
dGUgZG9lcy4gU28gbWF5YmUgdGhlcmUgaXMgb25lIHJlc291cmNlIHRoYXQgaXMKbWlzc2luZyBh
bmQgd2hpY2ggaXMgbm90IGlnbm9yZWQgYXMgaXQgdXNlZCB0byBiZSBieSB0aGUgY29yZSBkZXZp
Y2UKZHJpdmVyIChsaWtlbHksIGRkLmMpLgoKQ2FuIHlvdSBlbmFibGUgQ09ORklHX0RFQlVHX0RS
SVZFUiBhbmQgc2VlIGluIHRoZSBsb2dzIGlmIGFueXRoaW5nIHBvcHMKdXA/IE1heWJlIHRyeWlu
ZyB0byB0cmFjZSAobWFudWFsbHkpIGluIHRoZSBjb3JlIHdoeSB3ZSBkbyBub3QgYXR0ZW1wdAp0
byBwcm9iZSB0aGUgRUJJIGNvbnRyb2xsZXIgYnkgbG9va2luZyBmb3IgcG9zc2libGUgY29uZGl0
aW9ucyB0byBiYWlsCm91dCBlYXJseS4gUGluY3RybCBpcyBvbmUgb2YgdGhlbSwgc28gbWF5YmUg
anVzdCByZW1vdmluZyBhbGwgcGluY3RybApyZWZlcmVuY2VzIGluIHRoZSBEVCBtYXkgaGVscCB0
cm91Ymxlc2hvb3RpbmcgdGhpcyAob2J2aW91c2x5IHByb2JlIHdpbGwKZmFpbCBpZiBwaW5jdHJs
IGlzIGluY29ycmVjdCwgYnV0IGlmIGl0IGlzIGF0dGVtcHRlZCB3ZSB3aWxsIGhhdmUgYQpjdWxw
cml0KS4KCkdvb2QgbHVjaywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
