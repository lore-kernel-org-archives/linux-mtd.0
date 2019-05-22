Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86554C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 21:37:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DAF9206B6
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 21:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZNuznDBj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DAF9206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlhNHuAzRYewQG8qgiopiD8V7keRIs1CnYw5xmXvmTw=; b=ZNuznDBjviYSNc
	thDxVJ69tKiAgZAwP1ohKCWJ68DbJqjAdo4WD2a4FrtaveX2mhWZH1I2N22u2fNGv/coA0+VXj/3E
	Jd/kVBxNKeYoiBiEqmIxEtFQFBBw/qHCZ+MVgGXY5h/zc6yobxyzG1sq/K4jC4qgN1whJPqYikBO2
	S/gvwPKouIy5lZlJaSupWh7aBZLO1OqVpyKnFjNfk+yDh08PY80plfRtM9QbWgfCNTGBTUsi19q9q
	jf+E19pX4i0QM6/14V4C53SJlXqjTtPiXSRdq8Lplu/30uDxoXiR2Pc3I7Xuv8ZPhm8BITGvrUY9v
	72I27Qk9JqI8B1ynpRrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTYvK-0003KB-6O; Wed, 22 May 2019 21:37:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTYvH-0003Jm-AG
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 21:37:21 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A0C6F283655;
 Wed, 22 May 2019 22:37:08 +0100 (BST)
Date: Wed, 22 May 2019 23:37:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: onenand_base: Avoid fall-through warnings
Message-ID: <20190522233705.234d75d5@collabora.com>
In-Reply-To: <20190522180446.GA30082@embeddedor>
References: <20190522180446.GA30082@embeddedor>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_143719_621808_C79A0777 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMiBNYXkgMjAxOSAxMzowNDo0NiAtMDUwMAoiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+IHdyb3RlOgoKPiBOT1RJQ0UgVEhBVDoKPiAKPiAiLi4u
d2UgZG9uJ3Qga25vdyB3aGV0aGVyIHdlIG5lZWQgZmFsbHRocm91Z2hzIG9yIGJyZWFrcyB0aGVy
ZSBhbmQgdGhpcwo+IGlzIGp1c3QgYSBjaGFuZ2UgdG8gYXZvaWQgaGF2aW5nIG5ldyB3YXJuaW5n
cyB3aGVuIHN3aXRjaGluZyB0bwo+IC1XaW1wbGljaXQtZmFsbHRocm91Z2ggYnV0IHRoaXMgY2hh
bmdlIG1pZ2h0IGJlIGVudGlyZWx5IHdyb25nLiJbMV0KPiAKPiBTZWUgdGhlIG9yaWdpbmFsIHRo
cmVhZCBvZiBkaXNjdXNzaW9uIGhlcmU6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0
Y2h3b3JrL3BhdGNoLzEwMzYyNTEvCj4gCj4gU28sIGluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5n
IC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIHRoaXMgcGF0Y2ggc2lsZW5jZXMKPiB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgo+IAo+IGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2Uu
YzogSW4gZnVuY3Rpb24g4oCYb25lbmFuZF9jaGVja19mZWF0dXJlc+KAmToKPiBkcml2ZXJzL210
ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI2NDo2OiB3YXJuaW5nOiB0aGlzIHN0YXRl
bWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBpZiAo
T05FTkFORF9JU19ERFAodGhpcykpCj4gICAgICAgXgo+IGRyaXZlcnMvbXRkL25hbmQvb25lbmFu
ZC9vbmVuYW5kX2Jhc2UuYzozMjg0OjI6IG5vdGU6IGhlcmUKPiAgIGNhc2UgT05FTkFORF9ERVZJ
Q0VfREVOU0lUWV8yR2I6Cj4gICBefn5+Cj4gZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5h
bmRfYmFzZS5jOjMyODg6MTc6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91
Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIHRoaXMtPm9wdGlvbnMgfD0gT05FTkFO
RF9IQVNfVU5MT0NLX0FMTDsKPiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNl
LmM6MzI5MDoyOiBub3RlOiBoZXJlCj4gICBjYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMUdi
Ogo+ICAgXn5+fgo+IAo+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD0zCj4gCj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMg
dG8gZW5hYmxlCj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiAKPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDE5MDUwOTA4NTMxOC4zNGE5ZDRiZUB4cHMxMy8KPiAKPiBDYzog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmMgfCAyICsrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5h
bmRfYmFzZS5jCj4gaW5kZXggZjQxZDc2MjQ4NTUwLi42Y2Y0ZGY5ZjhjMDEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCj4gQEAgLTMyODAsMTIgKzMyODAsMTQg
QEAgc3RhdGljIHZvaWQgb25lbmFuZF9jaGVja19mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPiAgCQkJaWYgKCh0aGlzLT52ZXJzaW9uX2lkICYgMHhmKSA9PSAweGUpCj4gIAkJCQl0aGlz
LT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX05PUF8xOwo+ICAJCX0KPiArCQkvKiBGYWxsIHRocm91
Z2ggLSA/ICovCgpTbywgdGhlIG9ubHkgdGhpbmcgdGhhdCB5b3UnbGwgcmUtdXNlIGJ5IGZhbGxp
bmcgdGhyb3VnaCB0aGUgbmV4dCBjYXNlCmlzIHRoZSAnLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFT
X1VOTE9DS19BTEwnIG9wZXJhdGlvbi4gSSBmaW5kIGl0IGVhc2llcgp0byBmb2xsb3cgd2l0aCBh
biBleHBsaWNpdCBjb3B5IG9mIHRoaXMgbGluZSArIGEgYnJlYWsuCgo+ICAKPiAgCWNhc2UgT05F
TkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6Cj4gIAkJLyogMkdiIEREUCBkb2VzIG5vdCBoYXZlIDIg
cGxhbmUgKi8KPiAgCQlpZiAoIU9ORU5BTkRfSVNfRERQKHRoaXMpKQo+ICAJCQl0aGlzLT5vcHRp
b25zIHw9IE9ORU5BTkRfSEFTXzJQTEFORTsKPiAgCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRf
SEFTX1VOTE9DS19BTEw7Cj4gKwkJLyogRmFsbCB0aHJvdWdoIC0gPyAqLwoKVGhpcyBmYWxsIHRo
cm91Z2ggY2VydGFpbmx5IGRvZXNuJ3QgbWFrZSBzZW5zZSwgYXMgdGhlIG9ubHkgdGhpbmcgdGhh
dAptaWdodCBiZSBkb25lIGluIHRoZSAxR2IgY2FzZSBpcyBjb25kaXRpb25hbGx5IGFkZGluZyB0
aGUKSEFTX1VOTE9DS19BTEwgZmxhZywgYW5kIHRoaXMgZmxhZyBpcyBhbHJlYWR5IHVuY29uZGl0
aW9uYWxseSBzZXQuClBsZWFzZSBhZGQgYSBicmVhayBoZXJlLgoKPiAgCj4gIAljYXNlIE9ORU5B
TkRfREVWSUNFX0RFTlNJVFlfMUdiOgo+ICAJCS8qIEEtRGllIGhhcyBhbGwgYmxvY2sgdW5sb2Nr
ICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
