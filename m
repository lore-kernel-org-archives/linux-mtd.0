Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A19C00A89
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 09:06:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 301AC2067B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 09:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wMDk/2qx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 301AC2067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XTNYHbw9r4O09EA7Usi3yTagd4i/QzFl/3p8CVrvW8Y=; b=wMDk/2qxG39i99YzYH/f2YEIB
	z6vvkjZJh2W+aq+K7+xx/BKKicfSWDCZGu5Cbky5rGnK8GQYaKLl42czeB2sCoHh9tR/EFCj0Ysoj
	OsLnJffzXfpUlWffu31BFsGJVjHmQMbNn50VhFXXTC6c0eOwbCax4pDAFCt4k6lU5q1UYjIi5rIQU
	pANH0PXFJw4sDWk/jfOsdy9eePITyYFSNwYr/jFipkTp3HtSOn8OB8RT66Or4fN1EJ38ThsZ7S7hr
	puWm4E8ddmcgeTX/8Ya3dekr7TXZdB1bIjBWc+FHj5B/3fRsxn2gDvXnvUbAWMRrJ3inrCV+wuEbN
	OcBclzmlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kabBq-0006xm-Oc; Thu, 05 Nov 2020 09:04:18 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabBn-0006xC-Uy
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 09:04:17 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRcyg3tSqz9vCyj;
 Thu,  5 Nov 2020 10:04:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uIyHmrE6a39O; Thu,  5 Nov 2020 10:04:11 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRcyg2vq6z9vCyV;
 Thu,  5 Nov 2020 10:04:11 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 89119D5F; Thu,  5 Nov 2020 10:06:51 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Thu, 05 Nov 2020 10:06:51 +0100
Date: Thu, 05 Nov 2020 10:06:51 +0100
Message-ID: <20201105100651.Horde.jOAklfLApjH2WjmauwW9Gg1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to
 d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing
 bits"))
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
 <20201104183859.590f0806@xps13>
 <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
 <20201105084939.72ea6bfd@xps13>
