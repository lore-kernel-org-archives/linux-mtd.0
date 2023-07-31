Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBB0C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC+128QkFGu20nN6pmf9BTKV9gHtrCpyGAr3vamRXpM=; b=F5oPRTBeS+09hY
	WfsSiIVIpmxpq/1S0xXpz6z8jJjMagqbkpK2/K2iVz0rdFqkXx4a8D0ud/NcSp3W+8azoRmkIa3YT
	8WoO4PsrveYWNzSTAkhh7DGq1tRMWlm6O81maLhm5ee2OGB/LOoE/jOFSEglWZ62iaQScXJ+KZd5M
	sMm+lh4ZLI9MluYp1/78rzr5Va101mnCk2cT7xskUzdtFjfuJoNkEI05i0qxe9D+DOK50nWgd3fAh
	d+S4zd8lm7+M+KmGCzJ0S0tDtEaqbqxMEmZ6d8fQZvAdZGoG0oIHvQzKoRk3vfrzpI4MMxyewybvv
	AvxJaw3rV2MSo6GJpMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOpQ-00EhyT-1v;
	Mon, 31 Jul 2023 09:04:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOpN-00Ehxi-2S
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 09:04:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26892C000B;
	Mon, 31 Jul 2023 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690794271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paD0F/s5wQsBQRkvq2Qm1XvzYl6lyAfijOD4Z469+bg=;
	b=c6voLSKxaap6HO19TVEMxOT83kiXe89mF7goxSN642GXAjveLL4uvwUd39e//bf0qagWdj
	zoCVHbQXN1wxZlGPgzmq9+dPPIOhjJu17YxojI+7Lik2/ic4K/3mJVha8bktBEwGwsO8z0
	egRm2XJYEQgCMqEnBMIlUYAmRnq8mjuW5lwkrjrLWBJgJSKSMej9MUyiDdUN5gdVqqb6SR
	SKJ1GfUymyN3kETJWoboCQ0zHqGrncAm6ewQVjOVbZYLf5FnfVip36JmU+ImIl+n8a1htO
	6rox25xmQ3vF7juOlB2n5ZJuC/xEzEOiF/Pot45qQZSBGTwdtEKV30rLvDueUQ==
Date: Mon, 31 Jul 2023 11:04:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: nand-controller: add
 nand-skip-bbtscan and nand-no-bbm-quirk DT options
Message-ID: <20230731110428.7d581494@xps-13>
In-Reply-To: <c919ba00-f741-33ff-cc6f-18988c52f14d@gmail.com>
References: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
	<20230718-curfew-jumble-aeafe95c5cc7@spud>
	<c919ba00-f741-33ff-cc6f-18988c52f14d@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_020434_084270_3458141A 
X-CRM114-Status: GOOD (  30.07  )
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

