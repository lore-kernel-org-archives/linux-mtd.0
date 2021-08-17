Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCF5C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F0B60F41
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52F0B60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNiZLbWcl5Ji8JgfjYD9uZX/YzQbTXPw7JP8ATXeLIQ=; b=sQPxeCEnRcizCc
	mLZplPt/+sC0nN2JIELzWQoogDQQZD7dmE2ql8pJVHPCgVZTCu8wkQxKMStlYoVIxmjjjk1UEYrcg
	tHI8OZvVnDplwycg1KE7DD6XzDYFLrdllVpsHC/nVWx105qi/p/oyOw0Oi8cljb/F+OecnhQOxE6X
	LrPQz3MBbAPBjZLTavdolP9EikqN1Du2Ek6IdqZS8Ba1LljwmdFq/29FtP3dn5bAO5GR1hpcREJ+3
	TXLBke90IkPnsWFdQALwUG5KvegRFVZjCG9JAZq7OiA+z1LH3XoUjirfcgkAHEv56NgDu1hho660S
	j07Eki24biBRxasJu/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFwkl-002Ang-Cq; Tue, 17 Aug 2021 10:55:31 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFwkh-002An5-Tn
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 10:55:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CFB06240007;
 Tue, 17 Aug 2021 10:55:22 +0000 (UTC)
Date: Tue, 17 Aug 2021 12:55:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Evgeny Novikov <novikov@ispras.ru>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Kirill Shilimanov
 <kirill.shilimanov@huawei.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ldv-project@linuxtesting.org"
 <ldv-project@linuxtesting.org>, masonccyang@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: mxic: Enable and prepare clocks in probe
Message-ID: <20210817125521.487979b9@xps13>
In-Reply-To: <246f2094-e294-73f8-8a5f-3467e987f788@ispras.ru>
References: <20210812113800.12466-1-novikov@ispras.ru>
 <CAHp75VcgqZEHBTXpNApGfRkhgjpCvbgj+yxUZbbO+=0DOvZLQg@mail.gmail.com>
 <20210816100114.384f01b9@xps13>
 <246f2094-e294-73f8-8a5f-3467e987f788@ispras.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_035528_281541_E9B7D580 
X-CRM114-Status: GOOD (  30.89  )
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

