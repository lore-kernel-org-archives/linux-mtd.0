Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FABC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 07:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7AM6nAU5Fg5vZmew0bQVSn3aLmB7LrjirikSWE2TGw=; b=15x4z4PwA2/UHd
	zHnEWDc1o6E1eBNeu+2ww4myxAqDvxEOqZYIT++ejrF3Vxli8vLd18FBjy04Ru8DjLotcmXL///uQ
	UpmRCCfGom/z/+mPBC39dN2gsqClgwqXfmJyE7Iy1m4pT71h/O1l2JjEqSJ8Vd/C2x63VJbiLT85A
	YWlnBbT3lX0siKbS6fTRNn5eqRJUKlY7siLbFksAwT6JaSe4VYH6Ygt2kEeSBBPEqM5DPRJNQ/iBV
	betgPl23WQ8LNzwb4GN7sD6ydDDoP5g4USo0bq6uDDcDA9Fx0qXXCjDvAzQZiGQm+Tf8FKBY13n7E
	aYnrVsrOV4dFxJa4gKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrxRC-003tK5-LS; Tue, 30 Nov 2021 07:20:26 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrxR9-003tJK-Qx
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 07:20:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 15A6FE0005;
 Tue, 30 Nov 2021 07:20:18 +0000 (UTC)
Date: Tue, 30 Nov 2021 08:20:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olga Kitaina <okitain@gmail.com>
Cc: linux-mtd@lists.infradead.org, nagasure@xilinx.com, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Message-ID: <20211130082017.1400f24b@xps13>
In-Reply-To: <3da5dff5-53d4-15db-075d-9b195f2f75dd@gmail.com>
References: <20211127180758.30884-1-okitain@gmail.com>
 <20211129095559.01aa63a6@xps13>
 <3da5dff5-53d4-15db-075d-9b195f2f75dd@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_232024_176236_8FBBE6E0 
X-CRM114-Status: GOOD (  36.23  )
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

