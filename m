Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C68C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2bpWQGowJzlup1zQJN32VyKYvhHBxnk0k8kw4iDHlE=; b=rE9A8LPgJ6y71rDDk8plcyA6uq
	xla95OfZWVNdGxFX9u1EJkdDfTcW+kIimJ6ejYUxWPudb8FKeCfvp7w9m7NOCqPs1ygwb5KNNhDF2
	B/9PgII1AuxxxCNipKZlg1ZsZUH6To1N54FMmud72FUeQCh9QN25RG9t25ToRIqnFs4yT4fFxmM8P
	i0wCSotCgd+PLEGsK0GWTk4AL7CeKnF+g4/IWFBH9AnBJM0Lefu/PJKeRPOMipjROP4Ls71VT91zk
	q/6E2nZvKcVQTZ80zGWoOHu+nGbaXHyjynyHL1XAndLDdLSjy79Fpy0rwZbZuDnleHnnNQywrQ1I3
	DrC2KIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngo25-003uFA-Du; Tue, 19 Apr 2022 13:36:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngnF9-003aqo-5J
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 12:46:11 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 556242223A;
 Tue, 19 Apr 2022 14:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650372362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdmczezhx/tpLA3z8mH/wGkfcsWv93c1p3+6YiunEDo=;
 b=TJN8RIQZoIAzq2TksZMMhDozCaRhbLdSsvng6TjQ+ZMl6yXee+/HEXZEYG1qWAyCRX0EO+
 +DP0ozooPtqaiyK13MoHI6+y8robdkYgAW4BIR4iFHZFK0/eJuzK/KwdMNWF0lmhSKaFr1
 6jlGF22HPFONPL8767smkef5jH4kQng=
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 14:46:02 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 Takahiro.Kuwano@infineon.com
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: core: Add helpers to read/write any
 register
In-Reply-To: <20220419123245.zu4hypebz77ckygn@ti.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-7-tudor.ambarus@microchip.com>
 <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
 <e21b0d76bf778f78f432ba27a673222d@walle.cc>
 <f318dbd9-d4bf-301a-b5c9-556d04d5bfe6@microchip.com>
 <20220419123245.zu4hypebz77ckygn@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <996f36b1303d191e472f56393aa6398e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_054607_568039_32A1F0B4 
X-CRM114-Status: GOOD (  20.94  )
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

