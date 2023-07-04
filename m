Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E66EB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbP14YE6t5K+twLXj89dkK9kqg4mwBVJeabVlVruXV8=; b=ARnJE2BOePrh7u
	dnLZjRz5DIsBvRaFpFmYQ4JRUP5WCFZUHAkJG9E/x5F3a0rqQiZghckpAvWZGFpE7/5LhYTqa/mJT
	yWPcnKTDUvxD1651rXmdvoIq24bprWBGS/IWR1vm2GQwCSY5PNh2ky2moVt7auK1E9smtepI+ghe3
	cOoqXQhKgjkaxdiT6FJ3gJlFcvJgEBtSeA28HAQmODg4PLktGcMEoTLAundT+NLho3xtrZ5lzbCOe
	2sBIjlnc+lBP8CNDEfUcvVyuYoWlx1tV90Og4jc8+zm/t1VZIgf/td+gW1TWXlgF9Cds9YvWS5lRk
	D8PfYZ254BlZsOwE2ABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhj7-00DcnZ-1k;
	Tue, 04 Jul 2023 15:14:01 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhj4-00Dclk-1v;
	Tue, 04 Jul 2023 15:14:00 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688483632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXGiUI7wXthGZKQ/sxJzjijIY2a26JIxtb9GTkcZ6mU=;
	b=ZrdHbbyuAduccdHY9ijrExqWBbYQXeH5ibGBH4XcqvtTTD0jkSMeeZNAWtOF7pGfMrDpGH
	cEcOmHkDq6cMCEdkGQR/WnTYQR1TjPuj4xaxq/fhcy37oUCj5rBKMdKaLBE3m7GVCAmhco
	7BFVpTltuJSlRYXCt1wsbhwRE7hc5PRybVaqydcLPo9/lMf0+GKOU04HG5lTL1ZMc3aevQ
	pYB7yjhHECcAZaKVB9mHg3TU2TE1IC8VXTwv6cHQZRTMGDOzC+0mXqnr3tZ4xrAjb0Jvqw
	HK8JAu3Fhms9VXRlYSBHoCtaCFV9vSaz+KMU0piBK2EAuREw1EvD0qflPBgYgA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B78866000F;
	Tue,  4 Jul 2023 15:13:49 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:13:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add
 skipbbt option
Message-ID: <20230704171348.5eee98f7@xps-13>
In-Reply-To: <457c1da7-61dc-2a56-4f86-47413795138c@gmail.com>
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
	<457c1da7-61dc-2a56-4f86-47413795138c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_081359_066196_CFCEABD7 
