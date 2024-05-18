Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C253C25B74
	for <linux-mtd@archiver.kernel.org>; Sat, 18 May 2024 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zXxx6I5F+vfjP+YPSPwPHDggrvxFJocvKiwB+/gkFg=; b=OZGMSSl52q9Vrj
	LArVsIdLufi3B5+uHLmzk4yeM2NkFRmHSi8iP5EHHz7ovyTJVGlnPdYDnrsO/WQhAZs+mOC8RWyMQ
	q0jWDEz5qwnNZYLnrbLb1coJiZEfBGkpQokkiIaTF0fVKt0VeBIeVOu1LvUTRvk1ze4UHMGPE0yz9
	akohpwIZLFPle3Nu0FUHREzeSlXCC9Q0pqhULAP/rT4oIq4XGK0loCQ6lxRwOYZ3M7noxe1HPeV9Z
	BzxJECdYcMdEMgW06KD+pSiMz6fegOY4kGC14dW9ehqRO1S4mIMYv/ZfrU2tpt4bP8cGzLazXwBhJ
	kNtZz0zmJ/ESb4SkNgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8HbO-00000009vVg-0ReG;
	Sat, 18 May 2024 10:47:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8HbK-00000009vVA-3Bnt
	for linux-mtd@lists.infradead.org;
	Sat, 18 May 2024 10:47:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4223F60002;
	Sat, 18 May 2024 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716029258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TuCcsSCKpvdBPd6CWGZI1LuxhUxx9GmmpFZhV35pMxE=;
	b=l2Q4mDmQpZqrBvG3HUBz0N5xc0aisgJVMLaH5CgskUBZ1mAD65yssP8akQ2va6JG+wk/kw
	+plzEgnWbp+Wj2Ns30Oz54XaJrNNQqbw2GYVueCGZMAuua00bB+6nAAg519/bNwQBKpho9
	yntKyXHVUw+Lbo+aaKEocM363GGO0UVX3bQ723e/3moq+/1iWvYsF3f6YTwiTmgoJpwj9y
	y/bpVgvo7Sx3l3sOKsy15Ql0DRNxKxncLm38gGxOF4vCZ4rRGP61meYIKG9kXCqmE/A6yz
	H4wmy6a8vRJ8ky3IFtLTTMfsnJpbnOAceYBk0qHnnh3N4YROelURTfpp/DwRBQ==
Date: Sat, 18 May 2024 12:47:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240518124732.584f441d@xps-13>
In-Reply-To: <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
	<20240506091444.59228fa9@xps-13>
	<CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_034743_093907_74748C9B 
X-CRM114-Status: GOOD (  30.54  )
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

