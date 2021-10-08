Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F832C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 12:28:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2136560F93
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 12:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2136560F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jy6K5LvSWnimn7moWgqXuJ9hk55OFTnIoEMFMEWQEUc=; b=WWo60dsL4b6pjS
	72vXHn25awf5g8IU2UGn+YV/lFqDrqyZTMK2Akk3ysYJV/xauB7l4eBZ21gQNCwr/8QqBpmy7Z0TD
	TgQjXr1E1040qFfuV3BLdSFIzCqVkPWQrQt9XLm6fb8h+/VCJ0/Q0QbMxuyTO77oBoFoCkrM437ah
	BpOnEZeE7KBVhkn6qT2iu+AaRGyYxm6EOy1Kek8nNOjyyp3AaBeTqc4twoYXh2YcQYbuOhg7+o/jv
	v+6kDcnU0zC8ZeLxuk0WIztNGrw+FampIbu+hdsrrm50LkewwH6ofVTFr+ijojHfR8sN+Bsv3v8P9
	6XDl8UlooYnCogM9Gnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYoyO-002hd0-5t; Fri, 08 Oct 2021 12:27:36 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYoyJ-002hZs-D9
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 12:27:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7D0171C0006;
 Fri,  8 Oct 2021 12:27:26 +0000 (UTC)
Date: Fri, 8 Oct 2021 14:27:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?= <S.Riedmueller@phytec.de>
Cc: "ceggers@arri.de" <ceggers@arri.de>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "michael@amarulasolutions.com" <michael@amarulasolutions.com>, Christian
 Hemp <C.Hemp@phytec.de>, "gerg@kernel.org" <gerg@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211008142724.7fbeed6a@xps13>
In-Reply-To: <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211004173351.36a66ccb@xps13>
 <20211004160620.3guajv5vvtfjrl7c@umbrella>
 <2091909.Mh6RI2rZIc@n95hx1g2>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_052731_759266_56E647A0 
