Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC29FED9E3
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2s1lL7/PIj5mHThFE1spu9bdNlA/txoNAODfdAAkSo=; b=piwVBNhBwIQPrJ
	Rbu5tt7l+43hIFUAImWtv4/nfhy7iGFsY4jfmiPDC9cTm63xtKd+r5gUUyY/QKChqhlwD/ftCQbDT
	mUnGo+91ghy231kJgWqqz+VxECMhG5XkGiy/WZHOBHMoF6Cts6Sk/kMOYueDf2DTe5IT2M93cJ610
	Noeei+uCWYKYCkuRCxFCBYUc3bIX3jvSCT0HyKl/dRuWrX7V9zu3mg//qWIC+L/+C79iWi71aF/lV
	DncxWitVOn1uXU71YPkZi9cm/eomsiu1nKM5fTdeE5nOHUwZWq3IDhOkU0Ee0kMizSksUp+hxg//0
	2EzbxNhwP1XJZSrvBBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WAY-00000006iAO-3jqX;
	Tue, 17 Mar 2026 15:17:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WAV-00000006i9v-2jnW
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 15:17:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B73031A2DDD;
	Tue, 17 Mar 2026 15:17:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8548C5FC9A;
	Tue, 17 Mar 2026 15:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B4E010450613;
	Tue, 17 Mar 2026 16:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773760631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HpYyC+ESVa00QuajRPpqFr8FQgzikq4Z2svdSNuwJ88=;
	b=QQvpvM2EbLtLTfmSDKs3yu9GXEBWBukP/xZdkwHdilmyi8kUSnR5ookupTpLcgFw4sTxiF
	0KQCD5WzB/rQ+RSbzB5nRtZnrttb2pvF7JUmteDrxdMCHaypTp+L39l789GzARM0WX/lqc
	HTRDHrjqCuS4tEsJWb+23I154wt64EOqwd0bJthZBDLnLzm6+OZtK0hXvOp+ZEANoH4QoI
	uLXFIPnbAKE2zMuDfdrVbeTRF9LrZ174/HC7DiB3PuNW9vTczrGWq/yat1ci1ljXQg5Ev0
	2w1t+pFmH9lvZSL/iL/kHcfycUmJpfFg8KMJHhVaeFFa2u0U0TY0mQ61QpS+RA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Eberhard Stoll <eberhard.stoll@kontron.de>, 
Subject: Re: [RFC PATCH v2 11/12] spi: cadence-quadspi: restrict PHY
 frequency to tuned operations
In-Reply-To: <874inlxde0.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 13
	Feb 2026 09:21:11 +0100")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-12-s-k6@ti.com> <87zf5nf5g1.fsf@bootlin.com>
	<fdcb19ff-c949-4538-8819-88720e514f04@ti.com>
	<874inlxde0.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 16:17:06 +0100
Message-ID: <87zf46cwp9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_081715_947270_A1899067 
X-CRM114-Status: GOOD (  19.90  )
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

