Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD68C7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620E121901
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DwaFF4EZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620E121901
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wBVP8n0MhkjKU6Rsll10BeWG7ZBDW6D02GWTFSRrg4=; b=DwaFF4EZ1+180h
	kT14e86rSfC/YC9jxhCTkeEbanI1R8/2qY80hnNDMxEUDyS0S/Tqx+n9tKx/hhtD0mz5cNcjZ7zcr
	VbZeDX33PiZo962ASCOFoWyCdGt0IACTZyyU5XWQMTSGqesmI0hh1x+FXlK/rEIx25hKxHuQBDwRy
	n+s1sfMDzUvSqEdpr8U9zcMcQkcgTRwKqKfMY6U2Rec+nq5dsu8SjisiKm5cTXdatnp+f3xPr/9Rr
	wt3xXk35Q26cbLk7yb0zybg7P1D5YOxFXaM5I5HsTJfX8VDlzAL/+nzUjyLJ8XlastapkLdBW63CX
	VBIPjMpq+ztKFsA7NsjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqvgr-0001Hj-0X; Fri, 26 Jul 2019 08:35:01 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqvgn-0001Go-3K
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 08:34:59 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 603A160010;
 Fri, 26 Jul 2019 08:34:42 +0000 (UTC)
Date: Fri, 26 Jul 2019 10:34:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
Message-ID: <20190726103441.274876a8@xps13>
In-Reply-To: <20190726102858.3b4019d8@xps13>
References: <20190726074434.21627-1-m.felsch@pengutronix.de>
 <20190726102858.3b4019d8@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_013457_448832_65E224F5 
