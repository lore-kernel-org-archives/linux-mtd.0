Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA3C54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A3B206CC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRxPDWpY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A3B206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1M/3+dBDnt+R4j1Fmvy5nznz/3bIYPBfACbNvF7idY=; b=sRxPDWpY4r/T0R
	xqSn4GJj8H5VT3bovUL7l/jnCsiURPl35KMTjTX7PWYnLW7gG1rKV0/mAcAtM1WE7Tx8pJ+YaVYTv
	8uOSphvabKTmOhw42oRGasgKZSTjZJjoLGlPC8mc0GJxRg6aFUZ5GNAQl/vcs8Wq3jdSXo63f+ZC0
	gqysRsMvBa+UHJn4C3YvP37bHuw3ZkRjPF9IpQGZ3GkGIy2TT13U5j0jXQpACXGqO/NyTfPV0CDHX
	ZblQ0aX6ykw1ZHNS25LrKjfaJ2+P4sETAHSvONH0QUV648a02aTppO1EsJ0MsMuAInsmR4/8xdS8w
	HyaJcD2h92pDkSveJ8IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYQWi-0005Ex-VA; Tue, 12 May 2020 08:44:36 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQWf-00056z-C6
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 08:44:35 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6C06A240007;
 Tue, 12 May 2020 08:44:23 +0000 (UTC)
Date: Tue, 12 May 2020 10:44:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH] nand: raw: use write_oob_raw for MTD_OPS_AUTO_OOB mode
Message-ID: <20200512104422.4c31f7e0@xps13>
In-Reply-To: <6F41AA9B-71D6-47FA-BC12-24941F84DA71@gmail.com>
References: <20200504094253.2741109-1-noltari@gmail.com>
 <20200504123237.5c128668@collabora.com>
 <20200511182923.6a4961ab@xps13>
 <6F41AA9B-71D6-47FA-BC12-24941F84DA71@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_014433_685254_FDC7C153 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: christophe.kerello@st.com, vigneshr@ti.com, richard@nod.at,
 s.hauer@pengutronix.de, devik@eaxlabs.cz, linux-kernel@vger.kernel.org,
 stefan@agner.ch, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpSaWNoYXJkLCBtYXliZSB5b3UnbGwgaGF2ZSBhbiBpZGVhIHRvIGZpeCB0aGUgc2l0
