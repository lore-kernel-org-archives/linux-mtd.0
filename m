Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8A4C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1RFpshdkqThygnSXCFp1x7CXMCsWOtgfK2fZv0jrT8=; b=UiYtyj3j2Oxr+V8Lq+rLJlwMly
	sqqyBS4lh3LQITpTNwBhs4zIbm8xmG3pzNAl4D5PuEQp+ICrfniLVaP6CWDczXyKgJimRyz8gxx68
	VvMLSjVdXwxWjf1jQYu1suQZPJWZjSVO9T57fuj2+XblZXpoBZuc6GnlHyqVl7eE4XT14+0aUG3hs
	yVbJjLamV1UkjhM79xoMk27JImucGuUQRwwjzlkzx8lCtm5LIaF7OSCCsuNxAjzsa1cDXdZ80eezQ
	M5bO7Rwtq997y+4m7SrtUruHIjVkpGKCohiWHqbWUbnM0y/ApsNmgup0L3/QxQCqltPemnwKO8fd6
	qQQ+LJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEwXP-00D496-P1; Tue, 01 Feb 2022 17:01:51 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEwXC-00D468-27; Tue, 01 Feb 2022 17:01:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 413A1223E9;
 Tue,  1 Feb 2022 18:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643734891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5X2u4lEgQtTxZHB9dZgOZUr72b3urORwKvx6DLRKSKo=;
 b=Xtwf8qsIL/iNo12NTMXqIzHHDHIMlkd3us+sYRK/KL/0QshdHLNBm68CR9CFPom2rpXGes
 1pfpPO/70vqybvrgKiyw5Jcr6FRpPiGjL8KBnyMFrDuiQ8Rk86YSYlKyTnnpqAdYk0vXes
 b123jqaWMyTKTN/bVJITivH86FGKwHk=
MIME-Version: 1.0
Date: Tue, 01 Feb 2022 18:01:28 +0100
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ansuel
 Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?Q?R?=
 =?UTF-8?Q?afa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH REBASED 2/2] dt-bindings: nvmem: cells: add MAC address
 cell
In-Reply-To: <YflX6kxWTD6qMnhJ@robh.at.kernel.org>
References: <20220125180114.12286-1-zajec5@gmail.com>
 <20220126070745.32305-1-zajec5@gmail.com>
 <20220126070745.32305-2-zajec5@gmail.com>
 <YflX6kxWTD6qMnhJ@robh.at.kernel.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <0b7b8f7ea6569f79524aea1a3d783665@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_090139_274173_3599AA3E 
X-CRM114-Status: GOOD (  29.30  )
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

