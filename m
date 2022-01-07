Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E768FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAz2qczpx2eb0Kx17EaxXxFOqncQA1cIaGwRIsSPJKQ=; b=wIWCDEujxzfGmm
	XgA4M6PeenSl+/73WXY5j0tn6KiKm1ykwSGQdkawyyrYJoEmzvRj4A2hZFETapt8QKtofuRZf+zVd
	cQ6Z4rMk61X9TDuSUy7HYSygyFthc8Drd4m+KERV2czOVWDrcihnjRtQo5fF4yU9Ced3ke0tImyQ7
	yNIfHNUBTe0uxqYRUztwKGvsx0216tdRoxyvu/DHrfWjbNKomDF/RJN1/FbduK43IWlIJLeaC91z8
	ejf8PIb7kfWXmM1GWuNW3AMUkd8uo+STapSN1hsEkAa3X2uZY7WIJ6b1mcCwjQSvyG4YLlTIuO/L6
	rZOIzHumbLnSWxk26Pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fIn-0024B0-CD; Fri, 07 Jan 2022 02:48:25 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fIY-002440-EG; Fri, 07 Jan 2022 02:48:11 +0000
Received: from [10.28.39.73] (10.28.39.73) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 7 Jan 2022
 10:48:08 +0800
Message-ID: <e4e1c378-81de-5e45-e5da-68193148e1e1@amlogic.com>
Date: Fri, 7 Jan 2022 10:48:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] dt-bindings: nand: meson: fix controller clock
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20220106033130.37623-1-liang.yang@amlogic.com>
 <20220106091209.6b97cf3c@xps13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220106091209.6b97cf3c@xps13>
X-Originating-IP: [10.28.39.73]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_184810_510930_E7BCEE44 
X-CRM114-Status: GOOD (  13.15  )
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

