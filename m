Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF535C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHmgP9ngJ9Lg3hJth2PwZtgscAE2Mh1WKnPqxE5/les=; b=Ojtc4pcGBTDNwf
	gX4K7HP4s5tosb2VSwef6TSp8hFVPeY+P26DxCnNqDZRXTgNxg319ZaXiXFMWL+zNr2x8MieCmO1N
	Ce4NGkHsrcE3N7XRoJ1j0HCB4YtGXjWUjt1GysI5Rj+KGDu8pN053+IzWKnPyhphpCrl6UPkpgSAZ
	N0joNz78R3pHrUKQ9Zr+XS/iPTZcBI6NL6GXvsMARnoYExrMR7UlhnWdD+H75e41rlPKdox3PMtom
	Z/+3lM2J7udmFwTEi+6oAdt57OMI/NOSDi7A4IxBkj/Uc81t02tRH1/9nndsdSon3sFtuCPi+2/LR
	Hz7eQ5TVnrJyVhdVOpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Ntu-00GzRa-9k; Thu, 06 Jan 2022 08:13:34 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5NtD-00Gz4X-CW; Thu, 06 Jan 2022 08:12:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A79E61C0006;
 Thu,  6 Jan 2022 08:12:47 +0000 (UTC)
Date: Thu, 6 Jan 2022 09:12:46 +0100
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
Message-ID: <20220106091246.08ca66e0@xps13>
In-Reply-To: <20220106033130.37623-1-liang.yang@amlogic.com>
References: <20220106033130.37623-1-liang.yang@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_001251_602433_EADED840 
X-CRM114-Status: GOOD (  13.30  )
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

CgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFRodSwgNiBKYW4gMjAyMiAxMTozMToz
MCArMDgwMDoKCj4gQ2hhbmdlLUlkOiBJMTQyNWI0OTFkOGI5NTA2MWUxY2UzNThlZjMzMTQzNDMz
ZmM5NGQyNAo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC50eHQg
ICAgICAgIHwgMTggKysrLS0tLS0tLS0tLS0tLS0tCgpJIGZvcmdvdCB0byBtZW50aW9uLCB3aGls
ZSB5b3UncmUgYXQgaXQsIGFmdGVyIGZpeGluZyB0aGUgYmluZGluZ3MsCmNvdWxkIHlvdSBwbGVh
c2UgY29udmVydCBpdCB0byB5YW1sPwoKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+IGluZGV4IDU3
OTRhYjExNDdjMS4uMzdmMTZmZTRmZTY2IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+
IEBAIC0xNCwxMSArMTQsNiBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNsb2NrLW5hbWVz
OiBTaG91bGQgY29udGFpbiB0aGUgZm9sbG93aW5nOgo+ICAJImNvcmUiIC0gTkZDIG1vZHVsZSBn
YXRlIGNsb2NrCj4gIAkiZGV2aWNlIiAtIGRldmljZSBjbG9jayBmcm9tIGVNTUMgc3ViIGNsb2Nr
IGNvbnRyb2xsZXIKPiAtCSJyeCIgLSByeCBjbG9jayBwaGFzZQo+IC0JInR4IiAtIHR4IGNsb2Nr
IHBoYXNlCj4gLQo+IC0tIGFtbG9naWMsbW1jLXN5c2Nvbgk6IFJlcXVpcmVkIGZvciBOQU5EIGNs
b2NrcywgaXQncyBzaGFyZWQgd2l0aCBTRC9lTU1DCj4gLQkJCQljb250cm9sbGVyIHBvcnQgQwo+
ICAKPiAgT3B0aW9uYWwgY2hpbGRyZW4gbm9kZXM6Cj4gIENoaWxkcmVuIG5vZGVzIHJlcHJlc2Vu
dCB0aGUgYXZhaWxhYmxlIG5hbmQgY2hpcHMuCj4gQEAgLTI4LDExICsyMyw2IEBAIHNlZSBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGZv
ciBnZW5lcmljIGJpbmRpCj4gIAo+ICBFeGFtcGxlIGRlbW9uc3RyYXRlIG9uIEFYRyBTb0M6Cj4g
IAo+IC0Jc2RfZW1tY19jX2Nsa2M6IG1tY0A3MDAwIHsKPiAtCQljb21wYXRpYmxlID0gImFtbG9n
aWMsbWVzb24tYXhnLW1tYy1jbGtjIiwgInN5c2NvbiI7Cj4gLQkJcmVnID0gPDB4MCAweDcwMDAg
MHgwIDB4ODAwPjsKPiAtCX07Cj4gLQo+ICAJbmFuZC1jb250cm9sbGVyQDc4MDAgewo+ICAJCWNv
bXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1heGctbmZjIjsKPiAgCQlyZWcgPSA8MHgwIDB4Nzgw
MCAweDAgMHgxMDA+Owo+IEBAIC00MSwxMSArMzEsOSBAQCBFeGFtcGxlIGRlbW9uc3RyYXRlIG9u
IEFYRyBTb0M6Cj4gIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBFX0VER0VfUklT
SU5HPjsKPiAgCj4gIAkJY2xvY2tzID0gPCZjbGtjIENMS0lEX1NEX0VNTUNfQz4sCj4gLQkJCTwm
c2RfZW1tY19jX2Nsa2MgQ0xLSURfTU1DX0RJVj4sCj4gLQkJCTwmc2RfZW1tY19jX2Nsa2MgQ0xL
SURfTU1DX1BIQVNFX1JYPiwKPiAtCQkJPCZzZF9lbW1jX2NfY2xrYyBDTEtJRF9NTUNfUEhBU0Vf
VFg+Owo+IC0JCWNsb2NrLW5hbWVzID0gImNvcmUiLCAiZGV2aWNlIiwgInJ4IiwgInR4IjsKPiAt
CQlhbWxvZ2ljLG1tYy1zeXNjb24gPSA8JnNkX2VtbWNfY19jbGtjPjsKPiArCQkJPCZjbGtjIENM
S0lEX0ZDTEtfRElWMj47Cj4gKwkJY2xvY2stbmFtZXMgPSAiY29yZSIsICJkZXZpY2UiOwo+ICsJ
CXNkX2VtbWNfY19jbGtjID0gPDB4ZmZlMDcwMDA+Owo+ICAKPiAgCQlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+ICAJCXBpbmN0cmwtMCA9IDwmbmFuZF9waW5zPjsKCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
