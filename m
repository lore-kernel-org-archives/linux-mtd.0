Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C526C10F14
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 09:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CABA20850
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 09:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t3y7dBXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CABA20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzxufIU6blbgwsIm+abq9fwXFHI5qLL3/t0KuBEMJFU=; b=t3y7dBXdne4VAp
	od1EtJ+dK2DDR/S7BYhJHtRVG4a1wed5IjxASSdFJz9wNu8iuoJtZaniO33woVCoi1aXw8IvAT+eW
	UhK66/lRsgjdPDIZMTcDkttlSTC1+KGwc/bNi7Mh2fPWeV+EPkeJkglJ4zOa6oMaOX+8mcUF/p4zg
	utmFAZ5S9QdBanKWP8iQ0Wh6m6hzhlsicB+R6bvVgM7VF8s3XwswAaN+K7V4guV8UW4cvcBRCJXWE
	bcX8GPxnDTxYgsdhLzpB54jsRI68cavD9m975WabNrzVmWZxhCq28fgw1wRyO87iJhKYhsHssIETH
	Dmubk25jG6RjBXzg+AAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE9KR-0004dY-Kf; Wed, 10 Apr 2019 09:15:35 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE9KO-0004bc-1u
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 09:15:33 +0000
Received: from xps13 (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr
 [90.88.18.121]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9ABAA10000A;
 Wed, 10 Apr 2019 09:15:22 +0000 (UTC)
Date: Wed, 10 Apr 2019 11:15:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add Macronix NAND read retry and
 randomizer support
Message-ID: <20190410111521.026c7010@xps13>
In-Reply-To: <OF37AF39D0.77A1B5F5-ON482583D8.002E12E6-482583D8.002FA5B1@mxic.com.tw>
References: <1554780172-23111-1-git-send-email-masonccyang@mxic.com.tw>
 <20190409090427.22de9917@collabora.com>
 <OF6C97E4DE.45261545-ON482583D7.00340468-482583D7.0034B3FE@mxic.com.tw>
 <20190409114701.744c2c8c@collabora.com>
 <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
 <20190410091612.229c91b4@xps13>
 <OF37AF39D0.77A1B5F5-ON482583D8.002E12E6-482583D8.002FA5B1@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_021532_395366_1E11747D 
X-CRM114-Status: GOOD (  22.04  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgbWFzb25jY3lhbmdAbXhpYy5jb20udHcsCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90
ZSBvbiBXZWQsIDEwIEFwciAyMDE5IDE2OjQwOjI1ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gIAo+
ID4gPiA+IAo+ID4gPiA+IFJlOiBbUEFUQ0hdIG10ZDogcmF3bmFuZDogQWRkIE1hY3Jvbml4IE5B
TkQgcmVhZCByZXRyeSBhbmQgICAKPiByYW5kb21pemVyIAo+ID4gPiBzdXBwb3J0ICAKPiA+ID4g
PiAKPiA+ID4gPiBPbiBUdWUsIDkgQXByIDIwMTkgMTc6MzU6MzkgKzA4MDAKPiA+ID4gPiBtYXNv
bmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZToKPiA+ID4gPiAgIAo+ID4gPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSBzeXNmc19teGlj
X25hbmQgPQo+ID4gPiA+ID4gPiA+ICsgICBfX0FUVFIobmFuZF9yYW5kb20sIFNfSVJVR08gfCBT
X0lXVVNSLAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgbXhpY19uYW5kX3JhbmRfdHlwZV9zaG93
LAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgbXhpY19uYW5kX3JhbmRfdHlwZV9zdG9yZSk7ICAg
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBObywgd2UgZG9uJ3Qgd2FudCB0byBleHBvc2UgdGhh
dCB0aHJvdWdoIGEgc3lzZnMgZmlsZSwgICAKPiBlc3BlY2lhbGx5IAo+ID4gPiBzaW5jZSAgCj4g
PiA+ID4gPiA+IGNoYW5naW5nIHRoZSByYW5kb21pemVyIGNvbmZpZyBtZWFucyBtYWtpbmcgdGhl
IE5BTkQgdW5yZWFkYWJsZSAgIAo+IGZvcgo+ID4gPiA+ID4gPiB0aG9zZSB0aGF0IGhhdmUgdXNl
ZCBpdCBiZWZvcmUgdGhlIGNoYW5nZS4KPiA+ID4gPiA+ID4gICAKPiA+ID4gPiA+IAo+ID4gPiA+
ID4gT3VyIG9uLWRpZSByYW5kb21pemVyIGlzIHN0aWxsIHJlYWRhYmxlIGZyb20gdXNlciBhZnRl
ciB0aGUgICAKPiBmdW5jdGlvbiAKPiA+ID4gPiA+IGlzIGVuYWJsZWQuICAgCj4gPiA+ID4gCj4g
PiA+ID4gWW91IG1lYW4gdGhlIG1lbW9yeSBpcyBzdGlsbCByZWFkYWJsZSBubyBtYXR0ZXIgdGhl
IHJhbmRvbWl6ZXIgICAKPiBzdGF0ZS4KPiA+ID4gPiBOb3Qgc3VyZSBob3cgdGhhdCdzIHBvc3Np
YmxlLCBidXQgb2theS4gIAo+ID4gCj4gPiBTbyBpZiB5b3Ugd3JpdGUgbm9uLXJhbmRvbWl6ZWQg
ZGF0YSB0byB0aGUgTkFORCBjaGlwLCB0aGVuIGVuYWJsZSB0aGUKPiA+IHJhbmRvbWl6ZXIgZW4g
cmVhZCBiYWNrIHRoZSBkYXRhLCBhbGwgd2lsbCBiZSBvaz8gIAoKcy9lbi9hbmQvCgo+IAo+IHll
cyAhCgpJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRoaXMgaXMgcG9zc2libGUuIEhhdmUgeW91IHRy
aWVkIGl0IHlvdXJzZWxmPwoKQ2FuIHlvdSBleHBsYWluIGhvdyB0aGlzIGlzIHN1cHBvc2VkIHRv
IHdvcms/Cgo+IAo+ID4gCj4gPiBBbmQgaWYgcmFuZG9taXplZCBkYXRhIGlzIHdyaXR0ZW4gdG8g
dGhlIE5BTkQgY2hpcCBhbmQgd2UgZGlzYWJsZSB0aGUKPiA+IHJhbmRvbWl6ZXIsIHRoZW4gdGhl
IGRhdGEgd2lsbCBhbHNvIGJlIGNvcnJlY3Q/Cj4gPiAgIAo+IAo+IEVuYWJsZSByYW5kb21pemVy
IGlzIGEgT1RQKE9uZS1UaW1lLVByb2dyYW0pIGJpdCBhbmQgY2FuJ3QgYmUgZXJhc2VkIAo+IGFn
YWluIQo+IFRoYXQgbWVhbnMgbmV2ZXIgZGlzYWJsZSBpdCBvbmNlIGl0IGhhcyBiZWVuIGVuYWJs
ZWQuCj4gCj4gPiA+ID4gICAKPiA+ID4gPiA+IFRoaXMgcmFuZG9taXplciBpcyBqdXN0IGxpa2Ug
YSBpbnRlcm5hbCBtZW1vcnkgY2VsbCAKPiA+ID4gPiA+IHJlbGlhYmlsaXR5IGVuaGFuY2VkLiAg
IAo+ID4gPiA+IAo+ID4gPiA+IFdoeSBkb24ndCB5b3UgZW5hYmxlIGl0IGJ5IGRlZmF1bHQgdGhl
bj8gICAKPiA+ID4gCj4gPiA+IFRoZSBwZW5hbHR5IG9mIHJhbmRvbWl6ZXIgaXMgcmVhZC93cml0
ZSBwZXJmb3JtYW5jZSBkb3duLgo+ID4gPiBpLmUsLiB0UFJPRyAzMDAgdXMgdG8gMzQwIHVzIChy
YW5kb21pemVyIGVuYWJsZSkKPiA+ID4gdGhlcmVmb3JlLCBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQu
ICAKPiA+IAo+ID4gSXMgdGhpcyBpbmZvIHNvbWV3aGVyZSBpbiB0aGUgT05GSSBwYXJhbSBwYWdl
PyBJIHN1cHBvc2Ugb25jZQo+ID4gcmFuZG9taXphdGlvbiBpcyBlbmFibGVkIHdlIHNob3VsZCBh
bHNvIHR3ZWFrIHRoZSB0aW1pbmdzIGFuZCB2ZXJpZnkKPiA+IHRoYXQgdGhlIGNvbnRyb2xsZXIg
c3VwcG9ydHMgaXQuICAKPiAKPiB5ZXMsIGl0IGlzIGluIE9ORkkgcGFyYW0gcGFnZUBCeXRlIyAx
Njcgb2YgYml0IDEgKFZlbmRvciBCbG9ja3MgCj4gc3RhcnRpbmdAQnl0ZSMgMTY0KS4KPiAKPiAr
I2RlZmluZSBPTkZJX0ZFQVRVUkVfQUREUl9NWElDX1JBTkRPTUlaRVIgMHhCMAo+ICsKPiArc3Ry
dWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggewo+ICsgICAgICAgICAgICAgICAgdTggcmVz
ZXJ2ZWRbMV07Cj4gKyAgICAgICAgICAgICAgICB1OCByZWxpYWJpbGl0eV9mdW5jOwo+ICt9IF9f
cGFja2VkOwo+IAo+IAo+IGluIGFkZGl0aW9uLCBlbmFibGUgcmFuZG9taXplciBoYXMgbm8gYW55
IGltcGFjdCBvbiB0aW1pbmcgb2YgdFJDLCB0UlAsIAo+IHRXQyBhbmQgc28gb24uCj4gaG9zdCBk
cml2ZXIganVzdCBuZWVkIHRvIGNoZWNrIHRoZSBzdGF0dXMgcGluIG9mIFJZLyNCWSBhcyBsaWtl
IHN0YW5kYXJkCj4gcmVhZC93cml0ZSBvcGVyYXRpb24gZmxvdy4KPiAKPiB0aGFua3MgJiBiZXN0
IHJlZ2FyZHMsCj4gTWFzb24KPiAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
