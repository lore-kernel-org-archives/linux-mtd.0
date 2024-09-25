Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BA3C369D1
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYlJbv16ynxpWJ4uWdFGALtNJ/VZRK1z5zrMMRtapQ0=; b=yAEGAgOqb5zFlC
	He54QSc1JshrbSY755PHjv0pqc5DuXD1/GBkLIGH+B+PdjR/tlHoedxn5WWOv7mZOB3AP2QxUXmYt
	MlSFkwXzFuTLUXa0JcyakKL6YLdsuvnHQHrSSs50V9qAt9JSmH4E0ENgSW0cVoeqYEq+ZhEZcggtC
	pkVG9OndjPREdLKsd3jw9J0klIuVNI4pVa6AoIZxuMI2cIdRQY2UmgnY/ta+85R8A8VMh2Qz7KshH
	duV8sf+m5r+Qxy56Z8Dna6WaUuSYjlbkGb6+UB1xQeEGhTHfsSrjsuzTppCc9eyc/3yK+X3iW9fy9
	xtqLefcmuz121b6nRg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQDl-00000004sY4-01zW;
	Wed, 25 Sep 2024 11:30:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQDg-00000004sXG-3X0v
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 11:30:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 835F6E0005;
	Wed, 25 Sep 2024 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727263805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7oOFsbLYbgAjnw+DJoaE3t1B0TAykxqlrbUIk6yDMe4=;
	b=TveXuEvUwy7B7onF9Bh6GCdUGuJ1x56bn+JOKfsxXRGMPbU3neItQfPpaIAOHuiPamBaL1
	lSHCM2AjlKCPfZ1tyiBdBo1tSMqwNfIXlo47jm2xLWrkdvp6DJMK48Bs8hDZUfVdGvYvst
	rvN/kJDcqi6LmkpUH06JY+r20WwvIywVe98+qz15jVQiAeGMkEWD+2xlmAV1Qm5252qoXv
	iHomUPiSCD66E+JayIxtbxTh53v/1AOoDcCSt/D3xC0MCEMfkq7C9yK3wzW9qiGHZbZqj9
	GbNEN+DDP/DcdqoloAigwMHsxYuXsxT9qJio4ObttWeVXZymfCCqfJmynW82fw==
Date: Wed, 25 Sep 2024 13:30:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan
 <saravanak@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi
 <lorenzo@kernel.org>, upstream@airoha.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add Documentation for Airoha
 fixed-partitions
Message-ID: <20240925133003.619c40c4@xps-13>
In-Reply-To: <20240925101422.8373-3-ansuelsmth@gmail.com>
References: <20240925101422.8373-1-ansuelsmth@gmail.com>
	<20240925101422.8373-3-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_043009_784507_7B627379 
