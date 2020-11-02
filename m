Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0E9C388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB6822268
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItkDG+B7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB6822268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RmXLrpU2hiimRYtKoyBq803vcGBiR+ZY4uVnkJPBwcI=; b=ItkDG+B7mjeiyEW4dwT0YEk3q
	HxY1g23FJrl0xJ6gzbowuUaD1mRiU/HFIbzsheComydGe5TGaKNu9kCRXkd1gTyqnxTFWEM72gPxM
	ZPFnUMIDjUfIkpkeDHCskomxVZIqsx+P1K1JmpxirDkFzbno+KxLOqKNBlKv25Ihkp/yNJ2iE7x3m
	V7LWOfQ6x2hSbhsRvRn1neZye6fqomiKORBw9j0zaRZNofibnKz7OUV9A4uWZnSi1IiLksaar07ye
	Z6V6agWktriXvSLHVWHE+mDoLZnAwJKPmORdMAKTX1IkeBFD5GQFIQKaHfMF24qLxVh4c2D14F/nJ
	Qi2IhivVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZKI-0003Rn-GB; Mon, 02 Nov 2020 12:52:46 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZKF-0003R3-Ve
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 12:52:44 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AF340C0011;
 Mon,  2 Nov 2020 12:52:38 +0000 (UTC)
Date: Mon, 2 Nov 2020 13:52:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 23/23] mtd: devices: powernv_flash: Add function names
 to headers and fix 'dev'
Message-ID: <20201102135237.7a03b817@xps13>
In-Reply-To: <20201102115406.1074327-24-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-24-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_075244_123493_2965CE5A 
X-CRM114-Status: GOOD (  20.62  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, vigneshr@ti.com,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Cyril Bur <cyril.bur@au1.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gTW9uLCAg
MiBOb3YgMjAyMCAxMTo1NDowNgorMDAwMDoKCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9m
bGFzaC5jOjEyOTogd2FybmluZzogQ2Fubm90IHVuZGVyc3RhbmQgICogQG10ZDogdGhlIGRldmlj
ZQo+ICBkcml2ZXJzL210ZC9kZXZpY2VzL3Bvd2VybnZfZmxhc2guYzoxNDU6IHdhcm5pbmc6IENh
bm5vdCB1bmRlcnN0YW5kICAqIEBtdGQ6IHRoZSBkZXZpY2UKPiAgZHJpdmVycy9tdGQvZGV2aWNl
cy9wb3dlcm52X2ZsYXNoLmM6MTYxOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKiBAbXRk
OiB0aGUgZGV2aWNlCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jOjE4NDog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGV2JyBub3QgZGVzY3JpYmVk
IGluICdwb3dlcm52X2ZsYXNoX3NldF9kcml2ZXJfaW5mbycKPiAKPiBDYzogTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxy
aWNoYXJkQG5vZC5hdD4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29t
Pgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IEJlbmph
bWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiBDYzogUGF1bCBN
YWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+Cj4gQ2M6IEN5cmlsIEJ1ciA8Y3lyaWwuYnVyQGF1
MS5pYm0uY29tPgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9m
bGFzaC5jIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3Bvd2VybnZf
Zmxhc2guYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jCj4gaW5kZXggMGI3
NTdkOWJhMmY2Yi4uMzJjYjBlNjQ5MDk2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZp
Y2VzL3Bvd2VybnZfZmxhc2guYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9m
bGFzaC5jCj4gQEAgLTEyNiw2ICsxMjYsOCBAQCBzdGF0aWMgaW50IHBvd2VybnZfZmxhc2hfYXN5
bmNfb3Aoc3RydWN0IG10ZF9pbmZvICptdGQsIGVudW0gZmxhc2hfb3Agb3AsCj4gIH0KPiAgCj4g
IC8qKgo+ICsgKiBwb3dlcm52X2ZsYXNoX3JlYWQKPiArICoKClBlcmhhcHMgd2Ugc2hvdWxkIG5v
dCBhZGQgYmxhbmsgbGluZXMgaWYgdGhlIHJlc3Qgb2YgdGhlIGZpbGUgZG9lcyBub3QKYWxyZWFk
eSBoYXZlIHN1Y2ggc3BhY2luZyAoc2VlIGJlbG93KS4KCj4gICAqIEBtdGQ6IHRoZSBkZXZpY2UK
PiAgICogQGZyb206IHRoZSBvZmZzZXQgdG8gcmVhZCBmcm9tCj4gICAqIEBsZW46IHRoZSBudW1i
ZXIgb2YgYnl0ZXMgdG8gcmVhZAo+IEBAIC0xNDIsNiArMTQ0LDcgQEAgc3RhdGljIGludCBwb3dl
cm52X2ZsYXNoX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBzaXplX3Qg
bGVuLAo+ICB9Cj4gIAo+ICAvKioKPiArICogcG93ZXJudl9mbGFzaF93cml0ZQo+ICAgKiBAbXRk
OiB0aGUgZGV2aWNlCj4gICAqIEB0bzogdGhlIG9mZnNldCB0byB3cml0ZSB0bwo+ICAgKiBAbGVu
OiB0aGUgbnVtYmVyIG9mIGJ5dGVzIHRvIHdyaXRlCj4gQEAgLTE1OCw2ICsxNjEsNyBAQCBzdGF0
aWMgaW50IHBvd2VybnZfZmxhc2hfd3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0
bywgc2l6ZV90IGxlbiwKPiAgfQo+ICAKPiAgLyoqCj4gKyAqIHBvd2VybnZfZmxhc2hfZXJhc2UK
PiAgICogQG10ZDogdGhlIGRldmljZQo+ICAgKiBAZXJhc2U6IHRoZSBlcmFzZSBpbmZvCj4gICAq
IFJldHVybnMgMCBpZiBlcmFzZSBzdWNjZXNzZnVsIG9yIC1FUlJOTyBpZiBhbiBlcnJvciBvY2N1
cnJlZAo+IEBAIC0xNzYsNyArMTgwLDcgQEAgc3RhdGljIGludCBwb3dlcm52X2ZsYXNoX2VyYXNl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqZXJhc2UpCj4gIAo+ICAv
KioKPiAgICogcG93ZXJudl9mbGFzaF9zZXRfZHJpdmVyX2luZm8gLSBGaWxsIHRoZSBtdGRfaW5m
byBzdHJ1Y3R1cmUgYW5kIGRvY2czCj4gLSAqIHN0cnVjdHVyZSBAcGRldjogVGhlIHBsYXRmb3Jt
IGRldmljZQo+ICsgKiBAZGV2OiBUaGUgZGV2aWNlIHN0cnVjdHVyZQo+ICAgKiBAbXRkOiBUaGUg
c3RydWN0dXJlIHRvIGZpbGwKPiAgICovCj4gIHN0YXRpYyBpbnQgcG93ZXJudl9mbGFzaF9zZXRf
ZHJpdmVyX2luZm8oc3RydWN0IGRldmljZSAqZGV2LAoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
