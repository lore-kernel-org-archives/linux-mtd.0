Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D641C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTOOpVYmyB6M80flElSggW81IaNVPD7IKnYHd9ahAVw=; b=xJAVljczb+tRkV
	b3ZFfw1tofce3zH9bQghYj6f4zL+/ACMg1GWx+GFugr9qQWEtv6L9rvarukgWhl3yFsu3aMpVNrTb
	QJ0A78bZebe2jnCFdG8gUmQ42mqiy2Og/KGNV8LfaYJZ/QzGiClSikiQDjh3EbX2s/zABhEHHw0EI
	MQInhnE/m7NgHl7Gt8ob2LvMhZRwM/dLWvuuC3B5wtXhvf7LGCSx1w4f9meixYgnltXjXS9ByiNb6
	is8LmSKGkouYGTd7+QZ6OBEBUHK8Z1kWUNC4VlFFdCKtrSvsPUqyaJMwel618ZH9ndpATkrcfKzau
	7e3btooOCGQcbYk0xhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DiF-00BUwS-L0; Thu, 08 Dec 2022 10:01:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Dhx-00BUdN-Sd; Thu, 08 Dec 2022 10:00:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0607420003;
	Thu,  8 Dec 2022 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670493641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQBvnBipF0jBYBuu1EcKJlR/pd4YO5GJfr3JHPYqAq8=;
	b=nHcSa8RDjNx8DzhiTHdnU62FP/U3JJFVD/kHc9FRwYndvpGihZr8KVG5P3UdSF/xTo4u2v
	+5JyQUxoQvDH5LFHTBxynsI7WZm+tjoremxnDBAN29LIip92uhp2yPPoYAFk6naOyHqako
	vrCPsn27kC0s95MhEALjy8UeHjE9LZzUO19D+K6X3KM7TMIaZAdVR+fQAO2npW0ycNH54L
	U2VADhsqdaMr3hdyuVrwoqMT3t6MdCwV6Ok2YX0960rhpZXhuViLxqyX2uUnMAHZlRB7IA
	UjJOAQ+XxF0KOCp1d6WHagxXOghUylxmnaity+qqz1a+81FqR2bNqC825po7DQ==
Date: Thu, 8 Dec 2022 11:00:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
 <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, benliang.zhao@mediatek.com,
 bin.zhang@mediatek.com