X-CRM114-Status: GOOD (  21.24  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyNSBTZXAg
MjAyNCAxMjoxMzo1OCArMDIwMDoKCj4gQWRkIERvY3VtZW50YXRpb24gZm9yIEFpcm9oYSBmaXhl
ZC1wYXJ0aXRpb25zIGNvbXBhdGlibGVzLgo+IAo+IEFpcm9oYSBiYXNlZCBTb0MgZGVjbGFyZSBh
IGRlZGljYXRlZCBwYXJ0aXRpb24gYXQgdGhlIGVuZCBvZiB0aGUgZmxhc2ggdG8KPiBzdG9yZSBj
YWxpYnJhdGlvbiBhbmQgZGV2aWNlIHNwZWNpZmljIGRhdGEsIGluIGFkZGl0aW9uIHRvIGZpeGVk
Cj4gcGFydGl0aW9ucy4KPiAKPiBUaGUgb2Zmc2V0IG9mIHRoaXMgc3BlY2lhbCBwYXJ0aXRpb24g
aXMgbm90IHdlbGwgZGVmaW5lZCBhcyBhIGN1c3RvbSBiYWQKPiBibG9jayBtYW5hZ2VtZW50IGRy
aXZlciBpcyB1c2VkIHRoYXQgcmVzZXJ2ZSBzcGFjZSBhdCB0aGUgZW5kIG9mIHRoZSBmbGFzaC4K
PiAKPiBUaGlzIGJpbmRpbmcgYWxsb3dzIGRlZmluaW5nIGFsbCBmaXhlZCBwYXJ0aXRpb25zIGFu
ZCBtYXJraW5nIHRoZSBsYXN0IG9uZQo+IHRvIGRldGVjdCB0aGUgY29ycmVjdCBvZmZzZXQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29t
Pgo+IC0tLQo+ICAuLi4vcGFydGl0aW9ucy9haXJvaGEsZml4ZWQtcGFydGl0aW9ucy55YW1sICAg
fCA4MCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9w
YXJ0aXRpb25zLnlhbWwgICB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvYWlyb2hhLGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+IAo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
YWlyb2hhLGZpeGVkLXBhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy9haXJvaGEsZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE0NWRmNTEwNjVhZgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvYWlyb2hhLGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+IEBAIC0wLDAgKzEsODAg
QEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbXRkL3BhcnRpdGlvbnMvYWlyb2hhLGZpeGVkLXBhcnRpdGlvbnMueWFtbCMKPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+
ICt0aXRsZTogQWlyb2hhIFNvQyBwYXJ0aXRpb25pbmcKPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4g
KyAgQWlyb2hhIGJhc2VkIFNvQyBkZWNsYXJlIGEgZGVkaWNhdGVkIHBhcnRpdGlvbiBhdCB0aGUg
ZW5kIG9mIHRoZSBmbGFzaCB0bwo+ICsgIHN0b3JlIGNhbGlicmF0aW9uIGFuZCBkZXZpY2Ugc3Bl
Y2lmaWMgZGF0YSwgaW4gYWRkaXRpb24gdG8gZml4ZWQgcGFydGl0aW9ucy4KPiArCj4gKyAgVGhl
IG9mZnNldCBvZiB0aGlzIHNwZWNpYWwgcGFydGl0aW9uIGlzIG5vdCB3ZWxsIGRlZmluZWQgYXMg
YSBjdXN0b20gYmFkIGJsb2NrCj4gKyAgbWFuYWdlbWVudCBkcml2ZXIgaXMgdXNlZCB0aGF0IHJl
c2VydmUgc3BhY2UgYXQgdGhlIGVuZCBvZiB0aGUgZmxhc2guCj4gKwo+ICsgIFRoaXMgYmluZGlu
ZyBhbGxvd3MgZGVmaW5pbmcgYWxsIGZpeGVkIHBhcnRpdGlvbnMgYW5kIG1hcmtpbmcgdGhlIGxh
c3Qgb25lIHRvCj4gKyAgZGV0ZWN0IHRoZSBjb3JyZWN0IG9mZnNldCBmcm9tIHRoZSBuZXcgZW5k
IG9mIHRoZSBmbGFzaC4KPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gQ2hyaXN0aWFuIE1hcmFu
Z2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+ICsKPiArc2VsZWN0OiBmYWxzZQo+ICsKPiArcHJv
cGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFpcm9oYSxmaXhlZC1wYXJ0
aXRpb25zCj4gKwo+ICsgICIjYWRkcmVzcy1jZWxscyI6Cj4gKyAgICBlbnVtOiBbIDEsIDIgXQo+
ICsKPiArICAiI3NpemUtY2VsbHMiOgo+ICsgICAgZW51bTogWyAxLCAyIF0KPiArCj4gK3BhdHRl
cm5Qcm9wZXJ0aWVzOgo+ICsgICJecGFydGl0aW9uQFswLTlhLWZdKyQiOgo+ICsgICAgJHJlZjog
cGFydGl0aW9uLnlhbWwjCj4gKyAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICBjb21wYXRpYmxlOgo+
ICsgICAgICAgIGNvbnN0OiBhaXJvaGEsZHluYW1pYy1hcnQKPiArICAgIHVuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gIiNhZGRyZXNzLWNlbGxzIgo+
ICsgIC0gIiNzaXplLWNlbGxzIgo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4g
Kwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgIHBhcnRpdGlvbnMgewo+ICsgICAgICAgIGNv
bXBhdGlibGUgPSAiYWlyb2hhLGZpeGVkLXBhcnRpdGlvbnMiOwo+ICsgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Owo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ICsKPiArICAgICAg
ICBwYXJ0aXRpb25AMCB7Cj4gKyAgICAgICAgICBsYWJlbCA9ICJib290bG9hZGVyIjsKPiArICAg
ICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDAwODAwMDA+Owo+ICsgICAgICAgIH07Cj4gKwo+
ICsgICAgICAgIHBhcnRpdGlvbkA4MDAwMCB7Cj4gKyAgICAgICAgICBsYWJlbCA9ICJ0Y2xpbnV4
IjsKPiArICAgICAgICAgIHJlZyA9IDwweDAwMDgwMDAwIDB4MDI4MDAwMDA+Owo+ICsgICAgICAg
IH07Cj4gKwo+ICsgICAgICAgIHBhcnRpdGlvbkAyODgwMDAwIHsKPiArICAgICAgICAgIGxhYmVs
ID0gInRjbGludXhfc2xhdmUiOwo+ICsgICAgICAgICAgcmVnID0gPDB4MDI4ODAwMDAgMHgwMjgw
MDAwMD47Cj4gKyAgICAgICAgfTsKPiArCj4gKyAgICAgICAgcGFydGl0aW9uQDUwODAwMDAgewo+
ICsgICAgICAgICAgbGFiZWwgPSAicm9vdGZzX2RhdGEiOwo+ICsgICAgICAgICAgcmVnID0gPDB4
NTA4MDAwMCAweDAwODAwMDAwPjsKPiArICAgICAgICB9Owo+ICsKPiArICAgICAgICBwYXJ0aXRp
b25AZmZmZmZmZmYgewo+ICsgICAgICAgICAgY29tcGF0aWJsZSA9ICJhaXJvaGEsZHluYW1pYy1h
cnQiOwo+ICsgICAgICAgICAgbGFiZWwgPSAiYXJ0IjsKPiArICAgICAgICAgIHJlZyA9IDwweGZm
ZmZmZmZmIDB4MDAzMDAwMDA+OwoKSSdtIGEgbGl0dGxlIGJpdCBwdXp6bGVkIGJ5IHRoaXMga2lu
ZCBvZiBpbmZvcm1hdGlvbiB3aGljaCBpcyBrbm93biB0bwpiZSB3cm9uZy4gQXMgdGhlIHBhcnRp
dGlvbiBvZmZzZXQgYW5kIHNpemUgbXVzdCBiZSBkeW5hbWljYWxseQpjYWxjdWxhdGVkLCB0aGlz
IHJlZyBwcm9wZXJ0eSAoYXMgd2VsbCBhcyB0aGUgc2l6ZSBwYXJhbWV0ZXIgb2YgdGhlCnByZXZp
b3VzIG9uZSkgYXJlIG5vdGFibHkgd3JvbmcuIEkgZ3Vlc3Mgd2UgYXJlIG5vdCBmdWxseSBjb25z
dHJhaW5lZApieSB0aGUgZml4ZWQtcGFydGl0aW9ucyBzY2hlbWEgaGVyZSwgc28gY291bGQgd2Ug
YXZvaWQgdGhlIHJlZyBwcm9wZXJ0eQppbiB0aGUgYWlyb2hhLGR5bmFtaWMtYXJ0IHBhcnRpdGlv
bj8gTWF5YmUgd2UgYWxzbyBuZWVkIGEgI2RlZmluZSBmb3IgYQpzcGVjaWZpYyBwbGFjZWhvbGRl
ciBpbiB0aGUgcGVudWx0aW1hdGUgcmVnIHByb3BlcnR5IHRvbyAoZm9yIHRoZSBzaXplKS4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
