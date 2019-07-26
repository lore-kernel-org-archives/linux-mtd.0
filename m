Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA619C7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2FA216C8
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6so894x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB2FA216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kjGGhvkeyBqWQXvOiugWDUBXQVzi7bcCUUaoXFeJEQ=; b=g6so894xLUuvcd
	RaIsiYIq9b8UJhFDv+sFYoiptehotl1FM679IMoXN5qHy/OurTNTifqQCkj0A4MVRtltcqwfxh89N
	9yuEuc74rpxoyOGm4dTj267il+YhEV7bG7lCacJqBXpvBe21rk+BBdQJM17r2wt1P2A6+MJm3E7bU
	T4XqoUDu2wlU/s8KdGKV0O//MZ9MnnIPh6RNuAJYvWVRJu0SzjYxz1lhEmLyEdxHYZf9QZP43/hK7
	T4au+lUilEHjzQR5rocPb5cLxH/Y7hOpPwOwhgVLpKNxgmnxfiTQngMJ4VMUYtn9e+5WBVODZ3+a/
	BCIY1zbutSpWX8RJwnPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqvbJ-0007Rd-A5; Fri, 26 Jul 2019 08:29:17 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqvbD-0007QU-5a
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 08:29:13 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 266D420009;
 Fri, 26 Jul 2019 08:28:59 +0000 (UTC)
