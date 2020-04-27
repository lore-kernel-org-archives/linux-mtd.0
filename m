Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FFEC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78B3D206D4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVdgHT6Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78B3D206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJYuYNlm9r+fI1N6Y66k4e9DGDWst/bsxc86IwkPh+k=; b=bVdgHT6QdcmfZ7
	L59tcqllHwXiv3C18gGbmbrZREzQINFSokL+P2WwMUDB5QGneCJVW2g3q9YTpA4qeAs1y5VPR4b2q
	PEdK6jjYpDKiv4QNC9wTzyIj/wHhvN6R/qBWtZBc1CicmT8GyAZTBQ/ak5NsdxzdvZOrOdZ/TVtqf
	SXmSbt3sbb6SbNJzn3E421ALnV4ZncU74f6OgSJu2M95i24sAYJ8UYKVvjS40I81nsHPiPhzsm438
	xHJBYfSHPk/3e9bOWIORExa3dXAuvxYCev6DJob409cBoOkBWxaRZWVuyaDEtfec8SRxTwsfeJzS7
	dzeE817/sxKMocisYWgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8Bc-0003Sv-PV; Mon, 27 Apr 2020 18:08:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8Ba-0003Rt-10
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:08:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 621E0FF80C;
 Mon, 27 Apr 2020 18:08:49 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:08:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage all errors
 cases at probe time
