Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F80C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBohi0XW1sA0MtFSkH3EZwasq81zZzhoNIUOGK8GmwU=; b=kEGNrmC+LBDcnh
	ONM55CqnC7CxvankhqaVMAS47/u52c5/oARCMyeURAHapP2utRbHI4anl5zyPNsnX/sVQkS/6zOWE
	9QtUYrO3VzXUOQKoifc/0IFuBLTM7EyZ+koOQDd6VWzSXfcwOdR2Tv0fCigIiL/KG78k3wUpjCcct
	TfJK/5QqNpwp2F9u2qtA5U6OXJMioXpu2DBkE9ueFotcdyhIlDWEASBIAQ5i64/WOji2M3LnUyOIu
	vUHxdQENYeKAsV2vOZY+C/szJVAorupApfLUfAcjU7Hy+AxzjF9cYCbJ5EMl88CQ7SwCP5q5YBrll
	ImtJrmsDogjRmRROFxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Nsx-00Gyz0-Qr; Thu, 06 Jan 2022 08:12:35 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Nsf-00Gypd-Fq; Thu, 06 Jan 2022 08:12:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id ED0021C0009;
 Thu,  6 Jan 2022 08:12:10 +0000 (UTC)
Date: Thu, 6 Jan 2022 09:12:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: nand: meson: fix controller clock
Message-ID: <20220106091209.6b97cf3c@xps13>
In-Reply-To: <20220106033130.37623-1-liang.yang@amlogic.com>
References: <20220106033130.37623-1-liang.yang@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_001217_706016_259DB902 
X-CRM114-Status: GOOD (  14.28  )
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

SGVsbG8sCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFRodSwgNiBKYW4gMjAyMiAx
MTozMTozMCArMDgwMDoKClRoaXMgcGF0Y2ggc2hvdWxkIGJlIGluIGEgc2VyaWVzIHdpdGggIm10
ZDogcmF3bmFuZDogbWVzb246IGZpeCB0aGUKY2xvY2sgYWZ0ZXIgZGlzY2FyZGluZyBzZF9lbW1j
X2NfY2xrIiBhbmQgcG9zc2libHkgY29tZSBmaXJzdC4KCllvdSBtaXNzIGEgY29tbWl0IG1lc3Nh
Z2Ugd2hpY2ggaXMgX3ZlcnlfIGltcG9ydGFudCBnaXZlbiB0aGUgdHlwZSBvZgpjaGFuZ2UgeW91
IHByb3Bvc2UuCiAKPiBDaGFuZ2UtSWQ6IEkxNDI1YjQ5MWQ4Yjk1MDYxZTFjZTM1OGVmMzMxNDM0
MzNmYzk0ZDI0CgpDaGFuZ2UgSURzIGhhdmUgbm90aGluZyB0byBkbyBoZXJlLgoKSG93ZXZlciBh
IEZpeGVzIGFuZCBhIFNpZ25lZC1vZmYtYnkgYXJlIHdlbGNvbWUuCgpZb3UnbGwgYWxzbyBuZWVk
IHRvIENjOiBSb2IgSC4gaW4geW91ciB2Mi4KCj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9tdGQvYW1s
b2dpYyxtZXNvbi1uYW5kLnR4dCAgICAgICAgfCAxOCArKystLS0tLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNv
bi1uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dp
YyxtZXNvbi1uYW5kLnR4dAo+IGluZGV4IDU3OTRhYjExNDdjMS4uMzdmMTZmZTRmZTY2IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxt
ZXNvbi1uYW5kLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+IEBAIC0xNCwxMSArMTQsNiBAQCBSZXF1aXJlZCBw
cm9wZXJ0aWVzOgo+ICAtIGNsb2NrLW5hbWVzOiBTaG91bGQgY29udGFpbiB0aGUgZm9sbG93aW5n
Ogo+ICAJImNvcmUiIC0gTkZDIG1vZHVsZSBnYXRlIGNsb2NrCj4gIAkiZGV2aWNlIiAtIGRldmlj
ZSBjbG9jayBmcm9tIGVNTUMgc3ViIGNsb2NrIGNvbnRyb2xsZXIKPiAtCSJyeCIgLSByeCBjbG9j
ayBwaGFzZQo+IC0JInR4IiAtIHR4IGNsb2NrIHBoYXNlCj4gLQo+IC0tIGFtbG9naWMsbW1jLXN5
c2Nvbgk6IFJlcXVpcmVkIGZvciBOQU5EIGNsb2NrcywgaXQncyBzaGFyZWQgd2l0aCBTRC9lTU1D
Cj4gLQkJCQljb250cm9sbGVyIHBvcnQgQwo+ICAKPiAgT3B0aW9uYWwgY2hpbGRyZW4gbm9kZXM6
Cj4gIENoaWxkcmVuIG5vZGVzIHJlcHJlc2VudCB0aGUgYXZhaWxhYmxlIG5hbmQgY2hpcHMuCj4g
QEAgLTI4LDExICsyMyw2IEBAIHNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL25hbmQtY29udHJvbGxlci55YW1sIGZvciBnZW5lcmljIGJpbmRpCj4gIAo+ICBFeGFtcGxl
IGRlbW9uc3RyYXRlIG9uIEFYRyBTb0M6Cj4gIAo+IC0Jc2RfZW1tY19jX2Nsa2M6IG1tY0A3MDAw
IHsKPiAtCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhnLW1tYy1jbGtjIiwgInN5c2Nv
biI7Cj4gLQkJcmVnID0gPDB4MCAweDcwMDAgMHgwIDB4ODAwPjsKPiAtCX07Cj4gLQo+ICAJbmFu
ZC1jb250cm9sbGVyQDc4MDAgewo+ICAJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1heGct
bmZjIjsKPiAgCQlyZWcgPSA8MHgwIDB4NzgwMCAweDAgMHgxMDA+Owo+IEBAIC00MSwxMSArMzEs
OSBAQCBFeGFtcGxlIGRlbW9uc3RyYXRlIG9uIEFYRyBTb0M6Cj4gIAkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDM0IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiAgCj4gIAkJY2xvY2tzID0gPCZjbGtj
IENMS0lEX1NEX0VNTUNfQz4sCj4gLQkJCTwmc2RfZW1tY19jX2Nsa2MgQ0xLSURfTU1DX0RJVj4s
Cj4gLQkJCTwmc2RfZW1tY19jX2Nsa2MgQ0xLSURfTU1DX1BIQVNFX1JYPiwKPiAtCQkJPCZzZF9l
bW1jX2NfY2xrYyBDTEtJRF9NTUNfUEhBU0VfVFg+Owo+IC0JCWNsb2NrLW5hbWVzID0gImNvcmUi
LCAiZGV2aWNlIiwgInJ4IiwgInR4IjsKPiAtCQlhbWxvZ2ljLG1tYy1zeXNjb24gPSA8JnNkX2Vt
bWNfY19jbGtjPjsKPiArCQkJPCZjbGtjIENMS0lEX0ZDTEtfRElWMj47Cj4gKwkJY2xvY2stbmFt
ZXMgPSAiY29yZSIsICJkZXZpY2UiOwo+ICsJCXNkX2VtbWNfY19jbGtjID0gPDB4ZmZlMDcwMDA+
Owo+ICAKPiAgCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICAJCXBpbmN0cmwtMCA9IDwm
bmFuZF9waW5zPjsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