dWF0aW9uIGhlcmU/CgrDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29t
PiB3cm90ZSBvbiBUdWUsIDEyIE1heSAyMDIwCjEwOjM2OjI1ICswMjAwOgoKPiBIaSwKPiAKPiA+
IEVsIDExIG1heSAyMDIwLCBhIGxhcyAxODoyOSwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4gZXNjcmliacOzOgo+ID4gCj4gPiBIZWxsbywKPiA+IAo+ID4gQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gTW9uLCA0
IE1heQo+ID4gMjAyMCAxMjozMjozNyArMDIwMDoKPiA+ICAgCj4gPj4gT24gTW9uLCAgNCBNYXkg
MjAyMCAxMTo0Mjo1MyArMDIwMAo+ID4+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFy
aUBnbWFpbC5jb20+IHdyb3RlOgo+ID4+ICAgCj4gPj4+IFNvbWUgTkFORCBjb250cm9sbGVycyBj
aGFuZ2UgdGhlIEVDQyBieXRlcyB3aGVuIE9PQiBpcyB3cml0dGVuIHdpdGggRUNDCj4gPj4+IGVu
YWJsZWQuCj4gPj4+IFRoaXMgaXMgYSBwcm9ibGVtIGluIGJyY21uYW5kLCBzaW5jZSBhZGRpbmcg
SkZGUzIgY2xlYW5tYXJrZXJzIGFmdGVyIHRoZSBwYWdlCj4gPj4+IGhhcyBiZWVuIGVyYXNlZCB3
aWxsIGNoYW5nZSB0aGUgRUNDIGJ5dGVzIHRvIDAgYW5kIHRoZSBjb250cm9sbGVyIHdpbGwgdGhp
bmsKPiA+Pj4gdGhlIGJsb2NrIGlzIGJhZC4KPiA+Pj4gSXQgY2FuIGJlIGZpeGVkIGJ5IHVzaW5n
IHdyaXRlX29vYl9yYXcsIHdoaWNoIGVuc3VyZXMgRUNDIGlzIGRpc2FibGVkLgo+ID4+PiAKPiA+
Pj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWls
LmNvbT4KPiA+Pj4gLS0tCj4gPj4+IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwg
MiArLQo+ID4+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+Pj4gCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPj4+IGluZGV4IGMyNGU1ZTJi
YTEzMC4uNzU1ZDI1MjAwNTIwIDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYwo+ID4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
Ywo+ID4+PiBAQCAtNDg4LDcgKzQ4OCw3IEBAIHN0YXRpYyBpbnQgbmFuZF9kb193cml0ZV9vb2Io
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IHRvLAo+ID4+PiAKPiA+Pj4gCW5hbmRfZmls
bF9vb2IoY2hpcCwgb3BzLT5vb2JidWYsIG9wcy0+b29ibGVuLCBvcHMpOwo+ID4+PiAKPiA+Pj4g
LQlpZiAob3BzLT5tb2RlID09IE1URF9PUFNfUkFXKQo+ID4+PiArCWlmIChvcHMtPm1vZGUgPT0g
TVREX09QU19BVVRPX09PQiB8fCBvcHMtPm1vZGUgPT0gTVREX09QU19SQVcpCj4gPj4+IAkJc3Rh
dHVzID0gY2hpcC0+ZWNjLndyaXRlX29vYl9yYXcoY2hpcCwgcGFnZSAmIGNoaXAtPnBhZ2VtYXNr
KTsgICAgCj4gPj4gCj4gPj4gVGhlIGRvYyBzYXlzOgo+ID4+IAo+ID4+IEBNVERfT1BTX1BMQUNF
X09PQjogIE9PQiBkYXRhIGFyZSBwbGFjZWQgYXQgdGhlIGdpdmVuIG9mZnNldCAoZGVmYXVsdCkK
PiA+PiBATVREX09QU19BVVRPX09PQjogICBPT0IgZGF0YSBhcmUgYXV0b21hdGljYWxseSBwbGFj
ZWQgYXQgdGhlIGZyZWUgYXJlYXMKPiA+PiAgICAgICAgICAgICAgICAgICAgIHdoaWNoIGFyZSBk
ZWZpbmVkIGJ5IHRoZSBpbnRlcm5hbCBlY2NsYXlvdXQKPiA+PiBATVREX09QU19SQVc6ICAgICAg
ICBkYXRhIGFyZSB0cmFuc2ZlcnJlZCBhcy1pcywgd2l0aCBubyBlcnJvcgo+ID4+IAkJICAgICBj
b3JyZWN0aW9uOyB0aGlzIG1vZGUgaW1wbGllcyAlTVREX09QU19QTEFDRV9PT0IKPiA+PiAKPiA+
PiBUbyBtZSwgdGhhdCBtZWFucyBNVERfT1BTX1BMQUNFX09PQiBhbmQgTVREX09QU19BVVRPX09P
QiBkbyBub3QgaW1wbHkKPiA+PiBNVERfT1BTX1JBVy4gQW55d2F5IHRob3NlIG1vZGVzIGFyZSBq
dXN0IHRvbyB2YWd1ZS4gV2UgcmVhbGx5IHNob3VsZAo+ID4+IHNlcGFyYXRlIHRoZSBFQ0MtZGlz
YWJsZWQvRUNDLWVuYWJsZWQgY29uY2VwdCAoQUtBIHJhdyB2cyBub24tcmF3IG1vZGUpCj4gPj4g
ZnJvbSB0aGUgT09CIHBsYWNlbWVudCBzY2hlbWUuIElJUkMsIE1pcXVlbCBoYWQgYSBwYXRjaHNl
dCBkb2luZyB0aGF0Lgo+ID4+IAo+ID4+IFdlIGFsc28gc2hvdWxkIGhhdmUgdGhlIGNvbmNlcHQg
b2YgcHJvdGVjdGVkIE9PQi1yZWdpb24gdnMKPiA+PiB1bnByb3RlY3RlZC1PT0ItcmVnaW9uIGlm
IHdlIHdhbnQgSkZGUzIgdG8gd29yayB3aXRoIGNvbnRyb2xsZXJzIHRoYXQKPiA+PiBwcm90ZWN0
IHBhcnQgb2YgdGhlIE9PQiByZWdpb24uIE9uY2Ugd2UgaGF2ZSB0aGF0IHdlIGNhbiBwYXRjaCBK
RkZTMgo+ID4+IHRvIHdyaXRlIHRoaW5ncyB3aXRoICJFQ0MtZGlzYWJsZWQiKyJhdXRvLU9PQi1w
bGFjZW1lbnQtb24tdW5wcm90ZWN0ZWQKPiA+PiBhcmVhIi4gIAo+ID4gCj4gPiBJIHNlZSB0aGUg
cHJvYmxlbSBidXQgYXMgQm9yaXMgc2FpZCB0aGUgZml4IGlzIG5vdCB2YWxpZCBhcy1pcy4KPiA+
IFByb2JsZW0gaXM6IEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBwcm9wb3NhbCB5ZXQuCj4gPiAKPiA+
IElzIGZvcmNpbmcgSkZGUzIgdG8gd3JpdGUgY2xlYW5tYXJrZXJzIGluIHJhdyBtb2RlIG9ubHkg
YW4gb3B0aW9uPyAgCj4gCj4gVGhlIGRvYyBzYXlzIHRoYXQgZm9yIE1URF9PUFNfQVVUT19PT0Ig
InRoZSBkYXRhIGlzIGF1dG9tYXRpY2FsbHkgcGxhY2VkIGF0IHRoZSBmcmVlIGFyZWFzIHdoaWNo
IGFyZSBkZWZpbmVkIGJ5IHRoZSBpbnRlcm5hbCBlY2NsYXlvdXTigJ0uCj4gU28sIGlmIHdl4oCZ
cmUgcGxhY2luZyB0aGlzIGRhdGEgaW4gdGhlIGZyZWUgT09CIGFyZWEgbGVmdCBieSB0aGUgRUND
IGJ5dGVzIGl0IG1lYW5zIHRoYXQgdGhpcyBhdXRvbWF0aWNhbGx5IHBsYWNlZCBkYXRhIHdvbuKA
mXQgYmUgZXJyb3IgY29ycmVjdGFibGUsIHNpbmNlIGl04oCZcyBpbiB0aGUgT09CLCBhbmQgdGhl
IE9PQiBkYXRhIGlzbuKAmXQgZXJyb3IgY29ycmVjdGVkLCByaWdodD8KCk5vLCBmcmVlIGJ5dGVz
IHNvbWV0aW1lcyBhcmUgYW5kIHNvbWV0aW1lcyBhcmUgbm90IGNvdmVyZWQgYnkgdGhlIEVDQwpl
bmdpbmUuIEl0IGRlcGVuZHMgb24gdGhlIGNvbnRyb2xsZXIuCgo+IFRoZSBwcm9ibGVtIGlzIHRo
YXQgImZsYXNoX2VyYXNlIC1q4oCdIHVzZXMgTVREX09QU19BVVRPX09PQiB0byB3cml0ZSB0aGUg
T09CIEpGRlMyIGNsZWFuIG1hcmtlcnMgYW5kIGlmIHRoaXMgaXMgd3JpdHRlbiB3aXRoIEVDQyBl
bmFibGVkIHRoZSBOQU5EIGNvbnRyb2xsZXIgd2lsbCBjaGFuZ2UgdGhlIEVDQyBieXRlcyB0byBh
biBpbnZhbGlkIHZhbHVlIChvciBhdCBsZWFzdCBicmNtbmFuZCBjb250cm9sbGVyKS4KPiAKPiBB
bm90aGVyIG9wdGlvbiBjb3VsZCBiZSBhZGRpbmcgYW5vdGhlciBtb2RlLCBzb21ldGhpbmcgbGlr
ZSBNVERfT1BTX0FVVE9fT09CX1JBVyBhbmQgdXNpbmcgaXQgaW4gbXRkLXV0aWxzIGFuZCBKRkZT
Mi4KCk5vLCB0aGVzZSBtb2RlcyBhbHJlYWR5IGFyZSBjb21wbGV0ZWx5IHdyb25nLCBJIG11c3Qg
cmVzZW5kIG15IHNlcmllcwpmaXhpbmcgdGhlbS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
