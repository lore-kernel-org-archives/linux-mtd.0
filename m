Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06ACCA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQIHprnmWak3p4VFhptsyhOKvXXocM7UBK810on9BrI=; b=G50NXLYb2y7JKx
	aKzuoT8R9Wv8Woc0+qJs9aYxFAhGufig3fFLcYsYPdAAFXASc5U5lOpb4KDhyyUieTYoqwU9MmdbQ
	IVOmA/skU/B2Bt/6rixH0iCTz+AY/g3EFUPtL9AWV5a+fHNxYQt57UOQAbnUn6PMcRCv1wTWD0ttu
	LNzGS4YgwbStlm9UbzhiwrM8Rp+iTygf8ETVL0QX9MgQHW93glOKGnaVT4yfqkr1LD8O1GTCIeGcD
	bxUuLG0eJRfuAjD9rpSuSK7/ewacF9+lqGxuVfTI3t57SW0uFq3hyM8IHde2f1ykr+GtGO8XQsiWU
	x0Dkyn5qlnTdTE49TkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKLr-0000000BAbW-1923;
	Mon, 12 Oct 2026 18:02:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKLh-0000000BAZQ-3yqF
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:02:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 801BA1A11E9;
	Mon, 12 Oct 2026 18:02:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FE39601A6;
	Mon, 12 Oct 2026 18:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B4CC11D709B8;
	Mon, 12 Oct 2026 20:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791828119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eN09B8iBlF64T0aTmOSgm5Y2C78SY2TacmK0ll+reUk=;
	b=tAcam95NZ1BivOLoK77OxsuB56U3i0Qppo9vGls9cATCKGIw5agJkxwfoWDG/OthDNehCN
	a78TLjuOsJBlAb9c9IbeUtFCXWg+wRRZUZST+frVgrNrwFyHR9/S1ky2uGhvcLosGJq9A3
	reiFa2cJApB3cf3l+Hou1A6jAIM47qX3oh6EpXUPzIlSg7zerEABZa+iQUXPtWBoCgP2w2
	xMAzUAHMsNZVbdUPaDt4CKC2Dtc6NGpogZ9SIu+0Ir/lObyEebBL0verhlnaylrZfdc3hN
	aX6MJq9RcvIOfQOFogsYem2rkhG6H2k3+A65BQJ60k0NftyLS3qCnM4730lBbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
	(James Hilliard's message of "Mon, 14 Sep 2026 15:09:47 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	<20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 20:01:51 +0200
Message-ID: <8733ua23xs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_110210_273330_39472BB8 
X-CRM114-Status: GOOD (  26.11  )
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

SGkgSmFtZXMsCgpPbiAxNC8wOS8yMDI2IGF0IDE1OjA5OjQ3IC0wNiwgSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBIHRpbWVkLW91dCB3YWl0IGNh
biByZXR1cm4gd2hpbGUgdGhlIGludGVycnVwdCBoYW5kbGVyIGlzIHN0aWxsIHVzaW5nCj4gdGhl
IHByZXZpb3VzIG9wZXJhdGlvbidzIGludGVycnVwdCBzdGF0dXMgYW5kIGVuYWJsZSBtYXNrLiBT
dGFydGluZyB0aGUKPiBuZXh0IHdhaXQgY2FsbHMgaW5pdF9jb21wbGV0aW9uKCkgb24gdGhlIHNh
bWUgb2JqZWN0LCB3aGljaCBjYW4gcmVzZXQgaXRzCj4gd2FpdHF1ZXVlIGxvY2sgd2hpbGUgdGhl
IG9sZCBoYW5kbGVyIGNhbGxzIGNvbXBsZXRlKCkuIFRoZSBvbGQgaGFuZGxlcgo+IGNhbiBhbHNv
IGNvbXBsZXRlIHRoZSBuZXcgd2FpdCBvciByZXN0b3JlIGFuIG9ic29sZXRlIGludGVycnVwdCBt
YXNrLgo+Cj4gSW5pdGlhbGl6ZSB0aGUgY29tcGxldGlvbiBvbmNlIGluIHByb2JlIGFuZCB1c2Ug
cmVpbml0X2NvbXBsZXRpb24oKSBmb3IKPiBlYWNoIGludGVycnVwdC1kcml2ZW4gd2FpdC4gT24g
dGltZW91dCwgZGlzYWJsZSBhbmQgc3luY2hyb25pemUgdGhlIElSUQo+IGJlZm9yZSBtYXNraW5n
IGNvbnRyb2xsZXIgaW50ZXJydXB0cyBhbmQgYWNrbm93bGVkZ2luZyB0aGUgd2FpdGVkLWZvcgo+
IGV2ZW50cy4gRHJhaW5pbmcgdGhlIGhhbmRsZXIgZmlyc3QgYWxzbyBwcmV2ZW50cyBhIHBhcnRp
YWwtZXZlbnQgaGFuZGxlcgo+IGZyb20gcmV3cml0aW5nIHRoZSBlbmFibGUgbWFzayBhZnRlciBp
dCBoYXMgYmVlbiBjbGVhcmVkLiBGbHVzaCB0aGVzZQo+IHJlZ2lzdGVyIHdyaXRlcyBiZWZvcmUg
cmUtZW5hYmxpbmcgdGhlIElSUSBsaW5lLCBsZWF2aW5nIHRoZSBjb250cm9sbGVyJ3MKPiBpbnRl
cnJ1cHQgc291cmNlcyBtYXNrZWQuCj4KPiBGb3Igc3VjY2Vzc2Z1bCB3YWl0cywgbW92ZSBjb21w
bGV0ZSgpIGFmdGVyIHRoZSBoYW5kbGVyJ3MgcmVnaXN0ZXIgdXBkYXRlcwo+IHNvIHRoYXQgdGhl
IG5leHQgb3BlcmF0aW9uIGNhbm5vdCByYWNlIHdpdGggdGhvc2UgdXBkYXRlcy4gS2VlcCBwb2xs
aW5nCj4gdW5jaGFuZ2VkIGFuZCBsZWF2ZSBjb250cm9sbGVyIGFuZCBETUEgYWJvcnQgaGFuZGxp
bmcgdG8gdGhlIGV4aXN0aW5nCj4gY2FsbGVycy4KPgo+IEZpeGVzOiAxZmVmNjJjMTQyM2IgKCJt
dGQ6IG5hbmQ6IGFkZCBzdW54aSBOQU5EIGZsYXNoIGNvbnRyb2xsZXIgc3VwcG9ydCIpCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KClNvIGZyb20gdGhlIGNvbW1pdCBsb2cg
SSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBmaXhpbmcgYSByYWNlLiBUaGUKcHJvYmxlbSBzZWVt
cyBsZWdpdGltYXRlLgoKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIHwgMjYg
KysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4KCi4uLgoKPiBAQCAtNDE0LDEyICs0MTYsMTMgQEAgc3Rh
dGljIGlycXJldHVybl90IHN1bnhpX25mY19pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lk
KQo+ICAJaWYgKCEoaWVuICYgc3QpKQo+ICAJCXJldHVybiBJUlFfTk9ORTsKPiAgCj4gLQlpZiAo
KGllbiAmIHN0KSA9PSBpZW4pCj4gLQkJY29tcGxldGUoJm5mYy0+Y29tcGxldGUpOwo+IC0KPiAr
CS8qIEZpbmlzaCB1cGRhdGluZyB0aGUgaW50ZXJydXB0IHN0YXRlIGJlZm9yZSB3YWtpbmcgdGhl
IG5leHQgb3BlcmF0aW9uLiAqLwo+ICAJd3JpdGVsKHN0ICYgTkZDX0lOVF9NQVNLLCBuZmMtPnJl
Z3MgKyBORkNfUkVHX1NUKTsKPiAgCXdyaXRlbCh+c3QgJiBpZW4gJiBORkNfSU5UX01BU0ssIG5m
Yy0+cmVncyArIE5GQ19SRUdfSU5UKTsKPiAgCj4gKwlpZiAoKGllbiAmIHN0KSA9PSBpZW4pCj4g
KwkJY29tcGxldGUoJm5mYy0+Y29tcGxldGUpOwo+ICsKPiAgCXJldHVybiBJUlFfSEFORExFRDsK
PiAgfQo+ICAKPiBAQCAtNDM1LDE2ICs0MzgsMTkgQEAgc3RhdGljIGludCBzdW54aV9uZmNfd2Fp
dF9ldmVudHMoc3RydWN0IHN1bnhpX25mYyAqbmZjLCB1MzIgZXZlbnRzLAo+ICAJCXRpbWVvdXRf
bXMgPSBORkNfREVGQVVMVF9USU1FT1VUX01TOwo+ICAKPiAgCWlmICghdXNlX3BvbGxpbmcpIHsK
PiAtCQlpbml0X2NvbXBsZXRpb24oJm5mYy0+Y29tcGxldGUpOwo+ICsJCXJlaW5pdF9jb21wbGV0
aW9uKCZuZmMtPmNvbXBsZXRlKTsKClRoZSB3aG9sZSBjaGFuZ2UgYXJvdW5kIChyZSlpbml0X2Nv
bXBsZXRpb24gbG9va3MgcmVsZXZhbnQgKGhlcmUgYW5kIGluIHRoZSBoYW5kbGVyKS4KCj4gIAo+
ICAJCXdyaXRlbChldmVudHMsIG5mYy0+cmVncyArIE5GQ19SRUdfSU5UKTsKPiAgCQlyZXQgPSB3
YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJm5mYy0+Y29tcGxldGUsCj4gIAkJCQkJCW1zZWNz
X3RvX2ppZmZpZXModGltZW91dF9tcykpOwo+IC0JCWlmICghcmV0KQo+ICsJCWlmICghcmV0KSB7
Cj4gKwkJCS8qIERyYWluIHRoZSBoYW5kbGVyIGJlZm9yZSBpdCBjYW4gcmVzdG9yZSBhbiBvbGQg
SVJRIG1hc2suICovCj4gKwkJCWRpc2FibGVfaXJxKG5mYy0+aXJxKTsKCmRpc2FibGVfaXJxKCkg
Zm9yIHNlcmlhbGl6aW5nIGFjY2Vzc2VzIHRvIGEgc2luZ2xlIHJlZ2lzdGVyPyBJdApjZXJ0YWlu
bHkgd29ya3MgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgaXMgc28gY29tbW9uIHRvIHVzZSBpdCBsaWtl
IHRoYXQsCmZvciBzdWNoIHNpbXBsZSBjYXNlcy4gVHlwaWNhbGx5IGluIHRoaXMgY2FzZSBJIHdv
dWxkIGhhdmUgdXNlZCBhCnNwaW5sb2NrIG1heWJlPyBPciBldmVuIGJldHRlciwgd2h5IG5vdCBq
dXN0IGF2b2lkIHRoZSByYWNlIGVudGlyZWx5CmFuZCBoYW5kbGUgdGhlIHJlZ2lzdGVyIGluIHRo
ZSB3YWl0ZXI/IFlvdSBjZXJ0YWlubHkgZG9uJ3QgbmVlZCB0byB3cml0ZQppdCBpbiB0aGUgSVJR
IGhhbmRsZXIuIFlvdSBjYW4gaGFuZGxlIHRoZSBJUlEgY29uZmlndXJhdGlvbiBhdCB0aGUKZGV2
aWNlIGxldmVsLCB3aGljaCB3aWxsIGFsc28gcHJldmVudCB0aGUgbmVlZCBmb3IgeW91ciBleHRy
YQpyZWFkbCAiYmFycmllciIgYmVmb3JlIGVuYWJsaW5nIHRoZSBJUlEuCgpGdXJ0aGVybW9yZSwg
bm93IHRoYXQgSSBoYXZlIGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcsIHJlLXJlYWRpbmcgdGhlCmNv
bW1pdCBsb2csIEkgbm93IGRpc2FncmVlIHdpdGggdGhlIGZpcnN0IHBhcnQgb2Y6Cgo+VGhlIG9s
ZCBoYW5kbGVyIGNhbiBhbHNvIGNvbXBsZXRlIHRoZSBuZXcgd2FpdCBvciByZXN0b3JlIGFuIG9i
c29sZXRlIGludGVycnVwdCBtYXNrLgoKImNvbXBsZXRlIHRoZSBuZXcgd2FpdCI/IEkgZG9uJ3Qg
c2VlIGhvdyBhIHN0YWxlIGhhbmRsZXIgY29tcGxldGVzIHRoZQpuZXh0IHdhaXQgZ2l2ZW4gdGhl
IGhhbmRsZXIgaXMgYSBoYXJkIElSUSBhbmQgdGhlIGludGVycnVwdCBlbmFibGUKcmVnaXN0ZXIg
aXMgY2xlYXJlZCBvbiB0aW1lb3V0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
