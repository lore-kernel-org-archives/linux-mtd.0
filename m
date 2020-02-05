Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B053C33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FA52085B
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OIt1Jl8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FA52085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80Io/3HzwmoTwRICBraF7vw1yigCOwZtWyTbJzRjf7A=; b=OIt1Jl8s41As8/
	MB3MPcP8uzMySjYUEV25mMGbRhOw7IXBlEMHMAaEANviHY+yeCjTojSXfy/xsgscmRKxCu8LSzfNU
	UBjsl0moyNPQhF0iFjGEBqBAOSbOBmSHfRpXlFn2ZFkgspYYw3lPT+uoinQNYJAm87gq9RLgz5QPm
	Nt3q4LROXpV8eBa+Kyn5xYWR18QZaAtPryvqGuVIreg/yfvlY2fxkkreRPjOwAkgPPf7xZGfXoW0H
	wNVczAVxU0XJv4wnieAzEimivqbXIdmSNKmnpcazPWaep2sRb8fEBPfEe/IVzKJhncjgvjV5p0A7x
	OyO7QZpVXGNU1lrhR0kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izHOH-0003ua-IK; Wed, 05 Feb 2020 09:54:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izHOE-0003tj-BJ
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 09:54:36 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C24A8FF80F;
 Wed,  5 Feb 2020 09:54:22 +0000 (UTC)
Date: Wed, 5 Feb 2020 10:54:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH v3 4/5] mtd: spinand: micron: Add M70A series Micron SPI
 NAND devices
Message-ID: <20200205105422.57b5f6c4@xps13>
In-Reply-To: <20200202215508.2928-5-sshivamurthy@micron.com>
References: <20200202215508.2928-1-sshivamurthy@micron.com>
 <20200202215508.2928-5-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_015434_672413_953DE820 
