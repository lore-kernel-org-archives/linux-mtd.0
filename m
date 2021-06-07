Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CFEC47094
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B6B61073
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B6B61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6AH+d1RuEiL2lnnU2qYqEuUaCq8a3r4neBPI9mum2I=; b=dIg0feealMNbQoJSS/16tvKTWb
	LKHIZYZ930Gyx9HbkJxqTbgTeBfelex1vjDqDvM+aLBRv99fiVNFrxQBgEto+u4ni8TYum5MqArDY
	hcW18ShKozFhl0HmYjL8lJhQ6v2v3lC79/4/bCOHSVuhNPH6SwW2lWasWVKslXTafw1c9lq25fqvE
	+cCf67zSMd4rJoIQiyqSrE2mXQ8bKnNAzHqLGb6/+ky/UwYih7s2SXXv8AzMyPSHIQxkkL1si6lGQ
	Sy8GGpzJUkTT5AEMw0nL8Nr3fXEfM9zSGH8/uci895TQhADYX2Uu8lZIwWscLXhpSJg5FVQxpJ6fC
	yEeB08OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqCtM-0035kj-6M; Mon, 07 Jun 2021 10:54:00 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqClS-0032Yk-EF
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 10:45:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 998BE22173;
 Mon,  7 Jun 2021 12:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623062747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtcjoDEottJsH6hOo8FFAg8Br0rxwSoDL6YU6qH3MNk=;
 b=WzDsxEeoMpRcUuQZn5ScEFSd6wBgtBLSRzU79gjrQG7H5Vu1C8GDvuHnCXVzYvsmmYckNS
 2l/fNQOPKZMsGSZ+3sAZTBB9OYTkrvp+zRxyMM4cAUI/TWZN654L1vpYBoA1lCTTjGgDXi
 Pmjuv2nTMzSVBEABP2Il3xBsLCXvcLY=
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 12:45:47 +0200
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
In-Reply-To: <4b3e1bde-09ff-eebd-8e93-8db7a5834f96@ti.com>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
 <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
 <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
 <1549db61-500a-e5df-9303-823b41457861@ti.com>
 <4ba7994b0cc8d436012a776ca14addca@walle.cc>
 <3e46bc75-6ace-f7c0-1b14-aae812554ac9@ti.com>
 <2559d150b3a0d964ece0c9e29e155ecc@walle.cc>
 <4b3e1bde-09ff-eebd-8e93-8db7a5834f96@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6745ec209caa1d335a3e093c1de76ef6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_034550_841418_128C1720 
