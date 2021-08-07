Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B259C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:36:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE922608FC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE922608FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPWtdSManyB2DoFzdn3qevwxt0p9/TdPhDH1/N8LCyg=; b=C3V4oQgpiigBh2
	um9Q80/Xg4F0g4V/QwQUpaCOcnfAdiC5fcRJfMneoeRqB5PUgY9CKqUvq/qgKSqOVctkD81gUEu1/
	gguvFzLsEV2YX+4Tihn/qapXRc8kCEkgfQz9ztvOfBJVl/4LtqOviISOug2HtJ6/1hK5Ghl7EZzZD
	X/87DuOQ57HK5uv+/ekFr+9urH/L2XVfFNuGluRpAevgX3JHyS8/4ckP5sTQFb1oIxQgf7aik7j1k
	vGyUuUmLWvf/Cy426Mp3O74ci7FHx9GDqwe2V0PTtkdc5pYcaJSh70wmKmYd107Ktl0qKkIvB3M3a
	VO6esnfKThRPQVkdmNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCJgH-00EZzS-Tp; Sat, 07 Aug 2021 10:35:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCJgE-00EZyd-KI
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 10:35:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9C085C0002;
 Sat,  7 Aug 2021 10:35:48 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:35:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/4] mtd: rfd_ftl: add discard support
Message-ID: <20210807123547.5a50dbd9@xps13>
In-Reply-To: <20210807080633.GC2522@gofer.mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <cdc2b33790398d42f310af350298c1e781a50991.1626169090.git.sean@mess.org>
 <20210806201820.512beda8@xps13>
 <20210807080633.GC2522@gofer.mess.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_033550_850196_DC408ACF 
X-CRM114-Status: GOOD (  27.28  )
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