SGkgU2FudGhvc2gsCgorIEZyaWVkZXIgYW5kIEViZXJoYXJkCgpPbiAxMy8wMi8yMDI2IGF0IDA5
OjIxOjExICswMSwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cgo+IE9uIDA3LzAyLzIwMjYgYXQgMDA6NTc6MDQgKzA1MzAsIFNhbnRob3NoIEt1bWFyIEsg
PHMtazZAdGkuY29tPiB3cm90ZToKPgo+PiBPbiAwNS8wMi8yNiAyMzoxNywgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4+IEhpIFNhbnRob3NoLAo+Pj4gCj4+Pj4gKwkvKgo+Pj4+ICsJICogUEhZIHR1
bmluZyBhbGxvd3MgaGlnaC1mcmVxdWVuY3kgb3BlcmF0aW9uIG9ubHkgZm9yIGNhbGlicmF0ZWQK
Pj4+PiArCSAqIGNvbW1hbmRzLiBVbmNhbGlicmF0ZWQgb3BlcmF0aW9ucyB1c2Ugc2FmZSBub24t
UEhZIGZyZXF1ZW5jeSB0bwo+Pj4+ICsJICogYXZvaWQgdGltaW5nIHZpb2xhdGlvbnMuCj4+Pj4g
KwkgKi8KPj4+PiArCWlmIChjcXNwaS0+ZGRhdGEtPmV4ZWN1dGVfdHVuaW5nICYmIGZfcGRhdGEt
PnVzZV9waHkgJiYKPj4+PiArCSAgICAoY3FzcGlfb3BfbWF0Y2hlc190dW5lZChvcCwgJmZfcGRh
dGEtPnBoeV9yZWFkX29wKSB8fAo+Pj4+ICsJICAgICBjcXNwaV9vcF9tYXRjaGVzX3R1bmVkKG9w
LCAmZl9wZGF0YS0+cGh5X3dyaXRlX29wKSkpIHsKPj4+PiArCQljcXNwaV9jb25maWd1cmUoZl9w
ZGF0YSwgb3AtPm1heF9mcmVxKTsKPj4+PiArCX0gZWxzZSBpZiAoY3FzcGktPmRkYXRhLT5leGVj
dXRlX3R1bmluZykgewo+Pj4+ICsJCS8qIFVzZSBzYWZlIGZyZXF1ZW5jeSBmb3IgdW50dW5lZCBv
cGVyYXRpb25zICovCj4+Pj4gKwkJY3FzcGlfY29uZmlndXJlKGZfcGRhdGEsIGZfcGRhdGEtPm5v
bl9waHlfY2xrX3JhdGUpOwo+Pj4+ICsJfSBlbHNlIHsKPj4+PiArCQkvKiBObyB0dW5pbmcgc3Vw
cG9ydCwgYWx3YXlzIHVzZSByZXF1ZXN0ZWQgZnJlcXVlbmN5ICovCj4+Pj4gKwkJY3FzcGlfY29u
ZmlndXJlKGZfcGRhdGEsIG9wLT5tYXhfZnJlcSk7Cj4+Pj4gKwl9Cj4+PiBTaG91bGRuJ3Qgd2Ug
aGFuZGxlIHRoaXMgYXQgdGhlIGNvcmUgbGV2ZWw/IFdlIGtub3cgd2hhdCBraW5kIG9mCj4+PiBv
cGVyYXRpb24gcGF0dGVybiB3ZSBwcm92aWRlZCwgc28gaXQgaXMgZWFzeSB0byBzZXQgdGhlIGNv
cnJlY3QKPj4+IGZyZXF1ZW5jeSBpbiB0aGUgb3BlcmF0aW9uIHN0cnVjdHVyZS4KPj4+IENhbiB5
b3UgcGxlYXNlIG1ha2UgdGhpcyBoYXBwZW4/IFBlcmhhcHMgeW91IGNhbiByZXR1cm4gdGhlIG9w
ZXJhdGlvbgo+Pj4gZnJlcXVlbmN5IG9uY2UgdGhlIGNhbGlicmF0aW9uIGlzIHN1Y2Nlc3NmdWwg
KGluIHRoZSByZWFkIGFuZCB3cml0ZSBvcAo+Pj4gdGVtcGxhdGVzIG1heWJlPykgc28gdGhpcyBj
YW4gYmUgcGlja2VkIHVwIGJ5IHRoZSBjb3JlIGFuZCB1c2VkIGZvciB0aGUKPj4+IGZvbGxvd2lu
ZyBvcGVyYXRpb25zLiBUaGlzIHdheSB0aGUgY29udHJvbGxlciBkcml2ZXIgbm8gbG9uZ2VyIG5l
ZWRzIHRvCj4+PiBjaGVjayBpZiB0aGUgb3BlcmF0aW9uIGhhcyBiZWVuIHR1bmVkIG9yIG5vdCwg
aXQgY2FuIGp1c3QgbG9vayBhdCB0aGUKPj4+IGZyZXF1ZW5jeS4gV2hlbiB1c2luZyB0aGUgaGln
aGVzdCBmcmVxdWVuY3ksIFBIWSB0dW5pbmcgbXVzdCBiZQo+Pj4gdXNlZC9lbmFibGVkLCBvdGhl
cndpc2Ugbm90Lgo+Pgo+PiBObywgTWlxdWVsLCB0aGlzIG1heSBub3QgYmUgY29ycmVjdC4gVGhl
cmUgY2FuIGJlIGNhc2VzIHdoZXJlIGFuCj4+IG9wZXJhdGlvbiBkb2VzIG5vdCByZXF1aXJlIHR1
bmluZyBidXQgc3RpbGwgY2FuIHJ1biBhdCBtYXhpbXVtCj4+IGZyZXF1ZW5jeSAoMTY2IE1Ieiwg
Zm9yIGluc3RhbmNlKS4KPgo+IFRoaXMgaXMgY3VycmVudGx5IG5vdCB0aGUgY2FzZS4gQ3VycmVu
dGx5IHlvdSB0dW5lIGZvciBvbmUgb3IgdHdvIG9wcwo+IChyZWFkL3dyaXRlKSBhbmQgeW91IGVu
YWJsZSBQSFkgdHVuaW5nIG9ubHkgb24gdGhlc2UuIERvIHlvdSBwbGFuIG9uCj4gYWRkaW5nIHN1
Y2ggYSBmZWF0dXJlPyBJZiBub3QsIEkgd291bGQgbm90IGJvdGhlciB3aXRoIHRoaXMgbm93Lgo+
Cj4+IEluIHN1Y2ggc2NlbmFyaW9zLCBzaW1wbHkgc2V0dGluZwo+PiBvcC0+bWF4X2ZyZXEgdG8g
dGhlIG1heGltdW0gZnJlcXVlbmN5IHZhbHVlIGFuZCBkZWNpZGluZyB3aGV0aGVyIHRvCj4+IGVu
YWJsZSB0dW5pbmcgYmFzZWQgb24gYW4gb3AtPm1heF9mcmVxIGNvbXBhcmlzb24gd291bGQgbm90
IGJlCj4+IHN1ZmZpY2llbnQuCj4KPiBJZiB0aGVyZSBhcmUgc3VjaCBjYXNlcywgY2FuIHRoZXkg
YmUgbGlzdGVkPyBJIGFtIHNvcnJ5IGJ1dCBJIGZhaWwgdG8KPiBzZWUgd2hlcmUgdGhpcyB3b3Vs
ZCBub3Qgd29yay4gQW55IGV4YW1wbGVzIHRvIHNoYXJlPwoKSSBkb24ndCBrbm93IGlmIHlvdSBn
b3QgbXkgZmVlZGJhY2ssIGJ1dCBJIHdvdWxkIGxpa2UgdG8gaGF2ZSBhbGwgY2FzZXMKaW4gbWlu
ZCB0byBkZWNpZGUgaW4gd2hpY2ggZGlyZWN0aW9uIHdlIG11c3QgZ28uIEVzcGVjaWFsbHksIEkg
d291bGQKbGlrZSB0byBtYWtlIHRoZSBicmlkZ2Ugd2l0aCBGcmllZGVyJ3Mgd29yayB3aG8gaXMg
YWxzbyAicGxheWluZyIgd2l0aAp0aGUgbWF4aW11bSBmcmVxdWVuY3kuCgpXZSBuZWVkIHRvIGNs
YXJpZnkgb3VyIG1lbnRhbCBwaWN0dXJlIG9mIHRoZSBtYXhfZnJlcSBoYW5kbGluZy4gSG93IGl0
CnNob3VsZCBiZSBkZXJpdmVkLCBob3cgYXV0b25vbW91cyBzaGFsbCB0aGUgU1BJIGNvbnRyb2xs
ZXJzIGJlIHdydCB0aGlzCnZhbHVlLCBzaGFsbCB3ZSBmbGFnIG9wZXJhdGlvbnMgdGhhdCBjYW4g
Z28gZmFzdGVyIGFuZCBpZiB5ZXMsIGNhbiB3ZQphdHRhY2ggYSBtZWFuaW5nZnVsIHZhbHVlIHRv
IHRoZXNlIG9wZXJhdGlvbnMsIGV0YyBldGMuCgpJIGZlZWwgbGlrZSB0aGlzIGlzIHRoZSBwYXJ0
IHRoYXQgbmVlZHMgZXh0cmEgdGhpbmtpbmcuIFRoZSByZXN0IG9mIHRoZQpzZXJpZXMgaXMgcHJv
bWlzaW5nLiBJIHdvdWxkIGxpa2UgdXMgdG8gY2xhcmlmeSB0aGUgbmVlZHMsIG1heWJlIHByb3Bv
c2UKc29tZSBraW5kIG9mIGRyYXdpbmcvc2xpZGVzIG9yIGV2ZW4gdGFrZSBoYWxmIGFuIGhvdXIg
dG8gZGlzY3VzcyBpbiBhCmNhbGwgb25jZSB3ZSBoYXZlIGFsbCBjYXNlcyBpbiBtaW5kLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