X-CRM114-Status: GOOD (  23.50  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDE1IEp1biAyMDIzIDE5
OjM0OjI2ICswMjAwOgoKPiBPbiBSb2NrY2hpcCBTb0NzIHRoZSBmaXJzdCBib290IHN0YWdlcyBh
cmUgd3JpdHRlbiBvbiBOQU5ECj4gd2l0aCBoZWxwIG9mIG1hbnVmYWN0dXJlciBzb2Z0d2FyZSB0
aGF0IHVzZXMgYSBkaWZmZXJlbnQgZm9ybWF0Cj4gdGhlbiB0aGUgTVREIGZyYW1ld29yay4gU2tp
cCB0aGUgYXV0b21hdGljIEJCVCBzY2FuIHdpdGggdGhlCj4gTkFORF9TS0lQX0JCVFNDQU4gb3B0
aW9uIHNvIHRoYXQgdGhlIG9yaWdpbmFsIGNvbnRlbnQgaXMgdW5jaGFuZ2VkCj4gZHVyaW5nIHRo
ZSBkcml2ZXIgcHJvYmUuCj4gVGhlIE5BTkRfTk9fQkJNX1FVSVJLIG9wdGlvbiBhbGxvd3MgdXMg
dG8gZXJhc2UgYmFkIGJsb2NrcyB3aXRoCj4gdGhlIG5hbmRfZXJhc2VfbmFuZCgpIGZ1bmN0aW9u
IGFuZCB0aGUgZmxhc2hfZXJhc2UgY29tbWFuZC4KPiBXaXRoIHRoZXNlIG9wdGlvbnMgdGhlIHVz
ZXIgaGFzIHRoZSAiZnJlZWRvbSBvZiBjaG9pY2UiIGJ5IG5ldXRyYWwKPiBhY2Nlc3MgbW9kZSB0
byByZWFkIGFuZCB3cml0ZSBpbiB3aGF0ZXZlciBmb3JtYXQgaXMgbmVlZGVkLgoKQ2FuIHRoZSBi
b290X3JvbV9tb2RlIHRoaW5nIGhlbHA/CgpGb3Igd3JpdGluZyB0aGlzIHBhcnQgeW91IGNhbiBk
aXNhYmxlIHRoZSBiYWQgYmxvY2sgcHJvdGVjdGlvbiB1c2luZwpkZWJ1Z2ZzIGFuZCB0aGVuIHdy
aXRlIGFuIGV4dGVybmFsbHkgcHJvY2Vzc2VkIGZpbGUgaW4gcmF3IG1vZGUgSSBndWVzcy4KCkZv
ciB0aGUgYm9vdCBJIHRoaW5rIEkgcHJvcG9zZWQgYSBEVCBwcm9wZXJ0eS4gSSBkb24ndCByZW1l
bWJlciBob3cgZmFyCnRoZSBkaXNjdXNzaW9uIHdlbnQuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpv
aGFuIEpvbmtlciA8amJ4NjI0NEBnbWFpbC5jb20+Cj4gLS0tCj4gCj4gQ2hhbmdlcyBWMzoKPiAg
IENoYW5nZSBwcmVmaXhlcwo+IAo+IENoYW5nZWQgVjI6Cj4gICByZXdvcmQKPiAKPiAtLS0KPiAK
PiBJJ20gYXdhcmUgdGhhdCB0aGUgbWFpbnRhaW5lciBmaW5kcyBpdCAiYXdmdWwiLAo+IGJ1dCBp
dCdzIGFic29sdXRlIG5lY2Vzc2FyeSB0bzoKPiAxOiByZWFkL3dyaXRlIGJvb3QgYmxvY2tzIGlu
IHVzZXIgc3BhY2Ugd2l0aG91dCB0b3VjaGluZyBvcmlnaW5hbCBjb250ZW50Cj4gMjogZm9ybWF0
IGEgTkFORCBmb3IgTVREIGVpdGhlciB3aXRoIGJ1aWx0IGluIG9yIGV4dGVybmFsIGRyaXZlciBt
b2R1bGUKPiAKPiBTbyB3ZSBrZWVwIGl0IGluY2x1ZGUgaW4gdGhpcyBzZXJpZS4KPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMgfCA3ICsrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCj4gaW5kZXggNWEwNDY4MDM0
Li5mY2RhNGM3NjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAt
bmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1u
YW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0xODgsNiArMTg4LDEwIEBAIHN0cnVjdCBya19uZmMgewo+
ICAJdW5zaWduZWQgbG9uZyBhc3NpZ25lZF9jczsKPiAgfTsKPiAKPiArc3RhdGljIGludCBza2lw
YmJ0Owo+ICttb2R1bGVfcGFyYW0oc2tpcGJidCwgaW50LCAwNjQ0KTsKPiArTU9EVUxFX1BBUk1f
REVTQyhza2lwYmJ0LCAiU2tpcCBCQlQgc2NhbiBpZiBkYXRhIG9uIHRoZSBOQU5EIGNoaXAgaXMg
bm90IGluIE1URCBmb3JtYXQuIik7Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBya19uZmNf
bmFuZF9jaGlwICpya19uZmNfdG9fcmtuYW5kKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIHsK
PiAgCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IHJrX25mY19uYW5kX2NoaXAsIGNo
aXApOwo+IEBAIC0xMTUzLDYgKzExNTcsOSBAQCBzdGF0aWMgaW50IHJrX25mY19uYW5kX2NoaXBf
aW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBya19uZmMgKm5mYywKPiAKPiAgCW5hbmRf
c2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwLCBuZmMpOwo+IAo+ICsJaWYgKHNraXBiYnQpCj4gKwkJ
Y2hpcC0+b3B0aW9ucyB8PSBOQU5EX1NLSVBfQkJUU0NBTiB8IE5BTkRfTk9fQkJNX1FVSVJLOwo+
ICsKPiAgCWNoaXAtPm9wdGlvbnMgfD0gTkFORF9VU0VTX0RNQSB8IE5BTkRfTk9fU1VCUEFHRV9X
UklURTsKPiAgCWNoaXAtPmJidF9vcHRpb25zID0gTkFORF9CQlRfVVNFX0ZMQVNIIHwgTkFORF9C
QlRfTk9fT09COwo+IAo+IC0tCj4gMi4zMC4yCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