In-Reply-To: <20201105084939.72ea6bfd@xps13>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_040416_255734_028E176E 
X-CRM114-Status: GOOD (  23.09  )
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ClF1b3RpbmcgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cgo+IEhp
IENocmlzdG9waGUsCj4KPiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+IHdyb3RlIG9uIFdlZCwgNCBOb3YgMjAyMAo+IDE5OjM3OjU3ICswMTAwOgo+Cj4+IEhp
IE1pcXVlbCwKPj4KPj4gTGUgMDQvMTEvMjAyMCDDoCAxODozOCwgTWlxdWVsIFJheW5hbCBhIMOp
Y3JpdMKgOgo+PiA+IEhpIENocmlzdG9waGUsCj4+ID4KPj4gPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlIG9uIFdlZCwgMDQgTm92Cj4+ID4gMjAy
MCAxODozMzo1MyArMDEwMDoKPj4gPgo+PiA+PiBIaSBNaXF1ZWwsCj4+ID4+Cj4+ID4+IEknbSB1
bmFibGUgdG8gYm9vdCA1LjEwLXJjMSBvbiBteSBib2FyZHMuIEkgZ2V0IHRoZSBmb2xsb3dpbmcg
ZXJyb3I6Cj4+ID4+Cj4+ID4+IFsgICAgNC4xMjU4MTFdIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFu
dWZhY3R1cmVyIElEOiAweGFkLCBDaGlwIElEOiAweDc2Cj4+ID4+IFsgICAgNC4xMzE5OTJdIG5h
bmQ6IEh5bml4IE5BTkQgNjRNaUIgMywzViA4LWJpdAo+PiA+PiBbICAgIDQuMTM2MTczXSBuYW5k
OiA2NCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTYgS2lCLCBwYWdlIHNpemU6ICAKPj4gNTEyLCBP
T0Igc2l6ZTogMTYKPj4gPj4gWyAgICA0LjE0MzUzNF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBd
LS0tLS0tLS0tLS0tCj4+ID4+IFsgICAgNC4xNDc5MzRdIFVuc3VwcG9ydGVkIEVDQyBhbGdvcml0
aG0hCj4+ID4+IFsgICAgNC4xNTIxNDJdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEgYXQgIAo+PiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYzo1MjQ0ICAKPj4gbmFuZF9zY2FuX3dpdGhf
aWRzKzB4MTI2MC8weDE2NDAKPj4gPj4gLi4uCj4+ID4+IFsgICAgNC4zMzIwNTJdIC0tLVsgZW5k
IHRyYWNlIGUzYTM2ZjYyY2FlNGFjNTYgXS0tLQo+PiA+PiBbICAgIDQuMzM2ODgyXSBncGlvLW5h
bmQ6IHByb2JlIG9mIGMwMDAwMDAwLm5hbmQgZmFpbGVkIHdpdGggZXJyb3IgLTIyCj4+ID4+Cj4+
ID4+IEJpc2VjdGVkIHRvIGNvbW1pdCBkNzE1N2ZmNDlhNWIgKCJtdGQ6IHJhd25hbmQ6IFVzZSB0
aGUgRUNDICAKPj4gZnJhbWV3b3JrIHVzZXIgaW5wdXQgcGFyc2luZyBiaXRzIikKPj4gPj4KPj4g
Pj4gTXkgZmlyc3QgaW1wcmVzc2lvbiBpcyB0aGF0IHdpdGggdGhhdCBjaGFuZ2UsIHRoZSB2YWx1
ZSBzZXQgaW4gIAo+PiBjaGlwLT5lY2MuYWxnbwo+PiA+PiBieSBncGlvX25hbmRfcHJvYmUoKSBp
biBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncGlvLmMgZ2V0cyAgCj4+IG92ZXJ3cml0dGVuIGluIHJh
d25hbmRfZHRfaW5pdCgpCj4+ID4+Cj4+ID4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlIGZpeGVzIHRo
ZSBwcm9ibGVtLCB0aG91Z2ggSSdtIG5vdCBzdXJlIGl0ICAKPj4gaXMgdGhlIHJpZ2h0IGZpeC4g
Q2FuIHlvdSBoYXZlIGEgbG9vayA/Cj4+ID4+Cj4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgCj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLmMKPj4gPj4gaW5kZXggMWYwZDU0MmQ1OTIzLi5hYTc0Nzk3Y2YyZGEgMTAwNjQ0Cj4+ID4+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4+ID4+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4+ID4+IEBAIC01MDMyLDcgKzUwMzIsOCBAQCBz
dGF0aWMgaW50IHJhd25hbmRfZHRfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+PiA+PiAg
ICAJCWNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IG5hbmQtPmVjYy5kZWZhdWx0cy5lbmdpbmVfdHlw
ZTsKPj4gPj4KPj4gPj4gICAgCWNoaXAtPmVjYy5wbGFjZW1lbnQgPSBuYW5kLT5lY2MudXNlcl9j
b25mLnBsYWNlbWVudDsKPj4gPj4gLQljaGlwLT5lY2MuYWxnbyA9IG5hbmQtPmVjYy51c2VyX2Nv
bmYuYWxnbzsKPj4gPj4gKwlpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktO
T1dOKQo+PiA+PiArCQljaGlwLT5lY2MuYWxnbyA9IG5hbmQtPmVjYy51c2VyX2NvbmYuYWxnbzsK
Pj4gPj4gICAgCWNoaXAtPmVjYy5zdHJlbmd0aCA9IG5hbmQtPmVjYy51c2VyX2NvbmYuc3RyZW5n
dGg7Cj4+ID4+ICAgIAljaGlwLT5lY2Muc2l6ZSA9IG5hbmQtPmVjYy51c2VyX2NvbmYuc3RlcF9z
aXplOwo+PiA+Pgo+PiA+PiAtLS0KPj4gPj4KPj4gPj4gVGhhbmtzCj4+ID4+IENocmlzdG9waGUK
Pj4gPgo+PiA+IFNvcnJ5IGZvciBpbnRyb2R1Y2luZyB0aGlzIGlzc3VlLCBJIGRpZG4ndCBoYWQg
dGhlIHRpbWUgdG8gc2VuZCB0aGUKPj4gPiBGaXhlcyBQUiB5ZXQgYnV0IEkgdGhpbmsgdGhpcyBp
c3N1ZSBoYXMgYmVlbiBzb2x2ZWQgYWxyZWFkeS4gQ291bGQKPj4gPiB5b3UgcGxlYXNlIHRyeSB3
aXRoIGEgcmVjZW50IGxpbnV4LW5leHQ/Cj4+ID4KPj4KPj4gU29ycnksIHNhbWUgcHJvYmxlbSB3
aXRoICJMaW51eCB2ZXJzaW9uIDUuMTAuMC1yYzItbmV4dC0yMDIwMTEwNCIKPgo+IENhbiB5b3Ug
cGxlYXNlIGdpdmUgdGhpcyBwYXRjaCBhIHRyeSwgcGxlYXNlPwo+Cj4gLS0tODwtLS0KPgo+IEF1
dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBEYXRlOiAg
IFRodSBOb3YgNSAwODo0NDo0OCAyMDIwICswMTAwCj4KPiAgICAgbXRkOiByYXduYW5kOiBncGlv
OiBNb3ZlIHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCj4KPiAgICAg
V2hpbGUgZm9yY2luZyBhIEhhbW1pbmcgc29mdHdhcmUgRUNDIGxvb2tzIGNsZWFybHkgd3Jvbmcs
IGxldCdzIGp1c3QKPiAgICAgZml4IHRoZSBzaXR1YXRpb24gZm9yIG5vdyBhbmQgbW92ZSB0aGVz
ZSBsaW5lcyB0byB0aGUgLT5hdHRhY2hfY2hpcCgpCj4gICAgIGhvb2sgd2hpY2ggZ2V0cyBleGVj
dXRlZCBhZnRlciB0aGUgdXNlciBpbnB1dCBwYXJzaW5nIGFuZCBOQU5EIGNoaXAKPiAgICAgZGlz
Y292ZXJ5Lgo+Cj4gICAgIEZpeGVzOiBkNzE1N2ZmNDlhNWIgKCJtdGQ6IHJhd25hbmQ6IFVzZSB0
aGUgRUNDIGZyYW1ld29yayB1c2VyICAKPiBpbnB1dCBwYXJzaW5nIGJpdHMiKQo+ICAgICBTaWdu
ZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwaW8uYwo+IGluZGV4IDNiZDg0N2NjYzNmMy4uNmZlYWI4NDdmNWUwIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwaW8uYwo+IEBAIC0xNjEsOCArMTYxLDE1IEBAIHN0YXRpYyBpbnQgZ3Bpb19uYW5k
X2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgICAgICAgIHJldHVybiByZXQ7Cj4g
IH0KPgo+ICtzdGF0aWMgaW50IGdwaW9fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwKQo+ICt7Cj4gKyAgICAgICBjaGlwLT5lY2MubW9kZSA9IE5BTkRfRUNDX1NPRlQ7Cj4g
KyAgICAgICBjaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0hBTU1JTkc7Cj4gK30KPiArCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyX29wcyBncGlvX25hbmRfb3BzID0gewo+
ICAgICAgICAgLmV4ZWNfb3AgPSBncGlvX25hbmRfZXhlY19vcCwKPiArICAgICAgIC5hdHRhY2hf
Y2hpcCA9IGdwaW9fbmFuZF9hdHRhY2hfY2hpcCwKPiAgfTsKPgo+ICAjaWZkZWYgQ09ORklHX09G
Cj4gQEAgLTM0Miw4ICszNDksNiBAQCBzdGF0aWMgaW50IGdwaW9fbmFuZF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgZ3Bpb210ZC0+YmFzZS5vcHMgPSAmZ3Bp
b19uYW5kX29wczsKPgo+ICAgICAgICAgbmFuZF9zZXRfZmxhc2hfbm9kZShjaGlwLCBwZGV2LT5k
ZXYub2Zfbm9kZSk7Cj4gLSAgICAgICBjaGlwLT5lY2MubW9kZSAgICAgICAgICA9IE5BTkRfRUND
X1NPRlQ7Cj4gLSAgICAgICBjaGlwLT5lY2MuYWxnbyAgICAgICAgICA9IE5BTkRfRUNDX0hBTU1J
Tkc7Cj4gICAgICAgICBjaGlwLT5vcHRpb25zICAgICAgICAgICA9IGdwaW9tdGQtPnBsYXQub3B0
aW9uczsKPiAgICAgICAgIGNoaXAtPmNvbnRyb2xsZXIgICAgICAgID0gJmdwaW9tdGQtPmJhc2U7
CgoKV29ya3Mgd2l0aCB0aGUgZm9sbG93aW5nOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwaW8uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYwppbmRleCA0ZWMwYTFl
MTA4NjcuLjY2ZDNmMWViNzg4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bp
by5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYwpAQCAtMTYxLDggKzE2MSwxNyBA
QCBzdGF0aWMgaW50IGdwaW9fbmFuZF9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAg
CXJldHVybiByZXQ7CiAgfQoKK3N0YXRpYyBpbnQgZ3Bpb19uYW5kX2F0dGFjaF9jaGlwKHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXApCit7CisJY2hpcC0+ZWNjLmVuZ2luZV90eXBlCT0gTkFORF9FQ0Nf
RU5HSU5FX1RZUEVfU09GVDsKKwljaGlwLT5lY2MuYWxnbwkJPSBOQU5EX0VDQ19BTEdPX0hBTU1J
Tkc7CisKKwlyZXR1cm4gMDsKK30KKwogIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9jb250cm9s
bGVyX29wcyBncGlvX25hbmRfb3BzID0gewogIAkuZXhlY19vcCA9IGdwaW9fbmFuZF9leGVjX29w
LAorCS5hdHRhY2hfY2hpcCA9IGdwaW9fbmFuZF9hdHRhY2hfY2hpcCwKICB9OwoKICAjaWZkZWYg
Q09ORklHX09GCkBAIC0zNDIsOCArMzUxLDYgQEAgc3RhdGljIGludCBncGlvX25hbmRfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICAJZ3Bpb210ZC0+YmFzZS5vcHMgPSAmZ3Bp
b19uYW5kX29wczsKCiAgCW5hbmRfc2V0X2ZsYXNoX25vZGUoY2hpcCwgcGRldi0+ZGV2Lm9mX25v
ZGUpOwotCWNoaXAtPmVjYy5lbmdpbmVfdHlwZQk9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7
Ci0JY2hpcC0+ZWNjLmFsZ28JCT0gTkFORF9FQ0NfQUxHT19IQU1NSU5HOwogIAljaGlwLT5vcHRp
b25zCQk9IGdwaW9tdGQtPnBsYXQub3B0aW9uczsKICAJY2hpcC0+Y29udHJvbGxlcgk9ICZncGlv
bXRkLT5iYXNlOwoKLS0tCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
