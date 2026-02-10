Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44603EA8121
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7KbLncgW5YhOz90zGs0A/5MwWsftIvlA44kAoIqD2Q=; b=hlv76snRTOtpAQ
	nrrZg0u4KNn08pyAl/2R+ZuGsaPrCKRCPtWidfNXzvVweZXMqID0BU0WRtAe5KBk1L7zh3CcVpfeO
	WZtEQnVSSzqfKwJVgJRPd04inQwzRDv3K+9WD1MJvDySpWuD9awUG1cbijMKzpjp7+q2QtaFEfAE7
	283apYLkBVh11GRf1st8XbGgFTxsegtPQeiL8ocCXnha1o2/cY2oNL27QpNeq2ATHvBG+MdPHVJRk
	7918SQUoZfYBna3QkscQAuHOqhhKaf0PAVye3i6YNnibY/hdBrcwq9icOwkuathYmkl0fHpnUJmse
	g4HllK1uEmHSuBV3ZDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoj3-0000000H363-0vKc;
	Tue, 10 Feb 2026 14:28:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoiz-0000000H34i-2if8;
	Tue, 10 Feb 2026 14:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770733698;
	bh=muVQ1zQzdc9CjW+SMGZIOKie1oQVfcVMN3gvbBxDNQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6QsXv0HmwEC4rsdnP2MtqVr7K2V/6R9qghoJSN7lLgDKzayX8QLq7Z3JT7nF2b11
	 f2goSCY2LqBw56NAm/s7IDxxyiAL74ofPiLNc56kPLdOXYIrEstWGiTlmHD4QuSI9Y
	 q4ruM/bLlfad2Oq1DPAzvWtDSrVWgRt4Uw17mlDQW9GUIUGgw++IO8KB4vheHBEsIk
	 iyHxWEuVbE7mU9q+xwO258CHdCPasCNjmHKZotgf0LC8P3RKGpVQpjEvybX/hDkxYS
	 2KAhXNLy9yjE1oRVvxgeghNTrq9YjsqBhOYJNDIdJtV0S03hT+PXjpOPqeHIEdZByC
	 PfVZ0TBb919dg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E580C17E12A9;
	Tue, 10 Feb 2026 15:28:17 +0100 (CET)
Message-ID: <0ccca45c-34af-4d38-ad0f-6cd080f2882d@collabora.com>
Date: Tue, 10 Feb 2026 15:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com,
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
 <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_062821_863018_AFE20DC2 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SWwgMTAvMDIvMjYgMTQ6NDEsIFJvYiBIZXJyaW5nIGhhIHNjcml0dG86Cj4gT24gVGh1LCBKYW4g
