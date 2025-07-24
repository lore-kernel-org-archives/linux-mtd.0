Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE9CC83F26
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jul 2025 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwLkMkp2PKBfyIpSNl8+CCykrMHfKxE6/Que0G3eJsY=; b=29ftwNNCv4FlX3
	q+Z3YxKSTyotQ3BNk8sCR2zMjARng8hC53YWhrXnDmJSQnkAndsZmniXvW8lW2+kRMDAw6s+n05CL
	TKmSOVbZNDEn0amavCY3ED9H9YKA6NFPp5peEUc89vf1uwFasDkUFBmdpQCTaw9MzBRc01Z98yNJK
	BVi+k2aodoQgCjzEz1KwXiOYeYjdeBf0Zofr4dDP3uB4HjhxJoL5UzcnUN7XjWbajXRV4c4vXcMpU
	Dvbgqjq6G93gUy6DKLlCiKTcowzbYR3JH/rvvsSXzcXWJMgzUxM/YZ4KkF4hclPsBfQhXGjTWl8Oa
	emnvN/5OZYdXfCDLx1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPm-00000007dwD-0ME3;
	Thu, 24 Jul 2025 13:55:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewLo-00000007Y4J-1xS7;
	Thu, 24 Jul 2025 13:51:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37E69436D4;
	Thu, 24 Jul 2025 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73387C4CEF5;
	Thu, 24 Jul 2025 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365072;
	bh=a5F5WdeNr+6UL1FTjKLm8yq2/Q45+2nnNzBSMbUAfjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p/rhJZXJPL+hUu5+jASgQUGlnPJUr1Xc29vibLZ8cNKZe01Mj5RN+KYj7LDB+xhJb
	 o/hSi4YULMPs3UbgtcGgxe/YDYUPUE8xO8HC5+Jmd0ahq+2sKqaMEivl3B75n/w2sQ
	 tJaL41C7P/tqlizhqTU9Uq/xra5sXzQCbNBMnnzr+UXC/Uw0f+7ppybFg/Ny7vEvC8
	 iRMRIWOpswAtwWBK926ekJULZhZcKmwdDTC/Sqteu2FiAd0MNEXULYbRqpCM8ANcGX
	 JP0Zv3NVzmYt9jbIeeGkxoajWjxhIStbkfPpciaPsAuweTqnEBCI7LztQrWQ6+Nd9/
	 VQf1lb2KCJLXQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
In-Reply-To: <CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
	<20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
	<mafs01psu89sx.fsf@kernel.org>
	<CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
Date: Thu, 24 Jul 2025 15:51:08 +0200
Message-ID: <mafs0h5z1snn7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065112_543659_98464277 
X-CRM114-Status: GOOD (  32.20  )
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

