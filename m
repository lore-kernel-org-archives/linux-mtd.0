Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD99EB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWySzw1SL5ypFWe/zKLMXSztltc3lSVkCXYL09w0/Zw=; b=0JbiwvYTv+aBg2
	yNKlqCni53rhF2ZRx4IBtFuMaVWc+zKT3BfFLziyroMTk8M91RPFaXPGKQayzRsvuG+v+YyS2zSoE
	AsqfdWD71EetydwQRTvsFZPflMaKJmbMaAblejHApGQQC1xYv9+ZrWdr78k2Vjen8NH25pCTNR5SF
	pm3HoIKXo8kUyBcnWCeRolhkgpTC6kD0vbL0rlocmR5zj9R7pOb3QYI/qtLE0TJ/WzQWNakExSGZO
	z6y1AUPPKrc4Zz/5MGh1VRcrwQZPhuh2ODxcRt4rwPiKJaXv85SkQps+JetAyxZG7N7ldPFWcUAYf
	uV2escB4VK+ulF5VlPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhqj-00DeAG-11;
	Tue, 04 Jul 2023 15:21:53 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhqf-00De8r-2X
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 15:21:51 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688484104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K38v2/1tVPSmRbW0dpHienxuBMNg/NRz5CODwmaB/Fo=;
	b=MVT3MhpJYHr9CqEyl6hcRGgdI9qBgna0aFj1cKzA5cANC+BnxMMa8aOd5KM3y89AFnvyyz
	lZY/h8bzbCt8rpLZjUxNrwpb/SMIbLl8QsHHtZ+UAL4m45wJTPo/4buqTfd1iqIUc5AB30
	Z/QaZAugdLGhvjPofrboTWpNTQeWSA25NjEnMId3p2IzfbsVRmQc0+KvsMkACclGR/sj7v
	KPNn1+QdUfJx+sHCfEAn/3YzP1AFZx2uZH3oQq8yn27sAa4hHqd5QfIWlZW1FGj7umL5lh
	NqKvQL2yoJzD6hRc5QoRgoTxezfIHDiPn5U3t7ZdYI8RpLo+NmPEe3cMAWFQFw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C854D1BF205;
	Tue,  4 Jul 2023 15:21:42 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:21:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Florian Fainelli
 <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Boris
 Brezillon <bbrezillon@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: rawnand: brcmnand: Fix potential false time
 out warning
Message-ID: <20230704172141.1369c9e8@xps-13>
In-Reply-To: <20230627193738.19596-3-william.zhang@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-3-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_082150_132005_BBA2737A 
X-CRM114-Status: GOOD (  20.89  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjcg
SnVuIDIwMjMgMTI6Mzc6MzUgLTA3MDA6Cgo+IElmIHN5c3RlbSBpcyBidXN5IGR1cmluZyB0aGUg
Y29tbWFuZCBzdGF0dXMgcG9sbGluZyBmdW5jdGlvbiwgdGhlIGRyaXZlcgo+IG1heSBub3QgZ2V0
IHRoZSBjaGFuY2UgdG8gcG9sbCB0aGUgc3RhdHVzIHJlZ2lzdGVyIHRpbGwgdGhlIGVuZCBvZiB0
aW1lCj4gb3V0IGFuZCByZXR1cm4gdGhlIHByZW1hdHVyZSBzdGF0dXMuICBEbyBhIGZpbmFsIGNo
ZWNrIGFmdGVyIHRpbWUgb3V0Cj4gaGFwcGVucyB0byBlbnN1cmUgcmVhZGluZyB0aGUgY29ycmVj
dCBzdGF0dXMuCj4gCj4gRml4ZXM6IDlkMmVlMGE2MGI4YiAoIm10ZDogbmFuZDogYnJjbW5hbmQ6
IENoZWNrIGZsYXNoICNXUCBwaW4gc3RhdHVzIGJlZm9yZSBuYW5kIGVyYXNlL3Byb2dyYW0iKQo+
IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29t
Pgo+IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJyb2Fk
Y29tLmNvbT4KCkNjOiBzdGFibGUgaGVyZSBhbmQgaW4gcGF0Y2ggMSBhcyB3ZWxsLgoKPiAtLS0K
PiAKPiBDaGFuZ2VzIGluIHYzOiBOb25lCj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+IAo+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgOCArKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCj4gaW5kZXggNjk3MDk0MTk1MTZhLi4zN2MyYzdjZmEwMGUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBAQCAtMTA4MCw2ICsx
MDgwLDE0IEBAIHN0YXRpYyBpbnQgYmNtbmFuZF9jdHJsX3BvbGxfc3RhdHVzKHN0cnVjdCBicmNt
bmFuZF9jb250cm9sbGVyICpjdHJsLAo+ICAJCWNwdV9yZWxheCgpOwo+ICAJfSB3aGlsZSAodGlt
ZV9hZnRlcihsaW1pdCwgamlmZmllcykpOwo+ICAKPiArCS8qCj4gKwkgKiBkbyBhIGZpbmFsIGNo
ZWNrIGFmdGVyIHRpbWUgb3V0IGluIGNhc2UgQ1BVIGlzIGJ1c3kgYW5kIGRyaXZlciBkb2VzCj4g
KwkgKiBub3QgZ2V0IHRoZSBlbm91Z2ggdGltZSB0byBwb2xsIHRvIGF2b2lkIGZhbHNlIGFsYXJt
CgpEbyBhIGZpbmFsLi4uIC4uLnRoZSBDUFUgd2FzIGJ1c3kgYW5kIHRoZSBkcml2ZXIgZGlkIG5v
dCBnZXQgZW5vdWdoCnRpbWUgdG8gcGVyZm9ybSB0aGUgcG9sbGluZyB0byBhdm9pZCBmYWxzZSBh
bGFybXMuCgo+ICsJICovCj4gKwl2YWwgPSBicmNtbmFuZF9yZWFkX3JlZyhjdHJsLCBCUkNNTkFO
RF9JTlRGQ19TVEFUVVMpOwo+ICsJaWYgKCh2YWwgJiBtYXNrKSA9PSBleHBlY3RlZF92YWwpCj4g
KwkJcmV0dXJuIDA7Cj4gKwo+ICAJZGV2X3dhcm4oY3RybC0+ZGV2LCAidGltZW91dCBvbiBzdGF0
dXMgcG9sbCAoZXhwZWN0ZWQgJXggZ290ICV4KVxuIiwKPiAgCQkgZXhwZWN0ZWRfdmFsLCB2YWwg
JiBtYXNrKTsKPiAgCgpPdGhlcndpc2UgbG9va3MgZ29vZC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
