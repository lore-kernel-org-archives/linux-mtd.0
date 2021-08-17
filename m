Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AA0C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 11:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07AC260FA0
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 11:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07AC260FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmv/NXLhTQHgL0uqEZESSabThwi7PcL4UqdTNz6kOuw=; b=rK0cJ5IJv3Nn0v
	VCI6uxkWSKt5xF7saP2auenayuwYG7mcejh7ibPlUqCn6XIBoXCkNHexBwrVGoEDej6ejYXQ1I0zz
	WO1ULDZZCyHRtjhD3UHGGiiPstjKGm7hwyNW4fNoESGnqgHJ0L4VYvykZ7WOqCiA5YT1fkUdcCaq2
	kn+8IqhkeOlP3jWoGnJGUO9L7iIiRjbZuS8evTYn8abVyJikwbq+hpCuhMxnzV+gGpzqnQb6vbdCE
	wV30kI86BLnSz0iWaYbvMAVed/eZ4+6Pigk0G6sXLqMUISLaLeMaPYTX3i3amgfrlJauA8s4T3Ok4
	LPYwgGXKY5WoLbE/i4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFwp6-002BHz-KW; Tue, 17 Aug 2021 11:00:00 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFwp2-002BHK-Ku
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 10:59:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AF36B60008;
 Tue, 17 Aug 2021 10:59:50 +0000 (UTC)
Date: Tue, 17 Aug 2021 12:59:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Evgeny Novikov <novikov@ispras.ru>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Kirill Shilimanov
 <kirill.shilimanov@huawei.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ldv-project@linuxtesting.org"
 <ldv-project@linuxtesting.org>, ycllin@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: mxic: Enable and prepare clocks in probe
Message-ID: <20210817125949.5bde9715@xps13>
In-Reply-To: <20210817125521.487979b9@xps13>
References: <20210812113800.12466-1-novikov@ispras.ru>
 <CAHp75VcgqZEHBTXpNApGfRkhgjpCvbgj+yxUZbbO+=0DOvZLQg@mail.gmail.com>
 <20210816100114.384f01b9@xps13>
 <246f2094-e294-73f8-8a5f-3467e987f788@ispras.ru>
 <20210817125521.487979b9@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_035957_009252_C836FA54 