SGkgQWxleGV5LAoKVGhpcyBlbWFpbCBnb3QgYnVyaWVkIGluIG15IGluYm94IHNvbWV3aGVyZS4u
LgoKT24gTW9uLCBNYXkgMTIgMjAyNSwgQWxleGV5IENoYXJrb3Ygd3JvdGU6Cgo+IEhpIFByYXR5
dXNoLAo+Cj4gT24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMToyMOKAr1BNIFByYXR5dXNoIFlhZGF2
IDxwcmF0eXVzaEBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gSGkgQWxleGV5LAo+Pgo+PiBPbiBT
YXQsIE1heSAxMCAyMDI1LCBBbGV4ZXkgQ2hhcmtvdiB3cm90ZToKPj4KPj4gPiBUaGUgY29udHJv
bGxlciBpcyB0YWlsb3JlZCB0byBTUEkgTk9SIGZsYXNoIG1lbW9yeSBhbmQgYWJzdHJhY3RzIGF3
YXkgYWxsCj4+ID4gU1BJIGNvbW11bmljYXRpb25zIGJlaGluZCBhIHNtYWxsIHNldCBvZiBNTUlP
IHJlZ2lzdGVycyBhbmQgYSBwaHlzaWNhbAo+PiA+IG1lbW9yeSBtYXBwaW5nIG9mIHRoZSBhY3R1
YWwgY2hpcCBjb250ZW50cy4KPj4gPgo+PiA+IEl0IGRvZXNuJ3QgZXhwb3NlIGNoaXAgcHJvYmlu
ZyBmdW5jdGlvbnMgYmV5b25kIHJlYWRpbmcgdGhlIElEIHRob3VnaCwgc28KPj4gPiB1c2UgbG93
ZXIgbGV2ZWwgY2hpcCBvcGNvZGVzIHZpYSB0aGUgInByb2dyYW1tYWJsZSBjb21tYW5kIG1vZGUi
IG9mIHRoZQo+PiA+IGNvbnRyb2xsZXIgYW5kIHRoZSBrZXJuZWwncyBTUEkgTk9SIGZyYW1ld29y
ayB0byBhdm9pZCBoYXJkLWNvZGluZyBjaGlwCj4+ID4gcGFyYW1ldGVycyBmb3IgZWFjaCBJRCB0
aGUgd2F5IHRoZSB2ZW5kb3Iga2VybmVsIGRvZXMgaXQuCj4+ID4KPj4gPiBDdXJyZW50bHkgdGVz
dGVkIG9uIGEgV29uZGVyTWVkaWEgV004OTUwIFNvQyB3aXRoIGEgTWFjcm9uaXggTVgyNUw0MDA1
QQo+PiA+IGZsYXNoIGNoaXAgKEFQQyBSb2NrIGJvYXJkKSwgYnV0IHNob3VsZCB3b3JrIG9uIGFs
bCBWSUEvV29uZGVyTWVkaWEgU29Dcwo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogQWxleGV5IENo
YXJrb3YgPGFsY2hhcmtAZ21haWwuY29tPgo+PiA+IC0tLQo+PiA+ICBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+ID4gIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvY29udHJvbGxlcnMvS2NvbmZpZyAgICAgIHwgIDE0ICsKPj4gPiAgZHJpdmVycy9tdGQv
c3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZSAgICAgfCAgIDEgKwo+PiA+ICBkcml2ZXJzL210
ZC9zcGktbm9yL2NvbnRyb2xsZXJzL3dtdC1zZmxhc2guYyB8IDUyNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4KPj4gRHJpdmVycyBpbiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xs
ZXJzLyBhcmUgZGVwcmVjYXRlZCwgYW5kIHdlIHdhbnQKPj4gdG8gZXZlbnR1YWxseSBnZXQgcmlk
IG9mIHRoZSBBUEkuIFRoZSBleHBlY3RlZCB3YXkgaXMgZm9yIGRyaXZlcnMgdG8gdXNlCj4+IFNQ
SSBNRU0gKGRyaXZlcnMvc3BpL3NwaS1tZW0uYykuIFNQSSBNRU0gZHJpdmVycyBhcmUgdXN1YWxs
eSBtb3JlCj4+IGdlbmVyYWwgYW5kIG5vdCB0YWlsb3JlZCBzcGVjaWZpY2FsbHkgdG8gU1BJIE5P
UiBmbGFzaGVzLCBzbyBpdCBtaWdodCBiZQo+PiBhIGJpdCB0cmlja3kgdG8gd3JpdGUgZHJpdmVy
cyBmb3Igc3BlY2lhbGl6ZWQgaGFyZHdhcmUgd2l0aCBpdC4gQnV0IEkKPj4gdGhpbmsgdGhlIGRy
aXZlcnMvc3BpL3NwaS1pbnRlbC5jIGRyaXZlciBpcyB3cml0dGVuIGZvciBzaW1pbGFyIGtpbmQg
b2YKPj4gaGFyZHdhcmUgc28gaXQgc2hvdWxkIGJlIHBvc3NpYmxlLgo+Cj4gT29wcy4gSSd2ZSBo
YWQgYSBsb29rIGF0IHNwaS1tZW0sIGFuZCBpdCBzZWVtcyBsaWtlIGl0J3Mgbm90IGEKPiBwYXJ0
aWN1bGFybHkgZml0dGluZyBhYnN0cmFjdGlvbiBmb3IgdGhpcyBjb250cm9sbGVyLgo+Cj4gRnJv
bSB3aGF0IEkgdW5kZXJzdG9vZCwgc3BpLW1lbSBwcmltYXJpbHkgZXhwZWN0cyB0byBiZSB0YWxr
aW5nIFNQSQo+IG9wY29kZXMgdG8gdGhlIGNvbnRyb2xsZXIsIGFuZCBmb3IgdGhlIGNvbnRyb2xs
ZXIvZHJpdmVyIHRvIGJyaW5nCj4gdGhlaXIgb3duIGNoaXAgcHJvYmluZyByb3V0aW5lcy4gVGhp
cyBjb250cm9sbGVyIG9uIHRoZSBvdGhlciBoYW5kCj4gYWJzdHJhY3RzIHRoZSBvcGNvZGVzIGF3
YXksIGFuZCB3YW50cyBzb21lb25lIHRvIHRlbGwgaXQgd2hhdCBpdHMKPiBmbGFzaCBjaGlwIGNh
biBkbyAodGhlIGNvbnRyb2xsZXIgaXRzZWxmIGNhbiBvbmx5IGdldCBhIGNoaXAgSUQgaW4KPiAi
bm9ybWFsIiBtb2RlLCBhbmQgaXQgbmVlZHMgdG8gc29tZWhvdyBrbm93IHRoZSBjaGlwIHNpemUg
YW5kCj4gc3RhbmRhcmQvZmFzdCByZWFkIGNhcGFiaWxpdHkgb2YgdGhlIGNoaXApLiBTbyBwcmV0
dHkgbXVjaCB0aGUKPiBvcHBvc2l0ZSwgaHVoLgoKRG9lcyBpdCB1c2UgU0ZEUCB0byBmaWd1cmUg
b3V0IHdoaWNoIG9wY29kZXMgdG8gdXNlPyBUaGVuIGl0IGZlZWxzIHZlcnkKc2ltaWxhciB0byBp
bnRlbC1zcGkuIFNlZSBbMF0gZm9yIGV4YW1wbGUuIEkga25vdyB0aGlzIGlzIGZpdHRpbmcgYQpz
cXVhcmUgcGVnIGluIGEgcm91bmQgaG9sZSwgYnV0IGlmIGl0IGlzbid0IHRvbyBwYWluZnVsIHRo
ZW4gaXQgd291bGQKbWFrZSBtYWludGVuYW5jZSBvbiBTUEkgTk9SIGVuZCBhIGJpdCBlYXNpZXIu
CgpNaWthICgrQ2MpLCB5b3UgZGlkIHRoZSBjb252ZXJzaW9uIG9mIGludGVsLXNwaSB0byBTUEkg
TUVNLiBNYXliZSB5b3UKY2FuIHNoYXJlIGhvdyBwYWluZnVsL2Vhc3kgdGhlIGNvbnZlcnNpb24g
d2FzLCBhbmQgaWYgaXQgZW5kZWQgdXAgYmVpbmcKbWFpbnRhaW5hYmxlPwoKPgo+IEluIHRoZSBl
bmQsIEkgb25seSBuZWVkIHNvbWV0aGluZyBsaWtlIHNwaV9ub3JfZGV0ZWN0KCkgYW5kIGNhbiBk
byB0aGUKPiByZXN0IGRpcmVjdGx5IG9uIHRvcCBvZiB0aGUgTVREIGZyYW1ld29yayB3aXRob3V0
IHRvdWNoaW5nIGFueSBTUEkKPiBvcGNvZGVzIGFmdGVyIHRoZSBkZXRlY3Rpb24gaXMgZG9uZS4g
SXMgdGhlcmUgYW55IG90aGVyIG5vbi1kZXByZWNhdGVkCj4gZnJhbWV3b3JrIHRoYXQgY2FuIHBy
b3ZpZGUgc29tZXRoaW5nIGxpa2UgdGhpcz8gTWF5YmUgcGh5c21hcD8gSXQKPiBsb29rcyBldmVu
IG9sZGVyIHRoYW4gU1BJIE5PUiB0aG91Z2ggOikKClswXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJz
L3NwaS9zcGktaW50ZWwuYyNuOTA1CgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