SGkgSm9oYW4sIFJpY2hhcmQsCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDE5IEp1
bCAyMDIzIDIxOjM5OjI0ICswMjAwOgoKPiBPbiA3LzE4LzIzIDE3OjQ2LCBDb25vciBEb29sZXkg
d3JvdGU6Cj4gPiBPbiBTYXQsIEp1bCAxNSwgMjAyMyBhdCAxMjo0ODoxNlBNICswMjAwLCBKb2hh
biBKb25rZXIgd3JvdGU6ICAKPiA+PiBBIE5BTkQgY2hpcCBjYW4gY29udGFpbiBhIGRpZmZlcmVu
dCBkYXRhIGZvcm1hdCB0aGVuIHRoZSBNVEQgZnJhbWV3b3JrCj4gPj4gZXhwZWN0cyBpbiB0aGUg
ZXJhc2UgYmxvY2tzIGZvciB0aGUgQmFkIEJsb2NrIFRhYmxlKEJCVCkuCj4gPj4gUmVzdWx0IGlz
IGEgZmFpbGVkIHByb2JlLCB3aGlsZSBub3RoaW5nIHdyb25nIHdpdGggdGhlIGhhcmR3YXJlLgo+
ID4+IFNvbWUgTVREIGZsYWdzIG5lZWQgdG8gYmUgc2V0IHRvIGdhaW4gYWNjZXNzIGFnYWluLgo+
ID4+Cj4gPj4gU2tpcCB0aGUgYXV0b21hdGljIEJCVCBzY2FuIHdpdGggdGhlIE5BTkRfU0tJUF9C
QlRTQ0FOIG9wdGlvbgo+ID4+IHNvIHRoYXQgdGhlIG9yaWdpbmFsIGNvbnRlbnQgaXMgdW5jaGFu
Z2VkIGR1cmluZyB0aGUgZHJpdmVyIHByb2JlLgo+ID4+IFRoZSBOQU5EX05PX0JCTV9RVUlSSyBv
cHRpb24gYWxsb3dzIHVzIHRvIGVyYXNlIGJhZCBibG9ja3Mgd2l0aAo+ID4+IHRoZSBuYW5kX2Vy
YXNlX25hbmQoKSBmdW5jdGlvbiBhbmQgdGhlIGZsYXNoX2VyYXNlIGNvbW1hbmQuCj4gPj4KPiA+
PiBBZGQgbmFuZC1za2lwLWJidHNjYW4gYW5kIG5hbmQtbm8tYmJtLXF1aXJrIERldmljZSBUcmVl
IG9wdGlvbnMsCj4gPj4gc28gdGhlIHVzZXIgaGFzIHRoZSAiZnJlZWRvbSBvZiBjaG9pY2UiIGJ5
IG5ldXRyYWwKPiA+PiBhY2Nlc3MgbW9kZSB0byByZWFkIGFuZCB3cml0ZSBpbiB3aGF0ZXZlciBm
b3JtYXQgaXMgbmVlZGVkLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSm9oYW4gSm9ua2VyIDxq
Yng2MjQ0QGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+Pgo+ID4+IFByZXZpb3VzIGRpc2N1c3Npb246
Cj4gPj4gW1BBVENIIHYzIDMvM10gbXRkOiByYXduYW5kOiByb2NrY2hpcC1uYW5kLWNvbnRyb2xs
ZXI6IGFkZCBza2lwYmJ0IG9wdGlvbgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW10ZC8xNjE4MzgyNTYwLjIzMjY5MzEuMTY4OTI2MTQzNTAyMi5KYXZhTWFpbC56aW1icmFAbm9k
LmF0Lwo+ID4+IC0tLQo+ID4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250
cm9sbGVyLnlhbWwgICAgfCAxMyArKysrKysrKysrKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiA+PiBpbmRleCBm
NzBhMzJkMmQ5ZDQuLmNhMDRkMDZhMDM3NyAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sCj4gPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFt
bAo+ID4+IEBAIC0xMDMsNiArMTAzLDE5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4+ICAgICAg
ICAgICAgdGhlIGJvb3QgUk9NIG9yIHNpbWlsYXIgcmVzdHJpY3Rpb25zLgo+ID4+ICAgICAgICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKPiA+Pgo+ID4+ICsg
ICAgICBuYW5kLW5vLWJibS1xdWlyazoKPiA+PiArICAgICAgICBkZXNjcmlwdGlvbjoKPiA+PiAr
ICAgICAgICAgIFNvbWUgY29udHJvbGxlcnMgd2l0aCBwaXBlbGluZWQgRUNDIGVuZ2luZXMgb3Zl
cnJpZGUgdGhlIEJCTSBtYXJrZXIgd2l0aAo+ID4+ICsgICAgICAgICAgZGF0YSBvciBFQ0MgYnl0
ZXMsIHRodXMgbWFraW5nIGJhZCBibG9jayBkZXRlY3Rpb24gdGhyb3VnaCBiYWQgYmxvY2sgbWFy
a2VyCj4gPj4gKyAgICAgICAgICBpbXBvc3NpYmxlLiBMZXQncyBmbGFnIHRob3NlIGNoaXBzIHNv
IHRoZSBjb3JlIGtub3dzIGl0IHNob3VsZG4ndCBjaGVjayB0aGUKPiA+PiArICAgICAgICAgIEJC
TSBhbmQgY29uc2lkZXIgYWxsIGJsb2NrcyBnb29kLgoKSSBhbSBzb3JyeSBidXQgdGhpcyBpcyB0
b3RhbGx5IGJyb2tlbi4gV2UgY2Fubm90IGp1c3QgImNvbnNpZGVyIGFsbApibG9ja3MgZ29vZCIu
Cgo+ID4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2Zs
YWcgIAo+ID4gCj4gPiBXaGlsZSB0aGlzIHNlZW1zIG9rYXksIGFzIGl0IHNlZW1zIHRvIGRlc2Ny
aWJlIGZhY2V0IG9mIHRoZSBoYXJkd2FyZS4uLgo+ID4gICAKPiA+PiArICAgICAgbmFuZC1za2lw
LWJidHNjYW46Cj4gPj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4gPj4gKyAgICAgICAgICBUaGlz
IG9wdGlvbiBza2lwcyB0aGUgQkJUIHNjYW4gZHVyaW5nIGluaXRpYWxpemF0aW9uLgo+ID4+ICsg
ICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcgIAo+ID4g
Cj4gPiAuLi50aGlzIHNlZW1zIHRvIGJlIHVzZWQgdG8gY29udHJvbCB0aGUgYmVoYXZpb3VyIG9m
IHNvZnR3YXJlLCBhbmQgZG9lcwo+ID4gbm90IGRlc2NyaWJlIHRoZSB1bmRlcmx5aW5nIGhhcmR3
YXJlLgo+ID4gCj4gPiBNYXliZSBJJ20gb2ZmLCBidXQgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBw
cm9wZXJ0eSBkb2VzIG5vdCBoaW50IGF0IHRoZQo+ID4gYXNwZWN0IG9mIHRoZSBoYXJkd2FyZSB0
aGF0IHRoaXMgYWRkcmVzc2VzLiAgCj4gCj4gSGkgQ29ub3IsCj4gCj4gCj4gVGhhbmsgeW91IQo+
IFlvdXIgcG9pbnQgaXMgY29ycmVjdC4KPiBIb3dldmVyIEkgbmVlZCBib3RoIGZsYWdzIHRvIGNo
YW5nZSBNVEQgc29mdHdhcmUgZHJpdmVyIHByb2JlIGJlaGF2aW9yIGluIGNhc2Ugb2YgZm9ybWF0
dGluZy4KPiAKPiBQYXRjaCB3YXMgbWFkZSBhZnRlciBjb21tZW50IGJ5ICBNaXF1ZWw6Cj4gJ0kg
d291bGQgcmF0aGVyIHByZWZlciBhIERUIHByb3BlcnR5IHdoaWNoIHNheXMgImRvIG5vdCB1c2Ug
dGhlCj4gc3RhbmRhcmQgcGF0dGVybiIuJwo+IAo+IERUIHNob3VsZCBkZXNjcmliZSBoYXJkd2Fy
ZSBhbmQgbm90IHNvZnR3YXJlIHByb2JlIGNvbmZpZ3VyYXRpb24uCj4gQ3VycmVudGx5IG5vdCBh
d2FyZSB3aGF0IG90aGVyIG9wdGlvbnMgd2UgaGF2ZSBmb3IgbW9kdWxlIHBhcmFtZXRlcnMuCj4g
UHJlZmVyIG15IHNvbHV0aW9uIGluIHRoZSBsaW5rLiBDb3VsZCB0aGUgTVREIG1haW50YWluZXIg
aGF2ZSBhIGxvb2sgYWdhaW4/IFRoYW5rcyEKPiBQbGVhc2UgYWR2aXNlLgoKVGhlIG1vcmUgSSB0
aGluayBhYm91dCB0aGlzLCB0aGUgbGVzcyBJIHdhbnQgdG8gc3VwcG9ydCBpdC4gWW91IGFyZQpi
YXNpY2FsbHkgZ2V0dGluZyByaWQgb2YgYW55IGJhZCBibG9jayBzdXBwb3J0IHNvIGluIHByYWN0
aWNlIHlvdSBkb24ndAp3YW50IHRvIHVzZSBtdGQuIFJpY2hhcmQsIHdoYXQgZG8geW91IHRoaW5r
PyBJIGhhdmUgbm8gc3Ryb25nIG9waW5pb24KYWJvdXQgYWxsIHRoaXMsIGJ1dCBJIGp1c3QgZmVl
bCBpdCdzIHRlcnJpYmx5IHdyb25nLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
