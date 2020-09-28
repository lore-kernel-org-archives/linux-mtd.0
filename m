Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EE2C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 14:56:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D017521974
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 14:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ROp8jp7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D017521974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dynlkIAloegQD1rHZ01TAjht3NhwXBHYZ7gsHseENcw=; b=1ROp8jp7BKuP0+jKPpD0I716C
	+Ne9BPHIvWoQhPMtcpWwZ4LVUiz0cY3X7kmiUt8Cvvx6/+ruzbJ9WWput+xRcnPKFfcwTeUl7agUp
	Ewdgd80Y9697wfwy+ZibvIU8aIKZrLdk+weztHm/YIxJ+lc6jCOtg8493up654synD13GOJgsgElm
	nWvGw8PHzGbd9/rxfu6fRZMHFwDsVqEImrkr2V12/8ZWaZgd50egsgWLbPP/KoVAFwymceiVzgCxB
	5NdJgpM0y4wJ9XePvmzU0bleCXZZvJ7iNziKnmiCB+3k96blFsaReIBEcI8B6TUVh6Z/zq48bXikn
	qb+gKlqJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMuYy-0001Ic-Ks; Mon, 28 Sep 2020 14:55:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMuYv-0001HR-VU
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 14:55:35 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6B4C520005;
 Mon, 28 Sep 2020 14:55:30 +0000 (UTC)
Date: Mon, 28 Sep 2020 16:55:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thirumalesha N <nthirumalesha7@gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: spinand: micron: Generalize the function
 and structure names
Message-ID: <20200928165528.54e5db6e@xps13>
In-Reply-To: <CALKVOUomKLZ5GEHmXb+VfEq8UiNUpCN-Vqkx3N+yykEnCrHkDA@mail.gmail.com>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
 <20200913161533.10655-2-nthirumalesha7@gmail.com>
 <20200915101321.1afa5033@xps13>
 <CALKVOUomKLZ5GEHmXb+VfEq8UiNUpCN-Vqkx3N+yykEnCrHkDA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_105534_190955_21AD8E08 