QW0gMjAyMi0wMi0wMSAxNjo1NSwgc2NocmllYiBSb2IgSGVycmluZzoKPiBPbiBXZWQsIEphbiAy
NiwgMjAyMiBhdCAwODowNzo0NUFNICswMTAwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZy
b206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gCj4+IFRoaXMgYWRkcyBz
dXBwb3J0IGZvciBkZXNjcmliaW5nIGRldGFpbHMgb2YgTlZNRU0gY2VsbCBjb250YWluaW5nIE1B
Qwo+PiBhZGRyZXNzLiBUaG9zZSBhcmUgb2Z0ZW4gZGV2aWNlIHNwZWNpZmljIGFuZCBjb3VsZCBi
ZSBuaWNlbHkgc3RvcmVkIGluCj4+IERULgo+PiAKPj4gSW5pdGlhbCBkb2N1bWVudGF0aW9uIGlu
Y2x1ZGVzIHN1cHBvcnQgZm9yIGRlc2NyaWJpbmc6Cj4+IDEuIENlbGwgZGF0YSBmb3JtYXQgKGUu
Zy4gQnJvYWRjb20ncyBOVlJBTSB1c2VzIEFTQ0lJIHRvIHN0b3JlIE1BQykKPj4gMi4gUmV2ZXJz
ZWQgYnl0ZXMgZmxhc2ggKHJlcXVpcmVkIGZvciBpLk1YNi9pLk1YNyBPQ09UUCBzdXBwb3J0KQo+
PiAzLiBTb3VyY2UgZm9yIG11bHRpcGxlIGFkZHJlc3NlcyAodmVyeSBjb21tb24gaW4gaG9tZSBy
b3V0ZXJzKQo+PiAKPj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+PiAtLS0KPj4gIC4uLi9iaW5kaW5ncy9udm1lbS9jZWxscy9tYWMtYWRkcmVzcy55
YW1sICAgICB8IDk0IAo+PiArKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
OTQgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMvbWFjLWFkZHJlc3MueWFtbAo+PiAKPj4g
ZGlmZiAtLWdpdCAKPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
Y2VsbHMvbWFjLWFkZHJlc3MueWFtbCAKPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbnZtZW0vY2VsbHMvbWFjLWFkZHJlc3MueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmY4ZDE5ZTg3Y2RmMAo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxscy9tYWMt
YWRkcmVzcy55YW1sCj4+IEBAIC0wLDAgKzEsOTQgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPj4gKyVZQU1MIDEuMgo+PiArLS0t
Cj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVtL2NlbGxzL21hYy1h
ZGRyZXNzLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IE5WTUVNIGNlbGwgY29udGFpbmluZyBhIE1B
QyBhZGRyZXNzCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJsZToK
Pj4gKyAgICBjb25zdDogbWFjLWFkZHJlc3MKPj4gKwo+PiArICBmb3JtYXQ6Cj4+ICsgICAgZGVz
Y3JpcHRpb246IHwKPj4gKyAgICAgIFNvbWUgTlZNRU0gY2VsbHMgY29udGFpbiBNQUMgaW4gYSBu
b24tYmluYXJ5IGZvcm1hdC4KPj4gKwo+PiArICAgICAgQVNDSUkgc2hvdWxkIGJlIHNwZWNpZmll
ZCBpZiBNQUMgaXMgc3RyaW5nIGZvcm1hdHRlZCBsaWtlOgo+PiArICAgICAgLSAiMDE6MjM6NDU6
Njc6ODk6QUIiICgzMCAzMSAzYSAzMiAzMyAzYSAzNCAzNSAzYSAzNiAzNyAzYSAzOCAKPj4gMzkg
M2EgNDEgNDIpCj4+ICsgICAgICAtICIwMS0yMy00NS02Ny04OS1BQiIKPj4gKyAgICAgIC0gIjAx
MjM0NTY3ODlBQiIKPj4gKyAgICBlbnVtOgo+PiArICAgICAgLSBhc2NpaQo+PiArCj4+ICsgIHJl
dmVyc2VkLWJ5dGVzOgo+PiArICAgIHR5cGU6IGJvb2xlYW4KPj4gKyAgICBkZXNjcmlwdGlvbjog
fAo+PiArICAgICAgTUFDIGlzIHN0b3JlZCBpbiByZXZlcnNlZCBieXRlcyBvcmRlci4gRXhhbXBs
ZToKPj4gKyAgICAgIFN0b3JlZCB2YWx1ZTogQUIgODkgNjcgNDUgMjMgMDEKPj4gKyAgICAgIEFj
dHVhbCBNQUM6IDAxIDIzIDQ1IDY3IDg5IEFCCj4+ICsKPj4gKyAgYmFzZS1hZGRyZXNzOgo+PiAr
ICAgIHR5cGU6IGJvb2xlYW4KPj4gKyAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgTWFya3Mg
TlZNRU0gY2VsbCBhcyBwcm92aWRlciBvZiBtdWx0aXBsZSBhZGRyZXNzZXMgdGhhdCBhcmUgCj4+
IHJlbGF0aXZlIHRvCj4+ICsgICAgICB0aGUgb25lIGFjdHVhbGx5IHN0b3JlZCBwaHlzaWNhbGx5
LiBSZXNwZWN0aXZlIGFkZHJlc3NlcyBjYW4gYmUgCj4+IHJlcXVlc3RlZAo+PiArICAgICAgYnkg
c3BlY2lmeWluZyBjZWxsIGluZGV4IG9mIE5WTUVNIGNlbGwuCj4gCj4gV2hpbGUgYSBiYXNlIGFk
ZHJlc3MgaXMgY29tbW9uLCBhcmVuJ3QgdGhlcmUgZGlmZmVyZW50IHdheXMgdGhlIGJhc2UgaXMK
PiBtb2RpZmllZC4KPiAKPiBUaGUgcHJvYmxlbSB3aXRoIHRoZXNlIHByb3BlcnRpZXMgaXMgZXZl
cnkgbmV3IHZhcmlhdGlvbiByZXN1bHRzIGluIGEKPiBuZXcgcHJvcGVydHkgYW5kIHRoZSBlbmQg
cmVzdWx0IGlzIHNvbWV0aGluZyBub3Qgd2VsbCBkZXNpZ25lZC4gQSAKPiB1bmlxdWUKPiBjb21w
YXRpYmxlIHN0cmluZywgIiNudm1lbS1jZWxsLWNlbGxzIiBhbmQgY29kZSB0byBpbnRlcnByZXQg
dGhlIGRhdGEgCj4gaXMKPiBtb3JlIGZsZXhpYmxlLgoKSSBhY3R1YWxseSBsaWtlIGhhdmluZyBh
IHVuaXF1ZSBjb21wYXRpYmxlIGZvciBhbnl0aGluZyBidXQgdGhlIGJhc2ljCm9wZXJhdGlvbnMu
IEZvciBleGFtcGxlLCB0aGUgc2wyOCB2cGQgYXJlYSBhbHNvIGhhcyBhIGNoZWNrc3VtLCB3aGlj
aApjb3VsZCBiZSBoYW5kbGVkIGlmIHRoZXJlIGlzIGFuIG93biBjb21wYXRpYmxlLiBJIGRvbid0
IHRoaW5rIHRoaXMgaXMKcG9zc2libGUgd2l0aCB0aGlzIHByb3Bvc2FsLiBBbHNvIHRoZXJlIGlz
IGEgdmVyc2lvbiBmaWVsZCwgd2hhdCBpZgp3ZSBjaGFuZ2UgdGhlIGxheW91dCBvZiB0aGF0IHRo
aW5nPyBBbSBJIHN1cHBvc2VkIHRvIGNoYW5nZSB0aGUKZGV2aWNlIHRyZWU/IFRoZSBtb3JlIEkg
dGhpbmsgYWJvdXQgUm9iJ3MgcHJvcG9zYWwgdG8gaGF2ZSBhIGNvbXBhdGlibGUKdGhlIG1vcmUg
SSBsaWtlIGl0LgoKT25lIG9mIFJhZmHFgnMgY29uY2VybnMgYXJlIGNvZGUgZHVwbGljYXRpb24u
IEkuZS4gaWYgZXZlcnl0aGluZyBuZWVkcwppdHMgb3duIGNvbXBhdGlibGUgc3RyaW5nLCB0aGUg
ZHJpdmVyIHdpbGwgYWxzbyBoYXZlIHRvIGhhdmUgYWxsIG9mIAp0aGVzZS4KQnV0IEknZCBzYXks
IHRoaXMgaXMgYSBjb21tb24gdGhpbmcgaW4gbW9zdCBkcml2ZXJzLgoKVGhhdCBiZWluZyBzYWlk
LCBJJ2QgcmVhbGx5IGxpa2UgdG8gaGF2ZSBhIGNvbnNlbnMgaGVyZSBhcyB0aGlzIHRvcGljCmlz
IG9wZW4gbGlrZSBmb3JldmVyIGFuZCBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IGF0
IGxlYXN0IHdlCndlcmUgY2xlYXIgb24gdGhlIGRldmljZSB0cmVlIHNpZGUuCgotbWljaGFlbAoK
PiBGb3Igc29tZXRoaW5nIGxpa2UgdGhpcyB0byBmbHksIEkgbmVlZCBzb21lIGxldmVsIG9mIGNv
bmZpZGVuY2UgdGhpcyBpcwo+IGVub3VnaCBmb3IgZXZlcnlvbmUgZm9yIHNvbWUgdGltZSAoSU9X
LCBmaW5kIGFsbCB0aGUgcHJldmlvdXMgYXR0ZW1wdHMKPiBhbmQgZ2V0IHRob3NlIHBlb3BsZSdz
IGJ1eS1pbikuIFlvdSBoYXZlIGZvdW5kIGF0IGxlYXN0IDMgY2FzZXMsIGJ1dCBJCj4gc2VlbSB0
byByZWNhbGwgbW9yZS4KPiAKPiBSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
