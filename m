Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EB1C07E9E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 16:34:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F62861C37
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 16:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F62861C37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTlv3mulu0JRAWQED11L6k2ZujD867Yq+HoWHgsNMXc=; b=sbOcGzjbynFEqJ
	n0gmAEFkTpFz/nm+tSkXTO06Try3SQghzzYARfrvckG2tb6m/ZCMlGdBTeR3dQgL9CFXY3/GdVCy0
	yrVfgy2fZvo0jBZQH9ISL5wM74HALI50UDarr8RMcanFpI7Ru0Khb9/4JhrIZqBxlvgNoIyu1MLXu
	quCCDPpGmvWFvUX2Su+2ReUAluZPKB1nxJAn0gLZskF5vR2xV/Ehq2yWg+EqKOgBbCPRIiSvUQj5p
	oXrUgAucX/CNxHOomh6Ugg7EDb4+tYmQS375gjNFJzHxXURUH5XUBvPrsqbDcjLbGmJv1PvSXbwvj
	pB2KG6Fn9VZjb5BW1NNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0nwm-00CGoo-5o; Tue, 06 Jul 2021 16:29:20 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0nwi-00CGna-JA
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 16:29:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D93D7100004;
 Tue,  6 Jul 2021 16:29:09 +0000 (UTC)
Date: Tue, 6 Jul 2021 18:29:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tudor.Ambarus@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
Message-ID: <20210706182908.3cf82669@xps13>
In-Reply-To: <2716acf0-fcf1-d2ef-83be-152d0300d687@roeck-us.net>
References: <20210702093841.32307-1-michael@walle.cc>
 <9bb2acac-aeb8-d2b2-8df0-9acfd972ec5d@microchip.com>
 <9F46D75C-D00D-4577-A337-7411049EC7D9@walle.cc>
 <8da3d84e-dfbf-2030-98b4-148362d22f52@microchip.com>
 <2716acf0-fcf1-d2ef-83be-152d0300d687@roeck-us.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_092916_944357_7ADD6504 
X-CRM114-Status: GOOD (  26.77  )
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

