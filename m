Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697F9C282DA
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 15:07:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9D32177E
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 15:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Epmgiyvl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1H7zl/N+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9D32177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wzb+YoodKn1JkOVnpqJFLTBLpxmdmVlYRnKUV5HxmI=; b=EpmgiyvlhMLkRq
	AG60312XtL1VB/0AOMCMSW6Y+H7zJTrz6L90gyMFn9tEEPcuk6rVdS/9YDIjAK1w1F0v+kYHJzKPn
	dEtgcTgrlZXtCf/Hd7o3I0pYmuw4g4o1Euz0mnXkfWWqteFjYLk+mshhAXOEsZ9FTyXHLDLfyT6iM
	IP6dTfv6KoYPo2MeAy5tMZFMDfQoULlBXyhen9U72UDxsYdxvwCdowr7cEP63+XQnHtpmRA+lw1j7
	8GbNcb5T1MeIyo3wvMs1xLaHFbmygGXFwbl90/T4Fl0pibCf3uQTFO9NNAdDpLH4io4oGjLjZZqav
	xoW6z8+JZlMKZ4PWLwdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqJMn-0003II-ED; Sun, 03 Feb 2019 15:07:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqJMj-0003He-RU
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 15:07:27 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 280E32177E;
 Sun,  3 Feb 2019 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549206443;
 bh=Jfs/7TZD7Dt6pob7pVeQFmN4YeMF4UVpP6WK8aXKfrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1H7zl/N+aKOQb1vGR0xo0iV7406nz3fwmiFO9wK+zgiIqyN5U3UlOAml7b0ESJDFK
 M0tOG22fjSuh+jy4jGVl5E7SGoc4KqKExWLUbtn8mQZLH7nl7v8Md6VcJnuSsGm05R
 PYcx6PoJbNwy9UKBrdM4tQx4iIK59NQHOzJ8eYjU=
Date: Sun, 3 Feb 2019 16:07:09 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 9/9] mtd: rawnand: jz4780-bch: Add support for the
 JZ4740
Message-ID: <20190203160709.29d7d721@bbrezillon>
In-Reply-To: <1549205792.1588.0@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-10-paul@crapouillou.net>
 <20190203083505.4dc52278@bbrezillon>
 <1549202293.1950.2@crapouillou.net>
 <20190203151604.23061e2a@bbrezillon>
 <1549205792.1588.0@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_070725_925316_65442BB0 