Message-ID: <20200427200848.722f4c56@xps13>
In-Reply-To: <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_110854_339333_7C8F539B 
X-CRM114-Status: GOOD (  21.18  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gTW9uLCAyNyBB
cHIgMjAyMCAxOTo1OTozNCArMDIwMDoKCj4gT24gNC8yNy8yMCA3OjQ3IFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQ2hyaXN0b3BoZSwKPiA+IAo+ID4gQ2hyaXN0b3BoZSBLZXJlbGxv
IDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3cm90ZSBvbiBXZWQsIDE1IEFwcgo+ID4gMjAy
MCAxNzo1NzoyOCArMDIwMDoKPiA+ICAgCj4gPj4gVGhpcyBwYXRjaCBkZWZlcnMgaXRzIHByb2Jl
IHdoZW4gdGhlIGV4cGVjdGVkIHJlc2V0IGNvbnRyb2wgaXMgbm90Cj4gPj4geWV0IHJlYWR5LiBU
aGlzIHBhdGNoIGFsc28gaGFuZGxlcyBwcm9wZXJseSBhbGwgZXJyb3JzIGNhc2VzIGF0IHByb2Jl
Cj4gPj4gdGltZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8
Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAxMyArKysrKysrKystLS0tCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4+IGluZGV4IGI2ZDQ1Y2QuLjBhOTY3OTcg
MTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
PiA+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4+IEBA
IC0xOTY3LDcgKzE5NjcsMTEgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gIAl9Cj4gPj4gIAo+ID4+ICAJcnN0YyA9IGRldm1f
cmVzZXRfY29udHJvbF9nZXQoZGV2LCBOVUxMKTsKPiA+PiAtCWlmICghSVNfRVJSKHJzdGMpKSB7
Cj4gPj4gKwlpZiAoSVNfRVJSKHJzdGMpKSB7Cj4gPj4gKwkJcmV0ID0gUFRSX0VSUihyc3RjKTsK
PiA+PiArCQlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpCj4gPj4gKwkJCWdvdG8gZXJyX2Nsa19k
aXNhYmxlOwo+ID4+ICsJfSBlbHNlIHsKPiA+PiAgCQlyZXNldF9jb250cm9sX2Fzc2VydChyc3Rj
KTsKPiA+PiAgCQlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdGMpOwo+ID4+ICAJfQo+ID4+IEBA
IC0xOTc1LDcgKzE5NzksNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiA+PiAgCS8qIERNQSBzZXR1cCAqLwo+ID4+ICAJcmV0ID0g
c3RtMzJfZm1jMl9kbWFfc2V0dXAoZm1jMik7Cj4gPj4gIAlpZiAocmV0KQo+ID4+IC0JCXJldHVy
biByZXQ7Cj4gPj4gKwkJZ290byBlcnJfZG1hX3NldHVwOwo+ID4+ICAKPiA+PiAgCS8qIEZNQzIg
aW5pdCByb3V0aW5lICovCj4gPj4gIAlzdG0zMl9mbWMyX2luaXQoZm1jMik7Cj4gPj4gQEAgLTE5
OTcsNyArMjAwMSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ID4+ICAJLyogU2NhbiB0byBmaW5kIGV4aXN0ZW5jZSBvZiB0aGUg
ZGV2aWNlICovCj4gPj4gIAlyZXQgPSBuYW5kX3NjYW4oY2hpcCwgbmFuZC0+bmNzKTsKPiA+PiAg
CWlmIChyZXQpCj4gPj4gLQkJZ290byBlcnJfc2NhbjsKPiA+PiArCQlnb3RvIGVycl9kbWFfc2V0
dXA7Cj4gPj4gIAo+ID4+ICAJcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDAp
Owo+ID4+ICAJaWYgKHJldCkKPiA+PiBAQCAtMjAxMCw3ICsyMDE0LDcgQEAgc3RhdGljIGludCBz
dG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gIGVycl9k
ZXZpY2VfcmVnaXN0ZXI6Cj4gPj4gIAluYW5kX2NsZWFudXAoY2hpcCk7Cj4gPj4gIAo+ID4+IC1l
cnJfc2NhbjoKPiA+PiArZXJyX2RtYV9zZXR1cDoKPiA+PiAgCWlmIChmbWMyLT5kbWFfZWNjX2No
KQo+ID4+ICAJCWRtYV9yZWxlYXNlX2NoYW5uZWwoZm1jMi0+ZG1hX2VjY19jaCk7Cj4gPj4gIAlp
ZiAoZm1jMi0+ZG1hX3R4X2NoKQo+ID4+IEBAIC0yMDIxLDYgKzIwMjUsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+PiAgCXNn
X2ZyZWVfdGFibGUoJmZtYzItPmRtYV9kYXRhX3NnKTsKPiA+PiAgCXNnX2ZyZWVfdGFibGUoJmZt
YzItPmRtYV9lY2Nfc2cpOwo+ID4+ICAKPiA+PiArZXJyX2Nsa19kaXNhYmxlOgo+ID4+ICAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGZtYzItPmNsayk7Cj4gPj4gIAo+ID4+ICAJcmV0dXJuIHJldDsg
IAo+ID4gCj4gPiBJIGRpZG4ndCBzcG90IGl0IGR1cmluZyBteSBlYXJsaWVyIHJldmlld3MgYnV0
IEkgcmVhbGx5IHByZWZlciB1c2luZwo+ID4gbGFiZWxzIGV4cGxhaW5pbmcgd2hhdCB5b3UgZG8g
dGhhbiBoYXZpbmcgdGhlIHNhbWUgbmFtZSBvZiB0aGUgZnVuY3Rpb24KPiA+IHdoaWNoIGZhaWxl
ZC4gVGhpcyB3YXkgeW91IGRvbid0IGhhdmUgdG8gcmV3b3JrIHRoZSBlcnJvciBwYXRoIHdoZW4K
PiA+IHlvdSBoYW5kbGUgYW4gYWRkaXRpb25hbCBlcnJvci4KPiA+IAo+ID4gU28sIHdvdWxkIHlv
dSBtaW5kIGRvaW5nIHRoaXMgaW4gdHdvIHN0ZXBzOgo+ID4gCj4gPiAxLwo+ID4gUmVwbGFjZQo+
ID4gCj4gPiAgICAgZXJyX3NjYW46Cj4gPiAKPiA+IHdpdGgsIGVnLgo+ID4gCj4gPiAgICAgcmVs
ZWFzZV9kbWFfb2JqczogIAo+IAo+IFRoZSBeZXJyXyBwcmVmaXggaW4gZmFpbHBhdGggbGFiZWxz
IGlzIHVzZWZ1bCwgc2luY2UgaXQncyBlYXNpbHkKPiBwb3NzaWJsZSB0byBtYXRjaCBvbiBpdCB3
aXRoIHJlZ2V4ZXMgOyBub3Qgc28gbXVjaCBvbiBhcmJpdHJhcnkgbGFiZWwgbmFtZS4KCkkgZ3Vl
c3Mgc28sIGJ1dCBpcyBpdCBhY3R1YWxseSB1c2VmdWwgdG8gY2F0Y2ggbGFiZWxzIGluIGEgcmVn
ZXg/IChyZWFsCnF1ZXN0aW9uKQoKQW55IHdheSBJIHN1cHBvc2UgY2F0Y2hpbmcgIjpcbiIgaXMg
YWxyZWFkeSBhIGdvb2QgYXBwcm94aW1hdGlvbiB0bwpmaW5kIGxhYmVscz8KCj4gCj4gYnR3IHdv
dWxkIGl0IG1ha2Ugc2Vuc2UgdG8gc3BsaXQgdGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgb2YgdGhp
cyBzZXJpZXMKPiBpbnRvIGEgc2VwYXJhdGUgc2VyaWVzID8gVGhpcyByYXduYW5kIHBhcnQgc2Vl
bXMgbW9yZSBsaWtlIGFuIHVucmVsYXRlZAo+IGNsZWFudXAuCgpBcyBpdCBzZWVtcyB0aGF0IHRo
ZSBNRkQgZGlzY3Vzc2lvbiBjYW4gdGFrZSBsb25nZXIsIHRoZW4gSSB3b3VsZCBzYXkKeWVzLCBh
dCBsZWFzdCBmb3IgdGhlIGNsZWFudXAvbWlzYyBjaGFuZ2VzIHBhcnQuCgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