X-CRM114-Status: GOOD (  34.94  )
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

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFR1ZSwg
MTcgQXVnIDIwMjEKMTI6NTU6MjEgKzAyMDA6Cgo+IEhpIEV2Z2VueSwKPiAKPiArTWFzb24gZnJv
bSBNYWNyb25peAoKTWFzb24ncyBlLW1haWwgYm91bmNlZCwgaW5jbHVkaW5nIFlvdUNoaW5nIGlu
IHRoZSBkaXNjdXNzaW9uIHdobyBtYXkKYWxzbyBoYXZlIGFuIGFuc3dlciBvciBwZXJoYXBzIGtu
b3dzIHdobyB0byBpbmNsdWRlIGluIHRoZSBkaXNjdXNzaW9uCihzZWUgYmVsb3cgZm9yIHRoZSBj
b250ZXh0IGFuZCBxdWVzdGlvbikuCgo+IAo+IEV2Z2VueSBOb3Zpa292IDxub3Zpa292QGlzcHJh
cy5ydT4gd3JvdGUgb24gVHVlLCAxNyBBdWcgMjAyMSAxMzozNjowMwo+ICswMzAwOgo+IAo+ID4g
SGkgTWlxdWVsLAo+ID4gCj4gPiBPbiAxNi4wOC4yMDIxIDExOjAxLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+ID4gPiBIaSBBbmR5LAo+ID4gPgo+ID4gPiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlIG9uIFRodSwgMTIgQXVnIDIwMjEKPiA+ID4gMTU6MTM6
MTAgKzAzMDA6Cj4gPiA+ICAKPiA+ID4+IE9uIFRodXJzZGF5LCBBdWd1c3QgMTIsIDIwMjEsIEV2
Z2VueSBOb3Zpa292IDxub3Zpa292QGlzcHJhcy5ydT4gd3JvdGU6Cj4gPiA+PiAgCj4gPiA+Pj4g
SXQgc2VlbXMgdGhhdCBteGljX25mY19wcm9iZSgpIG1pc3NlZCBpbnZvY2F0aW9uIG9mCj4gPiA+
Pj4gbXhpY19uZmNfY2xrX2VuYWJsZSgpLiBUaGUgcGF0Y2ggZml4ZWQgdGhhdC4gSW4gYWRkaXRp
b24sIGVycm9yIGhhbmRsaW5nCj4gPiA+Pj4gd2FzIHJlZmluZWQgYXBwcm9wcmlhdGVseS4gIAo+
ID4gPj4KPiA+ID4+IE5BSy4gVW50aWwgeW91IHByb3ZpZGUgYSBkZWVwZXIgYW5hbHlzaXMsIGxp
a2UgaG93IHRoaXMgd29ya3MgYmVmb3JlIHlvdXIKPiA+ID4+IGNoYW5nZS4KPiA+ID4+Cj4gPiA+
Pgo+ID4gPj4gUGxlYXNlLCBkb27igJl0IGJsaW5kbHkgZ2VuZXJhdGUgcGF0Y2hlcywgdGhpcyBj
YW4gZXZlbiB5b3VyIGJvdCBkbywganVzdAo+ID4gPj4gdGhpbmsgYWJvdXQgZWFjaCBjaGFuZ2Ug
YW5kIHByZWZlcmFibGUgdGVzdCBvbiB0aGUgcmVhbCBoYXJkd2FyZS4KPiA+ID4+Cj4gPiA+PiBU
aGUgYWJvdmUgaXMgdG8gYWxsIHlvdXIgbG92ZWx5IGNvbnRyaWJ1dGlvbnMuCj4gPiA+Pgo+ID4g
Pj4gIAo+ID4gPj4+IEZvdW5kIGJ5IExpbnV4IERyaXZlciBWZXJpZmljYXRpb24gcHJvamVjdCAo
bGludXh0ZXN0aW5nLm9yZykuCj4gPiA+Pj4KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBFdmdlbnkg
Tm92aWtvdiA8bm92aWtvdkBpc3ByYXMucnU+Cj4gPiA+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBLaXJp
bGwgU2hpbGltYW5vdiA8a2lyaWxsLnNoaWxpbWFub3ZAaHVhd2VpLmNvbT4KPiA+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBLaXJpbGwgU2hpbGltYW5vdiA8a2lyaWxsLnNoaWxpbWFub3ZAaHVhd2VpLmNv
bT4KPiA+ID4+PiAtLS0KPiA+ID4+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L214aWNfbmFuZC5j
IHwgMTYgKysrKysrKysrKysrLS0tLQo+ID4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+Pj4KPiA+ID4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbXhpY19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGlj
Xwo+ID4gPj4+IG5hbmQuYwo+ID4gPj4+IGluZGV4IGRhMTA3MDk5Mzk5NC4uMzdlNzViZjYwZWU1
IDEwMDY0NAo+ID4gPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L214aWNfbmFuZC5jCj4g
PiA+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhpY19uYW5kLmMKPiA+ID4+PiBAQCAt
NTA5LDkgKzUwOSwxNSBAQCBzdGF0aWMgaW50IG14aWNfbmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UKPiA+ID4+PiAqcGRldikKPiA+ID4+PiAgICAgICAgICBpZiAoSVNfRVJSKG5mYy0+
c2VuZF9kbHlfY2xrKSkKPiA+ID4+PiAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKG5m
Yy0+c2VuZF9kbHlfY2xrKTsKPiA+ID4+Pgo+ID4gPj4+ICsgICAgICAgZXJyID0gbXhpY19uZmNf
Y2xrX2VuYWJsZShuZmMpOwo+ID4gPj4+ICsgICAgICAgaWYgKGVycikKPiA+ID4+PiArICAgICAg
ICAgICAgICAgcmV0dXJuIGVycjsgIAo+ID4gPiBBcyBBbmR5IHNhaWQsIHRoaXMgaXMgbm90IG5l
ZWRlZC4KPiA+ID4gIAo+ID4gPj4+ICsKPiA+ID4+PiAgICAgICAgICBuZmMtPnJlZ3MgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gPiA+Pj4gLSAgICAgICBpZiAo
SVNfRVJSKG5mYy0+cmVncykpCj4gPiA+Pj4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KG5mYy0+cmVncyk7Cj4gPiA+Pj4gKyAgICAgICBpZiAoSVNfRVJSKG5mYy0+cmVncykpIHsKPiA+
ID4+PiArICAgICAgICAgICAgICAgZXJyID0gUFRSX0VSUihuZmMtPnJlZ3MpOwo+ID4gPj4+ICsg
ICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gPiA+Pj4gKyAgICAgICB9Cj4gPiA+Pj4KPiA+ID4+
PiAgICAgICAgICBuYW5kX2NoaXAgPSAmbmZjLT5jaGlwOwo+ID4gPj4+ICAgICAgICAgIG10ZCA9
IG5hbmRfdG9fbXRkKG5hbmRfY2hpcCk7Cj4gPiA+Pj4gQEAgLTUyNyw4ICs1MzMsMTAgQEAgc3Rh
dGljIGludCBteGljX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4gPiA+Pj4gKnBk
ZXYpCj4gPiA+Pj4gICAgICAgICAgbmFuZF9jaGlwLT5jb250cm9sbGVyID0gJm5mYy0+Y29udHJv
bGxlcjsKPiA+ID4+Pgo+ID4gPj4+ICAgICAgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRl
diwgMCk7Cj4gPiA+Pj4gLSAgICAgICBpZiAoaXJxIDwgMCkKPiA+ID4+PiAtICAgICAgICAgICAg
ICAgcmV0dXJuIGlycTsKPiA+ID4+PiArICAgICAgIGlmIChpcnEgPCAwKSB7Cj4gPiA+Pj4gKyAg
ICAgICAgICAgICAgIGVyciA9IGlycTsKPiA+ID4+PiArICAgICAgICAgICAgICAgZ290byBmYWls
OyAgCj4gPiA+IEhvd2V2ZXIgc29tZSByZXdvcmtpbmcgaXMgbmVlZGVkIGluIHRoZSBlcnJvciBw
YXRoLgo+ID4gPgo+ID4gPiBUaGF0IGdvdG8gc3RhdGVtZW50IHNob3VsZCBiZSByZW5hbWVkIGFu
ZCBkZXZtX3JlcXVlc3RfaXJxKCkgc2hvdWxkIG5vdAo+ID4gPiBqdW1wIHRvIGl0Lgo+ID4gPiAg
Cj4gPiAKPiA+IFdlIHN0aWxsIG5lZWQgc29tZSBoZWxwIGFuZCBjbGFyaWZpY2F0aW9uIGZyb20g
dGhvc2Ugd2hvIGFyZSB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhpcyBzb3J0IG9mIGRyaXZlcnMgb3Iv
YW5kIGNhbiB0ZXN0IHRoaXMgcGFydGljdWxhciBkcml2ZXIuIG14aWNfbmZjX2Nsa19lbmFibGUo
KSBpcyB0aGUgY29tcGxlbWVudGFyeSBmdW5jdGlvbiBmb3IgbXhpY19uZmNfY2xrX2Rpc2FibGUo
KS4gTm8gb3RoZXIgZnVuY3Rpb25zIGludm9rZSBjbGtfcHJlcGFyZV9lbmFibGUoKS9jbGtfZGlz
YWJsZV91bnByZXBhcmUoKSBpbiB0aGUgZHJpdmVyLiBVbmxpa2VseSBzb21lYm9keSBpbiBpdHMg
ZW52aXJvbm1lbnQgZG9lcyB0aGF0IHNpbmNlIGRyaXZlciBzcGVjaWZpYyBjbG9ja3MgYXJlIGRl
YWx0IHdpdGguIEF0IHRoZSBtb21lbnQgdGhlIGRyaXZlciBpbnZva2VzIG14aWNfbmZjX2Nsa19k
aXNhYmxlKCkgb24gZXJyb3IgaGFuZGxpbmcgcGF0aHMgaW4gcHJvYmUsIGluIHJlbW92ZSBhbmQg
aW4gbXhpY19uZmNfc2V0X2ZyZXEoKS4gbXhpY19uZmNfY2xrX2VuYWJsZSgpIGlzIGNhbGxlZCBq
dXN0IGJ5IG14aWNfbmZjX3NldF9mcmVxKCkgdGhhdCBtb3Jlb3ZlciBkb2VzIHRoaXMgYWZ0ZXIg
Y2FsbGluZyBteGljX25mY19jbGtfZGlzYWJsZSgpIGZpcnN0LiBTbywgd2UgZGlkIG5vdCBmaW5k
IGFueSBwbGFjZSBpbiB0aGUgZHJpdmVyIHRoYXQgaW52b2tlcyBteGljX25mY19jbGtfZW5hYmxl
KCkgcHJpb3IgdG8gbXhpY19uZmNfY2xrX2Rpc2FibGUoKS4gQmFzaW5nIG9uIHRoaXMgd2UgYWRk
ZWQgbXhpY19uZmNfY2xrX2VuYWJsZSgpIGp1c3QgYWZ0ZXIgZ2V0dGluZyBjbG9ja3MuIEFzIEkg
ZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cyBsYXJnZSBlLW1haWwsIHdlIG1heSBiZSB3cm9uZyBp
biBvdXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgZHJpdmVyIGVudmlyb25tZW50IG9yL2FuZCBhdCBz
cGVjaWZpY2F0aW9uIG9mIHJlcXVpcmVtZW50cyBiZWluZyBjaGVja2VkLiBJdCB3b3VsZCBiZSBn
cmVhdCBpZiB5b3Ugd2lsbCBwb2ludCBvdXQgb24gb3VyIG1pc3Rha2VzLgo+IAo+IEVuYWJsaW5n
IHRoZSBjbG9ja3Mgc2VlbXMgdG8gb25seSBiZSBuZWVkZWQgdG8gYWNjZXNzIHRoZSBOQU5EIGRl
dmljZQo+IGFuZCBub3QgdGhlIHJlZ2lzdGVycyBvZiB0aGUgY29udHJvbGxlci4gTWFzb24sIGlz
IHRoaXMgc3RhdGVtZW50Cj4gcmlnaHQ/IElmIHRoaXMgc3RhdGVtZW50IGlzIHdyb25nLCB0aGVu
IHlvdXIgcHJvcG9zYWwgaXMgbm90IGVudGlyZWx5Cj4gd3JvbmcgaW4gdGhlIHNlbnNlIHRoYXQg
d2UgbXVzdCBlbmFibGUgdGhlIG1pc3NpbmcgY2xvY2sgKmJlZm9yZSoKPiBhY2Nlc3NpbmcgYW55
IHJlZ2lzdGVyLgo+IAo+IE90aGVyd2lzZSBmb3IgdGhlIHR3byBvdGhlciBjbG9ja3MsIHdlIGRv
bid0IHJlYWxseSBjYXJlIHRvIGVuYWJsZSB0aGVtCj4gYmVmb3JlIHNldHRpbmcgdGhlIGFjdHVh
bCBmcmVxdWVuY3kgaW4gLT5zZXR1cF9pbnRlcmZhY2UoKSAoY2FsbGVkIGJ5Cj4gbmFuZF9zY2Fu
KCkpIGJlY2F1c2UgYXQgdGhpcyBwb2ludCB3ZSBkb24ndCB5ZXQga25vdyB3aGF0IHRpbWluZyBt
b2RlCj4gaXMgYmVzdC4gRGlzYWJsaW5nIHRoZSBjbG9jayBpcyBub3QgYW4gaXNzdWUgZXZlbiB0
aG91Z2ggaXQgd2FzIG5vdAo+IGVuYWJsZWQgaW4gdGhlIGZpc3QgcGxhY2UgYW55d2F5Lgo+IAo+
IEluIGFsbCBjYXNlcywgdGhlIGVycm9yIHBhdGggaXMgd3JvbmcuCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
