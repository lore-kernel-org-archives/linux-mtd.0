Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C060C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B2BC20645
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsLwXmte"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B2BC20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4nLIoVq0FXDwDTkQMP4xwkjps4Cd1qxDcOM4MDWC2g=; b=UsLwXmterf8ggI
	gXRv99pNm7OS3rC0xgnO4X8rqs+craxej8Za/tXyH29flZJvFe17oSHH0Nwk2Ovm7R3wBIrJzK0L3
	w+WN5NmlvZvRGb5IUzkmpXNlXvb602jmL957CfrrJlerzNbkcD8HPn2CtTak+sPqg1fui6Uy7Z3sj
	YtDssgfh+WJ+gsPXmppaWz3YTk+E3p+gkoXRPnkrNSq/Ei3/A6AFd7hWKLp1o4W9UHCo2RKd8JQYS
	UHLgohivY/YAtj/YLpVhUhKhjGogjA0ayQsYcIc/CHyfzjY7fQK9GY4imgoYYADFnF3cI2mDTfA4h
	/uJvz9Faub9OCO/lQ53g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShV8-0008Io-Kh; Mon, 20 May 2019 12:34:46 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShV5-0008I3-Fa
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 12:34:45 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3C106FF811;
 Mon, 20 May 2019 12:34:38 +0000 (UTC)