X-CRM114-Status: GOOD (  33.76  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpTLlJpZWRtdWVsbGVyQHBoeXRlYy5kZSB3cm90ZSBvbiBGcmksIDggT2N0IDIwMjEg
MTI6MDg6MDEgKzAwMDA6Cgo+IEhpIENocmlzdGlhbiwKPiAKPiBPbiBGcmksIDIwMjEtMTAtMDgg
YXQgMTE6NTUgKzAyMDAsIENocmlzdGlhbiBFZ2dlcnMgd3JvdGU6Cj4gPiArIHNldCBQSFlURUMg
ZGV2ZWxvcGVycyBvbiAoQilDQwo+ID4gCj4gPiBPbiBNb25kYXksIDQgT2N0b2JlciAyMDIxLCAx
ODowNjoyMCBDRVNULCBIYW4gWHUgd3JvdGU6ICAKPiA+ID4gQ291bGQgeW91IHBsZWFzZSB0cnkg
dG8gYWRkIGNsb2NrIGRpcy9lbmFibGUgd2hlbiBzZXR0aW5nIGNsb2NrIHJhdGUsIGluCj4gPiA+
IGNhc2UKPiA+ID4gY2xvY2sgZ2xpdGNoZXMuCj4gPiA+IAo+ID4gPiBjbGtfZGlzYWJsZV91bnBy
ZXBhcmUoci0+Y2xvY2tbMF0pOwo+ID4gPiBjbGtfc2V0X3JhdGUoci0+Y2xvY2tbMF0sIGh3LT5j
bGtfcmF0ZSk7Cj4gPiA+IGNsa19wcmVwYXJlX2VuYWJsZShyLT5jbG9ja1swXSk7Cj4gPiA+ICAg
Cj4gPiAKPiA+IFdpdGggdGhpcyBjaGFuZ2UsIHdlIG1hZGUgb3ZlciAyMDAwIHN1Y2Nlc3NmdWwg
cmVib290cyB3aXRob3V0IGFueSBHUE1JIERNQQo+ID4gdGltZW91dCBwcm9ibGVtcyEKPiA+IAo+
ID4gRnJvbSBQSFlURUMgKG91ciBCU1Agc3VwcGxpZXIpLCBJIGdvdCBzb21lIHBvc3NpYmxlIGJh
Y2tncm91bmQgZm9yIHRoaXMKPiA+IHByb2JsZW0uIEZvciBvbGRlciByZXZpc2lvbnMgb2YgSU1Y
NkRRIHRoZXJlIHdhcyBhbiBlcnJhdGEgKEVSUjAwNzExNywgWzFdKQo+ID4gaW4gdGhlIFJPTSBi
b290bG9hZGVyIHdoaWNoIHRyaWdnZXJzIGEgc2ltaWxhciAvIHRoZSBzYW1lIGJlaGF2aW9yOgo+
ID4gICAKPiA+ID4gRm9yIHJhdyBOQU5EIGJvb3QsIFJPTSBzd2l0Y2hlcyB0aGUgc291cmNlIG9m
IGVuZmNfY2xrX3Jvb3QgZnJvbSBQTEwyX1BGRDIKPiA+ID4gdG8gUExMMy4gVGhlIHJvb3QgY2xv
Y2sgaXMgcmVxdWlyZWQgdG8gYmUgZ2F0ZWQgYmVmb3JlIHN3aXRjaGluZyB0aGUKPiA+ID4gc291
cmNlCj4gPiA+IGNsb2NrLiBJZiB0aGUgcm9vdCBjbG9jayBpcyBub3QgZ2F0ZWQsIGNsb2NrIGds
aXRjaGVzIG1pZ2h0IGJlIHBhc3NlZCB0bwo+ID4gPiB0aGUgZGl2aWRlciB0aGF0IGZvbGxvd3Mg
dGhlIGNsb2NrIG11eCwgYW5kIHRoZSBkaXZpZGVyIG1pZ2h0IGJlaGF2ZQo+ID4gPiB1bnByZWRp
Y3RhYmx5Lgo+ID4gPiAuLi4KPiA+ID4gVGhpcyBwcm9ibGVtIGNhbiBhbHNvIG9jY3VyIGVsc2V3
aGVyZSBpbiBhcHBsaWNhdGlvbiBjb2RlIGlmIHRoZSByb290Cj4gPiA+IGNsb2NrCj4gPiA+IGlz
IG5vdCBwcm9wZXJseSBnYXRlZCB3aGVuIHRoZSBjbG9jayBjb25maWd1cmF0aW9uIGlzIGNoYW5n
ZWQuICAKPiA+IAo+ID4gSW4gbXkgY2FzZSAoTGludXggYm9vdCBvbiBpLk1YNlVMTCksIEkgcmVj
b2duaXplZCB0aGF0IG9uIHRoZSAzcmQgY2FsbCBvZgo+ID4gZ3BtaV9uZmNfYXBwbHlfdGltaW5n
cygpLCB0aGUgcmF0ZSBvZiByLT5jbG9ja1swXSBpcyBjaGFuZ2VkIAo+ID4gCj4gPiAtIGZyb206
IDIyIE1IeiAoQ1MyQ0RSOjpFTkZDX0NMS19QUkVEPTYgYW5kIENTMkNEUjo6RU5GQ19DTEtfUE9E
Rj0zKQo+ID4gLSB0bzogIDEwMCBNSHogKENTMkNEUjo6RU5GQ19DTEtfUFJFRD00IGFuZCBDUzJD
RFI6OkVORkNfQ0xLX1BPREY9MSkKPiA+IAo+ID4gVGhlIHByb3Bvc2FsIGZyb20gZnJvbSBIYW4g
WHUgIAo+ID4gPiBjbGtfZGlzYWJsZV91bnByZXBhcmUoci0+Y2xvY2tbMF0pOwo+ID4gPiBjbGtf
c2V0X3JhdGUoci0+Y2xvY2tbMF0sIGh3LT5jbGtfcmF0ZSk7Cj4gPiA+IGNsa19wcmVwYXJlX2Vu
YWJsZShyLT5jbG9ja1swXSk7ICAKPiA+IGRpc2FibGVzIG9ubHkgQ0NHUjQ6OkNHMTQgW1JBV05B
TkRfVV9HUE1JX0JDSF9JTlBVVF9HUE1JX0lPX0NMS19FTkFCTEVdCj4gPiBkdXJpbmcKPiA+IHRo
ZSByYXRlIGNoYW5nZS4gV2hpbGUgdGhpcyB3b3JrcyB2ZXJ5IGZpbmUgb24gbXkgc3lzdGVtLCB0
aGlzIHByb2JhYmx5Cj4gPiBkb2Vzbid0Cj4gPiBmdWxmaWxsIHRoZSByZXF1aXJlbWVudHMgaW4g
dGhlIGVycmF0YSBkZXNjcmlwdGlvbjoKPiA+ICAgCj4gPiA+IEZvciBvdGhlciBvY2N1cnJlbmNl
cyBpbiBhcHBsaWNhdGlvbiBjb2RlLCB0aGUgZm9sbG93aW5nIHByb2NlZHVyZSBzaG91bGQKPiA+
ID4gYmUKPiA+ID4gZm9sbG93ZWQgdG8gY2hhbmdlIHRoZSBjbG9jayBjb25maWd1cmF0aW9uIGZv
ciB0aGUgZW5mY19jbGtfcm9vdDoKPiA+ID4gMSkgR2F0ZSAoZGlzYWJsZSkgdGhlIEdQTUkvQkNI
IGNsb2NrcyBpbiByZWdpc3RlciBDQ01fQ0NHUjQuCj4gPiA+IDIpIEdhdGUgKGRpc2FibGUpIHRo
ZSBlbmZjX2Nsa19yb290IGJlZm9yZSBjaGFuZ2luZyB0aGUgZW5mY19jbGtfcm9vdAo+ID4gPiBz
b3VyY2UKPiA+ID4gICAgb3IgZGl2aWRlcnMgYnkgY2xlYXJpbmcgQ0NNX0NDR1IyW0NHN10gdG8g
MuKAmWIwMC4gVGhpcyBkaXNhYmxlcyB0aGUKPiA+ID4gICAgaW9tdXhfaXB0X2Nsa19pb19jbGsu
Cj4gPiA+IDMpIENvbmZpZ3VyZSBDQ01fQ1MyQ0RSIGZvciB0aGUgbmV3IGNsb2NrIHNvdXJjZSBj
b25maWd1cmF0aW9uLgo+ID4gPiA0KSBFbmFibGUgZW5mY19jbGtfcm9vdCBieSBzZXR0aW5nIEND
TV9DQ0dSMltDRzddIHRvIDLigJliMTEuIFRoaXMgZW5hYmxlcwo+ID4gPiB0aGUKPiA+ID4gICAg
aW9tdXhfaXB0X2Nsa19pb19jbGsuCj4gPiA+IDUpIEVuYWJsZSB0aGUgR1BNSS9CQ0ggY2xvY2tz
IGluIHJlZ2lzdGVyIENDTV9DQ0dSNCAgCj4gPiAKPiA+IEkgZ290IGFub3RoZXIgc29sdXRpb24g
ZnJvbSBQSFlURUMgKFsyXSwgbm90IGxlbmd0aHkgdGVzdGVkIHlldCksIHdoaWNoCj4gPiBkaXNh
YmxlcyBhbGwgR1BNSS9CQ0ggY2xvY2tzIG9uIENDR1I0ICh2ZXJpZmllZCB3aXRoIGEgSlRBRyBk
ZWJ1Z2dlcik6Cj4gPiAtIENDR1I0OjpDRzE1ICBbUkFXTkFORF9VX0dQTUlfSU5QVVRfQVBCX0NM
S19FTkFCTEVdCj4gPiAtIENDR1I0OjpDRzE0ICBbUkFXTkFORF9VX0dQTUlfQkNIX0lOUFVUX0dQ
TUlfSU9fQ0xLX0VOQUJMRV0KPiA+IC0gQ0NHUjQ6OkNHMTMgIFtSQVdOQU5EX1VfR1BNSV9CQ0hf
SU5QVVRfQkNIX0NMS19FTkFCTEVdCj4gPiAtIENDR1I0OjpDRzEyICBbUkFXTkFORF9VX0JDSF9J
TlBVVF9BUEJfQ0xLX0VOQUJMRV0KPiA+IC0gQ0NHUjQ6OkNHNiAgIFtQTDMwMV9NWDZRUEVSMV9C
Q0hDTEtfRU5BQkxFXQo+ID4gCj4gPiBDQ01fQ0NHUjJbQ0c3XSBpcyB1c2VkIGZvciBJT01VWF9J
UFRfQ0xLX0lPX0VOQUJMRSBvbiBpLk1YNlVMTCwgc28gc3RlcCAyLgo+ID4gc2VlbXMgbm90IHRv
IGFwcGx5IGhlcmUuIEFjdHVhbGx5IEkgZG9uJ3Qga25vdyBob3cgdG8gZ2F0ZSBFTkZDX0NMS19S
T09ULgo+ID4gCj4gPiBJIHdpbGwgY3ljbGljIHRlc3QgdGhlIHNvbHV0aW9uIGZyb20gUEhZVEVD
IG92ZXIgdGhlIHdlZWtlbmQuCj4gPiAKPiA+IEBIYW4gWHU6IFNob3VsZCBJIHByZWZlciB0aGUg
c29sdXRpb24gZnJvbSBQSFlURUM/Cj4gPiBAU3RlZmFuIFJpZWRtdWVsbGVyOiBBcmUgeW91IHdp
bGxpbmcgdG8gY29tbWl0IHRoaXMgdXBzdHJlYW0/ICAKPiAKPiBZZXMgc3VyZSwgSSBjYW4gcHJl
cGFyZSBhIHBhdGNoIGJlZ2lubmluZyBvZiBuZXh0IHdlZWsuCj4gQlRXLCB3ZSBoYXZlIHNlZW4g
dGhlc2UgRE1BIHRpbWVvdXQgaXNzdWVzIG9uIHRoZSBpLk1YNiBTT0NzIGFzIHdlbGwuIFNvIHRo
aXMKPiBmaXggaXMgbm90IG9ubHkgZm9yIHRoZSBpLk1YIDZVTEwuCgpDb3VsZCBpdCBiZSBwb3Nz
aWJsZSB0byBxdWFudGlmeSB0aGUgZXh0cmEgdGltZSBzcGVudCBpbgpkaXNhYmxpbmcvcmUtZW5h
YmxpbmcgY2xvY2tzIGp1c3QgZm9yIHRoZSByZWNvcmQ/IFNvIGZhciB0aGlzIGRyaXZlcgpvbmx5
IHN1cHBvcnRzIGEgc2luZ2xlIGNoaXAgYW5kIHRodXMgZnJlcXVlbmN5IGNoYW5nZXMgZG8gbm90
IGhhcHBlbgpmcmVxdWVudGx5IChhIGNvdXBsZSB0aW1lcyBhdCBib290KSBidXQgaWYgc29tZWRh
eSB3ZSBpbnRyb2R1Y2Ugc3VwcG9ydApmb3Igc2V2ZXJhbCBjaGlwcyBpdCBtaWdodCBiZWNvbWUg
dmVyeSBpbXBhY3RpbmcuIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
