Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776E9C7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B17A22C7E
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ov6ss5SH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B17A22C7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+rQeJ2Dt+/1m9+QmPsVLLabCBzNSHJEftWYUwY6sFA=; b=Ov6ss5SHaWjw76
	71yg9sbNO6+JqZ1kcvvFyhZ36GlIxMj+dil6L7PKB5AOErmgWfvAREUEXbPcKqLaeXy3y+ADc5VqD
	ZhFynNGDKRnIh1teT3BqwGFDM9RhN2VFECnC+bOSxJbmggivqeHysYnkMVZEZ8/B8pJ7FIGKagJGT
	mc0vrUn1pyeFbF0D/GjtQBWfMrTpRB49T5uyakheEHo1svF+3LeWnbEUtPitizZXzH1YkSb3Vnk4L
	XmoQwAhwG5gOP6//GdH6BiVBpuhsR96ZFoMyMYP5MzolGxngccckbnQ3c1aSNPhOWNsb/5qrw1Sio
	TRYAAaTuFHP24lnIXzMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqvzZ-0001Gk-94; Fri, 26 Jul 2019 08:54:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqvzU-0001BZ-6q
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 08:54:18 +0000
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hqvzP-0005sg-S8; Fri, 26 Jul 2019 10:54:11 +0200
Message-ID: <1564131251.2311.42.camel@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
From: Lucas Stach <l.stach@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Marco Felsch
 <m.felsch@pengutronix.de>
Date: Fri, 26 Jul 2019 10:54:11 +0200
In-Reply-To: <20190726102858.3b4019d8@xps13>
References: <20190726074434.21627-1-m.felsch@pengutronix.de>
 <20190726102858.3b4019d8@xps13>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_015416_347816_A2BFA039 
X-CRM114-Status: GOOD (  25.91  )
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