Date: Fri, 26 Jul 2019 10:28:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
Message-ID: <20190726102858.3b4019d8@xps13>
In-Reply-To: <20190726074434.21627-1-m.felsch@pengutronix.de>
References: <20190726074434.21627-1-m.felsch@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_012911_361775_2B616AE6 
X-CRM114-Status: GOOD (  20.68  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 boris.brezillon@kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY28sCgorIFJpY2hhcmQKKyBXb3JraW5nIGUtbWFpbCBhZGRyZXNzIGZvciBCb3JpcwoK
TWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5kZT4gd3JvdGUgb24gRnJpLCAyNiBK
dWwgMjAxOQowOTo0NDozNCArMDIwMDoKCj4gU29tZSBkZXZpY2VzIGRvbid0IHN1cHBvcnQgZWNj
ICJvZmZpY2lhbCIuIEJ5ICJvZmZpY2lhbCIgSSBtZWFuIHRoYXQgdGhlCj4gZmVhdHVyZSBjYW4g
YmUgc2V0IHRyb3VnaCB0aGUgIlNFVCBGRUFUVVJFIChFRmgpIiBjb21tYW5kIGJ1dCBpc24ndAo+
IHJlcG9ydGVkIHRvIHRoZSAiUkVBRCBJRCBQYXJhbWV0ZXIgVGFibGVzIi4gQmVjYXVzZSB0aGUg
IkVDQyBGaWVsZCIKPiBzdGlsbCBzYXlzIHRoYXQgaXQgaXMgZGlzYWJsZWQuIFRoaXMgaXMgYXBw
bGljYWJsZSBhdCBsZWFzdAo+IGZvciB0aGUgTVQyOUYyRzA4QUJBR0EgYW5kIE1UMjlGMkcwOEFC
QkdBIGRldmljZXMuIEV2ZW4gd29yc2UgdGhlCj4gZGF0YXNoZWV0IGRlc2NyaWJlcyB0aGUgRUND
IGZlYXR1cmUgaW4gY2hhcHRlciAiRUNDIFByb3RlY3Rpb24iLgo+IAo+IEN1cnJlbnRseSB0aGUg
ZHJpdmVyIGNoZWNrcyB0aGUgIlJFQUQgSUQgUGFyYW1ldGVyIiBmaWVsZCBkaXJlY3RseSBhZnRl
cgo+IHdlIGVuYWJsZWQgdGhlIGZlYXR1cmUuIElmIHRoZSBjaGVjayBmYWlscyB3ZSByZXR1cm4g
aW1tZWRpYXRlbHkgYnV0Cj4gbGVhdmUgdGhlIEVDQyBvbi4gTm93IGFsbCBmdXR1cmUgcmVhZC9w
cm9ncmFtIGN5Y2xlcyBnb2VzIHRyb3VnaCB0aGUgZWNjCj4gYW5kIHRoZSBob3N0IG5mYyBnZXRz
IGNvbmZ1c2VkIGFuZCByZXBvcnRzIEVDQyBlcnJvcnMuCj4gCj4gVG8gYWRkcmVzcyB0aGlzIGlu
IGEgY29tbW9uIHdheSB3ZSBuZWVkIHRvIHR1cm4gb2ZmIHRoZSBFQ0MgZGlyZWN0bHkKPiBhZnRl
ciByZWFkaW5nIHRoZSAiUkVBRCBJRCBQYXJhbWV0ZXIiIGFuZCBiZWZvcmUgY2hlY2tpbmcgdGhl
Cj4gIkVDQyBzdGF0dXMiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmNvIEZlbHNjaCA8bS5mZWxz
Y2hAcGVuZ3V0cm9uaXguZGU+CgpHb29kIGNhdGNoISBIb3dldmVyIHlvdSByZXBvcnQgdGhhdCBv
bi1kaWUgRUNDIGNvcnJlY3Rpb24gaXMgd29ya2luZwpidXQgeW91IHN0aWxsIGRpc2FibGUgaXQ7
IGFueSByZWFzb24gdG8gZG8gc28gPyBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8KYWN0dWFsbHkgZW5h
YmxlIG9uLWRpZSBFQ0MgYW5kIGV4cGxpY2l0bHkgbWFyayB0aGVzZSB0d28gY2hpcHMgYXMKYnVn
Z3kgKHNlZSBbMV0gZm9yIGNoZWNraW5nIHRoZSBjaGlwIElEcyk/CgpbMV0gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy1yYzEvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfbWFjcm9uaXguYyNMODMKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
bWljcm9uLmMgfCAxNCArKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9taWNyb24uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMK
PiBpbmRleCAxNjIyZDMxNDU1ODcuLmZiMTk5YWQyZjFhNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9taWNyb24uYwo+IEBAIC0zOTAsNiArMzkwLDE0IEBAIHN0YXRpYyBpbnQgbWljcm9uX3N1
cHBvcnRzX29uX2RpZV9lY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCSAgICAoY2hpcC0+
aWQuZGF0YVs0XSAmIE1JQ1JPTl9JRF9JTlRFUk5BTF9FQ0NfTUFTSykgIT0gMHgyKQo+ICAJCXJl
dHVybiBNSUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+ICAKPiArCS8qCj4gKwkgKiBJdCBzZWVt
cyB0aGF0IHRoZXJlIGFyZSBkZXZpY2VzIHdoaWNoIGRvIG5vdCBzdXBwb3J0IEVDQyBvZmZpY2lh
bC4KPiArCSAqIEF0IGxlYXN0IHRoZSBNVDI5RjJHMDhBQkFHQSAvIE1UMjlGMkcwOEFCQkdBIGRl
dmljZXMgc3VwcG9ydHMKPiArCSAqIGVuYWJsaW5nIHRoZSBFQ0MgZmVhdHVyZSBidXQgZG9uJ3Qg
cmVmbGVjdCB0aGF0IHRvIHRoZSBSRUFEX0lEIHRhYmxlLgo+ICsJICogU28gd2UgaGF2ZSB0byBn
dWFyYW50ZWUgdGhhdCB3ZSBkaXNhYmxlIHRoZSBFQ0MgZmVhdHVyZSBkaXJlY3RseQo+ICsJICog
YWZ0ZXIgd2UgZGlkIHRoZSBSRUFEX0lEIHRhYmxlIGNvbW1hbmQuIExhdGVyIHdlIGNhbiBldmFs
dWF0ZSB0aGUKPiArCSAqIEVDQ19FTkFCTEUgc3VwcG9ydC4KPiArCSAqLwo+ICAJcmV0ID0gbWlj
cm9uX25hbmRfb25fZGllX2VjY19zZXR1cChjaGlwLCB0cnVlKTsKPiAgCWlmIChyZXQpCj4gIAkJ
cmV0dXJuIE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gQEAgLTM5OCwxMyArNDA2LDEzIEBA
IHN0YXRpYyBpbnQgbWljcm9uX3N1cHBvcnRzX29uX2RpZV9lY2Moc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCkKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7
Cj4gIAo+IC0JaWYgKCEoaWRbNF0gJiBNSUNST05fSURfRUNDX0VOQUJMRUQpKQo+IC0JCXJldHVy
biBNSUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+IC0KPiAgCXJldCA9IG1pY3Jvbl9uYW5kX29u
X2RpZV9lY2Nfc2V0dXAoY2hpcCwgZmFsc2UpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gTUlD
Uk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKPiAgCj4gKwlpZiAoIShpZFs0XSAmIE1JQ1JPTl9JRF9F
Q0NfRU5BQkxFRCkpCj4gKwkJcmV0dXJuIE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gKwo+
ICAJcmV0ID0gbmFuZF9yZWFkaWRfb3AoY2hpcCwgMCwgaWQsIHNpemVvZihpZCkpOwo+ICAJaWYg
KHJldCkKPiAgCQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
