Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C5CC7EE37
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNmlqDIua8WFpr4nFOzXL26GbtffsufrrNrFFvS7NOU=; b=JgFtBOMeFq0016
	NTZXoM3aoKtRosQHqqlg4eGc0uQaeWQSzwG0ygni4RveA46+LP/AZbtkcru7Gq6RMxAQ6GwkLgwlC
	9s0hW2eQH7c7lrLquZ29bdd9Aesw6jHYgmHeK3LuRQlqv529HDQC2D2ylLwzHiAPCJ2CdOHn31ZWm
	CcUv2U/5jhgF4ms9Q30aY9ZeodG5ddeRr1MSKd5mI6TAx1gjP6qSJneiKttx3YOFO0TbrSXcjp30W
	DRc2xziO183+oUgCm/Kt9vZrbVIW7c5VfCCLSAT2TTfPCDCeCn+3grSaJbiNlY4xhyKD9axD2yd0H
	MIVwWUzFV9TQPeTU/WTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xjg-00CH6R-0E;
	Fri, 09 Jun 2023 08:44:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xjb-00CH4u-39;
	Fri, 09 Jun 2023 08:44:41 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686300272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUFfRtsLHvopatEGwTEyaADeR/Nh06kib+daVSfwfes=;
	b=MeanmY/uWXzjatJigRXE4FAin676dndJHzveYMdReO3ydYBO5ek4HsbrEv/grxjUX6eCGo
	ob0nFC/lSrTRVOrc2eQzR3E24rdfQuCicXQGFfx7nq88seI2scNhlQMhcdPzyLdVXAw4F3
	g5Oxh827fnN2BCDCijwfAuTXdo8XEFM4HWyioqPKd6aEZZnovGGC+Clkftkkj39Xfcvafy
	NchUPN7S9PgM90RB3BVy4k+pwx4OO1w1fp83WcnuBmE9LU+yQ4LGtuvUBFrMtKGKC1SWur
	lduwC5U9Kc97G/hDa9lF70uL/upMt87GZ8y5TvWDtSu58QzAfTc4lKuLNaDE/w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E11C240002;
	Fri,  9 Jun 2023 08:44:29 +0000 (UTC)
Date: Fri, 9 Jun 2023 10:44:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v1 2/5] mtd: nand: raw: rockchip-nand-controller: add
 skipbbt option
Message-ID: <20230609104426.3901df54@xps-13>
In-Reply-To: <4d9473ce-c167-47d7-e37a-7b39915a724c@gmail.com>
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
	<4d9473ce-c167-47d7-e37a-7b39915a724c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_014440_314714_064F205B 
X-CRM114-Status: GOOD (  18.82  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDggSnVuIDIwMjMgMTg6
MzA6MjcgKzAyMDA6Cgo+IE9uIFJvY2tjaGlwIFNvQ3MgdGhlIGZpcnN0IGJvb3Qgc3RhZ2VzIGFy
ZSB3cml0dGVuIG9uIE5BTkQKPiB3aXRoIGhlbHAgb2YgbWFudWZhY3R1cmVyIHNvZnR3YXJlIHRo
YXQgdXNlcyBhIGRpZmZlcmVudCBmb3JtYXQKPiB0aGVuIHRoZSBNVEQgZnJhbWV3b3JrLiBTa2lw
IHRoZSBhdXRvbWF0aWMgQkJUIHNjYW4gd2l0aCB0aGUKPiBOQU5EX1NLSVBfQkJUU0NBTiBvcHRp
b24gc28gd2UgY2FuIHJ1biBpdCBtYW51YWxseS4KCkhvdyBkbyB5b3UgcnVuIGl0IG1hbnVhbGx5
PwoKPiBUaGUgTkFORF9OT19CQk1fUVVJUksgb3B0aW9uIGFsbG93cyB1cyB0byBlcmFzZSBiYWQg
YmxvY2tzIHdpdGgKPiB0aGUgbmFuZF9lcmFzZV9uYW5kKCkgZnVuY3Rpb24gYW5kIHRoZSBmbGFz
aF9lcmFzZSBjb21tYW5kLgoKRm9yIGVyYXN1cmUgeW91IG5vdyBoYXZlIGFjY2VzcyB0byBhIGRl
YnVnZnMgZW50cnkgZm9yCmV4cGVydHMvZm9yZW5zaWNzIHdoaWNoIGFsbG93cyB5b3UgdG8gYnlw
YXNzIGFsbCBiYWQgYmxvY2sgY2hlY2tzLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBKb25r
ZXIgPGpieDYyNDRAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2Nr
Y2hpcC1uYW5kLWNvbnRyb2xsZXIuYyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2Nr
Y2hpcC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5h
bmQtY29udHJvbGxlci5jCj4gaW5kZXggY2FmY2NjMzI0Li5mNTY0MzBmNmMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0x
ODgsNiArMTg4LDEwIEBAIHN0cnVjdCBya19uZmMgewo+ICAJdW5zaWduZWQgbG9uZyBhc3NpZ25l
ZF9jczsKPiAgfTsKPiAKPiArc3RhdGljIGludCBza2lwYmJ0Owo+ICttb2R1bGVfcGFyYW0oc2tp
cGJidCwgaW50LCAwNjQ0KTsKPiArTU9EVUxFX1BBUk1fREVTQyhza2lwYmJ0LCAiU2tpcCBCQlQg
c2NhbiBpZiB0aGUgTkFORCBjaGlwIGNvbnRhaW5zIGRhdGEgbm90IGluIE1URCBmb3JtYXQuIik7
CgpJIGhpZ2hseSBkaXNsaWtlIHRoaXMuCgpJdCdzIG5vdCBhIG1vZHVsZSBwYXJhbWV0ZXIgdGhh
dCB5b3UgbmVlZCwgaXQgaXMgcmVsYXRlZCB0byBhIHBhcnRpdGlvbi4KCj4gKwo+ICBzdGF0aWMg
aW5saW5lIHN0cnVjdCBya19uZmNfbmFuZF9jaGlwICpya19uZmNfdG9fcmtuYW5kKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXApCj4gIHsKPiAgCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0
IHJrX25mY19uYW5kX2NoaXAsIGNoaXApOwo+IEBAIC0xMTU2LDYgKzExNjAsMTAgQEAgc3RhdGlj
IGludCBya19uZmNfbmFuZF9jaGlwX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgcmtf
bmZjICpuZmMsCj4gCj4gIAluYW5kX3NldF9jb250cm9sbGVyX2RhdGEoY2hpcCwgbmZjKTsKPiAK
PiArCS8qIFNraXAgdGhlIGF1dG9tYXRpYyBCQlQgc2NhbiBzbyB3ZSBjYW4gcnVuIGl0IG1hbnVh
bGx5LiAqLwo+ICsJaWYgKHNraXBiYnQpCj4gKwkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX1NLSVBf
QkJUU0NBTiB8IE5BTkRfTk9fQkJNX1FVSVJLOwo+ICsKPiAgCWNoaXAtPm9wdGlvbnMgfD0gTkFO
RF9VU0VTX0RNQSB8IE5BTkRfTk9fU1VCUEFHRV9XUklURTsKPiAgCWNoaXAtPmJidF9vcHRpb25z
ID0gTkFORF9CQlRfVVNFX0ZMQVNIIHwgTkFORF9CQlRfTk9fT09COwo+IAo+IC0tCj4gMi4zMC4y
Cj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