SGkgTWlxdWVsLAoKT24gMjAyMi8xLzYgMTY6MTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4gCj4gSGVsbG8sCj4gCj4gbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbSB3
cm90ZSBvbiBUaHUsIDYgSmFuIDIwMjIgMTE6MzE6MzAgKzA4MDA6Cj4gCj4gVGhpcyBwYXRjaCBz
aG91bGQgYmUgaW4gYSBzZXJpZXMgd2l0aCAibXRkOiByYXduYW5kOiBtZXNvbjogZml4IHRoZQo+
IGNsb2NrIGFmdGVyIGRpc2NhcmRpbmcgc2RfZW1tY19jX2NsayIgYW5kIHBvc3NpYmx5IGNvbWUg
Zmlyc3QuCj4gCj4gWW91IG1pc3MgYSBjb21taXQgbWVzc2FnZSB3aGljaCBpcyBfdmVyeV8gaW1w
b3J0YW50IGdpdmVuIHRoZSB0eXBlIG9mCj4gY2hhbmdlIHlvdSBwcm9wb3NlLgo+ICAgCj4+IENo
YW5nZS1JZDogSTE0MjViNDkxZDhiOTUwNjFlMWNlMzU4ZWYzMzE0MzQzM2ZjOTRkMjQKPiAKPiBD
aGFuZ2UgSURzIGhhdmUgbm90aGluZyB0byBkbyBoZXJlLgo+IAo+IEhvd2V2ZXIgYSBGaXhlcyBh
bmQgYSBTaWduZWQtb2ZmLWJ5IGFyZSB3ZWxjb21lLgo+IAo+IFlvdSdsbCBhbHNvIG5lZWQgdG8g
Q2M6IFJvYiBILiBpbiB5b3VyIHYyLgo+IApvaywgaSB3aWxsIGZpeCB0aGVzZSBvbmNlIHdlIGNs
YXJpZnkgdGhlIHBhdGNoIGFib3V0IHNkX2VtbWNfY19jbGsgYW5kIApkZWNpZGUgdG8gdXNlIHRo
aXMgcGF0Y2guCj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5k
LnR4dCAgICAgICAgfCAxOCArKystLS0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5k
LnR4dAo+PiBpbmRleCA1Nzk0YWIxMTQ3YzEuLjM3ZjE2ZmU0ZmU2NiAxMDA2NDQKPj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQu
dHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dp
YyxtZXNvbi1uYW5kLnR4dAo+PiBAQCAtMTQsMTEgKzE0LDYgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKPj4gICAtIGNsb2NrLW5hbWVzOiBTaG91bGQgY29udGFpbiB0aGUgZm9sbG93aW5nOgo+PiAg
IAkiY29yZSIgLSBORkMgbW9kdWxlIGdhdGUgY2xvY2sKPj4gICAJImRldmljZSIgLSBkZXZpY2Ug
Y2xvY2sgZnJvbSBlTU1DIHN1YiBjbG9jayBjb250cm9sbGVyCj4+IC0JInJ4IiAtIHJ4IGNsb2Nr
IHBoYXNlCj4+IC0JInR4IiAtIHR4IGNsb2NrIHBoYXNlCj4+IC0KPj4gLS0gYW1sb2dpYyxtbWMt
c3lzY29uCTogUmVxdWlyZWQgZm9yIE5BTkQgY2xvY2tzLCBpdCdzIHNoYXJlZCB3aXRoIFNEL2VN
TUMKPj4gLQkJCQljb250cm9sbGVyIHBvcnQgQwo+PiAgIAo+PiAgIE9wdGlvbmFsIGNoaWxkcmVu
IG5vZGVzOgo+PiAgIENoaWxkcmVuIG5vZGVzIHJlcHJlc2VudCB0aGUgYXZhaWxhYmxlIG5hbmQg
Y2hpcHMuCj4+IEBAIC0yOCwxMSArMjMsNiBAQCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCBmb3IgZ2VuZXJpYyBiaW5kaQo+PiAg
IAo+PiAgIEV4YW1wbGUgZGVtb25zdHJhdGUgb24gQVhHIFNvQzoKPj4gICAKPj4gLQlzZF9lbW1j
X2NfY2xrYzogbW1jQDcwMDAgewo+PiAtCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhn
LW1tYy1jbGtjIiwgInN5c2NvbiI7Cj4+IC0JCXJlZyA9IDwweDAgMHg3MDAwIDB4MCAweDgwMD47
Cj4+IC0JfTsKPj4gLQo+PiAgIAluYW5kLWNvbnRyb2xsZXJANzgwMCB7Cj4+ICAgCQljb21wYXRp
YmxlID0gImFtbG9naWMsbWVzb24tYXhnLW5mYyI7Cj4+ICAgCQlyZWcgPSA8MHgwIDB4NzgwMCAw
eDAgMHgxMDA+Owo+PiBAQCAtNDEsMTEgKzMxLDkgQEAgRXhhbXBsZSBkZW1vbnN0cmF0ZSBvbiBB
WEcgU29DOgo+PiAgIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBFX0VER0VfUklT
SU5HPjsKPj4gICAKPj4gICAJCWNsb2NrcyA9IDwmY2xrYyBDTEtJRF9TRF9FTU1DX0M+LAo+PiAt
CQkJPCZzZF9lbW1jX2NfY2xrYyBDTEtJRF9NTUNfRElWPiwKPj4gLQkJCTwmc2RfZW1tY19jX2Ns
a2MgQ0xLSURfTU1DX1BIQVNFX1JYPiwKPj4gLQkJCTwmc2RfZW1tY19jX2Nsa2MgQ0xLSURfTU1D
X1BIQVNFX1RYPjsKPj4gLQkJY2xvY2stbmFtZXMgPSAiY29yZSIsICJkZXZpY2UiLCAicngiLCAi
dHgiOwo+PiAtCQlhbWxvZ2ljLG1tYy1zeXNjb24gPSA8JnNkX2VtbWNfY19jbGtjPjsKPj4gKwkJ
CTwmY2xrYyBDTEtJRF9GQ0xLX0RJVjI+Owo+PiArCQljbG9jay1uYW1lcyA9ICJjb3JlIiwgImRl
dmljZSI7Cj4+ICsJCXNkX2VtbWNfY19jbGtjID0gPDB4ZmZlMDcwMDA+Owo+PiAgIAo+PiAgIAkJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gICAJCXBpbmN0cmwtMCA9IDwmbmFuZF9waW5z
PjsKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
