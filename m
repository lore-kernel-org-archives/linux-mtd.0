Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A023FF8867
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwNNyhredSQpXj/eBExvI4YbeV4rJ0DmYQR7TGqdj8c=; b=P5AVLB6BKMV1uV
	gYpp32I6eBxKsbh3RSVMfb9UNAy3sEuOCcYYK4J98yj20E5CmqS1UTqL2MPsk6gS4NBCPSecT7/f8
	Hkoz1yV4JAqb7yS2d8lPTUN4nJxN4YsqzP8cPXJFdATlOTmhfU4mq4I3orULP2c2x3PZvT6v3ee/h
	/rdhAvibY6LZkY/TYcIUIZEM9Ji1ynhY8PCIB7M9DSjimbHorLQJax9eod7hRWJ8g656ej3ZGOLz1
	H9fvNgP3HTLqDnA+EzoLkIWJVgCoIcvCjcIptl+eSiXwX1mfSQrPYUUaKFJX2vBX41SIbNY0xg47w
	r3qqfbwAcqdKltjL0grA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1R7-00000003MMI-2V8q;
	Wed, 29 Apr 2026 09:42:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1R3-00000003MKm-2yE8
	for linux-mtd@lists.infradead.org;
	Wed, 29 Apr 2026 09:42:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A596AC5CD59;
	Wed, 29 Apr 2026 09:43:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 673E4601DF;
	Wed, 29 Apr 2026 09:42:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9764510729AB0;
	Wed, 29 Apr 2026 11:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777455741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v/NHAdqcAIjrljj0o3r/rYGwX1SP5NW5sDQNpjnh8ik=;
	b=itAreS11Ry6MEWWqWOYHc1aSTrU6m9Qq4JBLgvZon8eOjxMlu5Y39z8tvF69EPy1LzeRZi
	aCyGs6XkIMz5o8jwV4WM5v1y/2Jb/HfWZtPSKZnsMqb1oW8EdL4LENANSiQbn9XqA3KRNE
	tO9szqPFMjgNu2MEvYDzg2fFdimpsdwyOxJopylgjaPfOvkSBGJGFfT7Uy3lWOq5JPhc+7
	Y1JuOjJl3A/KzjoiR6CaxeIHTThQBtm8T8XlTr8cLzCDcQdgcvEgtUapVBJhYUBBRCc1fp
	ktlO2a1Qm+MUzEUTJAjMQNcMOhfRI9/o/vKslhFOBmZyPq9fcTPyIM/GBzx25A==
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
In-Reply-To: <20260429-lushly-greasily-c14c01c1aee8@thorsis.com> (Alexander
	Dahl's message of "Wed, 29 Apr 2026 10:02:28 +0200")
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
	<20260105-at91-probe-v3-3-594013ff2965@kernel.org>
	<20260423-stoke-ocean-139dbe306256@thorsis.com>
	<20260424-worried-renewal-924d34ed945c@thorsis.com>
	<87tsswfnmy.fsf@bootlin.com>
	<20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 29 Apr 2026 11:42:19 +0200
Message-ID: <87lde6cdc4.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024225_890725_9F1C4EF2 
X-CRM114-Status: UNSURE (   8.75  )
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

SGkgQWxleGFuZGVyLAoKPiAgICAgWyAgICAwLjk1ODI5OF0gYnVzOiAncGxhdGZvcm0nOiBhZGQg
ZHJpdmVyIGF0bWVsLWViaQo+ICAgICBbICAgIDAuOTU4NDUxXSBwbGF0Zm9ybSAxMDAwMDAwMC5l
Ymk6IGJ1czogJ3BsYXRmb3JtJzogX19kcml2ZXJfcHJvYmVfZGV2aWNlOiBtYXRjaGVkIGRldmlj
ZSB3aXRoIGRyaXZlciBhdG1lbC1lYmkKPiAgICAgWyAgICAwLjk1ODU2Nl0gcGxhdGZvcm0gMTAw
MDAwMDAuZWJpOiBlcnJvciAtRVBST0JFX0RFRkVSOiB3YWl0IGZvciBzdXBwbGllciAvYWhiL2Fw
Yi9waW5jdHJsQGZmZmZmNDAwL2ViaS9lYmktZGF0YS1sc2IKPiAgICAgWyAgICAwLjk1ODY0OV0g
cGxhdGZvcm0gMTAwMDAwMDAuZWJpOiBBZGRlZCB0byBkZWZlcnJlZCBsaXN0Cj4gICAgIFsgICAg
MC45NTk0MjldIGJ1czogJ3BsYXRmb3JtJzogcmVtb3ZlIGRyaXZlciBhdG1lbC1lYmkKPiAgICAg
WyAgICAwLjk1OTU0MF0gZHJpdmVyOiAnYXRtZWwtZWJpJzogZHJpdmVyX3JlbGVhc2UKCkludGVy
ZXN0aW5nLgoKSWYgeW91IGxvb2sgYXQgdGhlIHZlcnkgbGFzdCBsaW5lIG9mIHRoZSBkcml2ZXIs
IHRoZSBFQkkgZHJpdmVyIGRvZXMgbm90CnVzZSBhIHN0YW5kYXJkICJtb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyIiBtYWNybywgaXQgdXNlcyBzb21lIGtpbmQgb2YKcnVuLW9uY2UgcHJvYmUgdGhhdCBp
cyBrZXB0IGluIGFuIF9faW5pdCBzZWN0aW9uOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ny4wLjEvc291cmNlL2RyaXZlcnMvbWVtb3J5L2F0bWVsLWViaS5jI0w2MzcKCkFuZCB0
aGlzIHNlZW1zIHRvIGJlIGluY29tcGF0aWJsZSB3aXRoIHByb2JlIGRlZmVycmFsczoKaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMC4xL3NvdXJjZS9kcml2ZXJzL2Jhc2UvcGxh
dGZvcm0uYyNMOTQ4CgpJIHdvdWxkIHN1Z2dlc3QgdHJ5aW5nIHNvbWV0aGluZyBhbG9uZSB0aGVz
ZSBsaW5lczoKCi0tLSBhL2RyaXZlcnMvbWVtb3J5L2F0bWVsLWViaS5jCisrKyBiL2RyaXZlcnMv
bWVtb3J5L2F0bWVsLWViaS5jCkBAIC02MzMsNSArNjMzLDYgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgYXRtZWxfZWJpX2RyaXZlciA9IHsKICAgICAgICAgICAgICAgIC5vZl9tYXRj
aF90YWJsZSA9IGF0bWVsX2ViaV9pZF90YWJsZSwKICAgICAgICAgICAgICAgIC5wbSA9ICZhdG1l
bF9lYmlfcG1fb3BzLAogICAgICAgIH0sCisgICAgICAgLnByb2JlID0gYXRtZWxfZWJpX3Byb2Jl
LAogfTsKLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKGF0bWVsX2ViaV9kcml2ZXIsIGF0
bWVsX2ViaV9wcm9iZSk7CitidWlsdGluX3BsYXRmb3JtX2RyaXZlcihhdG1lbF9lYmlfZHJpdmVy
KTsKCk1lbW9yeSB0YWtlbiBieSB0aGUgcHJvYmUgZnVuY3Rpb24gd2lsbCByZW1haW4gbWFwcGVk
LiBUaGF0IHNlZW1zIHRvIGJlCnRoZSBkcmF3YmFjay4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