SGkgT2xnYSwKCm9raXRhaW5AZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMjkgTm92IDIwMjEgMjE6
MDY6MDUgKzAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAyOS4xMS4yMDIxIDExOjU1LCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgT2xnYSwKPiA+IAo+ID4gUGxlYXNlIGFkZCBhbGwgdGhl
IE1URCBtYWludGFpbmVycyBpbiBjb3B5LCBhcyByZXF1ZXN0ZWQgYnkKPiA+IGdldF9tYWludGFp
bmVycy5wbC4KPiA+IAo+ID4gb2tpdGFpbkBnbWFpbC5jb20gd3JvdGUgb24gU2F0LCAyNyBOb3Yg
MjAyMSAyMTowNzo1OAo+ID4gKzAzMDA6Cj4gPiAgIAo+ID4+IEFjY29yZGluZyB0byB0aGUgQXJh
c2FuIE5BTkQgY29udHJvbGxlciBzcGVjLAo+ID4+IHRoZSBmbGFzaCBjbG9jayByYXRlIGZvciBT
RFIgbXVzdCBiZSA8PSAxMDAgTUh6LAo+ID4+IHdoaWxlIGZvciBOVi1ERFIgaXQgbXVzdCBiZSB0
aGUgc2FtZSBhcyB0aGUgcmF0ZQo+ID4+IG9mIHRoZSBDTEsgbGluZSBmb3IgdGhlIG1vZGUuICAK
PiA+IAo+ID4gSSBjb21wbGV0ZWx5IG1pc3NlZCB0aGF0LCB3aGVyZSBkaWQgeW91IGdldCB0aGUg
aW5mb3JtYXRpb24/ICAKPiAKPiBUaGUgIkRhdGEgSW50ZXJmYWNlIFRyYW5zaXRpb25zIiBjaGFw
dGVyIG9mIHRoZSBzcGVjIGNvbnRhaW5zIHRpbWluZ3MgZm9yIGZsYXNoIGNsb2NrIHNldHVwIGlu
IE5WLUREUgo+IGFuZCBOVi1ERFIyIG1vZGVzLiBUaGUgInRpbWUgcGVyaW9kIiBvZiB0aG9zZSBj
bG9ja3MgaXMgZXF1YWwgdG8gdENLIGluIE5WLUREUiBhbmQgdFJDIGluIE5WLUREUjIuCj4gCj4g
VGhlIHNhbWUgY2hhcHRlciBzaG91bGQgaGF2ZSBpbmZvcm1hdGlvbiBhYm91dCBuZWNlc3Nhcnkg
c3RlcHMgdG8gc3dpdGNoIGZyb20gTlYtRERSIHRvIFNEUiwKPiB3aGljaCBpbmNsdWRlcyBzZXR0
aW5nIHRoZSBmbGFzaCBjbG9jayB0byAxMDAgTUh6Lgo+IAo+IAo+IEp1c3QgdG8gbWFrZSBzdXJl
IGknbSBub3Qgc2hvb3RpbmcgbXlzZWxmIGluIHRoZSBmb290OiBhbSBJIGNoYW5naW5nIHRoZSBy
aWdodCBjbG9jaz8KPiBUaGUgZG9jdW1lbnRhdGlvbiBwb2ludHMgb3V0IHRoYXQgd2UgaGF2ZSB0
byBjaGFuZ2UgZmxhc2hfY2xrLCB3aGljaCBpIHRob3VnaHQgd2FzCj4gbmZjLT5jb250cm9sbGVy
X2NsayBhbmQgc2V0IHVwIGJ5IGFuYW5kLT5jbGssIGJ1dCBpdCBzZWVtcyBsaWtlIGl0IG1pZ2h0
IGFjdHVhbGx5IGJlIG5mYy0+YnVzX2Nsay4KCkkgYmVsaWV2ZSBJIG1hZGUgYSBzZXJpb3VzIG1p
c3Rha2UsIHJlLXJlYWRpbmcgdGhlIGNvZGUgaXQgZmVlbHMgbGlrZQpJJ20gY2hhbmdpbmcgdGhl
IHN5c3RlbSdzIGNsb2NrICh3aGljaCBiYXNpY2FsbHkgY2hhbmdlcyBub3RoaW5nIGluIG91cgpj
YXNlKSBpbnN0ZWFkIG9mIGNoYW5naW5nIHRoZSBOQU5EIGJ1cyBjbG9jay4KCj4gSW4gdGhhdCBj
YXNlLCBkb2VzIHNldHRpbmcgbmZjLT5jb250cm9sbGVyX2NsayB0byAxMDAgTUh6IGJ5IGRlZmF1
bHQgbWFrZSBzZW5zZT8KPiBUaGVyZSBpc24ndCBhIGhhcmQgbGltaXQgb24gd2hhdCB0aGUgc3lz
dGVtIGNsb2NrIG1pZ2h0IGJlIChiZXlvbmQgYSBzcGVjaWZpYyBTb0MpLAo+IGJ1dCB0aGVyZSBh
cmUgdGltaW5nIHJlcXVpcmVtZW50cyBmb3IgdGhlIGZsYXNoIGNsb2NrLCBhbmQgc28gc2V0dGlu
ZyBhIHNwZWNpZmljIAo+IHN5c3RlbSBjbG9jayBmcmVxdWVuY3kgc2VlbXMgdW5uZWNlc3Nhcnkg
Zm9yIG1vc3QgZGV2aWNlcy4KPiAKClBsZWFzZSBjcmVhdGUgYSB0d28tcGF0Y2ggc2VyaWVzOgox
LSBTZXR0aW5nIHRoZSByaWdodCBjbG9jayBpbiB0aGUgY3VycmVudCBjb2RlIGJhc2UgKGludmVy
dGluZyBidXNfY2xrCmFuZCBjb250cm9sbGVyX2NsayB3aGVyZSByZWxldmFudCwgc2V0dGluZyBv
bmUgdG8gMTAwTUh6IGFuZCBsZXR0aW5nCnRoZSBvdGhlciBhcyBpdCBpcykKMi0gQ2hhbmdpbmcg
dGhlIGRlZmF1bHQgTlYtRERSIHJhdGUgYmFzZWQgb24gdENLIChiZWxvdyBwYXRjaCkuCgpEbyB5
b3UgaGF2ZSB0aGUgbmVjZXNzYXJ5IGhhcmR3YXJlIGZvciB0ZXN0aW5nPwogCj4gPj4gVGhlIGRy
aXZlciBwcmV2aW91c2x5IGFsd2F5cyBzZXQgMTAwIE1IeiBmb3IgTlYtRERSLCB3aGljaAo+ID4+
IHdvdWxkIHJlc3VsdCBpbiBpbmNvcnJlY3QgYmVoYXZpb3IgZm9yIE5WLUREUiBtb2RlcyAwLTQu
Cj4gPj4KPiA+PiBUaGUgYXBwcm9wcmlhdGUgY2xvY2sgcmF0ZSBjYW4gYmUgY2FsY3VsYXRlZAo+
ID4+IGZyb20gdGhlIE5WLUREUiB0aW1pbmcgcGFyYW1ldGVycyBhcyAxL3RDSywgb3IgZm9yIHJh
dGVzCj4gPj4gbWVhc3VyZWQgaW4gcGljb3NlY29uZHMsIDEwXjEyIC8gbmFuZF9udmRkcl90aW1p
bmdzLT50Q0tfbWluLgo+ID4+ICAKPiA+IAo+ID4gWW91IG5lZWQgYSBjb3VwbGUgb2YgRml4ZXMg
KyBDYzogc3RhYmxlIHRhZ3MgaGVyZSwgb3RoZXJ3aXNlIHRoZQo+ID4gcGF0Y2ggbG9va3MgZ29v
ZCB0byBtZS4KPiA+ICAgCj4gCj4gV2lsbCBpbmNsdWRlIGluIHRoZSBuZXh0IGl0ZXJhdGlvbiBv
ZiB0aGUgcGF0Y2gsIHRoYW5rIHlvdS4KPiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBPbGdhIEtpdGFp
bmEgPG9raXRhaW5AZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCA4ICsrKysrKystCj4gPj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPiA+PiBpbmRleCA1M2JkMTA3
Mzg0MTguLmVkNGVlOTk0MjQ0MSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPiA+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPiA+PiBAQCAtMTgsNiArMTgsNyBAQAo+ID4+ICAj
aW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ID4+ICAjaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+Cj4gPj4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPiA+PiArI2luY2x1ZGUg
PGxpbnV4L21hdGg2NC5oPgo+ID4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPj4gICNp
bmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+Cj4gPj4gICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0
aW9ucy5oPgo+ID4+IEBAIC0xMDQzLDcgKzEwNDQsMTIgQEAgc3RhdGljIGludCBhbmZjX3NldHVw
X2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgdGFyZ2V0LAo+ID4+ICAJCQkJ
IERRU19CVUZGX1NFTF9PVVQoZHFzX21vZGUpOwo+ID4+ICAJfQo+ID4+ICAKPiA+PiAtCWFuYW5k
LT5jbGsgPSBBTkZDX1hMTlhfU0RSX0RGTFRfQ09SRV9DTEs7Cj4gPj4gKwlpZiAobmFuZF9pbnRl
cmZhY2VfaXNfc2RyKQo+ID4+ICsJCWFuYW5kLT5jbGsgPSBBTkZDX1hMTlhfU0RSX0RGTFRfQ09S
RV9DTEs7Cj4gPj4gKwllbHNlCj4gPj4gKwkJLyogT05GSSB0aW1pbmdzIGFyZSBkZWZpbmVkIGlu
IHBpY29zZWNvbmRzICovCj4gPj4gKwkJYW5hbmQtPmNsayA9IGRpdl91NjQoKHU2NClOU0VDX1BF
Ul9TRUMgKiAxMDAwLAo+ID4+ICsJCQkJICAgICBjb25mLT50aW1pbmdzLm52ZGRyLnRDS19taW4p
Owo+ID4+ICAKPiA+PiAgCS8qCj4gPj4gIAkgKiBEdWUgdG8gYSBoYXJkd2FyZSBidWcgaW4gdGhl
IFp5bnFNUCBTb0MsIFNEUiB0aW1pbmcgbW9kZXMgMC0xIHdvcmsKPiA+Pgo+ID4+IGJhc2UtY29t
bWl0OiBmNTNkNGMxMDlhNjY2YmYxYTQ4ODNiNDVkNTQ2ZmJhMDc5MjU4NzE3ICAKPiA+IAo+ID4g
Cj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsCj4gPiAgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