Subject: Re: [PATCH v3 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Message-ID: <20221208110035.5649a051@xps-13>
In-Reply-To: <fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
	<20221208062955.2546-8-xiangsheng.hou@mediatek.com>
	<fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_020050_246472_9AC0E4EB 
X-CRM114-Status: GOOD (  17.89  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRo
dSwgOCBEZWMgMjAyMiAxMDo0NDoxNyArMDEwMDoKCj4gT24gMDgvMTIvMjAyMiAwNzoyOSwgWGlh
bmdzaGVuZyBIb3Ugd3JvdGU6Cj4gPiBTcGxpdCBNZWRpYVRlayBFQ0MgZW5naW5lIHdpdGggcmF3
bmFuZCBjb250cm9sbGVyIGFuZCBjb252ZXJ0IHRvCj4gPiBZQU1MIHNjaGVtYS4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogWGlhbmdzaGVuZyBIb3UgPHhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNv
bT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9tdGQvbWVkaWF0ZWssbXRrLW5mYy55YW1sICAg
ICAgICB8IDE1NCArKysrKysrKysrKysrKysKPiA+ICAuLi4vbXRkL21lZGlhdGVrLG5hbmQtZWNj
LWVuZ2luZS55YW1sICAgICAgICAgfCAgNjIgKysrKysrCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL210ay1uYW5kLnR4dCAgICAgIHwgMTc2IC0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgMjE2IGluc2VydGlvbnMoKyksIDE3NiBkZWxldGlvbnMoLSkKPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9tZWRpYXRlayxtdGstbmZjLnlhbWwKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRpYXRlayxuYW5kLWVjYy1lbmdpbmUueWFt
bAo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL210ay1uYW5kLnR4dAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRpYXRlayxtdGstbmZjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21lZGlhdGVrLG10ay1uZmMueWFtbAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWIxYTQ0YzdhZTRlCj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL21lZGlhdGVrLG10ay1uZmMueWFtbAo+ID4gQEAgLTAsMCArMSwxNTQgQEAKPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
PiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL210ZC9tZWRpYXRlayxtdGstbmZjLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IE1l
ZGlhVGVrKE1USykgU29DcyByYXcgTkFORCBGTEFTSCBjb250cm9sbGVyIChORkMpCj4gPiArCj4g
PiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIFhpYW5nc2hlbmcgSG91IDx4aWFuZ3NoZW5nLmhvdUBt
ZWRpYXRlay5jb20+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4g
PiArICAgIGVudW06Cj4gPiArICAgICAgLSBtZWRpYXRlayxtdDI3MDEtbmZjCj4gPiArICAgICAg
LSBtZWRpYXRlayxtdDI3MTItbmZjCj4gPiArICAgICAgLSBtZWRpYXRlayxtdDc2MjItbmZjCj4g
PiArCj4gPiArICByZWc6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IEJhc2UgcGh5c2ljYWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiBORkkuCj4gPiArCj4gPiArICBpbnRl
cnJ1cHRzOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBORkkgaW50
ZXJydXB0Cj4gPiArCj4gPiArICBjbG9ja3M6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IGNsb2NrIHVzZWQgZm9yIHRoZSBjb250cm9sbGVyCj4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogY2xvY2sgdXNlZCBmb3IgdGhlIHBhZAo+ID4gKwo+ID4gKyAgY2xvY2stbmFt
ZXM6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gY29uc3Q6IG5maV9jbGsKPiA+ICsgICAg
ICAtIGNvbnN0OiBwYWRfY2xrCj4gPiArCj4gPiArICBlY2MtZW5naW5lOgo+ID4gKyAgICBkZXNj
cmlwdGlvbjogZGV2aWNlLXRyZWUgbm9kZSBvZiB0aGUgcmVxdWlyZWQgRUNDIGVuZ2luZS4KPiA+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4g
Kwo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gKyAgIl5uYW5kQFthLWYwLTldJCI6Cj4gPiAr
ICAgIHR5cGU6IG9iamVjdCAgCj4gCj4gVGhpcyBzaG91bGQgYmUgaW5zdGVhZDoKPiAgICAgJHJl
ZjogbmFuZC1jaGlwLnlhbWwjCj4gICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiAK
PiBhbmQgdGhlbiBwcm9wZXJ0aWVzIGJlbG93IChkdWUgdG8gY3VycmVudCBkdHNjaGVtYSBsaW1p
dGF0aW9ucykgc2hvdWxkCj4gbGlzdCBwcm9wZXJ0aWVzIGZyb20gbmFuZC1jb250cm9sbGVyLnlh
bWw6Cj4gCj4gICAgICAgbmFuZC1vbi1mbGFzaC1iYnQ6IHRydWUKPiAKPiBPcHRpb25hbGx5LCB3
ZSBjb3VsZCBjcmVhdGUgYWRkaXRpb25hbCBzY2hlbWEgLSBuYW5kLWNvbnRyb2xsZXItY2hpcCwK
PiB3aGljaCB3b3VsZCBiZSByZWZlcmVuY2VkIGRpcmVjdGx5IGJ5IG5hbmQtY29udHJvbGxlciBh
bmQgaXRzZWxmIHdvdWxkCj4gcmVmIG5hbmQtY2hpcC4KCklzbid0IHRoaXMgZW5vdWdoPyAoaW4g
bGludXgtbmV4dCkKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbXRkL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvbmFuZC1jb250cm9sbGVyLnlhbWw/aD1tdGQvbmV4dCNuNTQKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