SGksCgprZWd1YW5nLnpoYW5nQGdtYWlsLmNvbSB3cm90ZSBvbiBTYXQsIDE4IE1heSAyMDI0IDE2
OjAxOjAxICswODAwOgoKPiBPbiBNb24sIE1heSA2LCAyMDI0IGF0IDM6MTTigK9QTSBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIZWxsbywK
PiA+Cj4gPiBkZXZudWxsK2tlZ3VhbmcuemhhbmcuZ21haWwuY29tQGtlcm5lbC5vcmcgd3JvdGUg
b24gVHVlLCAzMCBBcHIgMjAyNAo+ID4gMTk6MTE6MTAgKzA4MDA6Cj4gPiAgCj4gPiA+IEZyb206
IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgo+ID4gPgo+ID4gPiBBZGQg
ZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50IGZvciBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxl
ci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFu
Z0BnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGluIHY3Ogo+ID4gPiAtIHJlbmFt
ZSB0aGUgZmlsZSB0byBsb29uZ3NvbixsczFiLW5mYy55YW1sCj4gPiA+Cj4gPiA+IENoYW5nZXMg
aW4gdjY6Cj4gPiA+IC0gQSBuZXdseSBhZGRlZCBwYXRjaAo+ID4gPiAtLS0KPiA+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sIHwgNjYgKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykK
PiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvbG9vbmdzb24sbHMxYi1uZmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbG9vbmdzb24sbHMxYi1uZmMueWFtbAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE2OWYyMmI5ZmQ5ZQo+ID4gPiAtLS0gL2Rl
di9udWxsCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
bG9vbmdzb24sbHMxYi1uZmMueWFtbAo+ID4gPiBAQCAtMCwwICsxLDY2IEBACj4gPiA+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+
ID4gKyVZQU1MIDEuMgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sIwo+ID4gPiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsKPiA+ID4g
K3RpdGxlOiBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlcgo+ID4gPiArCj4gPiA+ICttYWludGFp
bmVyczoKPiA+ID4gKyAgLSBLZWd1YW5nIFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4K
PiA+ID4gKwo+ID4gPiArYWxsT2Y6Cj4gPiA+ICsgIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlh
bWwKPiA+ID4gKwo+ID4gPiArcHJvcGVydGllczoKPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4g
KyAgICBvbmVPZjoKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGxvb25nc29uLGxzMWItbmZjICAKPiA+
Cj4gPiBXaGF0IGlzIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoaXMgY2hvaWNlPyBTZWVtcyBsaWtl
IHRoZSBiIHZhcmlhbnQgaGFzCj4gPiB0d28gcG9zc2libGUgaW1wbGVtZW50YXRpb25zIGFuZCBz
aG91bGQgYWx3YXlzIGJlIHByZWNlZGVkIGJ5IGEgbW9yZQo+ID4gc3BlY2lmaWMgY29tcGF0aWJs
ZS4KPiA+Cj4gPiBBcyB0aGVyZSBpcyBjdXJyZW50bHkgbm8gZGVzY3JpcHRpb24gb2YgdGhpcyBj
b250cm9sbGVyIHVwc3RyZWFtLCBJCj4gPiB3b3VsZCBub3QgY2FyZSB0b28gbXVjaCBhYm91dCBh
bnkgb3V0LW9mLXRyZWUgZGVzY3JpcHRpb24gYW5kIGRpcmVjdGx5Cj4gPiBnbyBmb3IgYSBjbGVh
biBkZXNjcmlwdGlvbi4KPiA+ICAKPiBFeGN1c2UgbWUsIHNob3VsZCBJIGFkZCBhIGRlc2NyaXB0
aW9uIGZvciB0aGlzIHByb3BlcnR5PwoKTm8sIGRlc2NyaXB0aW9uIGlzIG5vdCBuZWVkZWQuIEJ1
dCB5b3UgYXJlIGFsbG93aW5nIHRoZQoibG9vbmdzb24sbHMxYi1uZmMiIGNvbXBhdGlibGUgYWxv
bmUsIHdoaWNoIEkgdGhpbmsgaXMgbm90IHJlbGV2YW50LAp1bmxlc3MgeW91IGNvbnZpbmNlIG1l
IGl0IGlzIDotKQoKPiA+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiA+ICsgICAgICAgICAgLSBlbnVt
Ogo+ID4gPiArICAgICAgICAgICAgICAtIGxvb25nc29uLGxzMWEtbmZjCj4gPiA+ICsgICAgICAg
ICAgICAgIC0gbG9vbmdzb24sbHMxYy1uZmMKPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBsb29u
Z3NvbixsczFiLW5mYwo+ID4gPiArCj4gPiA+ICsgIHJlZzoKPiA+ID4gKyAgICBtYXhJdGVtczog
MQo+ID4gPiArCj4gPiA+ICsgIGRtYXM6Cj4gPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4gKwo+
ID4gPiArICBkbWEtbmFtZXM6Cj4gPiA+ICsgICAgY29uc3Q6IHJ4dHgKPiA+ID4gKwo+ID4gPiAr
cGF0dGVyblByb3BlcnRpZXM6Cj4gPiA+ICsgICJebmFuZEBbMC0zXSQiOgo+ID4gPiArICAgIHR5
cGU6IG9iamVjdAo+ID4gPiArICAgICRyZWY6IHJhdy1uYW5kLWNoaXAueWFtbAo+ID4gPiArCj4g
PiA+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gPiArCj4gPiA+ICtyZXF1
aXJlZDoKPiA+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiA+ICsgIC0gcmVnCj4gPiA+ICsgIC0gZG1h
cwo+ID4gPiArICAtIGRtYS1uYW1lcyAgCj4gPgo+ID4gU2hvdWxkIERNQSBwcm9wcyBiZSByZXF1
aXJlZD8KPiA+ICAKPiBZZXMuIFRoaXMgTkFORCBjb250cm9sbGVyIG9ubHkgd29ya3Mgd2l0aCBE
TUEsIHdoaWNoIG1lYW5zIHRoZSBETUEgaXMgbmVjZXNzYXJ5LgoKT2sKCj4gCj4gPiA+ICsKPiA+
ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ID4gKwo+ID4gPiArZXhhbXBsZXM6
Cj4gPiA+ICsgIC0gfAo+ID4gPiArICAgIG5hbmQtY29udHJvbGxlckAxZmU3ODAwMCB7Cj4gPiA+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAibG9vbmdzb24sbHMxYi1uZmMiOwo+ID4gPiArICAgICAg
ICByZWcgPSA8MHgxZmU3ODAwMCAweDQwPjsKPiA+ID4gKwo+ID4gPiArICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiA+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+ICsK
PiA+ID4gKyAgICAgICAgZG1hcyA9IDwmZG1hIDA+Owo+ID4gPiArICAgICAgICBkbWEtbmFtZXMg
PSAicnh0eCI7ICAKPiA+Cj4gPiBUaGVyZSBpcyBhIHByZWZlcnJlZCBzcGFjaW5nIGZvciBEVCBu
b2Rlcywgc2VlOgo+ID4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZGV2aWNldHJlZS9iaW5kaW5n
cy9kdHMtY29kaW5nLXN0eWxlLmh0bWwKPiA+ICAKPiBTb3JyeS4gSSBkb24ndCBnZXQgdGhlIG1l
YW5pbmcgb2YgcHJlZmVycmVkIHNwYWNpbmcuCj4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZGV2
aWNldHJlZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5odG1sIHNheXMKPiAiRm9yIERUUyBleGFt
cGxlcyBpbiB0aGUgc2NoZW1hLCBwcmVmZXJyZWQgaXMgZm91ci1zcGFjZSBpbmRlbnRhdGlvbi4i
Cj4gVGhlbiBJIHVzZWQgZm91ci1zcGFjZSBpbmRlbnRhdGlvbi4KCkknbSB0YWxraW5nIGFib3V0
IHRoZSBuZXcgbGluZXMgKFxuKSBiZXR3ZWVuIHRoZSBwcm9wZXJ0aWVzLgogCj4gCj4gPiA+ICsK
PiA+ID4gKyAgICAgICAgbmFuZEAwIHsKPiA+ID4gKyAgICAgICAgICAgIHJlZyA9IDwwPjsKPiA+
ID4gKyAgICAgICAgICAgIG5hbmQtdXNlLXNvZnQtZWNjLWVuZ2luZTsKPiA+ID4gKyAgICAgICAg
ICAgIG5hbmQtZWNjLWFsZ28gPSAiaGFtbWluZyI7ICAKPiA+Cj4gPiBUaGVzZSB0d28gcHJvcGVy
dGllcyBhcmUgbm90IG5lZWRlZC4gVW5sZXNzIHRoZXJlIGlzIG5vIGhhcmR3YXJlIEVDQwo+ID4g
Y2FwYWJpbGl0eSBvbiB0aGlzIGNvbnRyb2xsZXIgYW5kIGluIHRoaXMgY2FzZSB5b3UgbmVlZCB0
byBlbnN1cmUgdGhlCj4gPiBwcm9wZXJ0aWVzIGFyZSBwcmVzZW50IGluIHRoZSBzY2hlbWEuICAK
PiAKPiBFeGFjdGx5LiBUaGlzIE5BTkQgY29udHJvbGxlciBkb2Vzbid0IHN1cHBvcnQgaGFyZHdh
cmUgRUNDLgo+ICduYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmUnIGFuZCAnbmFuZC1lY2MtYWxnbycg
YXJlIHByZXNlbnQgaW4gbmFuZC1jaGlwLnlhbWwuCj4gSXMgdGhlcmUgYW55dGhpbmcgZWxzZSBJ
IHNob3VsZCBkbz8KClRocnkgYXJlIGluIG5hbmQtY2hpcC55YW1sLCB3aGljaCBtZWFucyB0aGV5
IGFyZSBhbGxvd2VkLCBidXQgSSB3YW50CnRoZW0gbWFuZGF0b3J5OgoKcmVxdWlyZWQ6CiAgLSBm
b28KICAtIGJhcgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
