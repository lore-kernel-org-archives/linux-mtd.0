Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48192C77B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0afBCbVJ/Y6KMqtMsiVyME9B6e4yZrYnu7RRESTYPI=; b=yNrUodFEwMdC2T
	S4aCM/vNqLv0Q1HNuHY2QnTy3Vwxmc31r5EmPejY1ecTbkj7kFPyuG5r1BOB0coMRDER+UZoe9mm/
	iZfs6CTq1i51nnhEMnrVX3Q+UACokw8pV2dREEK5zhZtRxHGRGNj0D8om6kLmkf5GlZvofKNt+8HY
	DSFtJSoyoyY+HDLj5QjlvJEGZxjnRMAJ+OFRIVwIvERPrqMTsGIX04nXwpwGCyhLTDYzjOZvAXjOM
	Xz3GoZN0ppAqXtH3yUeYpjJyx2QMTHdBVeJfYp9iHR/IgU5jjrKnztyP1u6aCJKecmwEQcxIkO4Nq
	Qfptu5qJTrHK4qOx4uRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptmdE-000otI-1K;
	Tue, 02 May 2023 09:49:12 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptmdA-000oqy-27
	for linux-mtd@lists.infradead.org;
	Tue, 02 May 2023 09:49:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DC045E000B;
	Tue,  2 May 2023 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683020943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gfQOh2PwLRlQwHDSKhkoGrNXpAwRAnESR/q6uR4syw=;
	b=Y5M2PSY/L2VSU9ucaJhy48rOisVe/Q65cV5eN3o9/bbow5TScajZGfS8Mz1IGeWH03A2AL
	OZ04z+MNJi1LgqSLexpsmLQiFx4YgOAR5yUYqUJ53aHQwcBnu4jd+femeHT+osqvfCPkPY
	AREHvgHt3Ee8b88s5+jArsABJ9ynk2AZ2Vi1FIOaiFVOjtkcZAI8oxmBEHXgYOWWm5Np5h
	8UwK7SUmvvfEB5Rfk5hAlZzrSACRYNXEa1nJZNDe69QkYpBI6BFwu5vHEboZsDq8Hwnv6h
	Y/OBeSWpShjwMnqhJdlL+c5CXrOmryoyYmIlBtUHA2l8Ut23mHneu16/pzjg7w==
Date: Tue, 2 May 2023 11:48:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/43] dt-bindings: mtd: add DT bindings for ts7250 nand
Message-ID: <20230502114858.7152572a@xps-13>
In-Reply-To: <20230424123522.18302-23-nikita.shubin@maquefel.me>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	<20230424123522.18302-23-nikita.shubin@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_024908_963334_8FA502A2 
X-CRM114-Status: GOOD (  25.37  )
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

SGkgTmlraXRhLAoKbmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZSB3cm90ZSBvbiBNb24sIDI0IEFw
ciAyMDIzIDE1OjM0OjM4ICswMzAwOgoKPiBBZGQgWUFNTCBiaW5kaW5ncyBmb3IgdHM3MjUwIE5B
TkQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1
ZWZlbC5tZT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL210ZC90ZWNobm9sb2dpYyxuYW5kLnlhbWwg
ICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTYgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC90ZWNobm9sb2dpYyxuYW5kLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC90ZWNobm9sb2dpYyxuYW5kLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RlY2hub2xvZ2ljLG5hbmQu
eWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMjM0ZDkz
YTFjMjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC90ZWNobm9sb2dpYyxuYW5kLnlhbWwKPiBAQCAtMCwwICsxLDU2IEBACj4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiAr
JVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210
ZC90ZWNobm9sb2dpYyxuYW5kLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFRlY2hub2xvZ2ljIFN5c3Rl
bXMgTkFORCBjb250cm9sbGVyCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEx1a2FzeiBNYWpl
d3NraSA8bHVrbWFAZGVueC5kZT4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToK
PiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiB0ZWNobm9sb2dpYyx0czcyMDAtbmFuZAoK
d291bGQgLW5hbmQtY29udHJvbGxlciBpbnN0ZWFkIG9mIC1uYW5kIHdvcmsgYXMgYSBzdWZmaXgg
aGVyZT8KCllvdSBtZW50aW9uIHRzNzI1MCBpbiB0aGUgdGl0bGUsIHNob3VsZCB3ZSBoYXZlIGEg
bW9yZSBzcGVjaWZpYwpjb21wYXRpYmxlIHRoYW4gdHM3MjAwIGFzIHdlbGw/CgpJIHNlZSBieSBs
b29raW5nIGF0IHRoZSBtdGQgcGF0Y2ggdGhhdCB5b3UgYWN0dWFsbHkgdHJ5IHRvIG1hdGNoIGJv
dGgsCnNvIHRoZXkgc2hvdWxkIGJvdGggYmUgZGVmaW5lZCBpbiB0aGUgYmluZGluZ3MuCgo+ICsg
ICAgICAtIGNvbnN0OiBnZW5fbmFuZAoKVGhpcyBpcyBhIG9sZCBoYWNrIGZvciB2ZXJ5IHNpbXBs
ZSBjb250cm9sbGVycyAoY29udmVydGVkIHRvIERUIHByb2JpbmcKMTIgeWVhcnMgYWdvKS4gVGhl
IGxvZ2ljIHVzZWQgYnkgdGhpcyBkcml2ZXIgaGFzIGJlZW4gZGVwcmVjYXRlZCBmb3IKbGlrZSAx
MCB5ZWFycyBhbmQgZG9lcyBub3QgcmVhbGx5IGFwcGx5IHRvIG1vZGVybiBBUElzLiBJIHdvdWxk
IHJlYWxseQpsaWtlIHRvIGtlZXAgdGhpcyBkcml2ZXIgY29udGFpbmVkIHdpdGggcGxhdGZvcm0g
ZGF0YSBjb21pbmcgZnJvbSBhcmNoLwpkYXRhIG9ubHkuCgpJIHN1Z2dlc3QgeW91IGNyZWF0ZSBh
IHJlYWwgTkFORCBjb250cm9sbGVyIGRyaXZlciBiYXNlZCBvbiB0aGUKZ2VuZXJpYyBvbmUgKHNo
b3VsZCBub3QgYmUgdmVyeSBjb21wbGV4LCBqdXN0IGR1cGxpY2F0ZSB0aGUgY29kZSBzbyB0aGUK
bWlncmF0aW9uIHRvIHRoZSB1cC10by1kYXRlIEFQSSBpcyBlYXNlZCkgYW5kIHlvdSBmbGFnIGl0
IGFzICJtdXN0IGJlCnVwZGF0ZWQgdG8gLT5leGVjX29wKCkgc29tZWhvdy4gVGhpcyB3YXkgaWYg
c29tZW9uZSBzdGFydHMgdGhlCmNvbnZlcnNpb24sIGl0IGRvZXMgbm90IG5lZWQgdG8gY29wZSB3
aXRoIHRoZSA1IG90aGVyIHVzZXJzIG9mIHRoZQpnZW5lcmljIGRyaXZlciB3aGljaCBhbnl3YXkg
c2hhcmUgbm90aGluZyBpbiBjb21tb24gYmVzaWRlcyB0aGUKZGVwcmVjYXRlZCAtPmNtZF9jdHJs
KCkgYmFja2JvbmUuCgpJIHJlYWQgdGhlIGNvbW1lbnRzIG9uIHRoZSBjb3ZlciBsZXR0ZXIsIHBl
b3BsZSBhcmUga2luZCBvZiBwdXNoaW5nIG9uCmhhdmluZyB0aGlzIG1lcmdlZCBxdWlja2x5LiBJ
IGFtIGZpbmUgYWNjZXB0aW5nIGEgbGVnYWN5IGNvbnRyb2xsZXIKZHJpdmVyIGFuZCBtaWdyYXRp
bmcgaXQgdG8gLT5leGVjX29wKCkgbGF0ZXIsIGJ1dCB0aGUgY3VycmVudCBkcml2ZXIKY29udmVy
c2lvbiBkb2VzIG5vdCBmaXQgdGhlIGFwcHJvYWNoIHRha2VuIHllYXJzIGFnbyB0b3dhcmRzIGEg
Y2xlYW5lcgptdGQgdHJlZS4KCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+
ICsgICcjYWRkcmVzcy1jZWxscyc6IHRydWUKPiArICAnI3NpemUtY2VsbHMnOiB0cnVlCj4gKwo+
ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsKPiArdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiB0cnVlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgIG5hbmQt
cGFydHNAMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAidGVjaG5vbG9naWMsdHM3MjAwLW5hbmQi
LCAiZ2VuX25hbmQiOwo+ICsgICAgICByZWcgPSA8MHg2MDAwMDAwMCAweDgwMDAwMDA+Owo+ICsg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4g
Kwo+ICsgICAgICBwYXJ0aXRpb25AMCB7Cj4gKyAgICAgICAgbGFiZWwgPSAiVFMtQk9PVFJPTSI7
Cj4gKyAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAyMDAwMD47Cj4gKyAgICAgICAgcmVh
ZC1vbmx5Owo+ICsgICAgICB9OwoKUGFydGl0aW9ucyBhcmUgbm90IHVzZWZ1bCBoZXJlLCBidXQg
aWYgeW91IHdhbnQgdGhlbSwgdXNlIHRoZQpwYXJ0aXRpb25zIGNvbnRhaW5lciBpbnN0ZWFkLCBw
bGVhc2UuCgo+ICsKPiArICAgICAgcGFydGl0aW9uQDIwMDAwIHsKPiArICAgICAgICBsYWJlbCA9
ICJMaW51eCI7Cj4gKyAgICAgICAgcmVnID0gPDB4MDAwMjAwMDAgMHgwN2QwMDAwMD47Cj4gKyAg
ICAgIH07Cj4gKwo+ICsgICAgICBwYXJ0aXRpb25AN2QyMDAwMCB7Cj4gKyAgICAgICAgbGFiZWwg
PSAiUmVkQm9vdCI7Cj4gKyAgICAgICAgcmVnID0gPDB4MDdkMjAwMDAgMHgwMDJlMDAwMD47Cj4g
KyAgICAgICAgcmVhZC1vbmx5Owo+ICsgICAgICB9Owo+ICsgICAgfTsKPiArCj4gKy4uLgoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
