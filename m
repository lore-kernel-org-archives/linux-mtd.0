Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBEAC7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36CC222C7C
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 08:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIAQYzHY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36CC222C7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9C6dHFg5a0tR1mNKpDBd2RAm/TJB59yfgE4iO3GIo8=; b=bIAQYzHY4kFp1D
	+bq+rWMBpRey04DMy2As2AxrsQFL/EvY6+HklFyF6Iip5cTSN9cyGm4lzX+tzY77CXnSUP0poTumq
	mc2L7/JE3uevi90tt9AVk02X90ghhRVtKGpZusxRXMz4UY1pKpE+H2JVO3fnoNU8Ov/gEtUhH0hXM
	01mImjKa7A63TX24ctvOJ5lt+yN+HcCm+shxu2Q/4ewBBepxMN8J/w9C9NrcFJrpE8cBNL7ydHtfK
	qpVJo/njt/OCzyxCt0R3EsUtArid5wH6Br8WFiKhN7FQAXr7XfMy4CrfGXL7fFKAfFxbx4vRum3Oa
	buTR/jeGyjXk9H4Io2jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqw4M-0003Go-7M; Fri, 26 Jul 2019 08:59:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqw4I-0003GR-Ao
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 08:59:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F15CE28BE7E;
 Fri, 26 Jul 2019 09:59:08 +0100 (BST)
Date: Fri, 26 Jul 2019 10:59:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
Message-ID: <20190726105905.09a563f3@collabora.com>
In-Reply-To: <20190726103441.274876a8@xps13>
References: <20190726074434.21627-1-m.felsch@pengutronix.de>
 <20190726102858.3b4019d8@xps13> <20190726103441.274876a8@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_015914_633183_BF90336C 
X-CRM114-Status: GOOD (  28.63  )
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
 linux-mtd@lists.infradead.org, Marco Felsch <m.felsch@pengutronix.de>,
 kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNiBKdWwgMjAxOSAxMDozNDo0MSArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gKyBBY3R1YWwgYWRkcmVzcyBmb3IgQm9yaXMK
PiAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBvbiBG
cmksIDI2IEp1bCAyMDE5Cj4gMTA6Mjg6NTggKzAyMDA6Cj4gCj4gPiBIaSBNYXJjbywKPiA+IAo+
ID4gKyBSaWNoYXJkCj4gPiArIFdvcmtpbmcgZS1tYWlsIGFkZHJlc3MgZm9yIEJvcmlzCj4gPiAK
PiA+IE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9uIEZyaSwg
MjYgSnVsIDIwMTkKPiA+IDA5OjQ0OjM0ICswMjAwOgo+ID4gICAKPiA+ID4gU29tZSBkZXZpY2Vz
IGRvbid0IHN1cHBvcnQgZWNjICJvZmZpY2lhbCIuIEJ5ICJvZmZpY2lhbCIgSSBtZWFuIHRoYXQg
dGhlCj4gPiA+IGZlYXR1cmUgY2FuIGJlIHNldCB0cm91Z2ggdGhlICJTRVQgRkVBVFVSRSAoRUZo
KSIgY29tbWFuZCBidXQgaXNuJ3QKPiA+ID4gcmVwb3J0ZWQgdG8gdGhlICJSRUFEIElEIFBhcmFt
ZXRlciBUYWJsZXMiLiBCZWNhdXNlIHRoZSAiRUNDIEZpZWxkIgo+ID4gPiBzdGlsbCBzYXlzIHRo
YXQgaXQgaXMgZGlzYWJsZWQuIFRoaXMgaXMgYXBwbGljYWJsZSBhdCBsZWFzdAo+ID4gPiBmb3Ig
dGhlIE1UMjlGMkcwOEFCQUdBIGFuZCBNVDI5RjJHMDhBQkJHQSBkZXZpY2VzLiBFdmVuIHdvcnNl
IHRoZQo+ID4gPiBkYXRhc2hlZXQgZGVzY3JpYmVzIHRoZSBFQ0MgZmVhdHVyZSBpbiBjaGFwdGVy
ICJFQ0MgUHJvdGVjdGlvbiIuCj4gPiA+IAo+ID4gPiBDdXJyZW50bHkgdGhlIGRyaXZlciBjaGVj
a3MgdGhlICJSRUFEIElEIFBhcmFtZXRlciIgZmllbGQgZGlyZWN0bHkgYWZ0ZXIKPiA+ID4gd2Ug
ZW5hYmxlZCB0aGUgZmVhdHVyZS4gSWYgdGhlIGNoZWNrIGZhaWxzIHdlIHJldHVybiBpbW1lZGlh
dGVseSBidXQKPiA+ID4gbGVhdmUgdGhlIEVDQyBvbi4gTm93IGFsbCBmdXR1cmUgcmVhZC9wcm9n
cmFtIGN5Y2xlcyBnb2VzIHRyb3VnaCB0aGUgZWNjCj4gPiA+IGFuZCB0aGUgaG9zdCBuZmMgZ2V0
cyBjb25mdXNlZCBhbmQgcmVwb3J0cyBFQ0MgZXJyb3JzLgo+ID4gPiAKPiA+ID4gVG8gYWRkcmVz
cyB0aGlzIGluIGEgY29tbW9uIHdheSB3ZSBuZWVkIHRvIHR1cm4gb2ZmIHRoZSBFQ0MgZGlyZWN0
bHkKPiA+ID4gYWZ0ZXIgcmVhZGluZyB0aGUgIlJFQUQgSUQgUGFyYW1ldGVyIiBhbmQgYmVmb3Jl
IGNoZWNraW5nIHRoZQo+ID4gPiAiRUNDIHN0YXR1cyIuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiAgCgpEdWghIFlldCBh
bm90aGVyIGJ1ZyBvbiB0aG9zZSBNaWNyb24gY2hpcHMuIEkgY2FuJ3Qgc2F5IEknbQpzdXJwcmlz
ZWQgOi0pLgoKQW55d2F5LCB0aGUgY2hhbmdlIGxvb2tzIGdvb2Q6CgpSZXZpZXdlZC1ieTogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KCj4gPiAKPiA+IEdv
b2QgY2F0Y2ghIEhvd2V2ZXIgeW91IHJlcG9ydCB0aGF0IG9uLWRpZSBFQ0MgY29ycmVjdGlvbiBp
cyB3b3JraW5nCj4gPiBidXQgeW91IHN0aWxsIGRpc2FibGUgaXQ7IGFueSByZWFzb24gdG8gZG8g
c28gPyBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8KPiA+IGFjdHVhbGx5IGVuYWJsZSBvbi1kaWUgRUND
IGFuZCBleHBsaWNpdGx5IG1hcmsgdGhlc2UgdHdvIGNoaXBzIGFzCj4gPiBidWdneSAoc2VlIFsx
XSBmb3IgY2hlY2tpbmcgdGhlIGNoaXAgSURzKT8KClRoYXQncyBhIHNvbHV0aW9uLCBidXQgYXJl
IHdlIGV2ZW4gc3VyZSBFQ0Mgd29ya3MgY29ycmVjdGx5IG9uIHRob3NlCk5BTkRzPyBHaXZlbiBh
bGwgdGhlIHByb2JsZW0gd2UgaGF2ZSB3aXRoIG9uLWRpZSBFQ0Mgb24gTWljcm9uIGNoaXBzIEkK
dGhpbmsgaXQgbWlnaHQgYmUgYSBnb29kIHRoaW5nIHRvIGJhc2UgdGhlICJvbi1kaWUgRUNDIHN1
cHBvcnQiCmRldGVjdGlvbiBvbiB0aGUgZnVsbCBJRCAob3IgZXZlbiBiZXR0ZXIsIHRoZSBwYXJ0
IG5hbWUgcHJvdmlkZWQgYnkgdGhlCk9ORmkgcGFyYW0gcGFnZSkgaW5zdGVhZCBvZiB0cnlpbmcg
dG8gYmUgc21hcnQuIFRoaXMgd2F5IHdlIGNhbgp3aGl0ZWxpc3QgdGhlIE5BTkRzIHRoYXQgYXJl
IGtub3duIHRvIHdvcmsgY29ycmVjdGx5IGFuZCBzdG9wIGFkZGluZwptb3JlIHF1aXJrcyBldmVy
eSB0aW1lIHdlIGZpbmQgYSBuZXcgYnVnLi4uCgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjUuMy1yYzEvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25h
bmRfbWFjcm9uaXguYyNMODMKPiA+ICAgCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9taWNyb24uYyB8IDE0ICsrKysrKysrKysrLS0tCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9taWNyb24uYwo+ID4gPiBpbmRleCAxNjIyZDMxNDU1ODcuLmZiMTk5YWQy
ZjFhNiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9taWNyb24u
Ywo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jCj4gPiA+IEBA
IC0zOTAsNiArMzkwLDE0IEBAIHN0YXRpYyBpbnQgbWljcm9uX3N1cHBvcnRzX29uX2RpZV9lY2Mo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gIAkgICAgKGNoaXAtPmlkLmRhdGFbNF0gJiBN
SUNST05fSURfSU5URVJOQUxfRUNDX01BU0spICE9IDB4MikKPiA+ID4gIAkJcmV0dXJuIE1JQ1JP
Tl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gPiA+ICAKPiA+ID4gKwkvKgo+ID4gPiArCSAqIEl0IHNl
ZW1zIHRoYXQgdGhlcmUgYXJlIGRldmljZXMgd2hpY2ggZG8gbm90IHN1cHBvcnQgRUNDIG9mZmlj
aWFsLgo+ID4gPiArCSAqIEF0IGxlYXN0IHRoZSBNVDI5RjJHMDhBQkFHQSAvIE1UMjlGMkcwOEFC
QkdBIGRldmljZXMgc3VwcG9ydHMKPiA+ID4gKwkgKiBlbmFibGluZyB0aGUgRUNDIGZlYXR1cmUg
YnV0IGRvbid0IHJlZmxlY3QgdGhhdCB0byB0aGUgUkVBRF9JRCB0YWJsZS4KPiA+ID4gKwkgKiBT
byB3ZSBoYXZlIHRvIGd1YXJhbnRlZSB0aGF0IHdlIGRpc2FibGUgdGhlIEVDQyBmZWF0dXJlIGRp
cmVjdGx5Cj4gPiA+ICsJICogYWZ0ZXIgd2UgZGlkIHRoZSBSRUFEX0lEIHRhYmxlIGNvbW1hbmQu
IExhdGVyIHdlIGNhbiBldmFsdWF0ZSB0aGUKPiA+ID4gKwkgKiBFQ0NfRU5BQkxFIHN1cHBvcnQu
Cj4gPiA+ICsJICovCj4gPiA+ICAJcmV0ID0gbWljcm9uX25hbmRfb25fZGllX2VjY19zZXR1cChj
aGlwLCB0cnVlKTsKPiA+ID4gIAlpZiAocmV0KQo+ID4gPiAgCQlyZXR1cm4gTUlDUk9OX09OX0RJ
RV9VTlNVUFBPUlRFRDsKPiA+ID4gQEAgLTM5OCwxMyArNDA2LDEzIEBAIHN0YXRpYyBpbnQgbWlj
cm9uX3N1cHBvcnRzX29uX2RpZV9lY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gIAlp
ZiAocmV0KQo+ID4gPiAgCQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKPiA+ID4g
IAo+ID4gPiAtCWlmICghKGlkWzRdICYgTUlDUk9OX0lEX0VDQ19FTkFCTEVEKSkKPiA+ID4gLQkJ
cmV0dXJuIE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gPiA+IC0KPiA+ID4gIAlyZXQgPSBt
aWNyb25fbmFuZF9vbl9kaWVfZWNjX3NldHVwKGNoaXAsIGZhbHNlKTsKPiA+ID4gIAlpZiAocmV0
KQo+ID4gPiAgCQlyZXR1cm4gTUlDUk9OX09OX0RJRV9VTlNVUFBPUlRFRDsKPiA+ID4gIAo+ID4g
PiArCWlmICghKGlkWzRdICYgTUlDUk9OX0lEX0VDQ19FTkFCTEVEKSkKPiA+ID4gKwkJcmV0dXJu
IE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7Cj4gPiA+ICsKPiA+ID4gIAlyZXQgPSBuYW5kX3Jl
YWRpZF9vcChjaGlwLCAwLCBpZCwgc2l6ZW9mKGlkKSk7Cj4gPiA+ICAJaWYgKHJldCkKPiA+ID4g
IAkJcmV0dXJuIE1JQ1JPTl9PTl9ESUVfVU5TVVBQT1JURUQ7ICAKPiA+IAo+ID4gVGhhbmtzLAo+
ID4gTWlxdcOobCAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