MTUsIDIwMjYgYXQgNjo1NuKAr0FNIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vCj4gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBzdXBw
b3J0IGZvciB0aGUgbWVkaWF0ZWssbXQ4MTkyLWF1ZHN5cyBjb21wYXRpYmxlLCB3aGljaCB1c2Vz
Cj4+IGEgZGlmZmVyZW50IGF1ZGlvIGNvbnRyb2xsZXIgKG10ODE5Mi1hZmUtcGNtKSBjb21wYXJl
ZCB0byBtdDgxODMKPj4gYW5kIG10MjcwMS4KPj4KPj4gVGhpcyByZXNvbHZlcyBhIGR0YnNfY2hl
Y2sgd2FybmluZyBvbiBhbGwgTVQ4MTkyIGRldmljZXRyZWVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPgo+PiAtLS0KPj4gICAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGF1ZHN5
cy55YW1sICAgICAgICAgfCA0NiArKysrKysrKysrKysrLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxh
dWRzeXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0
ZWsvbWVkaWF0ZWssYXVkc3lzLnlhbWwKPj4gaW5kZXggZjNhNzYxY2JkMGZkLi4wOWE2YzE2ZTdl
ODIgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssYXVkc3lzLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxhdWRzeXMueWFtbAo+PiBAQCAt
NDgsMTkgKzQ4LDM5IEBAIHJlcXVpcmVkOgo+PiAgICAgLSBjb21wYXRpYmxlCj4+ICAgICAtICcj
Y2xvY2stY2VsbHMnCj4+Cj4+IC1pZjoKPj4gLSAgcHJvcGVydGllczoKPj4gLSAgICBjb21wYXRp
YmxlOgo+PiAtICAgICAgY29udGFpbnM6Cj4+IC0gICAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgx
ODMtYXVkaW9zeXMKPj4gLXRoZW46Cj4+IC0gIHByb3BlcnRpZXM6Cj4+IC0gICAgYXVkaW8tY29u
dHJvbGxlcjoKPj4gLSAgICAgICRyZWY6IC9zY2hlbWFzL3NvdW5kL21lZGlhdGVrLG10ODE4My1h
dWRpby55YW1sIwo+PiAtZWxzZToKPj4gLSAgcHJvcGVydGllczoKPj4gLSAgICBhdWRpby1jb250
cm9sbGVyOgo+PiAtICAgICAgJHJlZjogL3NjaGVtYXMvc291bmQvbWVkaWF0ZWssbXQyNzAxLWF1
ZGlvLnlhbWwjCj4+ICthbGxPZjoKPj4gKyAtIGlmOgo+IAo+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXVkc3lzLnlhbWw6NTI6MjoKPiBb
d2FybmluZ10gd3JvbmcgaW5kZW50YXRpb246IGV4cGVjdGVkIDIgYnV0IGZvdW5kIDEgKGluZGVu
dGF0aW9uKQo+IAo+IAo+PiArICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgIGNvbXBhdGlibGU6
Cj4+ICsgICAgICAgICBjb250YWluczoKPj4gKyAgICAgICAgICAgZW51bToKPj4gKyAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10MjcwMS1hdWRzeXMKPj4gKyAgICAgICAgICAgICAtIG1lZGlhdGVr
LG10NzYyMi1hdWRzeXMKPj4gKyAgIHRoZW46Cj4+ICsgICAgIHByb3BlcnRpZXM6Cj4+ICsgICAg
ICAgYXVkaW8tY29udHJvbGxlcjoKPj4gKyAgICAgICAgICRyZWY6IC9zY2hlbWFzL3NvdW5kL21l
ZGlhdGVrLG10MjcwMS1hdWRpby55YW1sIwo+PiArCj4+ICsgLSBpZjoKPj4gKyAgICAgcHJvcGVy
dGllczoKPj4gKyAgICAgICBjb21wYXRpYmxlOgo+PiArICAgICAgICAgY29udGFpbnM6Cj4+ICsg
ICAgICAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtYXVkaW9zeXMKPj4gKyAgIHRoZW46Cj4+
ICsgICAgIHByb3BlcnRpZXM6Cj4+ICsgICAgICAgYXVkaW8tY29udHJvbGxlcjoKPj4gKyAgICAg
ICAgICRyZWY6IC9zY2hlbWFzL3NvdW5kL21lZGlhdGVrLG10ODE4My1hdWRpby55YW1sIwo+PiAr
Cj4+ICsgLSBpZjoKPj4gKyAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICBjb21wYXRpYmxlOgo+
PiArICAgICAgICAgY29udGFpbnM6Cj4+ICsgICAgICAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgx
OTItYXVkc3lzCj4+ICsgICB0aGVuOgo+PiArICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgIGF1
ZGlvLWNvbnRyb2xsZXI6Cj4+ICsgICAgICAgICAkcmVmOiAvc2NoZW1hcy9zb3VuZC9tdDgxOTIt
YWZlLXBjbS55YW1sIwo+PiArCj4+Cj4gCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxhdWRzeXMueWFtbDo4NDoxOgo+IFt3YXJuaW5nXSB0
b28gbWFueSBibGFuayBsaW5lcyAoMiA+IDEpIChlbXB0eS1saW5lcykKPiAKPiBQbGVhc2UgZml4
IGFzIHRoZXNlIGFyZSB3YXJuaW5ncyBpbiBsaW51eC1uZXh0IG5vdy4KPiAKCkFjay4gU29ycnkg
Zm9yIHRoZSBtaXN0YWtlcy4gTm90IHN1cmUgaG93IHRoaXMgaGFwcGVuZWQuCgpMZXQgbWUgc2Vl
IHdoZW4gSSBjYW4gZ2V0IHNvbWUgbWludXRlcyB0byBnZXQgdGhpcyBhZGRyZXNzZWQuCgpDaGVl
cnMsCkFuZ2VsbwoKPiAKPj4gICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPj4KPj4gLS0K
Pj4gMi41Mi4wCj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
