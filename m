Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00229C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiGdOYQaML1IiJxHHUerMMbRddolqcpZIjFQYT4yan4=; b=aVJDNMgZpX+QnR
	MWofHM3NTx7wEx8mIOzVC9ly8APpHT0JpZAkSPqsXet9aRel2GZvt6yE765n7aI5ZxsBvy5H9aG+S
	AfRy5/BEW4ZIC595S7kLBa3zyJs/twdcYkQr2b6p27diMYqe+5roiWn1bncybFkmy7eSGO73georu
	7+2aVYbLt6NYE6zlPSTxhS+efpe19VbQFkhOLH20tNcJF+QrUVlV8WfW0bnhrseTLimqOiRDl38Im
	jfHlWNrihJPa8XsOLw3cI+YY9ecjh5mfoANqqZgH9kOxxfhIo5v7Pcag+9WwlB8vJJ0nHs01d7p9r
	ZpjwELn4C8tlL33gqBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ZTG-00699v-Nf; Fri, 09 Dec 2022 09:15:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ZT5-00696U-9t; Fri, 09 Dec 2022 09:14:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A05ECC000A;
	Fri,  9 Dec 2022 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670577288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8RnLDoy8tp25SHwTkiovb8GWGbv3/sxicauJU19K4U=;
	b=cYgNkYDoYt41DwhflXDt+gjhOooE64yqVPoCzTiMgMvWATWeW5f8DqUfY9O+zg65GnJTg0
	kiRvk5BIsHBLHDoVaH9iZm1nGSbiyGiCQapvdwb7kQUJpB46yNb6CiOI/6c3eR64OBfGgX
	HdXZZ5dOg2htbmcdAg5Tsh3oeA8wSdiXe1fk5rb1nWSEi46x8amCxtEUTObXHJn2Sv7yDl
	sgZRfzeg8/69B4/zGUo31ma2KUaftT0//Ncm9AENpQ8CsMApR8fUOW68Xxa2bJ+b575oM7
	iP+cLlJh4g+1kMoFuXGhUH4yXngrD+1Vinb5WGM4Y6Xhbtah1gpnmsQxSSROSQ==
Date: Fri, 9 Dec 2022 10:14:43 +0100
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
Message-ID: <20221209101443.77fbbe49@xps-13>
In-Reply-To: <f3e3a3d0-6d21-c782-38a2-c8b2c36242c3@linaro.org>
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
	<20221208062955.2546-8-xiangsheng.hou@mediatek.com>
	<fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
	<20221208110035.5649a051@xps-13>
	<f3e3a3d0-6d21-c782-38a2-c8b2c36242c3@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_011455_634363_D2C07939 