X-CRM114-Status: GOOD (  20.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgc2hpdmEubGludXh3b3Jrc0BnbWFpbC5jb20sCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNv
bSB3cm90ZSBvbiBTdW4sICAyIEZlYiAyMDIwIDIyOjU1OjA3ICswMTAwOgoKPiBGcm9tOiBTaGl2
YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKPiBBZGQgZGV2aWNl
IHRhYmxlIGZvciBNNzBBIHNlcmllcyBNaWNyb24gU1BJIE5BTkQgZGV2aWNlcy4KPiAKPiBBcyBv
cHBvc2VkIHRvIHRoZSBNNzlBIGFuZCBNNzhBIHNlcmllcyBhbHJlYWR5IHN1cHBvcnRlZCwgTTcw
QSBwYXJ0cwo+IGhhdmUgdGhlICJDb250aW51b3VzIFJlYWQiIGZlYXR1cmUgZW5hYmxlZCBieSBk
ZWZhdWx0LCB3aGljaCBkb2VzIG5vdCBmaXQKPiB0aGUgc3Vic3lzdGVtIG5lZWRzLgo+IAo+IElu
IHRoaXMgbW9kZSwgdGhlIFJFQUQgQ0FDSEUgY29tbWFuZCBkb2Vzbid0IHJlcXVpcmUgdGhlIHN0
YXJ0aW5nIGNvbHVtbgo+IGFkZHJlc3MuIFRoZSBkZXZpY2UgYWx3YXlzIG91dHB1dCB0aGUgZGF0
YSBzdGFydGluZyBmcm9tIHRoZSBmaXJzdAo+IGNvbHVtbiBvZiB0aGUgY2FjaGUgcmVnaXN0ZXIs
IGFuZCBvbmNlIHRoZSBlbmQgb2YgdGhlIGNhY2hlIHJlZ2lzdGVyCj4gcmVhY2hlZCwgdGhlIGRh
dGEgb3V0cHV0IGNvbnRpbnVlcyB0aHJvdWdoIHRoZSBuZXh0IHBhZ2UuIFdpdGggdGhlCj4gY29u
dGludW91cyByZWFkIG1vZGUsIGl0IGlzIHBvc3NpYmxlIHRvIHJlYWQgb3V0IHRoZSBlbnRpcmUg
YmxvY2sgdXNpbmcKPiBhIHNpbmdsZSBSRUFEIGNvbW1hbmQsIGFuZCBvbmNlIHRoZSBlbmQgb2Yg
dGhlIGJsb2NrIHJlYWNoZWQsIHRoZSBvdXRwdXQKPiBwaW5zIGJlY29tZSBIaWdoLVogc3RhdGUu
IEhvd2V2ZXIsIGR1cmluZyB0aGlzIG1vZGUgdGhlIHJlYWQgY29tbWFuZAo+IGRvZXNuJ3Qgb3V0
cHV0IHRoZSBPT0IgYXJlYS4KPiAKPiBIZW5jZSwgd2UgZGlzYWJsZSB0aGUgZmVhdHVyZSBhdCBw
cm9iZSB0aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2
YW11cnRoeUBtaWNyb24uY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24u
YyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL21pY3Jvbi5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiBpbmRleCA1ZmQx
ZjkyMWVmMTIuLjNkMzczNGFmYzM1ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9taWNyb24uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gQEAgLTE4
LDYgKzE4LDggQEAKPiAgI2RlZmluZSBNSUNST05fU1RBVFVTX0VDQ180VE82X0JJVEZMSVBTCSgz
IDw8IDQpCj4gICNkZWZpbmUgTUlDUk9OX1NUQVRVU19FQ0NfN1RPOF9CSVRGTElQUwkoNSA8PCA0
KQo+ICAKPiArI2RlZmluZSBNSUNST05fQ0ZHX0NPTlRJX1JFQUQJCUJJVCgwKQo+ICsKPiAgc3Rh
dGljIFNQSU5BTkRfT1BfVkFSSUFOVFMocmVhZF9jYWNoZV92YXJpYW50cywKPiAgCQlTUElOQU5E
X1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1FVQURJT19PUCgwLCAyLCBOVUxMLCAwKSwKPiAgCQlTUElO
QU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1g0X09QKDAsIDEsIE5VTEwsIDApLAo+IEBAIC0xMzEs
NiArMTMzLDI2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1pY3Jvbl9zcGlu
YW5kX3RhYmxlW10gPSB7Cj4gIAkJICAgICAwLAo+ICAJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZt
aWNyb25fOF9vb2JsYXlvdXQsCj4gIAkJCQkgICAgIG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKSks
Cj4gKwkvKiBNNzBBIDRHYiAzLjNWICovCj4gKwlTUElOQU5EX0lORk8oIk1UMjlGNEcwMUFCQUZE
IiwgMHgzNCwKPiArCQkgICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYsIDI1NiwgNjQsIDIwNDgsIDQw
LCAxLCAxLCAxKSwKPiArCQkgICAgIE5BTkRfRUNDUkVRKDgsIDUxMiksCj4gKwkJICAgICBTUElO
QU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAg
JndyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICsJCQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFu
dHMpLAo+ICsJCSAgICAgU1BJTkFORF9IQVNfQ1JfRkVBVF9CSVQsCj4gKwkJICAgICBTUElOQU5E
X0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiArCQkJCSAgICAgbWljcm9uXzhfZWNjX2dl
dF9zdGF0dXMpKSwKPiArCS8qIE03MEEgNEdiIDEuOFYgKi8KPiArCVNQSU5BTkRfSU5GTygiTVQy
OUY0RzAxQUJCRkQiLCAweDM1LAo+ICsJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2
NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAo+ICsJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKPiAr
CQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiAr
CQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAgJnVwZGF0ZV9j
YWNoZV92YXJpYW50cyksCj4gKwkJICAgICBTUElOQU5EX0hBU19DUl9GRUFUX0JJVCwKPiArCQkg
ICAgIFNQSU5BTkRfRUNDSU5GTygmbWljcm9uXzhfb29ibGF5b3V0LAo+ICsJCQkJICAgICBtaWNy
b25fOF9lY2NfZ2V0X3N0YXR1cykpLAo+ICB9Owo+ICAKPiAgc3RhdGljIGludCBtaWNyb25fc3Bp
bmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+IEBAIC0xNTMsOCAr
MTc1LDIyIEBAIHN0YXRpYyBpbnQgbWljcm9uX3NwaW5hbmRfZGV0ZWN0KHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCkKPiAgCXJldHVybiAxOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IG1p
Y3Jvbl9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICt7Cj4g
KwkvKgo+ICsJICogTTcwQSBkZXZpY2Ugc2VyaWVzIGVuYWJsZSBDb250aW51b3VzIFJlYWQgZmVh
dHVyZSBhdCBQb3dlci11cCwKPiArCSAqIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQuIERpc2FibGUg
dGhpcyBiaXQgdG8gYXZvaWQgYW55IHBvc3NpYmxlCj4gKwkgKiBmYWlsdXJlLgo+ICsJICovCj4g
KwlpZiAoc3BpbmFuZC0+ZmxhZ3MgPT0gU1BJTkFORF9IQVNfQ1JfRkVBVF9CSVQpCj4gKwkJcmV0
dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBNSUNST05fQ0ZHX0NPTlRJX1JFQUQsIDApOwo+
ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRf
bWFudWZhY3R1cmVyX29wcyBtaWNyb25fc3BpbmFuZF9tYW51Zl9vcHMgPSB7Cj4gIAkuZGV0ZWN0
ID0gbWljcm9uX3NwaW5hbmRfZGV0ZWN0LAo+ICsJLmluaXQgPSBtaWNyb25fc3BpbmFuZF9pbml0
LAo+ICB9OwoKSSB3b3VsZCBtb3ZlIHRoZSBhZGRpdGlvbiBvZiAuaW5pdCA9IC4uLiBhbmQgdGhl
IGZ1bmN0aW9uIGRlZmluaXRpb24gdG8KcGF0Y2ggMy81LgoKVGhlIGxvZ2ljIGlzOgoxLyBZb3Ug
aW50cm9kdWNlIHRoZSBmZWF0dXJlCjIvIFlvdSBhZGQgc3VwcG9ydCBmb3IgbmV3IGRldmljZXMg
YW5kIHVzZSB0aGlzIGZlYXR1cmUKCj4gIAo+ICBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFj
dHVyZXIgbWljcm9uX3NwaW5hbmRfbWFudWZhY3R1cmVyID0gewoKT3RoZXJ3aXNlIGxvb2tzIGdv
b2QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