X-CRM114-Status: GOOD (  29.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wNi0wNyAxMjozMCwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+IE9uIDYv
Ny8yMSAzOjI2IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBBbSAyMDIxLTA2LTA3IDA4OjQ3
LCBzY2hyaWViIFZpZ25lc2ggUmFnaGF2ZW5kcmE6Cj4+PiBPbiA2LzcvMjEgMTE6MzggQU0sIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4gQW0gMjAyMS0wNi0wNyAwNzo0Niwgc2NocmllYiBWaWdu
ZXNoIFJhZ2hhdmVuZHJhOgo+Pj4+PiBPbiA2LzQvMjEgNjo0NSBQTSwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPj4+Pj4+IEFtIDIwMjEtMDYtMDQgMTU6MDcsIHNjaHJpZWIgVHVkb3IuQW1iYXJ1c0Bt
aWNyb2NoaXAuY29tOgo+Pj4+Pj4+IE9uIDYvNC8yMSAxOjAyIFBNLCBNaWNoYWVsIFdhbGxlIHdy
b3RlOgo+Pj4+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIAo+Pj4+Pj4+PiB5b3UKPj4+Pj4+Pj4ga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBTUEkgTk9SIGZsYXNoZXMgd2lsbCBqdXN0IGln
bm9yZSBwcm9ncmFtIGNvbW1hbmRzIGlmIHRoZSBPVFAKPj4+Pj4+Pj4gcmVnaW9uIGlzCj4+Pj4+
Pj4+IGxvY2tlZC4gVGh1cywgYSB1c2VyIG1pZ2h0IG5vdCBub3RpY2UgdGhhdCB0aGUgaW50ZW5k
ZWQgd3JpdGUKPj4+Pj4+Pj4gZGlkbid0IGVuZAo+Pj4+Pj4+PiB1cCBpbiB0aGUgZmxhc2guIFJl
dHVybiAtRVJPRlMgdG8gdGhlIHVzZXIgaW4gdGhpcyBjYXNlLiBGcm9tIAo+Pj4+Pj4+PiB3aGF0
Cj4+Pj4+Pj4+IEkgY2FuCj4+Pj4+Pj4+IHRlbGwsIGNoaXBzL2NmaV9jbWRzZXRfMDAwMS5jIGFs
c28gcmV0dXJuIHRoaXMgZXJyb3IgY29kZS4KPj4+Pj4+Pj4gCj4+Pj4+Pj4+IE9uZSBjb3VsZCBv
cHRpbWl6ZSBzcGlfbm9yX210ZF9vdHBfcmFuZ2VfaXNfbG9ja2VkKCkgdG8gcmVhZCB0aGUKPj4+
Pj4+Pj4gc3RhdHVzCj4+Pj4+Pj4+IHJlZ2lzdGVyIG9ubHkgb25jZSBhbmQgbm90IGZvciBldmVy
eSBPVFAgcmVnaW9uLCBidXQgZm9yIHRoYXQgd2UKPj4+Pj4+Pj4gd291bGQKPj4+Pj4+Pj4gbmVl
ZCBzb21lIG1vcmUgaW52YXNpdmUgY2hhbmdlcy4gR2l2ZW4gdGhhdCB0aGlzIGlzCj4+Pj4+Pj4+
IG9uZS10aW1lLXByb2dyYW1tYWJsZSBtZW1vcnkgYW5kIHRoZSBub3JtYWwgYWNjZXNzIG1vZGUg
aXMKPj4+Pj4+Pj4gcmVhZGluZywgd2UKPj4+Pj4+Pj4ganVzdCBsaXZlIHdpdGggdGhlIHNtYWxs
IG92ZXJoZWFkLgo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gRml4ZXM6IDA2OTA4OWFjZjg4YiAoIm10ZDog
c3BpLW5vcjogYWRkIE9UUCBzdXBwb3J0IikKPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFl
bCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPj4+Pj4+Pj4gUmV2aWV3ZWQtYnk6IFByYXR5dXNo
IFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+IMKgZHJpdmVycy9t
dGQvc3BpLW5vci9vdHAuYyB8IDM2IAo+Pj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+Pj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+
Pj4+Pj4+PiAKPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMg
Cj4+Pj4+Pj4+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYwo+Pj4+Pj4+PiBpbmRleCAzODk4
ZWQ2N2JhMWMuLjA2M2Y4ZmI2ODY0OSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQv
c3BpLW5vci9vdHAuYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL290cC5jCj4+
Pj4+Pj4+IEBAIC0yNDksNiArMjQ5LDMyIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9tdGRfb3RwX2lu
Zm8oc3RydWN0IAo+Pj4+Pj4+PiBtdGRfaW5mbwo+Pj4+Pj4+PiAqbXRkLCBzaXplX3QgbGVuLAo+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+Pj4+PiDCoH0KPj4+Pj4+Pj4g
Cj4+Pj4+Pj4+ICtzdGF0aWMgaW50IHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoc3Ry
dWN0IHNwaV9ub3IgKm5vciwKPj4+Pj4+Pj4gbG9mZl90IG9mcywKPj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGxlbikKPj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9vdHBfb3BzICpvcHMgPSAKPj4+Pj4+Pj4gbm9y
LT5wYXJhbXMtPm90cC5vcHM7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHJl
Z2lvbjsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoCBpbnQgbG9ja2VkOwo+Pj4+Pj4+PiArCj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqAgaWYgKCFsZW4pCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4gCj4+Pj4+Pj4gWW91IHdvbid0
IG5lZWQgdGhpcyBpZiB5b3UgcHV0IHBhdGNoIDQvNSBiZWZvcmUgdGhpcyBvbmUuIFdpdGggCj4+
Pj4+Pj4gdGhpczoKPj4+Pj4+IAo+Pj4+Pj4gVGhpcyBwYXRjaCB3aWxsIGdldCBiYWNrcG9ydGVk
IHRvIHRoZSBzdGFibGUga2VybmVscy4gUGF0Y2ggNCBvbiAKPj4+Pj4+IHRoZQo+Pj4+Pj4gb3Ro
ZXIgaGFuZCBkb2VzIG5vdC4KPj4+Pj4+IAo+Pj4+PiAKPj4+Pj4gSSBkb24ndCBzZWUgd2h5IDQv
NSBjYW5ub3QgYmUgbWFya2VkIGZvciBiYWNrcG9ydCB0b28gYXMgaXQgbWFrZXMgCj4+Pj4+IDMv
NQo+Pj4+PiBtdWNoIGNsZWFuZXI/Cj4+Pj4gCj4+Pj4gV2hhdCBraW5kIG9mIHByb2JsZW0gZG9l
cyA0LzUgZml4PyBJIGNhbid0IHNlZSBob3cgdGhhdCBwYXRjaCB3b3VsZAo+Pj4+IGFwcGx5IHRv
IGFueSBydWxlIGluIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLnJz
dC4KPj4+PiAKPj4+IAo+Pj4gTG9va2luZyBmdXJ0aGVyLCBJIGRvbid0IHNlZSB0aGUgbmVlZCBm
b3IgNC81IHRvIGJlIGEgc2VwYXJhdGUgcGF0Y2guCj4+PiBQYXRjaCA0LzUgaXMgc2ltcGxpZnlp
bmcgc3BpX25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tlZCgpIGJ5IAo+Pj4gZW5zdXJpbmcKPj4+
ICdsZW4nIHBhc3NlZCBpcyBuZXZlciAwIHdoaWNoIGNhbiBiZSBkb25lIGluIDMvNSB3aGVuIGlu
dHJvZHVjaW5nCj4+PiBzcGlfbm9yX210ZF9vdHBfcmFuZ2VfaXNfbG9ja2VkKCkuCj4+PiAKPj4+
IFNvIHdoeSBub3Qgc3F1YXNoZWQgaXQgaW50byAzLzUuCj4+IAo+PiBCZWNhdXNlLCBzdHJpY3Rs
eSBzcGVha2luZywgaXQgaXMgbm90IHBhcnQgb2YgdGhhdCBwYXJ0aWN1bGFyIGZpeAo+PiBhbmQg
SU1ITyB2aW9sYXRlcyAiSXQgbXVzdCBmaXggb25seSBvbmUgdGhpbmciLiBCdXQgaWYgeW91J3Jl
IGZpbmUKPj4gd2l0aCB0aGF0LCBJIGNhbiBzcXVhc2ggdGhlIHR3by4KPj4gCj4+IFRCSCBJIGZp
bmQgaXQga2luZGEgZnVubnkgdG8gYmVuZCB0aGUgcnVsZXMsIGp1c3QgdG8gZ2V0IHJpZCBvZgo+
PiB0aGVzZSB0aHJlZSBsaW5lcyBvZiBjb2RlIG9yIHRoZSB1Z2xpbmVzcyB0aGF0IHRoZXkgd2ls
bCBiZSByZW1vdmVkCj4+IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2guCj4+IAo+IAo+IFRoaXMgaXMg
c3RpbGwgZml4aW5nIG9ubHkgb25lIHRoaW5nICJJbmRpY2F0aW5nIE9UUCB3cml0ZXMgYXJlIGln
bm9yZWQKPiB3aGVuIHJlZ2lvbiBpcyBsb2NrZWQiIChpZSBzcGlfbm9yX210ZF9vdHBfcmFuZ2Vf
aXNfbG9ja2VkKCkgY2hlY2spLgo+IEJ1dCwgc3BpX25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tl
ZCgpIChhcyBpbiAzLzUpIGNhbiBiZSBzaW1wbGlmaWVkIGlmCj4gJ2xlbiAhPSAwJyBpcyBjaGVj
a2VkIHByaW9yIHRvIGNhbGxpbmcgdGhlIGZ1bmN0aW9uLiBUaGF0J3Mgd2hhdCA0LzUKPiBkb2Vz
IHdoaWNoIEkgYmVsaWV2ZSBjYW4gYmUgc3F1YXNoZWQgaGVyZS4KCkNvcnJlY3QsIGJ1dCBpdCBh
bHNvIHNraXAgdGhlIGxvY2svdW5sb2NrIGFzIHdlbGwgYXMgdGhlICIqcmV0bGVuID0gMCIsCndo
aWNoIGlzbid0IG5lZWRlZCB0byBqdXN0IGZpeCB0aGUgZXJyb3IsIElNSE8uIEkndmUgYWxyZWFk
eSBhc2tlZCBUdWRvcgpiZWZvcmUgYWRkaW5nIHRoaXMgcGF0Y2gsIGJ1dCBJIGd1ZXNzIEkgZGlk
bid0IG1ha2UgaXQgY2xlYXIgZW5vdWdoIHRoYXQKb25lIHdvdWxkIGJlIGZvciB0aGUgYmFja3Bv
cnRpbmcgYW5kIG9uZSBmb3IgZm9yLW5leHQuCgo+IEkganVzdCBkb24ndCBsaWtlIGNvZGUgYmVp
bmcgcmVmYWN0b3JlZCBmb3IgdGhlIHB1cnBvc2Ugb2YgYmVpbmcgYWJsZSAKPiB0bwo+IGJlIGJh
Y2twb3J0ZWQuIEl0IGZlZWxzIHdlaXJkIHRvIGhhdmUgYSBwaWVjZSBvZiBjb2RlIGJlaW5nIGFk
ZGVkIGluIAo+IG9uZQo+IGNvbW1pdCwgYW5kIHRoZW4gYmVpbmcgZGVsZXRlZCB0aGUgdmVyeSBu
ZXh0IGNvbW1pdC4KPiBTbyBzdHJpY3RseSBzcGVha2luZyA0LzUgaGFzIHRvIGNvbWUgYmVmb3Jl
IDMvNS4KCkZhaXIgZW5vdWdoLiBBbmQgSSB0ZW5kIHRvIGFncmVlLiBCdXQgc2VlIG15IHJlYXNv
bmluZyBhYm92ZSB3aHkgSSBkaWQKaXQgdGhhdCB3YXkuCgo+IEJ1dCBJIGFtIGZpbmUgdG8gbGl2
ZSB3aXRoIHRoaXMgdGVtcG9yYXJ5IHVnbGluZXNzIGlmIFR1ZG9yIGFncmVlcy4KCk5vIG5lZWQg
OykgSSdsbCBzcXVhc2ggaXQuIEl0IG1pZ2h0IGV2ZW4gYmUgYmV0dGVyLCBpZiB0aGUgdHdvIHZl
cnNpb25zCmRvZXNuJ3QgZGl2ZXJnZSB0aGF0IG11Y2guCgotbWljaGFlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