SGkgR3VlbnRlciwKCkd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGUgb24g
U2F0LCAzIEp1bCAyMDIxIDEwOjI2OjA2Ci0wNzAwOgoKPiBPbiA3LzMvMjEgOTo0MiBBTSwgVHVk
b3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4gT24gNy8zLzIxIDc6MDggUE0sIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6ICAKPiA+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUKPiA+Pgo+ID4+IEFtIDMuIEp1bGkgMjAyMSAxMTo1NjoxNCBNRVNaIHNjaHJpZWIgVHVkb3Iu
QW1iYXJ1c0BtaWNyb2NoaXAuY29tOiAgCj4gPj4+IE9uIDcvMi8yMSAxMjozOCBQTSwgTWljaGFl
bCBXYWxsZSB3cm90ZTogIAo+ID4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgIAo+ID4+PiBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUgIAo+ID4+Pj4KPiA+Pj4+IFRoZXJlIGFyZSBmbGFzaCBkcml2ZXJzIHdoaWNoIHJl
Z2lzdGVycyB0aGUgT1RQIGNhbGxiYWNrcyBhbHRob3VnaCAgCj4gPj4+IHRoZSAgCj4gPj4+PiBm
bGFzaCBkb2Vzbid0IHN1cHBvcnQgT1RQIHJlZ2lvbnMgYW5kIHJldHVybiAtRU5PREFUQSBmb3Ig
dGhlc2UKPiA+Pj4+IGNhbGxiYWNrcyBpZiB0aGVyZSBpcyBubyBPVFAuIElmIHRoaXMgaGFwcGVu
cywgdGhlIHByb2JlIG9mIHRoZSB3aG9sZSAgCj4gPj4+Cj4gPj4+IHdoeSBkbyB0aGV5IHJlZ2lz
dGVyIHRoZSBPVFAgY2FsbGJhY2sgaWYgdGhleSBkb24ndCBzdXBwb3J0IE9UUD8gIAo+ID4+Cj4g
Pj4gSSBkb24ndCBrbm93LiBCdXQgSSBjZXJ0YWlubHkgd29uJ3QgdG91Y2ggdGhhdCBjb2RlIDpw
ICAKPiA+IAo+ID4gd2h5PyA6RAo+ID4gICAKPiA+Pgo+ID4+ICAKPiA+Pj4+IGZsYXNoIHdpbGwg
ZmFpbC4gRml4IGl0IGJ5IGhhbmRsaW5nIHRoZSBFTk9EQVRBIHJldHVybiBjb2RlIGFuZCBza2lw
Cj4gPj4+PiB0aGUgT1RQIHJlZ2lvbiBudm1lbSBzZXR1cC4KPiA+Pj4+Cj4gPj4+PiBGaXhlczog
NGIzNjFjZmE4NjI0ICgibXRkOiBjb3JlOiBhZGQgT1RQIG52bWVtIHByb3ZpZGVyIHN1cHBvcnQi
KQo+ID4+Pj4gUmVwb3J0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4K
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4g
Pj4+PiAtLS0KPiA+Pj4+ICAgZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMTAgKysrKysrKystLQo+
ID4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJz
L210ZC9tdGRjb3JlLmMKPiA+Pj4+IGluZGV4IGI1Y2NkMzAzNzc4OC4uNjg4MWQxNDIzZGQ2IDEw
MDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPj4+PiArKysgYi9kcml2
ZXJzL210ZC9tdGRjb3JlLmMKPiA+Pj4+IEBAIC04ODAsNyArODgwLDEwIEBAIHN0YXRpYyBpbnQg
bXRkX290cF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICAKPiA+Pj4gKm10ZCkgIAo+ID4+Pj4K
PiA+Pj4+ICAgICAgICAgIGlmIChtdGQtPl9nZXRfdXNlcl9wcm90X2luZm8gJiYgbXRkLT5fcmVh
ZF91c2VyX3Byb3RfcmVnKSB7Cj4gPj4+PiAgICAgICAgICAgICAgICAgIHNpemUgPSBtdGRfb3Rw
X3NpemUobXRkLCB0cnVlKTsKPiA+Pj4+IC0gICAgICAgICAgICAgICBpZiAoc2l6ZSA8IDApCj4g
Pj4+PiArICAgICAgICAgICAgICAgLyogRU5PREFUQSBtZWFucyB0aGVyZSBpcyBubyBPVFAgcmVn
aW9uICovCj4gPj4+PiArICAgICAgICAgICAgICAgaWYgKHNpemUgPT0gLUVOT0RBVEEpICAKPiA+
Pj4KPiA+Pj4gSWYgbm8gT1RQIGRhdGEsIG1heWJlIGl0J3MgbW9yZSBhcHByb3ByaWF0ZSBmb3Ig
dGhlIGNsaWVudHMgdG8ganVzdAo+ID4+PiByZXR1cm4gYSByZXRsZW4gb2YgMC4gIAo+ID4+Cj4g
Pj4geW91IG1lYW4gYWxyZWFkeSBjaGVja2luZyBFTk9EQVRBIGluIG10ZF9vdHBfc2l6ZSgpIGFu
ZCByZXR1cm4gMC4gVGhhdCB3b3VsZCBhbHNvIG1ha2UgdGhlIGh1bmsgYmVsb3cgdW5uZWNlc3Nh
cnkuIEknbGwgY2hhbmdlIGl0LiAgCj4gPiAKPiA+IEkndmUgdGhvdWdodCBhYm91dDoKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jIGIvZHJp
dmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAxLmMKPiA+IGluZGV4IDU0ZjkyZDA5ZDljZi4u
OTQxOWIzM2Q3MjM4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNl
dF8wMDAxLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jCj4g
PiBAQCAtMjMxNCw3ICsyMzE0LDcgQEAgc3RhdGljIGludCBjZmlfaW50ZWxleHRfb3RwX3dhbGso
c3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLCAgCj4gPiAgID4g
ICAgICAgICAgLyogQ2hlY2sgdGhhdCB3ZSBhY3R1YWxseSBoYXZlIHNvbWUgT1RQIHJlZ2lzdGVy
cyAqLyAgCj4gPiAgICAgICAgICBpZiAoIWV4dHAgfHwgIShleHRwLT5GZWF0dXJlU3VwcG9ydCAm
IDY0KSB8fCAhZXh0cC0+TnVtUHJvdGVjdGlvbkZpZWxkcykKPiA+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0RBVEE7Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgIAo+IAo+
IFRoZXJlIGFyZSB2YXJpb3VzIHBsYWNlcyB3aGVyZSB0aGlzIGlzIGNhbGxlZCwgaW5jbHVkaW5n
IGNvZGUgcmV0dXJuaW5nIGluZm9ybWF0aW9uCj4gdG8gdXNlcnNwYWNlLiBUaGF0IG1lYW5zIHlv
dSdkIGJlIGNoYW5naW5nIHRoZSBBQkkgdG8gdXNlcnNwYWNlIHdoaWNoIHdvdWxkIG5vdyBzdWRk
ZW5seQo+IHJldHVybiAwIGluc3RlYWQgb2YgLUVOT0RBVEEuCgpZZWFoIGxldCdzIGF2b2lkIHRo
aXMgaWYgcG9zc2libGUsIGV2ZW4gdGhvdWdoIEkgbGlrZWQgVHVkb3IncyBhcHByb2FjaC4KCldv
dWxkIE1pY2hhZWwgcHJvcG9zYWwgb2YgY2hlY2tpbmcgaXQgaW4gbXRkX290cF9zaXplKCkgc3Rp
bGwgYWZmZWN0CnVzZXJzcGFjZT8gSWYgbm90LCBoYXZpbmcgYSBzaW5nbGUgY2hlY2sgb3ZlciB0
aGUgLUVOT0RBVEEgcmV0dXJuIGNvZGUKc2VlbXMgYXR0cmFjdGl2ZS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