Date: Mon, 20 May 2019 14:34:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190520143438.46248bfc@xps13>
In-Reply-To: <1558076001-29579-1-git-send-email-masonccyang@mxic.com.tw>
References: <1558076001-29579-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_053443_815561_43E842BD 
X-CRM114-Status: GOOD (  18.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
RnJpLCAxNyBNYXkgMjAxOSAxNDo1MzoyMQorMDgwMDoKCj4gQWRkIHN1cHBvcnQgZm9yIE1hY3Jv
bml4IE5BTkQgcmVhZCByZXRyeS4KPiAKPiBNYWNyb25peCBOQU5EcyBzdXBwb3J0IHNwZWNpZmlj
IHJlYWQgb3BlcmF0aW9uIGZvciBkYXRhIHJlY292ZXJ5LAo+IHdoaWNoIGNhbiBiZSBlbmFibGVk
L2Rpc2FibGVkIHdpdGggYSBTRVQvR0VUX0ZFQVRVUkUuCj4gRHJpdmVyIGNoZWNrcyBieXRlIDE2
NyBvZiBWZW5kb3IgQmxvY2tzIGluIE9ORkkgcGFyYW1ldGVyIHBhZ2UgdGFibGUKPiB0byBzZWUg
aWYgdGhpcyBoaWdoLXJlbGlhYmlsaXR5IGZ1bmN0aW9uIGlzIHN1cHBvcnRlZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4KPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jIHwgNTcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+IGluZGV4IGUyODdlNzEuLjFh
NGRjOTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jCj4gQEAgLTE3LDYg
KzE3LDYyIEBACj4gIAo+ICAjaW5jbHVkZSAiaW50ZXJuYWxzLmgiCj4gIAo+ICsjZGVmaW5lIE1B
Q1JPTklYX1JFQURfUkVUUllfQklUIEJJVCgwKQo+ICsjZGVmaW5lIE1BQ1JPTklYX1JFQURfUkVU
UllfTU9ERSA2CgpDYW4geW91IG5hbWUgdGhpcyBkZWZpbmUgTUFDUk9OSVhfTlVNX1JFQURfUkVU
UllfTU9ERVM/Cgo+ICsKPiArc3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggewo+ICsJ
dTggcmVzZXJ2ZWRbMV07CgpEbyB5b3UgbmVlZCB0aGlzICJbMV0iID8KCj4gKwl1OCByZWxpYWJp
bGl0eV9mdW5jOwo+ICt9IF9fcGFja2VkOwo+ICsKPiArLyoKPiArICogTWFjcm9uaXggTkFORHMg
c3VwcG9ydCB1c2luZyBTRVQvR0VUX0ZFQVRVUkVTIHRvIGVudGVyL2V4aXQgcmVhZCByZXRyeSBt
b2RlCj4gKyAqLwo+ICtzdGF0aWMgaW50IG1hY3Jvbml4X25hbmRfc2V0dXBfcmVhZF9yZXRyeShz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgbW9kZSkKPiArewo+ICsJdTggZmVhdHVyZVtPTkZJ
X1NVQkZFQVRVUkVfUEFSQU1fTEVOXTsKPiArCWludCByZXQsIGZlYXR1cmVfYWRkciA9IE9ORklf
RkVBVFVSRV9BRERSX1JFQURfUkVUUlk7Cj4gKwo+ICsJaWYgKGNoaXAtPnBhcmFtZXRlcnMuc3Vw
cG9ydHNfc2V0X2dldF9mZWF0dXJlcyAmJgo+ICsJICAgIHRlc3RfYml0KGZlYXR1cmVfYWRkciwg
Y2hpcC0+cGFyYW1ldGVycy5zZXRfZmVhdHVyZV9saXN0KSAmJgo+ICsJICAgIHRlc3RfYml0KGZl
YXR1cmVfYWRkciwgY2hpcC0+cGFyYW1ldGVycy5nZXRfZmVhdHVyZV9saXN0KSkgewo+ICsJCWZl
YXR1cmVbMF0gPSBtb2RlOwo+ICsJCXJldCA9ICBuYW5kX3NldF9mZWF0dXJlcyhjaGlwLCBmZWF0
dXJlX2FkZHIsIGZlYXR1cmUpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXByX2VycigiRmFpbGVkIHRv
IHNldCByZWFkIHJldHJ5IG1vZGVkOiVkXG4iLCBtb2RlKTsKCkRvIHlvdSBoYXZlIHRvIGNhbGwg
bmFuZF9nZXRfZmVhdHVyZXMoKSBvbiBlcnJvcj8KCj4gKwo+ICsJCXJldCA9ICBuYW5kX2dldF9m
ZWF0dXJlcyhjaGlwLCBmZWF0dXJlX2FkZHIsIGZlYXR1cmUpOwo+ICsJCWlmIChyZXQgfHwgZmVh
dHVyZVswXSAhPSBtb2RlKQo+ICsJCQlwcl9lcnIoIkZhaWxlZCB0byB2ZXJpZnkgcmVhZCByZXRy
eSBtb2RlZDolZCglZClcbiIsCj4gKwkJCSAgICAgICBtb2RlLCBmZWF0dXJlWzBdKTsKCmlmIHJl
dCA9PSAwIGJ1dCBmZWF0dXJlWzBdICE9IG1vZGUsIHNob3VsZG4ndCB5b3UgcmV0dXJuIGFuIGVy
cm9yPwoKPiArCX0KPiArCj4gKwlyZXR1cm4gcmV0OwoKVGhpcyB3aWxsIHByb2R1Y2UgYSBXYXJu
aW5nIGF0IGNvbXBpbGUgdGltZSAocmV0IG1heSBiZSB1c2VkCnVuaW5pdGlhbGl6ZWQpLiBIYXZl
IHlvdSB0ZXN0ZWQgaXQ/Cgo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBtYWNyb25peF9uYW5kX29u
ZmlfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICt7Cj4gKwlzdHJ1Y3QgbmFuZF9wYXJh
bWV0ZXJzICpwID0gJmNoaXAtPnBhcmFtZXRlcnM7Cj4gKwlzdHJ1Y3QgbmFuZF9vbmZpX3ZlbmRv
cl9tYWNyb25peCAqbXhpYzsKPiArCj4gKwlpZiAoIXAtPm9uZmkpCj4gKwkJcmV0dXJuOwo+ICsK
PiArCW14aWMgPSAoc3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggKilwLT5vbmZpLT52
ZW5kb3I7Cj4gKwlpZiAoKG14aWMtPnJlbGlhYmlsaXR5X2Z1bmMgJiBNQUNST05JWF9SRUFEX1JF
VFJZX0JJVCkgPT0gMCkKPiArCQlyZXR1cm47Cj4gKwo+ICsJY2hpcC0+cmVhZF9yZXRyaWVzID0g
TUFDUk9OSVhfUkVBRF9SRVRSWV9NT0RFOwo+ICsJY2hpcC0+c2V0dXBfcmVhZF9yZXRyeSA9IG1h
Y3Jvbml4X25hbmRfc2V0dXBfcmVhZF9yZXRyeTsKPiArCj4gKwlpZiAocC0+c3VwcG9ydHNfc2V0
X2dldF9mZWF0dXJlcykgewo+ICsJCWJpdG1hcF9zZXQocC0+c2V0X2ZlYXR1cmVfbGlzdCwKPiAr
CQkJICAgT05GSV9GRUFUVVJFX0FERFJfUkVBRF9SRVRSWSwgMSk7Cj4gKwkJYml0bWFwX3NldChw
LT5nZXRfZmVhdHVyZV9saXN0LAo+ICsJCQkgICBPTkZJX0ZFQVRVUkVfQUREUl9SRUFEX1JFVFJZ
LCAxKTsKPiArCX0KPiArfQo+ICsKPiAgLyoKPiAgICogTWFjcm9uaXggQUMgc2VyaWVzIGRvZXMg
bm90IHN1cHBvcnQgdXNpbmcgU0VUL0dFVF9GRUFUVVJFUyB0byBjaGFuZ2UKPiAgICogdGhlIHRp
bWluZ3MgdW5saWtlIHdoYXQgaXMgZGVjbGFyZWQgaW4gdGhlIHBhcmFtZXRlciBwYWdlLiBVbmZs
YWcKPiBAQCAtNjUsNiArMTIxLDcgQEAgc3RhdGljIGludCBtYWNyb25peF9uYW5kX2luaXQoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCQljaGlwLT5vcHRpb25zIHw9IE5BTkRfQkJNX0ZJUlNU
UEFHRSB8IE5BTkRfQkJNX1NFQ09ORFBBR0U7Cj4gIAo+ICAJbWFjcm9uaXhfbmFuZF9maXhfYnJv
a2VuX2dldF90aW1pbmdzKGNoaXApOwo+ICsJbWFjcm9uaXhfbmFuZF9vbmZpX2luaXQoY2hpcCk7
Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
