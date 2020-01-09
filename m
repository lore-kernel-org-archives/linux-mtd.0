Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EF0C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 18:03:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14AD20678
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 18:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g29wcyAT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14AD20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WvFGDOHWjlxQWs8+OXFk0XdsTYjezORmIJ9/41VFbs=; b=g29wcyATbnUonf
	gxSkFY+0VVWiixf57YOPU+UNR4SsJxjbQdy3lXnd/DaXbA334ijlSyf0s1IXXNcUmPBXSVsLol9v/
	9i2SoWvxxnHyGnWHoDRTNMVv9O/eJ8FMH5OJjpg/R0ertZhHak42AHqrqxgana/CnuQQue7FfIl+h
	gcw6V8T09CybN63uvOc0hSP50EsPjdeDaf1St3rO96ez9doL6zOe+jcE+NojmZv9pLsXCTI4odwBp
	XJSdTwDsKrrOKmuhmqzGYC9PtcUu0QmU9eFu8l0LVz3AQ8z+q5GFfySFme1NZXpBhuPJfOA7Boxp/
	4epQVgW7NCXwYb9Uei6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipc8x-0000C8-HF; Thu, 09 Jan 2020 18:02:51 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipc8u-0000BZ-4O
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 18:02:50 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ADA81240011;
 Thu,  9 Jan 2020 18:02:41 +0000 (UTC)
Date: Thu, 9 Jan 2020 19:02:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin DEVERA <devik@eaxlabs.cz>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: Fix unexpected timeouts in waitrdy
Message-ID: <20200109190240.6fee87fb@xps13>
In-Reply-To: <0501ddbd-9e0f-62ec-ab57-d092502680d5@eaxlabs.cz>
References: <20191210150319.3125-1-devik@eaxlabs.cz>
 <20200109163752.621c6248@xps13>
 <73164aea-d889-21e4-4e7d-345ebd4e5197@eaxlabs.cz>
 <20200109182242.03743cf7@xps13>
 <0501ddbd-9e0f-62ec-ab57-d092502680d5@eaxlabs.cz>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_100248_446360_C7719D03 