X-CRM114-Status: GOOD (  24.07  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVGhpcnVtYWxlc2hhLAoKVGhpcnVtYWxlc2hhIE4gPG50aGlydW1hbGVzaGE3QGdtYWlsLmNv
bT4gd3JvdGUgb24gU3VuLCAyMCBTZXAgMjAyMAoyMjozODo1MyArMDgwMDoKCj4gSGkgTWlxdcOo
bCwKPiAKPiBJIGFkb3B0ZWQgdGhlc2UgY2hhbmdlcyBhcyBwZXIgdGhlIEJvcmlzIEJyZXppbGxv
biBjb21tZW50cwo+IAo+IE9uIFR1ZSwgU2VwIDE1LCAyMDIwIGF0IDQ6MTMgUE0gTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiB3cm90ZToKPiAKPiA+IEhpIFRoaXJ1
bWFsZXNoYSwKPiA+Cj4gPiBUaGlydW1hbGVzaGEgTmFyYXNpbWhhcHBhIDxudGhpcnVtYWxlc2hh
N0BnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMTQKPiA+IFNlcCAyMDIwIDAwOjE1OjMyICswODAw
Ogo+ID4gIAo+ID4gPiBSZW5hbWUgdGhlIG9vYiBzdHJ1Y3R1cmUgYW5kIHJlYWQvd3JpdGUvdXBk
YXRlIGZ1bmN0aW9uIG5hbWVzIHRvCj4gPiA+IGEgZ2VuZXJpYyBuYW1lcwo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUaGlydW1hbGVzaGEgTmFyYXNpbWhhcHBhIDxudGhpcnVtYWxlc2hhN0Bn
bWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMg
fCA4MCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgIAo+ID4gYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS9taWNyb24uYyAgCj4gPiA+IGluZGV4IDVkMzcwY2ZjZGFhYS4uZDFiMTA3M2Qx
YTU1IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4g
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4gPiBAQCAtMjgsNyArMjgs
NyBAQAo+ID4gPgo+ID4gPiAgI2RlZmluZSBNSUNST05fU0VMRUNUX0RJRSh4KSAoKHgpIDw8IDYp
Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyhyZWFkX2NhY2hlX3Zhcmlh
bnRzLAo+ID4gPiArc3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFMocXVhZGlvX3JlYWRfY2FjaGVf
dmFyaWFudHMsCj4gPiA+ICAgICAgICAgICAgICAgU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNI
RV9RVUFESU9fT1AoMCwgMiwgTlVMTCwgMCksCj4gPiA+ICAgICAgICAgICAgICAgU1BJTkFORF9Q
QUdFX1JFQURfRlJPTV9DQUNIRV9YNF9PUCgwLCAxLCBOVUxMLCAwKSwKPiA+ID4gICAgICAgICAg
ICAgICBTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX0RVQUxJT19PUCgwLCAxLCBOVUxMLCAw
KSwKPiA+ID4gQEAgLTM2LDExICszNiwxMSBAQCBzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyhy
ZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ID4gPiAgICAgICAgICAgICAgIFNQSU5BTkRfUEFHRV9SRUFE
X0ZST01fQ0FDSEVfT1AodHJ1ZSwgMCwgMSwgTlVMTCwgMCksCj4gPiA+ICAgICAgICAgICAgICAg
U1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9PUChmYWxzZSwgMCwgMSwgTlVMTCwgMCkpOwo+
ID4gPgo+ID4gPiAtc3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFMod3JpdGVfY2FjaGVfdmFyaWFu
dHMsCj4gPiA+ICtzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyh4NF93cml0ZV9jYWNoZV92YXJp
YW50cywgIAo+ID4KPiA+IFdoeSBxdWFkaW9fcmVhZCBhbmQgeDRfd3JpdGU/IEkgZG9uJ3QgZ2V0
IHRoZSBsb2dpYy4KPiA+ICAKPiAKPiBJTUhPLCBxdWFkaW9fcmVhZCBpcyBkZXJpdmVkIGZyb20g
U1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9RVUFESU9fT1AgJgo+IHg0X3dyaXRlIGlzIGRl
cml2ZWQgZnJvbSBTUElOQU5EX1BST0dfTE9BRF9YNAo+IAo+IEJvcmlzLCBQbGVhc2UgY29ycmVj
dCBtZSwgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyB3cm9uZwoKSSBzZWUuCgpUaGVuIHBsZWFzZSBz
cGxpdCB0aGlzIGNoYW5nZSwgb25lIHVwZGF0aW5nIHRoZSBoZWxwZXJzIHdpdGggYW4gIng0Igpw
cmVmaXggd2hlbiByZWxldmFudCBhbmQgYW5vdGhlciBvbmUgZm9yIDggdnMuIGdyb3VwZWQuCgo+
IAo+IAo+ID4gPiAgICAgICAgICAgICAgIFNQSU5BTkRfUFJPR19MT0FEX1g0KHRydWUsIDAsIE5V
TEwsIDApLAo+ID4gPiAgICAgICAgICAgICAgIFNQSU5BTkRfUFJPR19MT0FEKHRydWUsIDAsIE5V
TEwsIDApKTsKPiA+ID4KPiA+ID4gLXN0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRTKHVwZGF0ZV9j
YWNoZV92YXJpYW50cywKPiA+ID4gK3N0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRTKHg0X3VwZGF0
ZV9jYWNoZV92YXJpYW50cywKPiA+ID4gICAgICAgICAgICAgICBTUElOQU5EX1BST0dfTE9BRF9Y
NChmYWxzZSwgMCwgTlVMTCwgMCksCj4gPiA+ICAgICAgICAgICAgICAgU1BJTkFORF9QUk9HX0xP
QUQoZmFsc2UsIDAsIE5VTEwsIDApKTsKPiA+ID4KPiA+ID4gQEAgLTY5LDcgKzY5LDcgQEAgc3Rh
dGljIGludCBtaWNyb25fOF9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gIAo+ID4gKm10
ZCwgaW50IHNlY3Rpb24sICAKPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+Cj4g
PiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9vb2JsYXlvdXRfb3BzIG1pY3Jvbl84X29vYmxh
eW91dCA9IHsKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgbWlj
cm9uX2dyb3VwZWRfb29ibGF5b3V0ID0geyAgCj4gPgo+ID4gSXMgdGhpcyBuZWNlc3Nhcnk/IFdo
YXQgZG9lcyAiZ3JvdXBlZCIgbWVhbnM/IFNob3VsZCB3ZSByZW5hbWUgYWxsCj4gPiBmdW5jdGlv
bnMgd2l0aCBfOF8gaW4gaXQgdG8gbWFrZSBzZW5zZT8KPiA+ICAKPiAKPiBJTUhPLCBncm91cGVk
IG1lYW5zLCBlY2MgYnl0ZXMgYXJlIGF0IGNvbnRpbnVvdXMgYWRkcmVzcywgd2hlcmUgYXMKPiBp
bnRlcmxlYXZlZCBtZWFucyBlY2MgYnl0ZXMgc3BsaXR0ZWQgaW50byBtdWx0aXBsZSBhZGRyZXNz
ZXMKCkkgZG9uJ3QgbGlrZSB0aGUgbmFtZS4gSW50ZXJsZWF2ZWQgbWVhbnMgdGhhdCB0aGVyZSBh
cmUgT09CIGJ5dGVzCnN0b3JlZCBpbiB0aGUgZGF0YSBzZWN0aW9uLCB3aGljaCBpcyBub3QgdGhl
IGNhc2UgaGVyZS4gVGhlIHdheSBPT0IKYnl0ZXMgYXJlIG9yZ2FuaXplZCBkbyBub3Qgc2VlbSBy
ZWxldmFudCB0byBtZSwgSSB0aGluayBpIHByZWZlciB0aGUKIl80Xy9fOF8iIG5hbWluZyxldmVu
IGlmIGl0J3Mgbm90IHZlcnkgZXhwbGljaXQuCgpBbHNvIHBsZWFzZSBiZSBjb25zaXN0ZW50LCBk
byBub3QgbWl4ICJfNF8iIGFuZCAiaW50ZXJsZWF2ZWQiIChzZWUgdGhlCm90aGVyIHBhdGNoKS4K
CkFueSBmZWVkYmFjayBmcm9tIE1pY3JvbiB0byB2YWxpZGF0ZSB0aGVzZSBjaGFuZ2VzIHdpbGwg
YmUgYXBwcmVjaWF0ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