X-CRM114-Status: GOOD (  24.43  )
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
dSwgOCBEZWMgMjAyMiAxMToyNzoyNyArMDEwMDoKCj4gT24gMDgvMTIvMjAyMiAxMTowMCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEtyenlzenRvZiwKPiA+IAo+ID4ga3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRodSwgOCBEZWMgMjAyMiAxMDo0NDoxNyArMDEw
MDoKPiA+ICAgCj4gPj4gT24gMDgvMTIvMjAyMiAwNzoyOSwgWGlhbmdzaGVuZyBIb3Ugd3JvdGU6
ICAKPiA+Pj4gU3BsaXQgTWVkaWFUZWsgRUNDIGVuZ2luZSB3aXRoIHJhd25hbmQgY29udHJvbGxl
ciBhbmQgY29udmVydCB0bwo+ID4+PiBZQU1MIHNjaGVtYS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogWGlhbmdzaGVuZyBIb3UgPHhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbT4KPiA+Pj4g
LS0tCj4gPj4+ICAuLi4vYmluZGluZ3MvbXRkL21lZGlhdGVrLG10ay1uZmMueWFtbCAgICAgICAg
fCAxNTQgKysrKysrKysrKysrKysrCj4gPj4+ICAuLi4vbXRkL21lZGlhdGVrLG5hbmQtZWNjLWVu
Z2luZS55YW1sICAgICAgICAgfCAgNjIgKysrKysrCj4gPj4+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbXRrLW5hbmQudHh0ICAgICAgfCAxNzYgLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4+
ICAzIGZpbGVzIGNoYW5nZWQsIDIxNiBpbnNlcnRpb25zKCspLCAxNzYgZGVsZXRpb25zKC0pCj4g
Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9tZWRpYXRlayxtdGstbmZjLnlhbWwKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21lZGlhdGVrLG5hbmQtZWNjLWVuZ2lu
ZS55YW1sCj4gPj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9tdGstbmFuZC50eHQKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWVkaWF0ZWssbXRrLW5mYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRpYXRlayxtdGstbmZjLnlh
bWwKPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5l
YjFhNDRjN2FlNGUKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21lZGlhdGVrLG10ay1uZmMueWFtbAo+ID4+PiBAQCAt
MCwwICsxLDE1NCBAQAo+ID4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPj4+ICslWUFNTCAxLjIKPiA+Pj4gKy0tLQo+ID4+PiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbWVkaWF0ZWssbXRrLW5mYy55
YW1sIwo+ID4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4gPj4+ICsKPiA+Pj4gK3RpdGxlOiBNZWRpYVRlayhNVEspIFNvQ3MgcmF3IE5B
TkQgRkxBU0ggY29udHJvbGxlciAoTkZDKQo+ID4+PiArCj4gPj4+ICttYWludGFpbmVyczoKPiA+
Pj4gKyAgLSBYaWFuZ3NoZW5nIEhvdSA8eGlhbmdzaGVuZy5ob3VAbWVkaWF0ZWsuY29tPgo+ID4+
PiArCj4gPj4+ICtwcm9wZXJ0aWVzOgo+ID4+PiArICBjb21wYXRpYmxlOgo+ID4+PiArICAgIGVu
dW06Cj4gPj4+ICsgICAgICAtIG1lZGlhdGVrLG10MjcwMS1uZmMKPiA+Pj4gKyAgICAgIC0gbWVk
aWF0ZWssbXQyNzEyLW5mYwo+ID4+PiArICAgICAgLSBtZWRpYXRlayxtdDc2MjItbmZjCj4gPj4+
ICsKPiA+Pj4gKyAgcmVnOgo+ID4+PiArICAgIGl0ZW1zOgo+ID4+PiArICAgICAgLSBkZXNjcmlw
dGlvbjogQmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXplIG9mIE5GSS4KPiA+Pj4gKwo+ID4+
PiArICBpbnRlcnJ1cHRzOgo+ID4+PiArICAgIGl0ZW1zOgo+ID4+PiArICAgICAgLSBkZXNjcmlw
dGlvbjogTkZJIGludGVycnVwdAo+ID4+PiArCj4gPj4+ICsgIGNsb2NrczoKPiA+Pj4gKyAgICBp
dGVtczoKPiA+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNsb2NrIHVzZWQgZm9yIHRoZSBjb250
cm9sbGVyCj4gPj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBjbG9jayB1c2VkIGZvciB0aGUgcGFk
Cj4gPj4+ICsKPiA+Pj4gKyAgY2xvY2stbmFtZXM6Cj4gPj4+ICsgICAgaXRlbXM6Cj4gPj4+ICsg
ICAgICAtIGNvbnN0OiBuZmlfY2xrCj4gPj4+ICsgICAgICAtIGNvbnN0OiBwYWRfY2xrCj4gPj4+
ICsKPiA+Pj4gKyAgZWNjLWVuZ2luZToKPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjogZGV2aWNlLXRy
ZWUgbm9kZSBvZiB0aGUgcmVxdWlyZWQgRUNDIGVuZ2luZS4KPiA+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gPj4+ICsKPiA+Pj4gK3BhdHRl
cm5Qcm9wZXJ0aWVzOgo+ID4+PiArICAiXm5hbmRAW2EtZjAtOV0kIjoKPiA+Pj4gKyAgICB0eXBl
OiBvYmplY3QgICAgCj4gPj4KPiA+PiBUaGlzIHNob3VsZCBiZSBpbnN0ZWFkOgo+ID4+ICAgICAk
cmVmOiBuYW5kLWNoaXAueWFtbCMKPiA+PiAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxz
ZQo+ID4+Cj4gPj4gYW5kIHRoZW4gcHJvcGVydGllcyBiZWxvdyAoZHVlIHRvIGN1cnJlbnQgZHRz
Y2hlbWEgbGltaXRhdGlvbnMpIHNob3VsZAo+ID4+IGxpc3QgcHJvcGVydGllcyBmcm9tIG5hbmQt
Y29udHJvbGxlci55YW1sOgo+ID4+Cj4gPj4gICAgICAgbmFuZC1vbi1mbGFzaC1iYnQ6IHRydWUK
PiA+Pgo+ID4+IE9wdGlvbmFsbHksIHdlIGNvdWxkIGNyZWF0ZSBhZGRpdGlvbmFsIHNjaGVtYSAt
IG5hbmQtY29udHJvbGxlci1jaGlwLAo+ID4+IHdoaWNoIHdvdWxkIGJlIHJlZmVyZW5jZWQgZGly
ZWN0bHkgYnkgbmFuZC1jb250cm9sbGVyIGFuZCBpdHNlbGYgd291bGQKPiA+PiByZWYgbmFuZC1j
aGlwLiAgCj4gPiAKPiA+IElzbid0IHRoaXMgZW5vdWdoPyAoaW4gbGludXgtbmV4dCkKPiA+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJv
bGxlci55YW1sP2g9bXRkL25leHQjbjU0ICAKPiAKPiBObywgSSB0ZXN0ZWQgaXQgYW5kIGl0IGRv
ZXMgbm90IHdvcmsgYXMgaW50ZW5kZWQuIEluIHRoaXMgcGFydGljdWxhcgo+IGNhc2UuIEkgdGhp
bmsgdGhpcyBpcyBhIGxpbWl0YXRpb24gb2YgZHRzY2hlbWEsIGJlY2F1c2UgYmluZGluZyBpdHNl
bGYKPiBsb29rcyBmaW5lLiBUaGUgcHJvYmxlbSBpcyB0aGF0IHlvdSBoYXZlOgo+IDEuIG10ay1u
ZmMgaGF2aW5nIG5hbmRAIGNoaWxkcmVuLiBtdGstbmZjIHJlZmVyZW5jZXMgbmFuZC1jb250cm9s
bGVyCj4gd2hpY2ggYnJpbmdzIHRoZXNlIGNoaWxkcmVuLgo+IDIuIEhvd2V2ZXIgbmFuZC1jb250
cm9sbGVyIHdoaWxlIGJyaW5naW5nIHRoZXNlIGNoaWxkcmVuIGRvZXMgdHdvIHRoaW5nczoKPiBh
LiByZWY6IG5hbmQtY2hpcAo+IGIuIGFkZCBtb3JlIHByb3BldGllcwo+IAo+IDMuIFRoZSBtdGst
bmZjIG11c3QgZnVydGhlciBleHRlbmQgdGhlIG5hbmRAIGNoaWxkLgo+IDQuIElmIHlvdSBhZGQg
InVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UiIHlvdSBub3RpY2Ugd2FybmluZ3Mgb2YKPiB1
bmV2YWx1YXRlZCBwcm9wZXJ0aWUgZnJvbSBuYW5kLWNvbnRyb2xsZXIgY2hpbGRyZW4uCgpUaGFu
a3MgZm9yIHRoZSBkZXRhaWxzLiBBbnkgY2hhbmNlcyB0aGlzIGNhbiBldmVudHVhbGx5IGJlIGZp
eGVkIGF0CmR0LXNjaGVtYSBsZXZlbD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
