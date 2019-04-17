Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10298C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3AB820835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVeOI7Eu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3AB820835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsX+KzraxO/1Ea3fJuwNbU6vr7hzvU9kQA4xkwjibek=; b=GVeOI7EuF1rwxq
	eDW417JcjiYa+SZSFChkOdyCuV12IBIetNqcpsQ533KDWjW73aQIU8QJP347m6P3036W8dConUiR9
	NAzWkFoZnK/D1Fa3jHj1s4BMBb40GQdDgZn4fp3NH9jChGNTaewBTO40KSmK/SXlturqMPeVOyWPU
	IXt9cuLQ6GDEDvQCanC1xrg5NFre4YtqBiOmixYlwLfFBoWC2TdAde/uJCYq1yQnjqmbfWqFMl7e2
	8LR6GVtPdsAvTKdbfqx6TJpOyRNRqeyds0QSs+YCJ9Cudf3qLeBoTsqr33jEj9Ap3jzGYBHDZ1Dt7
	fEypjU1bm0mPJntQVi/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhR6-0008CV-6i; Wed, 17 Apr 2019 10:05:00 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhR3-0008C8-0T
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:04:58 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1B4504000F;
 Wed, 17 Apr 2019 10:04:41 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:04:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 2/7] mtd: onenand: Store bad block marker position in
 chip struct
Message-ID: <20190417120441.119ae33e@xps13>
In-Reply-To: <71f425a5-4028-1a8a-26db-b4b0860326dc@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-3-frieder.schrempf@kontron.de>
 <20190304115853.35216632@xps13>
 <71f425a5-4028-1a8a-26db-b4b0860326dc@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_030457_371509_2ECE4320 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gVGh1LCAyMSBNYXIKMjAxOSAwODo0Nzo1MiArMDAwMDoKCj4gT24gMDQuMDMu