X-CRM114-Status: GOOD (  28.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwMyBGZWIgMjAxOSAxMTo1NjozMiAtMDMwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IExlIGRpbS4gMyBmw6l2ci4gMjAxOSDDoCAxMToxNiwg
Qm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+IAo+IGEgw6ljcml0IDoKPiA+
IE9uIFN1biwgMDMgRmViIDIwMTkgMTA6NTg6MTMgLTAzMDAKPiA+IFBhdWwgQ2VyY3VlaWwgPHBh
dWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKPiA+ICAgCj4gPj4gIExlIGRpbS4gMyBmw6l2ci4g
MjAxOSDDoCA0OjM1LCBCb3JpcyBCcmV6aWxsb24gCj4gPj4gPGJicmV6aWxsb25Aa2VybmVsLm9y
Zz4KPiA+PiAgYSDDqWNyaXQgOiAgCj4gPj4gID4gT24gU2F0LCAgMiBGZWIgMjAxOSAyMDoxOToy
NiAtMDMwMAo+ID4+ICA+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90
ZToKPiA+PiAgPiAgCj4gPj4gID4+ICBBZGQgdGhlIGJhY2tlbmQgY29kZSBmb3IgdGhlIGp6NDc4
MC1iY2ggZHJpdmVyIHRvIHN1cHBvcnQgdGhlICAgCj4gPj4gSlo0NzQwICAKPiA+PiAgPj4gIFNv
QyBmcm9tIEluZ2VuaWMuCj4gPj4gID4+Cj4gPj4gID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENl
cmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiA+PiAgPj4gIC0tLQo+ID4+ICA+Pgo+ID4+
ICA+PiAgQ2hhbmdlczoKPiA+PiAgPj4KPiA+PiAgPj4gIHYyOiBOZXcgcGF0Y2gKPiA+PiAgPj4K
PiA+PiAgPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL01ha2VmaWxlICAgICAgICAg
fCAgIDIgKy0KPiA+PiAgPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc0MF9i
Y2guYyAgICAgfCAxNzMKPiA+PiAgPj4gKysrKysrKysrKysrKysrKysrCj4gPj4gID4+ICAgLi4u
L210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc4MF9iY2hfY29tbW9uLmMgIHwgICAxICsKPiA+PiAg
Pj4gICAuLi4vbmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBfYmNoX2ludGVybmFsLmggICAgfCAgIDEg
Kwo+ID4+ICA+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMTc2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiA+PiAgPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW5nZW5pYy9qejQ3NDBfYmNoLmMKPiA+PiAgPj4KPiA+PiAgPj4gIGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL01ha2VmaWxlCj4gPj4gID4+IGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW5nZW5pYy9NYWtlZmlsZQo+ID4+ICA+PiAgaW5kZXggZjM4YjQ2NzQ5MGNmLi5k
MTZjOTYxMTNhOTMgMTAwNjQ0Cj4gPj4gID4+ICAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9p
bmdlbmljL01ha2VmaWxlCj4gPj4gID4+ICArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdl
bmljL01ha2VmaWxlCj4gPj4gID4+ICBAQCAtMSwzICsxLDMgQEAKPiA+PiAgPj4gICBvYmotJChD
T05GSUdfTVREX05BTkRfSlo0NzQwKSArPSBqejQ3NDBfbmFuZC5vCj4gPj4gID4+ICAgb2JqLSQo
Q09ORklHX01URF9OQU5EX0paNDc4MCkgKz0gano0NzgwX25hbmQubyAgIAo+ID4+IGp6NDc4MF9i
Y2hfY29tbW9uLm8gIAo+ID4+ICA+PiBcCj4gPj4gID4+ICAtCQkJCSBqejQ3ODBfYmNoLm8gano0
NzI1Yl9iY2gubwo+ID4+ICA+PiAgKwkJCQkgano0NzgwX2JjaC5vIGp6NDcyNWJfYmNoLm8gano0
NzQwX2JjaC5vICAKPiA+PiAgPgo+ID4+ICA+IEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBwb2ludCBv
ZiB0aGUgano0NzgwX2JjaF9jb21tb24vano0N3h4eF9iY2gKPiA+PiAgPiBzZXBhcmF0aW9uLiBZ
b3Ugc2VlbSB0byBhbHdheXMgZW1iZWQgYWxsIG9iamVjdHMgYW55d2F5LCBzbyB5b3UgICAKPiA+
PiBjYW4gIAo+ID4+ICA+IGp1c3QgcHV0IHRoZSBjb2RlIGZvciBib3RoIGVuZ2luZXMgaW4gdGhl
IHNhbWUgc291cmNlIGZpbGUgYW5kICAgCj4gPj4gZGVjaWRlICAKPiA+PiAgPiB3aGljaCBvbmUg
dG8gdXNlIGJhc2VkIG9uIHRoZSBjb21wYXQgKHdoaWNoIHlvdSBhbHJlYWR5IGRvICAgCj4gPj4g
YW55d2F5KS4KPiA+PiAKPiA+PiAgRWFjaCBTb0MgaGFzIGEgZGlmZmVyZW50IHNldCBvZiByZWdp
c3RlcnMgZm9yIHRoZSBCQ0ggaGFyZHdhcmUuIEkgCj4gPj4gY2FuCj4gPj4gIHRyeSB0bwo+ID4+
ICBjcmFtIGV2ZXJ5dGhpbmcgaW50byBvbmUgZmlsZSwgYnV0IGl0IHdvbid0IGJlIHRoYXQgbXVj
aCBjbGVhbmVyLiAgCj4gPiAKPiA+IFRoZW4gbWF5YmUgdGhleSBkZXNlcnZlIHNlcGFyYXRlIGRy
aXZlcnMvbW9kdWxlcy4KPiA+IAo+ID4gQlRXLCBkaWRuJ3QgeW91IHNheSB0aGF0IG9uZSBJUCB1
c2VzIFJlZWQtU2Fsb21vbiBpbnN0ZWFkIG9mIEJDSC4gSSdkCj4gPiBzdWdnZXN0IHByZWZpeGlu
ZyBzdHJ1Y3RzIGFuZCBmdW5jdGlvbnMgd2l0aCBqejQ3eHhfZWNjIGluc3RlYWQgb2YKPiA+IGp6
NDd4eF9iY2ggYW5kIG5hbWluZyB0aGUgY29tbW9uIHBhcnQgano0N3h4X2VjYy5jIHRvIHJlZmxl
Y3QgdGhhdC4gIAo+IAo+IFdvdWxkIGl0IGJlIGEgZ29vZCBpZGVhIHRvIG1ha2UgYSBnZW5lcmlj
IEVDQyBBUEkgdGhhdCB0aGUgano0N3h4X25hbmQKPiBkcml2ZXIgY291bGQgdXNlPyBUaGVuIHRo
ZSB0aHJlZSBqejQ3eHggQkNIIGNvZGVwYXRocyBjb3VsZCBiZSBzZXBhcmF0ZQo+IGRyaXZlcnMg
dGhhdCByZWdpc3RlciB3aXRoIHRoZSBnZW5lcmljIEVDQyBjb3JlLgoKRGVmaW5pdGVseS4gQWN0
dWFsbHksIE1pcXVlbCBpcyBhbHJlYWR5IHdvcmtpbmcgb24gdGhhdCwgYnV0IEkgZG9uJ3QKdGhp
bmsgaXQncyBhIGdvb2QgaWRlYSB0byB3YWl0IGZvciB0aGlzIG5ldyBmcmFtZXdvcmsgdG8gYmUg
ZmluaXNoZWQgdG8KZ2V0IHlvdXIgY2hhbmdlcyBtZXJnZWQuIFNvIEknZCByZWNvbW1lbmQgaGF2
aW5nIGEganogc3BlY2lmaWMgRUNDIEFQSQoocHJldHR5IG11Y2ggdGhlIG9uZSB5b3UgaGF2ZSBp
biB0aGUgY29tbW9uIGZpbGUgZXhwZWN0IGl0IHdvdWxkIGJlCnByZWZpeGVkIHdpdGggX2VjYyBp
bnN0ZWFkIG9mIF9iY2gpIGFuZCBjb252ZXJ0IGl0IHRvIHRoZSBnZW5lcmljCmFwcHJvYWNoIGFm
dGVyd2FyZHMuIEdpdmVuIHRoZSBzaXplIG9mIHRoZSBjb21tb24uYyBmaWxlLCB5b3UgY2FuIGV2
ZW4KcHV0IGV2ZXJ5dGhpbmcgaW4gano0N3h4X2VjYy5oIGFzIGlubGluZSBmdW5jcyB0byBhdm9p
ZCBoYXZpbmcgeWV0CmFub3RoZXIgbW9kdWxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