X-CRM114-Status: GOOD (  25.38  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIERFVkVSQSA8ZGV2aWtAZWF4bGFicy5jej4gd3JvdGUgb24gVGh1
LCA5IEphbiAyMDIwIDE4OjQzOjQ2CiswMTAwOgoKPiBPbiAxLzkvMjAgNjoyMiBQTSwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiA+IEhpIE1hcnRpbiwKPiA+Cj4gPiBNYXJ0aW4gREVWRVJBIDxkZXZp
a0BlYXhsYWJzLmN6PiB3cm90ZSBvbiBUaHUsIDkgSmFuIDIwMjAgMTc6MTc6MzAKPiA+ICswMTAw
Ogo+ID4gIAo+ID4+IE9uIDEvOS8yMCA0OjM3IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4g
Pj4+IEhpIE1hcnRpbiwKPiA+Pj4KPiA+Pj4gTWFydGluIERldmVyYSA8ZGV2aWtAZWF4bGFicy5j
ej4gd3JvdGUgb24gVHVlLCAxMCBEZWMgMjAxOSAxNjowMzoxOAo+ID4+PiArMDEwMDogIAo+ID4+
PiAgID4+Pj4gVGhlIHVzZWQgd2F5IHRvIGNvbXB1dGUgamlmZmllcyB0aW1lb3V0IGJyb2tlcyB3
aGVuICAKPiA+Pj4+IGppZmZpZSBkaWZmZXJlbmNlIGlzIDEuIFNpbXBseSBhZGQgMSAtIGl0IGhh
cyBubyBvdGhlcgo+ID4+Pj4gc2lkZSBlZmZlY3RzLgo+ID4+Pj4gRml4ZXMgU1RNMzJNUDEgRk1D
MiBOQU5EIGNvbnRyb2xsZXIgd2hpY2ggc29tZXRpbWVzIGZhaWxlZAo+ID4+Pj4gZXhhY3RseSBp
biB0aGlzIHdheS4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gRGV2ZXJhIDxk
ZXZpa0BlYXhsYWJzLmN6Pgo+ID4+Pj4gLS0tCj4gPj4+PiAgICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYyB8IDYgKysrKystCj4gPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLmMKPiA+Pj4+IGluZGV4IGQ1MjdlNDQ4Y2UxOS4uYmVhYjNhNzc1Y2M3IDEwMDY0NAo+ID4+
Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+Pj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPj4+PiBAQCAtNzIxLDcgKzcyMSwxMSBA
QCBpbnQgbmFuZF9zb2Z0X3dhaXRyZHkoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdW5zaWduZWQg
bG9uZyB0aW1lb3V0X21zKQo+ID4+Pj4gICAgCWlmIChyZXQpCj4gPj4+PiAgICAJCXJldHVybiBy
ZXQ7ICAKPiA+Pj4+ICAgID4+IC0JdGltZW91dF9tcyA9IGppZmZpZXMgKyBtc2Vjc190b19qaWZm
aWVzKHRpbWVvdXRfbXMpOyAgCj4gPj4+PiArCS8qICsxIGJlbG93IGlzIG5lY2Vzc2FyeSBiZWNh
dXNlIGlmIHdlIGFyZSBub3cgaW4gdGhlIGxhc3QgZnJhY3Rpb24KPiA+Pj4+ICsJICogb2Ygamlm
ZnkgYW5kIG1zZWNzX3RvX2ppZmZpZXMgaXMgMSB0aGVuIHdlIHdpbGwgd2FpdCBvbmx5IHRoYXQK
PiA+Pj4+ICsJICogc21hbGwgamlmZnkgZnJhY3Rpb24gLSBwb3NzaWJseSBsZWFkaW5nIHRvIGZh
bHNlIHRpbWVvdXQKPiA+Pj4+ICsJICovCj4gPj4+PiArCXRpbWVvdXRfbXMgPSBqaWZmaWVzICsg
bXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSArIDE7Cj4gPj4+PiAgICAJZG8gewo+ID4+Pj4g
ICAgCQlyZXQgPSBuYW5kX3JlYWRfZGF0YV9vcChjaGlwLCAmc3RhdHVzLCBzaXplb2Yoc3RhdHVz
KSwgdHJ1ZSk7Cj4gPj4+PiAgICAJCWlmIChyZXQpICAKPiA+Pj4gSSBkb24ndCByZWFsbHkgd2hh
dCB5b3UgYXJlIGZpeGluZyBoZXJlLCBJIHN1c3BlY3QgdGhlIHJvb3QgY2F1c2UgdG8gYmUKPiA+
Pj4gYSB3cm9uZ2x5IGNhbGN1bGF0ZWQgdGltZW91dF9tcyBpbiB0aGUgY2FsbGluZyBkcml2ZXIu
Cj4gPj4+Cj4gPj4+IEl0IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUgY2FsbGVyIHRvIHVz
ZSB0aGlzIGZ1bmN0aW9uIHdpdGggYQo+ID4+PiByZWxldmFudCB0aW1lb3V0X21zIHBhcmFtZXRl
ci4gTWF5YmUgQ2hyaXN0b3BoZSBjYW4gaGVscCB5b3UgaGVyZT8gIAo+ID4+PiAgID4+IEhpIE1p
cXVlbCwgIAo+ID4+Cj4gPj4gYXNzdW1lIHRoYXQgbmFuZF9zb2Z0X3dhaXRyZHkgaXMgY2FsbGVk
IHdpdGggdGltZW91dF9tcz09MS4gSSBzdXBwb3NlIGl0IGlzCj4gPj4gdmFsaWQgY2FzZS4gSmlm
ZmllcyBhcmUgMTAwMCBmb3IgZXhhbXBsZSAoYXNzdW1lIHNvbWV0aGluZyBtb3JlIGxpa2UgMTAw
MC45OSAtCj4gPj4ganVzdCBiZWZvcmUgaW5jcmVtZW50aW5nIHRvIDEwMDEpLgo+ID4+IFdlIGNv
bXB1dGUgdGltZW91dF9tcyA9IDEwMDArbXNlY3NfdG9famlmZmllcygxKSA9IDEwMDEgKGF0IGxl
YXN0IGZvciBteSBqaWZmaWVzIHJhdGUpLgo+ID4+IG5hbmRfcmVhZF9kYXRhX29wIGlzIGNhbGxl
ZCBmb3IgdGhlIGZpcnN0IHRpbWUgYW5kIHJldHVybnMgMC4gRHVyaW5nIHRoZSBjYWxsIGppZmZp
ZXMgY2hhbmdlcwo+ID4+IHRvIDEwMDEgdGh1cyAid2hpbGUgbG9vcCIgZW5kcyBoZXJlICh3cm9u
Z2x5KS4KPiA+PiBOb3RpY2UgdGhhdCByb3V0aW5lIHdhcyBjYWxsZWQgd2l0aCBleHBlY3RlZCB0
aW1lb3V0IDFtcyBidXQgYWN0dWFsIHRpbWVvdXQgdXNlZCB3YXMgc29tZXRoaW5nCj4gPj4gYmV0
d2VlbiAwLi4uMW1zICh3aGljaCBJIGFsc28gbWVhc3VyZWQgYnkgdHJhY2luZyAmIHNjb3BlIG9u
IHRoZSBidXMpLgo+ID4+IE9yIGlzIG15IGFuYWx5c2lzIGZsYXdlZCBzb21ld2hlcmUgPyAgCj4g
PiBJIGFncmVlIHdpdGggeW91ciBhbmFseXNpcy4gRXZlbiBpZiBuYW5kX3NvZnRfd2FpdHJkeSB3
aWxsIG5vIGxvbmdlciBiZQo+ID4gdXNlZCBieSB0aGUgc3RtMzIgZHJpdmVyIChDaHJpc3RvcGhl
IHNlbnQgYSBwYXRjaCBmb3IgdGhhdCkgSSBhbSBmaW5lCj4gPiBhcHBseWluZyB0aGlzIGNoYW5n
ZS4KPiA+Cj4gPiBDb3VsZCB5b3UgYWRkIGEgY29tbWVudCB0byBleHBsYWluIHRoZSAnKzEnIGFu
ZCByZXNlbmQ/Cj4gPiAgCj4gQ2FuIHlvdSBnaXZlIG1lIHNvbWUgZ3VpZGFuY2UgcGxlYXNlID8g
V2hlcmUgc2hvdWxkIEkgYWRkIG1vcmUgY29tbWVudCB0bwo+IHRoZSBnaXQgY29tbWl0IG9yIHRv
IHRoZSBDIGNvZGUgPyBJIHRyaWVkIHRvIGNvbW1lbnQgYm90aCBjb21taXQgYW5kIGNvZGUsIHBy
b2JhYmx5Cj4geW91IGZpbmQgdGhlIGNvbW1lbnRzIG5vdCBjbGVhciBlbm91Z2ggPwoKU29ycnkg
Zm9yIG5vdCBleHBsYWluaW5nOiBDb3VsZCB5b3UgYWRkIHRoZSBleGFtcGxlIHRvIHRoZSBjb21t
aXQKbWVzc2FnZT8gVGhlIGNvbW1lbnQgaXMgZmluZSwgYmVzaWRlcyB0aGUgZmFjdCB0aGF0IGl0
IHNob3VsZCBzdGFydApsaWtlIHRoaXM6CgoJLyoKCSAqIEJsYSBibGEgYmxhCgpBbHNvIHBsZWFz
ZSBjaGFuZ2UgdGhlIGNvbW1pdCB0aXRsZSwgbWF5YmUKCgltdGQ6IHJhd25hbmQ6IEVuc3VyZSBu
YW5kX3NvZnRfd2FpdHJkeSB3YWl0IHBlcmlvZCBpcyBlbm91Z2gKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