SGkgRXZnZW55LAoKK01hc29uIGZyb20gTWFjcm9uaXgKCkV2Z2VueSBOb3Zpa292IDxub3Zpa292
QGlzcHJhcy5ydT4gd3JvdGUgb24gVHVlLCAxNyBBdWcgMjAyMSAxMzozNjowMworMDMwMDoKCj4g
SGkgTWlxdWVsLAo+IAo+IE9uIDE2LjA4LjIwMjEgMTE6MDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gPiBIaSBBbmR5LAo+ID4KPiA+IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdt
YWlsLmNvbT4gd3JvdGUgb24gVGh1LCAxMiBBdWcgMjAyMQo+ID4gMTU6MTM6MTAgKzAzMDA6Cj4g
PiAgCj4gPj4gT24gVGh1cnNkYXksIEF1Z3VzdCAxMiwgMjAyMSwgRXZnZW55IE5vdmlrb3YgPG5v
dmlrb3ZAaXNwcmFzLnJ1PiB3cm90ZToKPiA+PiAgCj4gPj4+IEl0IHNlZW1zIHRoYXQgbXhpY19u
ZmNfcHJvYmUoKSBtaXNzZWQgaW52b2NhdGlvbiBvZgo+ID4+PiBteGljX25mY19jbGtfZW5hYmxl
KCkuIFRoZSBwYXRjaCBmaXhlZCB0aGF0LiBJbiBhZGRpdGlvbiwgZXJyb3IgaGFuZGxpbmcKPiA+
Pj4gd2FzIHJlZmluZWQgYXBwcm9wcmlhdGVseS4gIAo+ID4+Cj4gPj4gTkFLLiBVbnRpbCB5b3Ug
cHJvdmlkZSBhIGRlZXBlciBhbmFseXNpcywgbGlrZSBob3cgdGhpcyB3b3JrcyBiZWZvcmUgeW91
cgo+ID4+IGNoYW5nZS4KPiA+Pgo+ID4+Cj4gPj4gUGxlYXNlLCBkb27igJl0IGJsaW5kbHkgZ2Vu
ZXJhdGUgcGF0Y2hlcywgdGhpcyBjYW4gZXZlbiB5b3VyIGJvdCBkbywganVzdAo+ID4+IHRoaW5r
IGFib3V0IGVhY2ggY2hhbmdlIGFuZCBwcmVmZXJhYmxlIHRlc3Qgb24gdGhlIHJlYWwgaGFyZHdh
cmUuCj4gPj4KPiA+PiBUaGUgYWJvdmUgaXMgdG8gYWxsIHlvdXIgbG92ZWx5IGNvbnRyaWJ1dGlv
bnMuCj4gPj4KPiA+PiAgCj4gPj4+IEZvdW5kIGJ5IExpbnV4IERyaXZlciBWZXJpZmljYXRpb24g
cHJvamVjdCAobGludXh0ZXN0aW5nLm9yZykuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEV2
Z2VueSBOb3Zpa292IDxub3Zpa292QGlzcHJhcy5ydT4KPiA+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBL
aXJpbGwgU2hpbGltYW5vdiA8a2lyaWxsLnNoaWxpbWFub3ZAaHVhd2VpLmNvbT4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogS2lyaWxsIFNoaWxpbWFub3YgPGtpcmlsbC5zaGlsaW1hbm92QGh1YXdlaS5j
b20+Cj4gPj4+IC0tLQo+ID4+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L214aWNfbmFuZC5jIHwg
MTYgKysrKysrKysrKysrLS0tLQo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbXhpY19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGljXwo+ID4+PiBu
YW5kLmMKPiA+Pj4gaW5kZXggZGExMDcwOTkzOTk0Li4zN2U3NWJmNjBlZTUgMTAwNjQ0Cj4gPj4+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L214aWNfbmFuZC5jCj4gPj4+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L214aWNfbmFuZC5jCj4gPj4+IEBAIC01MDksOSArNTA5LDE1IEBAIHN0
YXRpYyBpbnQgbXhpY19uZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+ID4+PiAqcGRl
dikKPiA+Pj4gICAgICAgICAgaWYgKElTX0VSUihuZmMtPnNlbmRfZGx5X2NsaykpCj4gPj4+ICAg
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobmZjLT5zZW5kX2RseV9jbGspOwo+ID4+Pgo+
ID4+PiArICAgICAgIGVyciA9IG14aWNfbmZjX2Nsa19lbmFibGUobmZjKTsKPiA+Pj4gKyAgICAg
ICBpZiAoZXJyKQo+ID4+PiArICAgICAgICAgICAgICAgcmV0dXJuIGVycjsgIAo+ID4gQXMgQW5k
eSBzYWlkLCB0aGlzIGlzIG5vdCBuZWVkZWQuCj4gPiAgCj4gPj4+ICsKPiA+Pj4gICAgICAgICAg
bmZjLT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+ID4+
PiAtICAgICAgIGlmIChJU19FUlIobmZjLT5yZWdzKSkKPiA+Pj4gLSAgICAgICAgICAgICAgIHJl
dHVybiBQVFJfRVJSKG5mYy0+cmVncyk7Cj4gPj4+ICsgICAgICAgaWYgKElTX0VSUihuZmMtPnJl
Z3MpKSB7Cj4gPj4+ICsgICAgICAgICAgICAgICBlcnIgPSBQVFJfRVJSKG5mYy0+cmVncyk7Cj4g
Pj4+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gPj4+ICsgICAgICAgfQo+ID4+Pgo+ID4+
PiAgICAgICAgICBuYW5kX2NoaXAgPSAmbmZjLT5jaGlwOwo+ID4+PiAgICAgICAgICBtdGQgPSBu
YW5kX3RvX210ZChuYW5kX2NoaXApOwo+ID4+PiBAQCAtNTI3LDggKzUzMywxMCBAQCBzdGF0aWMg
aW50IG14aWNfbmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiA+Pj4gKnBkZXYpCj4g
Pj4+ICAgICAgICAgIG5hbmRfY2hpcC0+Y29udHJvbGxlciA9ICZuZmMtPmNvbnRyb2xsZXI7Cj4g
Pj4+Cj4gPj4+ICAgICAgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gPj4+
IC0gICAgICAgaWYgKGlycSA8IDApCj4gPj4+IC0gICAgICAgICAgICAgICByZXR1cm4gaXJxOwo+
ID4+PiArICAgICAgIGlmIChpcnEgPCAwKSB7Cj4gPj4+ICsgICAgICAgICAgICAgICBlcnIgPSBp
cnE7Cj4gPj4+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWw7ICAKPiA+IEhvd2V2ZXIgc29tZSBy
ZXdvcmtpbmcgaXMgbmVlZGVkIGluIHRoZSBlcnJvciBwYXRoLgo+ID4KPiA+IFRoYXQgZ290byBz
dGF0ZW1lbnQgc2hvdWxkIGJlIHJlbmFtZWQgYW5kIGRldm1fcmVxdWVzdF9pcnEoKSBzaG91bGQg
bm90Cj4gPiBqdW1wIHRvIGl0Lgo+ID4gIAo+IAo+IFdlIHN0aWxsIG5lZWQgc29tZSBoZWxwIGFu
ZCBjbGFyaWZpY2F0aW9uIGZyb20gdGhvc2Ugd2hvIGFyZSB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhp
cyBzb3J0IG9mIGRyaXZlcnMgb3IvYW5kIGNhbiB0ZXN0IHRoaXMgcGFydGljdWxhciBkcml2ZXIu
IG14aWNfbmZjX2Nsa19lbmFibGUoKSBpcyB0aGUgY29tcGxlbWVudGFyeSBmdW5jdGlvbiBmb3Ig
bXhpY19uZmNfY2xrX2Rpc2FibGUoKS4gTm8gb3RoZXIgZnVuY3Rpb25zIGludm9rZSBjbGtfcHJl
cGFyZV9lbmFibGUoKS9jbGtfZGlzYWJsZV91bnByZXBhcmUoKSBpbiB0aGUgZHJpdmVyLiBVbmxp
a2VseSBzb21lYm9keSBpbiBpdHMgZW52aXJvbm1lbnQgZG9lcyB0aGF0IHNpbmNlIGRyaXZlciBz
cGVjaWZpYyBjbG9ja3MgYXJlIGRlYWx0IHdpdGguIEF0IHRoZSBtb21lbnQgdGhlIGRyaXZlciBp
bnZva2VzIG14aWNfbmZjX2Nsa19kaXNhYmxlKCkgb24gZXJyb3IgaGFuZGxpbmcgcGF0aHMgaW4g
cHJvYmUsIGluIHJlbW92ZSBhbmQgaW4gbXhpY19uZmNfc2V0X2ZyZXEoKS4gbXhpY19uZmNfY2xr
X2VuYWJsZSgpIGlzIGNhbGxlZCBqdXN0IGJ5IG14aWNfbmZjX3NldF9mcmVxKCkgdGhhdCBtb3Jl
b3ZlciBkb2VzIHRoaXMgYWZ0ZXIgY2FsbGluZyBteGljX25mY19jbGtfZGlzYWJsZSgpIGZpcnN0
LiBTbywgd2UgZGlkIG5vdCBmaW5kIGFueSBwbGFjZSBpbiB0aGUgZHJpdmVyIHRoYXQgaW52b2tl
cyBteGljX25mY19jbGtfZW5hYmxlKCkgcHJpb3IgdG8gbXhpY19uZmNfY2xrX2Rpc2FibGUoKS4g
QmFzaW5nIG9uIHRoaXMgd2UgYWRkZWQgbXhpY19uZmNfY2xrX2VuYWJsZSgpIGp1c3QgYWZ0ZXIg
Z2V0dGluZyBjbG9ja3MuIEFzIEkgZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cyBsYXJnZSBlLW1h
aWwsIHdlIG1heSBiZSB3cm9uZyBpbiBvdXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgZHJpdmVyIGVu
dmlyb25tZW50IG9yL2FuZCBhdCBzcGVjaWZpY2F0aW9uIG9mIHJlcXVpcmVtZW50cyBiZWluZyBj
aGVja2VkLiBJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3Ugd2lsbCBwb2ludCBvdXQgb24gb3VyIG1p
c3Rha2VzLgoKRW5hYmxpbmcgdGhlIGNsb2NrcyBzZWVtcyB0byBvbmx5IGJlIG5lZWRlZCB0byBh
Y2Nlc3MgdGhlIE5BTkQgZGV2aWNlCmFuZCBub3QgdGhlIHJlZ2lzdGVycyBvZiB0aGUgY29udHJv
bGxlci4gTWFzb24sIGlzIHRoaXMgc3RhdGVtZW50CnJpZ2h0PyBJZiB0aGlzIHN0YXRlbWVudCBp
cyB3cm9uZywgdGhlbiB5b3VyIHByb3Bvc2FsIGlzIG5vdCBlbnRpcmVseQp3cm9uZyBpbiB0aGUg
c2Vuc2UgdGhhdCB3ZSBtdXN0IGVuYWJsZSB0aGUgbWlzc2luZyBjbG9jayAqYmVmb3JlKgphY2Nl
c3NpbmcgYW55IHJlZ2lzdGVyLgoKT3RoZXJ3aXNlIGZvciB0aGUgdHdvIG90aGVyIGNsb2Nrcywg
d2UgZG9uJ3QgcmVhbGx5IGNhcmUgdG8gZW5hYmxlIHRoZW0KYmVmb3JlIHNldHRpbmcgdGhlIGFj
dHVhbCBmcmVxdWVuY3kgaW4gLT5zZXR1cF9pbnRlcmZhY2UoKSAoY2FsbGVkIGJ5Cm5hbmRfc2Nh
bigpKSBiZWNhdXNlIGF0IHRoaXMgcG9pbnQgd2UgZG9uJ3QgeWV0IGtub3cgd2hhdCB0aW1pbmcg
bW9kZQppcyBiZXN0LiBEaXNhYmxpbmcgdGhlIGNsb2NrIGlzIG5vdCBhbiBpc3N1ZSBldmVuIHRo
b3VnaCBpdCB3YXMgbm90CmVuYWJsZWQgaW4gdGhlIGZpc3QgcGxhY2UgYW55d2F5LgoKSW4gYWxs
IGNhc2VzLCB0aGUgZXJyb3IgcGF0aCBpcyB3cm9uZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