SGkgTWlndWVsLAoKQW0gRnJlaXRhZywgZGVuIDI2LjA3LjIwMTksIDEwOjI4ICswMjAwIHNjaHJp
ZWIgTWlxdWVsIFJheW5hbDoKPiBIaSBNYXJjbywKPiAKPiArIFJpY2hhcmQKPiArIFdvcmtpbmcg
ZS1tYWlsIGFkZHJlc3MgZm9yIEJvcmlzCj4gCj4gPiBNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBl
bmd1dHJvbml4LmRlPiB3cm90ZSBvbiBGcmksIDI2IEp1bCAyMDE5Cj4gMDk6NDQ6MzQgKzAyMDA6
Cj4gCj4gPiBTb21lIGRldmljZXMgZG9uJ3Qgc3VwcG9ydCBlY2MgIm9mZmljaWFsIi4gQnkgIm9m
ZmljaWFsIiBJIG1lYW4gdGhhdCB0aGUKPiA+IGZlYXR1cmUgY2FuIGJlIHNldCB0cm91Z2ggdGhl
ICJTRVQgRkVBVFVSRSAoRUZoKSIgY29tbWFuZCBidXQgaXNuJ3QKPiA+IHJlcG9ydGVkIHRvIHRo
ZSAiUkVBRCBJRCBQYXJhbWV0ZXIgVGFibGVzIi4gQmVjYXVzZSB0aGUgIkVDQyBGaWVsZCIKPiA+
IHN0aWxsIHNheXMgdGhhdCBpdCBpcyBkaXNhYmxlZC4gVGhpcyBpcyBhcHBsaWNhYmxlIGF0IGxl
YXN0Cj4gPiBmb3IgdGhlIE1UMjlGMkcwOEFCQUdBIGFuZCBNVDI5RjJHMDhBQkJHQSBkZXZpY2Vz
LiBFdmVuIHdvcnNlIHRoZQo+ID4gZGF0YXNoZWV0IGRlc2NyaWJlcyB0aGUgRUNDIGZlYXR1cmUg
aW4gY2hhcHRlciAiRUNDIFByb3RlY3Rpb24iLgo+ID4gCj4gPiBDdXJyZW50bHkgdGhlIGRyaXZl
ciBjaGVja3MgdGhlICJSRUFEIElEIFBhcmFtZXRlciIgZmllbGQgZGlyZWN0bHkgYWZ0ZXIKPiA+
IHdlIGVuYWJsZWQgdGhlIGZlYXR1cmUuIElmIHRoZSBjaGVjayBmYWlscyB3ZSByZXR1cm4gaW1t
ZWRpYXRlbHkgYnV0Cj4gPiBsZWF2ZSB0aGUgRUNDIG9uLiBOb3cgYWxsIGZ1dHVyZSByZWFkL3By
b2dyYW0gY3ljbGVzIGdvZXMgdHJvdWdoIHRoZSBlY2MKPiA+IGFuZCB0aGUgaG9zdCBuZmMgZ2V0
cyBjb25mdXNlZCBhbmQgcmVwb3J0cyBFQ0MgZXJyb3JzLgo+ID4gCj4gPiBUbyBhZGRyZXNzIHRo
aXMgaW4gYSBjb21tb24gd2F5IHdlIG5lZWQgdG8gdHVybiBvZmYgdGhlIEVDQyBkaXJlY3RseQo+
ID4gYWZ0ZXIgcmVhZGluZyB0aGUgIlJFQUQgSUQgUGFyYW1ldGVyIiBhbmQgYmVmb3JlIGNoZWNr
aW5nIHRoZQo+ID4gIkVDQyBzdGF0dXMiLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjbyBG
ZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPgo+IAo+IEdvb2QgY2F0Y2ghIEhvd2V2ZXIg
eW91IHJlcG9ydCB0aGF0IG9uLWRpZSBFQ0MgY29ycmVjdGlvbiBpcyB3b3JraW5nCj4gYnV0IHlv
dSBzdGlsbCBkaXNhYmxlIGl0OyBhbnkgcmVhc29uIHRvIGRvIHNvID8gV291bGQgaXQgYmUgYmV0
dGVyIHRvCj4gYWN0dWFsbHkgZW5hYmxlIG9uLWRpZSBFQ0MgYW5kIGV4cGxpY2l0bHkgbWFyayB0
aGVzZSB0d28gY2hpcHMgYXMKPiBidWdneSAoc2VlIFsxXSBmb3IgY2hlY2tpbmcgdGhlIGNoaXAg
SURzKT8KCkl0J3MgdGhlIG90aGVyIHdheSBhcm91bmQuIFRoZSBjaGlwIGlzIG5vdCBzdXBwb3Nl
ZCB0byBoYXZlIG9uLWRpZSBFQ0MKYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgYW5kIGNvcnJl
Y3RseSByZWZsZWN0cyB0aGlzIGZhY3QgaW4gdGhlClJFQURfSUQsIHNvIExpbnV4IHNob3VsZCBu
b3QgdHJ5IHRvIHVzZSB0aGUgb24tZGllIEVDQy4KClRoZSBidWcgaXMgdGhhdCB0aGUgTkFORCBp
cyBub3Qgc3VwcG9zZWQgdG8gaGF2ZSBvbi1kaWUgRUNDIGFuZCByZXBvcnRzCnRoaXMgY29ycmVj
dGx5LCBidXQgdGhlbiBhY3R1YWxseSBlbmFibGVzIGEgb24tZGllIEVDQyB1bml0IHdoZW4gYXNr
ZWQKdG8sIHByb2JhYmx5IGR1ZSB0byB0aGUgc2FtZSBkaWUgYmVpbmcgdXNlZCBmb3Igb24tZGll
IEVDQyBhbmQgRUNDIG9mZgpkZXZpY2VzLiBUaGUgY29uc2VxdWVuY2UgaXMgdGhhdCBMaW51eCAo
Y29ycmVjdGx5KSBhc3N1bWVzIHRoYXQgdGhlCmZ1bGwgT09CIHNpemUgaXMgYXZhaWxhYmxlIHRv
IHRoZSBjb250cm9sbGVyLCBidXQgdGhlIG9uLWRpZSBFQ0MgdW5pdApzY3JpYmJsZXMgb3ZlciBz
b21lIG9mIHRoZSBPT0IgZGF0YS4KCkkgdGhpbmsgdGhpcyBmaXggdGhlIG1vc3Qgcm9idXN0IHNv
bHV0aW9uLCBhcyBpdCBtYWtlcyBzdXJlIHRvIGRpc2FibGUKdGhlIG9uLWRpZSBFQ0MgdW5pdCB0
byBhdm9pZCB0aGUgaXNzdWUsIHdoaWNoIG1pZ2h0IGFsc28gYmUgcHJlc2VudCBvbgpvdGhlciBO
QU5EIGNoaXBzIHdlIGRvbid0IGtub3cgYWJvdXQgeWV0LgoKUmVnYXJkcywKTHVjYXMgCgo+IFsx
XSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4zLXJjMS9zb3VyY2UvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jI0w4Mwo+IAo+ID4gLS0tCj4gPiDCoGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMgfCAxNCArKysrKysrKysrKy0tLQo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jCj4gPiBpbmRleCAxNjIyZDMxNDU1ODcuLmZiMTk5
YWQyZjFhNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9u
LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMKPiA+IEBAIC0z
OTAsNiArMzkwLDE0IEBAIHN0YXRpYyBpbnQgbWljcm9uX3N1cHBvcnRzX29uX2RpZV9lY2Moc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gPiDCoAnCoMKgwqDCoChjaGlwLT5pZC5kYXRhWzRd
ICYgTUlDUk9OX0lEX0lOVEVSTkFMX0VDQ19NQVNLKSAhPSAweDIpCj4gPiA+ID4gwqAJCXJldHVy
biBNSUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+ID4gwqAKPiA+ID4gPiArCS8qCj4gPiA+ID4g
KwnCoCogSXQgc2VlbXMgdGhhdCB0aGVyZSBhcmUgZGV2aWNlcyB3aGljaCBkbyBub3Qgc3VwcG9y
dCBFQ0Mgb2ZmaWNpYWwuCj4gPiA+ID4gKwnCoCogQXQgbGVhc3QgdGhlIE1UMjlGMkcwOEFCQUdB
IC8gTVQyOUYyRzA4QUJCR0EgZGV2aWNlcyBzdXBwb3J0cwo+ID4gPiA+ICsJwqAqIGVuYWJsaW5n
IHRoZSBFQ0MgZmVhdHVyZSBidXQgZG9uJ3QgcmVmbGVjdCB0aGF0IHRvIHRoZSBSRUFEX0lEIHRh
YmxlLgo+ID4gPiA+ICsJwqAqIFNvIHdlIGhhdmUgdG8gZ3VhcmFudGVlIHRoYXQgd2UgZGlzYWJs
ZSB0aGUgRUNDIGZlYXR1cmUgZGlyZWN0bHkKPiA+ID4gPiArCcKgKiBhZnRlciB3ZSBkaWQgdGhl
IFJFQURfSUQgdGFibGUgY29tbWFuZC4gTGF0ZXIgd2UgY2FuIGV2YWx1YXRlIHRoZQo+ID4gPiA+
ICsJwqAqIEVDQ19FTkFCTEUgc3VwcG9ydC4KPiA+ID4gPiArCcKgKi8KPiA+ID4gPiDCoAlyZXQg
PSBtaWNyb25fbmFuZF9vbl9kaWVfZWNjX3NldHVwKGNoaXAsIHRydWUpOwo+ID4gPiA+IMKgCWlm
IChyZXQpCj4gPiA+ID4gwqAJCXJldHVybiBNSUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+ID4g
QEAgLTM5OCwxMyArNDA2LDEzIEBAIHN0YXRpYyBpbnQgbWljcm9uX3N1cHBvcnRzX29uX2RpZV9l
Y2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gPiDCoAlpZiAocmV0KQo+ID4gPiA+IMKg
CQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKPiA+IMKgCj4gPiA+ID4gLQlpZiAo
IShpZFs0XSAmIE1JQ1JPTl9JRF9FQ0NfRU5BQkxFRCkpCj4gPiA+ID4gLQkJcmV0dXJuIE1JQ1JP
Tl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gPiAtCj4gPiA+ID4gwqAJcmV0ID0gbWljcm9uX25hbmRf
b25fZGllX2VjY19zZXR1cChjaGlwLCBmYWxzZSk7Cj4gPiA+ID4gwqAJaWYgKHJldCkKPiA+ID4g
PiDCoAkJcmV0dXJuIE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gPiDCoAo+ID4gPiA+ICsJ
aWYgKCEoaWRbNF0gJiBNSUNST05fSURfRUNDX0VOQUJMRUQpKQo+ID4gPiA+ICsJCXJldHVybiBN
SUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+ID4gKwo+ID4gPiA+IMKgCXJldCA9IG5hbmRfcmVh
ZGlkX29wKGNoaXAsIDAsIGlkLCBzaXplb2YoaWQpKTsKPiA+ID4gPiDCoAlpZiAocmV0KQo+ID4g
wqAJCXJldHVybiBNSUNST05fT05fRElFX1VOU1VQUE9SVEVEOwo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
