Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5BFC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:34:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CBC2076E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rp4rdtcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CBC2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7MFcHegIbibs7n/kTPfrhRQY0o3nM2+YU1zWVJy+qdU=; b=Rp4rdtcPEUn0HubZ3pBsKP2Zw
	kTgCxnG8ahshWqd0E+FAnx7uCisiOokrm98DBX9FNcpjj+cDbh8I3YwCua8TsfOGqwadYryj0n3X7
	OZiW09sZUJD5A+Fr3PQQyHtUr1IeUdquGFKm38M9YYBDKO92grQVRbIdvhozSPjGGk0l1wjBJDAli
	k76WOiwYhCzxkF4xB1N79E61NHrjkyMlHZlElT/LtN5DuEuhcpc+fwz1WAkL9zoK7e/WRzwY77am0
	rmeaYA1BBr2vMuDBdJB2rA4i3L9qDKpw54mZ9A6v/xfLXBNpZeapB53ExTHTfe2xKKBfVCCGa6CMj
	j5+f0W8iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZ1M-000837-Bs; Mon, 02 Nov 2020 12:33:12 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZ1H-00080U-US
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 12:33:10 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A125E240008;
 Mon,  2 Nov 2020 12:33:03 +0000 (UTC)
Date: Mon, 2 Nov 2020 13:33:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 03/23] mtd: nand: onenand: onenand_base: Fix expected
 kernel-doc formatting
Message-ID: <20201102133302.788e42ac@xps13>
In-Reply-To: <20201102115406.1074327-4-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-4-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_073308_104092_FBC51816 
X-CRM114-Status: GOOD (  16.87  )
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
Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gTW9uLCAg
MiBOb3YgMjAyMCAxMTo1Mzo0NgorMDAwMDoKCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVu
YW5kX2Jhc2UuYzoxNDA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ210
ZCcgbm90IGRlc2NyaWJlZCBpbiAnb25lbmFuZF9vb2JsYXlvdXRfMzJfNjRfZWNjJwo+ICBkcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MTQwOiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzZWN0aW9uJyBub3QgZGVzY3JpYmVkIGluICdvbmVuYW5k
X29vYmxheW91dF8zMl82NF9lY2MnCj4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5k
X2Jhc2UuYzoxNDA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ29vYnJl
Z2lvbicgbm90IGRlc2NyaWJlZCBpbiAnb25lbmFuZF9vb2JsYXlvdXRfMzJfNjRfZWNjJwo+ICBk
cml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MjAwOiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhZGRyJyBub3QgZGVzY3JpYmVkIGluICdvbmVuYW5k
X3JlYWR3Jwo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MjEyOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd2YWx1ZScgbm90IGRlc2NyaWJl
ZCBpbiAnb25lbmFuZF93cml0ZXcnCj4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5k
X2Jhc2UuYzoyMTI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2FkZHIn
IG5vdCBkZXNjcmliZWQgaW4gJ29uZW5hbmRfd3JpdGV3Jwo+ICBkcml2ZXJzL210ZC9uYW5kL29u
ZW5hbmQvb25lbmFuZF9iYXNlLmM6MjI1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICd0aGlzJyBub3QgZGVzY3JpYmVkIGluICdvbmVuYW5kX2Jsb2NrX2FkZHJlc3MnCj4g
IGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYzoyMjU6IHdhcm5pbmc6IEZ1
bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2Jsb2NrJyBub3QgZGVzY3JpYmVkIGluICdvbmVu
YW5kX2Jsb2NrX2FkZHJlc3MnCj4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jh
c2UuYzoyNDI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3RoaXMnIG5v
dCBkZXNjcmliZWQgaW4gJ29uZW5hbmRfYnVmZmVycmFtX2FkZHJlc3MnCj4gIGRyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYzoyNDI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ2Jsb2NrJyBub3QgZGVzY3JpYmVkIGluICdvbmVuYW5kX2J1ZmZlcnJh
bV9hZGRyZXNzJwo+IAo+ICBOQjogU25pcHBlZCAyMDAgbGluZXMgZm9yIGJyZXZpdHkuCj4gCj4g
Q2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hy
QHRpLmNvbT4KPiBDYzogQWRyaWFuIEh1bnRlciA8ZXh0LWFkcmlhbi5odW50ZXJAbm9raWEuY29t
Pgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
b25lbmFuZC9vbmVuYW5kX2Jhc2UuYyB8IDQzOCArKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIxOSBpbnNlcnRpb25zKCspLCAyMTkgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+IGluZGV4IDE4OGI4MDYxZTFm
NzkuLjM1Zjg1MWJmOTBhM2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L29uZW5hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRf
YmFzZS5jCj4gQEAgLTE5Miw3ICsxOTIsNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBm
ZmNoYXJzW10gPSB7Cj4gIAoKWy4uLl0KCj4gIC8qKgo+ICAgKiBvbmVuYW5kX2J1ZmZlcl9hZGRy
ZXNzIC0gW0RFRkFVTFRdIEdldCBidWZmZXIgYWRkcmVzcwo+IC0gKiBAcGFyYW0gZGF0YXJhbTEJ
RGF0YVJBTSBpbmRleAo+IC0gKiBAcGFyYW0gc2VjdG9ycwl0aGUgc2VjdG9yIGFkZHJlc3MKPiAt
ICogQHBhcmFtIGNvdW50CQl0aGUgbnVtYmVyIG9mIHNlY3RvcnMKPiArICogQGRhdGFyYW06MQlE
YXRhUkFNIGluZGV4CgpTZWVtcyB0aGF0IHRoZSBvbmUgaXMgb24gdGhlIHdyb25nIHNpZGUgb2Yg
dGhlIGNvbG9uPwoKPiArICogQHNlY3RvcnM6CXRoZSBzZWN0b3IgYWRkcmVzcwo+ICsgKiBAY291
bnQ6CQl0aGUgbnVtYmVyIG9mIHNlY3RvcnMKPiAgICogQHJldHVybgkJdGhlIHN0YXJ0IGJ1ZmZl
ciB2YWx1ZQo+ICAgKgo+ICAgKiBTZXR1cCBTdGFydCBCdWZmZXIgUmVnaXN0ZXIgKEYyMDBoKQoK
VGhlIHJlc3QgbGd0bS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