MTkgMTE6NTgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmllZGVyLAo+ID4gCj4gPiBT
Y2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdyb3RlIG9uIE1v
biwgMTggRmViCj4gPiAyMDE5IDEwOjQyOjQxICswMDAwOgo+ID4gICAKPiA+PiBGcm9tOiBGcmll
ZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4gPj4KPiA+PiBUaGUg
aW5mb3JtYXRpb24gYWJvdXQgd2hlcmUgdGhlIG1hbnVmYWN0dXJlciBwdXRzIHRoZSBiYWQgYmxv
Y2sKPiA+PiBtYXJrZXJzIGluc2lkZSB0aGUgYmFkIGJsb2NrIGFuZCBpbiB0aGUgT09CIGRhdGEg
aXMgc3RvcmVkIGluCj4gPj4gZGlmZmVyZW50IHBsYWNlcy4gTGV0J3MgbW92ZSB0aGlzIGluZm9y
bWF0aW9uIHRvIHRoZSBjaGlwIHN0cnVjdCwKPiA+PiBhcyB3ZSBkaWQgaXQgZm9yIHJhd25hbmQu
Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJl
bXBmQGtvbnRyb24uZGU+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQv
b25lbmFuZF9iYXNlLmMgfCA1ICsrKystCj4gPj4gICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQv
b25lbmFuZF9iYnQuYyAgfCAzIC0tLQo+ID4+ICAgaW5jbHVkZS9saW51eC9tdGQvb25lbmFuZC5o
ICAgICAgICAgICAgIHwgMyArKysKPiA+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVu
YW5kX2Jhc2UuYwo+ID4+IGluZGV4IDRjYTRiMTk0ZTdkNy4uZjQxZDc2MjQ4NTUwIDEwMDY0NAo+
ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+ID4+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+ID4+IEBAIC0yNDU4
LDcgKzI0NTgsNyBAQCBzdGF0aWMgaW50IG9uZW5hbmRfZGVmYXVsdF9ibG9ja19tYXJrYmFkKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzKQo+ID4+ICAgICAgICAgICAgICAgICAgIGJi
bS0+YmJ0W2Jsb2NrID4+IDJdIHw9IDB4MDEgPDwgKChibG9jayAmIDB4MDMpIDw8IDEpOwo+ID4+
ICAgCj4gPj4gICAgICAgICAgIC8qIFdlIHdyaXRlIHR3byBieXRlcywgc28gd2UgZG9uJ3QgaGF2
ZSB0byBtZXNzIHdpdGggMTYtYml0IGFjY2VzcyAqLwo+ID4+IC0gICAgICAgIG9mcyArPSBtdGQt
Pm9vYnNpemUgKyAoYmJtLT5iYWRibG9ja3BvcyAmIH4weDAxKTsKPiA+PiArICAgICAgICBvZnMg
Kz0gbXRkLT5vb2JzaXplICsgKHRoaXMtPmJhZGJsb2NrcG9zICYgfjB4MDEpOwo+ID4+ICAgCS8q
IEZJWE1FIDogV2hhdCB0byBkbyB3aGVuIG1hcmtpbmcgU0xDIGJsb2NrIGluIHBhcnRpdGlvbgo+
ID4+ICAgCSAqIAkgICB3aXRoIE1MQyBlcmFzZXNpemU/IEZvciBub3csIGl0IGlzIG5vdCBhZHZp
c2FibGUgdG8KPiA+PiAgIAkgKgkgICBjcmVhdGUgcGFydGl0aW9ucyBjb250YWluaW5nIGJvdGgg
U0xDIGFuZCBNTEMgcmVnaW9ucy4KPiA+PiBAQCAtMzk2Nyw2ICszOTY3LDkgQEAgaW50IG9uZW5h
bmRfc2NhbihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IG1heGNoaXBzKQo+ID4+ICAgCWlmICgh
KHRoaXMtPm9wdGlvbnMgJiBPTkVOQU5EX1NLSVBfSU5JVElBTF9VTkxPQ0tJTkcpKQo+ID4+ICAg
CQl0aGlzLT51bmxvY2tfYWxsKG10ZCk7Cj4gPj4gICAKPiA+PiArCS8qIFNldCB0aGUgYmFkIGJs
b2NrIG1hcmtlciBwb3NpdGlvbiAqLwo+ID4+ICsJdGhpcy0+YmFkYmxvY2twb3MgPSBPTkVOQU5E
X0JBREJMT0NLX1BPUzsKPiA+PiArCj4gPj4gICAJcmV0ID0gdGhpcy0+c2Nhbl9iYnQobXRkKTsK
PiA+PiAgIAlpZiAoKCFGTEVYT05FTkFORCh0aGlzKSkgfHwgcmV0KQo+ID4+ICAgCQlyZXR1cm4g
cmV0Owo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9i
YnQuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2JidC5jCj4gPj4gaW5kZXgg
ZGRlMjA0ODc5MzdkLi41N2MzMWM4MWJlMTggMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMKPiA+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL29u
ZW5hbmQvb25lbmFuZF9iYnQuYwo+ID4+IEBAIC0xOTAsOSArMTkwLDYgQEAgc3RhdGljIGludCBv
bmVuYW5kX3NjYW5fYmJ0KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9iYnRfZGVz
Y3IgKmJkKQo+ID4+ICAgCWlmICghYmJtLT5iYnQpCj4gPj4gICAJCXJldHVybiAtRU5PTUVNOwo+
ID4+ICAgCj4gPj4gLQkvKiBTZXQgdGhlIGJhZCBibG9jayBwb3NpdGlvbiAqLwo+ID4+IC0JYmJt
LT5iYWRibG9ja3BvcyA9IE9ORU5BTkRfQkFEQkxPQ0tfUE9TOwo+ID4+IC0KPiA+PiAgIAkvKiBT
ZXQgZXJhc2Ugc2hpZnQgKi8KPiA+PiAgIAliYm0tPmJidF9lcmFzZV9zaGlmdCA9IHRoaXMtPmVy
YXNlX3NoaWZ0Owo+ID4+ICAgCj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL29u
ZW5hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmQuaAo+ID4+IGluZGV4IDBhYWE5OGIy
MTlhNC4uZTAzYWVhN2Y3ZTYxIDEwMDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL29u
ZW5hbmQuaAo+ID4+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmQuaAo+ID4+IEBAIC05
NCw2ICs5NCw3IEBAIHN0cnVjdCBvbmVuYW5kX2NoaXAgewo+ID4+ICAgCXVuc2lnbmVkIGludAkJ
dGVjaG5vbG9neTsKPiA+PiAgIAl1bnNpZ25lZCBpbnQJCWRlbnNpdHlfbWFzazsKPiA+PiAgIAl1
bnNpZ25lZCBpbnQJCW9wdGlvbnM7Cj4gPj4gKwlpbnQJCQliYWRibG9ja3BvczsgIAo+ID4gCj4g
PiBBbnkgcmVhc29uIG5vdCB0byB1bnNpZ24gdGhpcyBmaWVsZD8gIAo+IAo+IEl0IHdhcyBzaWdu
ZWQgc28gZmFyLCBidXQgeW91J3JlIHJpZ2h0IHRoYXQgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byAK
PiB1bnNpZ24gaXQuCgpXaXRoIHRoaXMgYWRkcmVzc2VkIHBsZWFzZSBhZGQgbXk6CgpSZXZpZXdl
ZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