X-CRM114-Status: GOOD (  21.78  )
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
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CisgQWN0dWFsIGFkZHJlc3MgZm9yIEJvcmlzCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiB3cm90ZSBvbiBGcmksIDI2IEp1bCAyMDE5CjEwOjI4OjU4ICswMjAwOgoK
PiBIaSBNYXJjbywKPiAKPiArIFJpY2hhcmQKPiArIFdvcmtpbmcgZS1tYWlsIGFkZHJlc3MgZm9y
IEJvcmlzCj4gCj4gTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5kZT4gd3JvdGUg
b24gRnJpLCAyNiBKdWwgMjAxOQo+IDA5OjQ0OjM0ICswMjAwOgo+IAo+ID4gU29tZSBkZXZpY2Vz
IGRvbid0IHN1cHBvcnQgZWNjICJvZmZpY2lhbCIuIEJ5ICJvZmZpY2lhbCIgSSBtZWFuIHRoYXQg
dGhlCj4gPiBmZWF0dXJlIGNhbiBiZSBzZXQgdHJvdWdoIHRoZSAiU0VUIEZFQVRVUkUgKEVGaCki
IGNvbW1hbmQgYnV0IGlzbid0Cj4gPiByZXBvcnRlZCB0byB0aGUgIlJFQUQgSUQgUGFyYW1ldGVy
IFRhYmxlcyIuIEJlY2F1c2UgdGhlICJFQ0MgRmllbGQiCj4gPiBzdGlsbCBzYXlzIHRoYXQgaXQg
aXMgZGlzYWJsZWQuIFRoaXMgaXMgYXBwbGljYWJsZSBhdCBsZWFzdAo+ID4gZm9yIHRoZSBNVDI5
RjJHMDhBQkFHQSBhbmQgTVQyOUYyRzA4QUJCR0EgZGV2aWNlcy4gRXZlbiB3b3JzZSB0aGUKPiA+
IGRhdGFzaGVldCBkZXNjcmliZXMgdGhlIEVDQyBmZWF0dXJlIGluIGNoYXB0ZXIgIkVDQyBQcm90
ZWN0aW9uIi4KPiA+IAo+ID4gQ3VycmVudGx5IHRoZSBkcml2ZXIgY2hlY2tzIHRoZSAiUkVBRCBJ
RCBQYXJhbWV0ZXIiIGZpZWxkIGRpcmVjdGx5IGFmdGVyCj4gPiB3ZSBlbmFibGVkIHRoZSBmZWF0
dXJlLiBJZiB0aGUgY2hlY2sgZmFpbHMgd2UgcmV0dXJuIGltbWVkaWF0ZWx5IGJ1dAo+ID4gbGVh
dmUgdGhlIEVDQyBvbi4gTm93IGFsbCBmdXR1cmUgcmVhZC9wcm9ncmFtIGN5Y2xlcyBnb2VzIHRy
b3VnaCB0aGUgZWNjCj4gPiBhbmQgdGhlIGhvc3QgbmZjIGdldHMgY29uZnVzZWQgYW5kIHJlcG9y
dHMgRUNDIGVycm9ycy4KPiA+IAo+ID4gVG8gYWRkcmVzcyB0aGlzIGluIGEgY29tbW9uIHdheSB3
ZSBuZWVkIHRvIHR1cm4gb2ZmIHRoZSBFQ0MgZGlyZWN0bHkKPiA+IGFmdGVyIHJlYWRpbmcgdGhl
ICJSRUFEIElEIFBhcmFtZXRlciIgYW5kIGJlZm9yZSBjaGVja2luZyB0aGUKPiA+ICJFQ0Mgc3Rh
dHVzIi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5n
dXRyb25peC5kZT4KPiAKPiBHb29kIGNhdGNoISBIb3dldmVyIHlvdSByZXBvcnQgdGhhdCBvbi1k
aWUgRUNDIGNvcnJlY3Rpb24gaXMgd29ya2luZwo+IGJ1dCB5b3Ugc3RpbGwgZGlzYWJsZSBpdDsg
YW55IHJlYXNvbiB0byBkbyBzbyA/IFdvdWxkIGl0IGJlIGJldHRlciB0bwo+IGFjdHVhbGx5IGVu
YWJsZSBvbi1kaWUgRUNDIGFuZCBleHBsaWNpdGx5IG1hcmsgdGhlc2UgdHdvIGNoaXBzIGFzCj4g
YnVnZ3kgKHNlZSBbMV0gZm9yIGNoZWNraW5nIHRoZSBjaGlwIElEcyk/Cj4gCj4gWzFdIGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjMtcmMxL3NvdXJjZS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMjTDgzCj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX21pY3Jvbi5jIHwgMTQgKysrKysrKysrKystLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX21pY3Jvbi5jCj4gPiBpbmRleCAxNjIyZDMxNDU1ODcuLmZiMTk5YWQyZjFhNiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMKPiA+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMKPiA+IEBAIC0zOTAsNiArMzkw
LDE0IEBAIHN0YXRpYyBpbnQgbWljcm9uX3N1cHBvcnRzX29uX2RpZV9lY2Moc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCkKPiA+ICAJICAgIChjaGlwLT5pZC5kYXRhWzRdICYgTUlDUk9OX0lEX0lOVEVS
TkFMX0VDQ19NQVNLKSAhPSAweDIpCj4gPiAgCQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBP
UlRFRDsKPiA+ICAKPiA+ICsJLyoKPiA+ICsJICogSXQgc2VlbXMgdGhhdCB0aGVyZSBhcmUgZGV2
aWNlcyB3aGljaCBkbyBub3Qgc3VwcG9ydCBFQ0Mgb2ZmaWNpYWwuCj4gPiArCSAqIEF0IGxlYXN0
IHRoZSBNVDI5RjJHMDhBQkFHQSAvIE1UMjlGMkcwOEFCQkdBIGRldmljZXMgc3VwcG9ydHMKPiA+
ICsJICogZW5hYmxpbmcgdGhlIEVDQyBmZWF0dXJlIGJ1dCBkb24ndCByZWZsZWN0IHRoYXQgdG8g
dGhlIFJFQURfSUQgdGFibGUuCj4gPiArCSAqIFNvIHdlIGhhdmUgdG8gZ3VhcmFudGVlIHRoYXQg
d2UgZGlzYWJsZSB0aGUgRUNDIGZlYXR1cmUgZGlyZWN0bHkKPiA+ICsJICogYWZ0ZXIgd2UgZGlk
IHRoZSBSRUFEX0lEIHRhYmxlIGNvbW1hbmQuIExhdGVyIHdlIGNhbiBldmFsdWF0ZSB0aGUKPiA+
ICsJICogRUNDX0VOQUJMRSBzdXBwb3J0Lgo+ID4gKwkgKi8KPiA+ICAJcmV0ID0gbWljcm9uX25h
bmRfb25fZGllX2VjY19zZXR1cChjaGlwLCB0cnVlKTsKPiA+ICAJaWYgKHJldCkKPiA+ICAJCXJl
dHVybiBNSUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+ID4gQEAgLTM5OCwxMyArNDA2LDEzIEBA
IHN0YXRpYyBpbnQgbWljcm9uX3N1cHBvcnRzX29uX2RpZV9lY2Moc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCkKPiA+ICAJaWYgKHJldCkKPiA+ICAJCXJldHVybiBNSUNST05fT05fRElFX1VOU1VQUE9S
VEVEOwo+ID4gIAo+ID4gLQlpZiAoIShpZFs0XSAmIE1JQ1JPTl9JRF9FQ0NfRU5BQkxFRCkpCj4g
PiAtCQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKPiA+IC0KPiA+ICAJcmV0ID0g
bWljcm9uX25hbmRfb25fZGllX2VjY19zZXR1cChjaGlwLCBmYWxzZSk7Cj4gPiAgCWlmIChyZXQp
Cj4gPiAgCQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKPiA+ICAKPiA+ICsJaWYg
KCEoaWRbNF0gJiBNSUNST05fSURfRUNDX0VOQUJMRUQpKQo+ID4gKwkJcmV0dXJuIE1JQ1JPTl9P
Tl9ESUVfVU5TVVBQT1JURUQ7Cj4gPiArCj4gPiAgCXJldCA9IG5hbmRfcmVhZGlkX29wKGNoaXAs
IDAsIGlkLCBzaXplb2YoaWQpKTsKPiA+ICAJaWYgKHJldCkKPiA+ICAJCXJldHVybiBNSUNST05f
T05fRElFX1VOU1VQUE9SVEVEOwo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