SGkgU2VhbiwKClNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFNhdCwgNyBBdWcg
MjAyMSAwOTowNjozMyArMDEwMDoKCj4gT24gRnJpLCBBdWcgMDYsIDIwMjEgYXQgMDg6MTg6MjBQ
TSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFNlYW4sCj4gPiAKPiA+IFNlYW4g
WW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIwMjEgMTA6NDQ6MDEg
KzAxMDA6Cj4gPiAgIAo+ID4gPiBJIHByb3Bvc2VkIHRoaXMgY2hhbmdlIDE2IHllYXJzIGFnbyBi
ZWZvcmUgZGlzY2FyZCB3YXMgYSBmZWF0dXJlIGluCj4gPiA+IHRoZSBibG9jayBsYXllcjogaHR0
cHM6Ly9sd24ubmV0L0FydGljbGVzLzE2Mjc3Ni8KPiA+ID4gCj4gPiA+IE5vdyB0aGF0IHRoZSBi
bG9jayBsYXllciBoYXMgZGlzY2FyZCwgd2UgY2FuIGZpbmFsbHkgbWVyZ2UgdGhpcyBjaGFuZ2Uu
ICAKPiA+IAo+ID4gQ2FuIHlvdSBleHBsYWluIHdoeSB0aGlzIGlzIG5lZWRlZCBoZXJlPyAgCj4g
Cj4gQmVjYXVzZSBkaXNjYXJkIGlzIGEgaHVnZSB3aW4uIFRoaXMgaXMgYWxzbyBrbm93biBhcyB0
cmltLgo+IAo+IEJ5IGltcGxlbWVudGluZyBkaXNjYXJkLCBib3RoIGZzdHJpbSBhbmQgdGhlIGRp
c2NhcmQgZmlsZXN5c3RlbSBvcHRpb24KPiBjYW4gYmUgdXNlZC4KPiAKPiBJbXBsZW1lbnRpbmcg
ZGlzY2FyZCBpbiB0aGUgZnRsIG1lYW5zIHRoYXQgd2hlbiBmaWxlcyBhcmUgcmVtb3ZlZCwgdGhl
cmUKPiBpcyBsZXNzIGRhdGEgaW4gdGhlIGZ0bCBtYXBwaW5nLiBUaGlzIG1lYW5zIGxlc3Mgc3R1
ZmYgdG8gbW92ZSBhcm91bmQgZm9yCj4gZXJhc2luZyBhbmQgYWxzbyBsZXNzIGVyYXNpbmcgdG8g
ZG8uIFRoaXMgbWVhbnMgYmV0dGVyIHdlYXIgbGV2ZWxsaW5nLgoKQW5kIHRoaXMgaXMgYSBnb29k
IGNvbW1pdCBtZXNzYWdlIGZvciB2MiA6LSkKCj4gCj4gVGhlcmUgaXMgYWxzbyBhIHdpa2lwZWRp
YSBwYWdlIG9uIHRyaW0gaGVyZToKPiAKPiAJaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kv
VHJpbV8oY29tcHV0aW5nKQoKR290IGl0LCB0aGFua3MhCgo+IAo+IFRoYW5rcywKPiAKPiBTZWFu
Cj4gCj4gPiAoYWxzbyBwbGVhc2UgYWRkIHRoZSBtYWludGFpbmVycyBpbiBDYzogZm9yIHRoZSB2
MikKPiA+ICAgCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+
Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvcmZkX2Z0bC5jIHwgMjkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCsp
Cj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcmZkX2Z0bC5jIGIvZHJpdmVy
cy9tdGQvcmZkX2Z0bC5jCj4gPiA+IGluZGV4IDdiMjQzZjJiMmZhMy4uN2Y1ZjZkMjQ3Y2FlIDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9yZmRfZnRsLmMKPiA+ID4gKysrIGIvZHJpdmVy
cy9tdGQvcmZkX2Z0bC5jCj4gPiA+IEBAIC03MDUsNiArNzA1LDM0IEBAIHN0YXRpYyBpbnQgcmZk
X2Z0bF93cml0ZXNlY3Qoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldiwgdV9sb25nIHNlY3Rv
ciwgY2hhciAqCj4gPiA+ICAJcmV0dXJuIHJjOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+ICtzdGF0
aWMgaW50IHJmZF9mdGxfZGlzY2FyZHNlY3Qoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldiwK
PiA+ID4gKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHNlY3RvciwgdW5zaWduZWQgaW50IG5yX3Nl
Y3RzKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBwYXJ0aXRpb24gKnBhcnQgPSAoc3RydWN0IHBh
cnRpdGlvbiAqKWRldjsKPiA+ID4gKwl1X2xvbmcgYWRkcjsKPiA+ID4gKwlpbnQgcmM7Cj4gPiA+
ICsKPiA+ID4gKwl3aGlsZSAobnJfc2VjdHMpIHsKPiA+ID4gKwkJaWYgKHNlY3RvciA+PSBwYXJ0
LT5zZWN0b3JfY291bnQpCj4gPiA+ICsJCQlyZXR1cm4gLUVJTzsKPiA+ID4gKwo+ID4gPiArCQlh
ZGRyID0gcGFydC0+c2VjdG9yX21hcFtzZWN0b3JdOwo+ID4gPiArCj4gPiA+ICsJCWlmIChhZGRy
ICE9IC0xKSB7Cj4gPiA+ICsJCQlyYyA9IG1hcmtfc2VjdG9yX2RlbGV0ZWQocGFydCwgYWRkcik7
Cj4gPiA+ICsJCQlpZiAocmMpCj4gPiA+ICsJCQkJcmV0dXJuIHJjOwo+ID4gPiArCj4gPiA+ICsJ
CQlwYXJ0LT5zZWN0b3JfbWFwW3NlY3Rvcl0gPSAtMTsKPiA+ID4gKwkJfQo+ID4gPiArCj4gPiA+
ICsJCXNlY3RvcisrOwo+ID4gPiArCQlucl9zZWN0cy0tOwo+ID4gPiArCX0KPiA+ID4gKwo+ID4g
PiArCXJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICBzdGF0aWMgaW50IHJmZF9mdGxf
Z2V0Z2VvKHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpkZXYsIHN0cnVjdCBoZF9nZW9tZXRyeSAq
Z2VvKQo+ID4gPiAgewo+ID4gPiAgCXN0cnVjdCBwYXJ0aXRpb24gKnBhcnQgPSAoc3RydWN0IHBh
cnRpdGlvbiopZGV2Owo+ID4gPiBAQCAtNzg2LDYgKzgxNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRk
X2Jsa3RyYW5zX29wcyByZmRfZnRsX3RyID0gewo+ID4gPiAgCj4gPiA+ICAJLnJlYWRzZWN0CT0g
cmZkX2Z0bF9yZWFkc2VjdCwKPiA+ID4gIAkud3JpdGVzZWN0CT0gcmZkX2Z0bF93cml0ZXNlY3Qs
Cj4gPiA+ICsJLmRpc2NhcmQJPSByZmRfZnRsX2Rpc2NhcmRzZWN0LAo+ID4gPiAgCS5nZXRnZW8J
CT0gcmZkX2Z0bF9nZXRnZW8sCj4gPiA+ICAJLmFkZF9tdGQJPSByZmRfZnRsX2FkZF9tdGQsCj4g
PiA+ICAJLnJlbW92ZV9kZXYJPSByZmRfZnRsX3JlbW92ZV9kZXYsICAKPiA+IAo+ID4gCj4gPiAK
PiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdAo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvICAKCgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