QW0gMjAyMi0wNC0xOSAxNDozMiwgc2NocmllYiBQcmF0eXVzaCBZYWRhdjoKPiBPbiAxOS8wNC8y
MiAxMjowOFBNLCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+IE9uIDQvMTkv
MjIgMTQ6NDYsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlCj4+ID4KPj4gPiBBbSAyMDIyLTA0LTE5IDEzOjE5LCBzY2hyaWViIE1pY2hh
ZWwgV2FsbGU6Cj4+ID4+IEFtIDIwMjItMDQtMTEgMTE6MTAsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1
czoKPj4gPj4+IFRoZXJlIGFyZSBtYW51ZmFjdHVyZXJzIHRoYXQgdXNlIHJlZ2lzdGVycyBpbmRl
eGVkIGJ5IGFkZHJlc3MuIFNvbWUgb2YKPj4gPj4+IHRoZW0gc3VwcG9ydCAicmVhZC93cml0ZSBh
bnkgcmVnaXN0ZXIiIG9wY29kZXMuIFByb3ZpZGUgY29yZSBtZXRob2RzCj4+ID4+PiB0aGF0Cj4+
ID4+PiBjYW4gYmUgdXNlZCBieSBhbGwgbWFudWZhY3R1cmVycy4gU1BJIE5PUiBjb250cm9sbGVy
IG9wcyBhcmUKPj4gPj4+IGludGVudGlvbmFsbHkKPj4gPj4+IG5vdCBzdXBwb3J0ZWQgYXMgd2Ug
aW50ZW5kIHRvIG1vdmUgYWxsIHRoZSBTUEkgTk9SIGNvbnRyb2xsZXIgZHJpdmVycwo+PiA+Pj4g
dW5kZXIgdGhlIFNQSSBzdWJzeXN0ZW0uCj4+ID4+Pgo+PiA+Pj4gU2lnbmVkLW9mZi1ieTogVHVk
b3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+PiA+Pj4gVGVzdGVkLWJ5
OiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+ID4+PiBS
ZXZpZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+PiA+Pgo+PiA+PiBJ
IHN0aWxsIGRvbid0IGxpa2UgaXQgYmVjYXVzZSB0aGUgZnVuY3Rpb24gZG9lc24ndCBkbwo+PiA+
PiBhbnl0aGluZyB3aGF0IHRoZSBmdW5jdGlvbiBuYW1lIG1pZ2h0IHN1Z2dlc3QuIFRoZSByZWFk
Cj4+ID4+IGp1c3QgZXhlY3V0ZXMgYW4gb3AsIHRoZSB3cml0ZSBleGVjdXRlcyBhbiBvcCB3aXRo
IGEKPj4gPj4gd3JpdGUgZW5hYmxlIGJlZm9yZS4gQWxsIHRoZSBiZWhhdmlvciBpcyBkZXRlcm1p
bmVkIGJ5IHRoZQo+PiA+PiAnb3AnIGFyZ3VtZW50Lgo+PiA+Pgo+PiA+PiBBbnl3YXksCj4+ID4+
IFJldmlld2VkLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+PiA+Pgo+PiA+
Pj4gLS0tCj4+ID4+PiB2Mzogbm8gY2hhbmdlcwo+PiA+Pj4KPj4gPj4+IMKgZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMgfCA0MQo+PiA+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggfMKgIDQgKysrKwo+
PiA+Pj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPj4gPj4+Cj4+ID4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYwo+PiA+Pj4gaW5kZXggNjE2NWRjN2JmZDE3Li40Mjc5NDMyOGQzYjYgMTAwNjQ0
Cj4+ID4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiA+Pj4gKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gPj4+IEBAIC0zMDcsNiArMzA3LDQ3IEBAIHNzaXpl
X3Qgc3BpX25vcl93cml0ZV9kYXRhKHN0cnVjdCBzcGlfbm9yICpub3IsCj4+ID4+PiBsb2ZmX3Qg
dG8sIHNpemVfdCBsZW4sCj4+ID4+PiDCoMKgwqDCoCByZXR1cm4gbm9yLT5jb250cm9sbGVyX29w
cy0+d3JpdGUobm9yLCB0bywgbGVuLCBidWYpOwo+PiA+Pj4gwqB9Cj4+ID4+Pgo+PiA+Pj4gKy8q
Kgo+PiA+Pj4gKyAqIHNwaV9ub3JfcmVhZF9yZWcoKSAtIHJlYWQgcmVnaXN0ZXIgdG8gZmxhc2gg
bWVtb3J5Cj4+ID4+PiArICogQG5vcjrCoMKgwqDCoMKgwqDCoCBwb2ludGVyIHRvICdzdHJ1Y3Qg
c3BpX25vcicuCj4+ID4+PiArICogQG9wOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUEkgbWVt
b3J5IG9wZXJhdGlvbi4gb3AtPmRhdGEuYnVmIG11c3QgYmUgRE1BLWFibGUuCj4+ID4+PiArICog
QHByb3RvOsKgIFNQSSBwcm90b2NvbCB0byB1c2UgZm9yIHRoZSByZWdpc3RlciBvcGVyYXRpb24u
Cj4+ID4+PiArICoKPj4gPj4+ICsgKiBSZXR1cm46IHplcm8gb24gc3VjY2VzcywgLWVycm5vIG90
aGVyd2lzZQo+PiA+Pj4gKyAqLwo+PiA+Pj4gK2ludCBzcGlfbm9yX3JlYWRfcmVnKHN0cnVjdCBz
cGlfbm9yICpub3IsIHN0cnVjdCBzcGlfbWVtX29wICpvcCwKPj4gPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIHNwaV9ub3JfcHJvdG9jb2wgcHJvdG8pCj4+ID4+PiAr
ewo+PiA+Pj4gK8KgwqDCoCBpZiAoIW5vci0+c3BpbWVtKQo+PiA+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiA+Pj4gKwo+PiA+Pj4gK8KgwqDCoCBzcGlf
bm9yX3NwaW1lbV9zZXR1cF9vcChub3IsIG9wLCBwcm90byk7Cj4+ID4+PiArwqDCoMKgIHJldHVy
biBzcGlfbm9yX3NwaW1lbV9leGVjX29wKG5vciwgb3ApOwo+PiA+Pj4gK30KPj4gPj4+ICsKPj4g
Pj4+ICsvKioKPj4gPj4+ICsgKiBzcGlfbm9yX3dyaXRlX3JlZygpIC0gd3JpdGUgcmVnaXN0ZXIg
dG8gZmxhc2ggbWVtb3J5Cj4+ID4+PiArICogQG5vcjrCoMKgwqDCoMKgwqDCoCBwb2ludGVyIHRv
ICdzdHJ1Y3Qgc3BpX25vcicKPj4gPj4+ICsgKiBAb3A6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFNQSSBtZW1vcnkgb3BlcmF0aW9uLiBvcC0+ZGF0YS5idWYgbXVzdCBiZSBETUEtYWJsZS4KPj4g
Pj4+ICsgKiBAcHJvdG86wqAgU1BJIHByb3RvY29sIHRvIHVzZSBmb3IgdGhlIHJlZ2lzdGVyIG9w
ZXJhdGlvbi4KPj4gPj4+ICsgKgo+PiA+Pj4gKyAqIFJldHVybjogemVybyBvbiBzdWNjZXNzLCAt
ZXJybm8gb3RoZXJ3aXNlCj4+ID4+PiArICovCj4+ID4+PiAraW50IHNwaV9ub3Jfd3JpdGVfcmVn
KHN0cnVjdCBzcGlfbm9yICpub3IsIHN0cnVjdCBzcGlfbWVtX29wICpvcCwKPj4gPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gc3BpX25vcl9wcm90b2NvbCBwcm90
bykKPj4gPj4+ICt7Cj4+ID4+PiArwqDCoMKgIGludCByZXQ7Cj4+ID4+PiArCj4+ID4+PiArwqDC
oMKgIGlmICghbm9yLT5zcGltZW0pCj4+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVPUE5PVFNVUFA7Cj4+ID4+PiArCj4+ID4+PiArwqDCoMKgIHJldCA9IHNwaV9ub3Jfd3Jp
dGVfZW5hYmxlKG5vcik7Cj4+ID4+PiArwqDCoMKgIGlmIChyZXQpCj4+ID4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiA+Pj4gK8KgwqDCoCBzcGlfbm9yX3NwaW1lbV9z
ZXR1cF9vcChub3IsIG9wLCBwcm90byk7Cj4+ID4+PiArwqDCoMKgIHJldHVybiBzcGlfbm9yX3Nw
aW1lbV9leGVjX29wKG5vciwgb3ApOwo+PiA+Cj4+ID4gQWZ0ZXIgc2VlaW5nIHlvdXIgbmV4dCB0
d28gcGF0Y2hlcy4gU2hvdWxkbid0IHRoZQo+PiA+IHNwaV9ub3Jfd2FpdF91bnRpbF9yZWFkeSgp
IGNhbGwgYmUgaGVyZSB0b28/Cj4+ID4KPj4gCj4+IEkgdGhvdWdodCBvZiB0aGlzIHRvbywgYnV0
IHNlZW1zIHRoYXQgZm9yIGEgcmVhc29uIHRoYXQgSSBkb24ndAo+PiByZW1lbWJlciwgd2UgZG9u
J3QgY2FsbCBmb3Igc3BpX25vcl93YWl0X3VudGlsX3JlYWR5IGFmdGVyIHdlCj4+IHdyaXRlIHRo
ZSBvY3RhbCBEVFIgYml0LiBQcmF0eXVzaCwgZG8geW91IHJlbWVtYmVyIHdoeT8KPiAKPiBXZSBh
cmUgbm90IHN1cmUgdGhlIHByb3RvY29sIGNoYW5nZWQgY29ycmVjdGx5IHNvIHdlIGNhbid0IHJl
bHkgb24KPiBzcGlfbm9yX3dhaXRfdW50aWxfcmVhZHkoKS4gV2UgcmVhZCB0aGUgSUQgaW5zdGVh
ZCB0byBiZSBzdXJlLgoKU28gYmVzaWRlcyB0aGUgZmFjdCB0aGF0IHRoZSB3cml0ZV9yZWcgb25s
eSB3b3JrcyB3aXRoIHRoZSAnY29ycmVjdCcKb3AgcGFyYW1ldGVyLCBpdCBpcyBhbHNvIHRhaWxv
cmVkIHRvIHRoZSBzcGVjaWFsIHVzZSBjYXNlLiBGb3IgcmVhbAp3cml0ZV9yZWcoKSwgdGhlIHVz
ZXIgd291bGQgYWN0dWFsbHkgaGFzIHRvIHBvbGwgdGhlIHN0YXR1cyBiaXQKYWZ0ZXJ3YXJkcz8g
OigKCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
