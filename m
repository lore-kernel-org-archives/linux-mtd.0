Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8CDC7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 15 May 2023 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ip3yvAjwxKyKtParuBzXDMRAHfqGFYUZQT9uNdSG2Mg=; b=QgBM96VFUsgYw5
	5phWcE2hgdZZ4yOYtVUT5npZhdyE7umyar+Y8HulXl2jmOj/rRnTmnjV/zMZjiuzsArizzwXFIb0d
	fxyuhTfvAVqca5J1lN+Qp5MFRVnPZs4CtaGsqusMtDVov0aUClgadE8RAxyW3zpSOBJaj+UPSGf0J
	5ncAaeUTOKveGqZ8SRh84NM8fBxpUNu9jloj+Pf2AnswJsSqxH5ekRFf+E/J2UOsVhnPVs9SF6CLo
	F2LWQNxbLAV5fMx60xlnyNaNKoNgrUZWw7LO1RjRmlboE7wQ1jqh2vcTC1lK4biPk0xIeHztrexDX
	JvtHBpW9qxdrLXjI5NdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXd6-002A3s-0O;
	Mon, 15 May 2023 12:48:44 +0000
Received: from forward502a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d502])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXd1-002A2J-0V
	for linux-mtd@lists.infradead.org;
	Mon, 15 May 2023 12:48:42 +0000
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2f8a:0:640:b50b:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTP id D8B225E760;
	Mon, 15 May 2023 15:48:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id UmZpAmsWpeA0-jIilLbUc;
	Mon, 15 May 2023 15:48:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1684154911;
	bh=VPLW2FeB4P4oqrQH+SA+K09MXHahJVX3Qt+tVJ0HPgM=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=rTpsKBaUYNrDMqgZCzLo+rwpffAx4rwp/78vMHKSMBcXFL97/r+qXEFutrlS14p+b
	 N9nHSir63pkmLnLwQrG3WImQ0FBxl7jeeKkDEOfQZ65h5uMvMnGVnAXZuYrvbTErYJ
	 D+Or/YXVjjel4iP4+1vGSHhehg2xFB46eJHxymes=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <783af132a3eab7c79c95de5113c6bdb0adce19b5.camel@maquefel.me>
Subject: Re: [PATCH 22/43] dt-bindings: mtd: add DT bindings for ts7250 nand
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Lukasz Majewski <lukma@denx.de>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 15 May 2023 18:48:31 +0300
In-Reply-To: <20230502114858.7152572a@xps-13>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	 <20230424123522.18302-23-nikita.shubin@maquefel.me>
	 <20230502114858.7152572a@xps-13>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_054839_390910_E2488564 
X-CRM114-Status: GOOD (  33.40  )
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

SGVsbG8gTWlxdWVsIQoKVGhhbmsgeW91IGZvciBsb29raW5nIGludG8gaXQuCgpPbiBUdWUsIDIw
MjMtMDUtMDIgYXQgMTE6NDggKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgTmlraXRh
LAo+IAo+IG5pa2l0YS5zaHViaW5AbWFxdWVmZWwubWXCoHdyb3RlIG9uIE1vbiwgMjQgQXByIDIw
MjMgMTU6MzQ6MzggKzAzMDA6Cj4gCj4gPiBBZGQgWUFNTCBiaW5kaW5ncyBmb3IgdHM3MjUwIE5B
TkQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHViaW5A
bWFxdWVmZWwubWU+Cj4gPiAtLS0KPiA+IMKgLi4uL2JpbmRpbmdzL210ZC90ZWNobm9sb2dpYyxu
YW5kLnlhbWzCoMKgwqDCoMKgwqDCoCB8IDU2Cj4gPiArKysrKysrKysrKysrKysrKysrCj4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0
NAo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC90ZWNobm9sb2dpYyxu
YW5kLnlhbWwKPiA+IAo+ID4gZGlmZiAtLWdpdAo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3RlY2hub2xvZ2ljLG5hbmQueWFtbAo+ID4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RlY2hub2xvZ2ljLG5hbmQueWFtbAo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzIzNGQ5M2ExYzIxCj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3RlY2hub2xvZ2ljLG5hbmQueWFtbAo+ID4gQEAgLTAsMCArMSw1NiBAQAo+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiA+ICsl
WUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L210ZC90ZWNobm9sb2dpYyxuYW5kLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IFRlY2hub2xv
Z2ljIFN5c3RlbXMgTkFORCBjb250cm9sbGVyCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiAr
wqAgLSBMdWthc3ogTWFqZXdza2kgPGx1a21hQGRlbnguZGU+Cj4gPiArCj4gPiArcHJvcGVydGll
czoKPiA+ICvCoCBjb21wYXRpYmxlOgo+ID4gK8KgwqDCoCBpdGVtczoKPiA+ICvCoMKgwqDCoMKg
IC0gY29uc3Q6IHRlY2hub2xvZ2ljLHRzNzIwMC1uYW5kCj4gCj4gd291bGQgLW5hbmQtY29udHJv
bGxlciBpbnN0ZWFkIG9mIC1uYW5kIHdvcmsgYXMgYSBzdWZmaXggaGVyZT8KPiAKPiBZb3UgbWVu
dGlvbiB0czcyNTAgaW4gdGhlIHRpdGxlLCBzaG91bGQgd2UgaGF2ZSBhIG1vcmUgc3BlY2lmaWMK
PiBjb21wYXRpYmxlIHRoYW4gdHM3MjAwIGFzIHdlbGw/Cj4gCj4gSSBzZWUgYnkgbG9va2luZyBh
dCB0aGUgbXRkIHBhdGNoIHRoYXQgeW91IGFjdHVhbGx5IHRyeSB0byBtYXRjaAo+IGJvdGgsCj4g
c28gdGhleSBzaG91bGQgYm90aCBiZSBkZWZpbmVkIGluIHRoZSBiaW5kaW5ncy4KPiAKPiA+ICvC
oMKgwqDCoMKgIC0gY29uc3Q6IGdlbl9uYW5kCj4gCj4gVGhpcyBpcyBhIG9sZCBoYWNrIGZvciB2
ZXJ5IHNpbXBsZSBjb250cm9sbGVycyAoY29udmVydGVkIHRvIERUCj4gcHJvYmluZwo+IDEyIHll
YXJzIGFnbykuIFRoZSBsb2dpYyB1c2VkIGJ5IHRoaXMgZHJpdmVyIGhhcyBiZWVuIGRlcHJlY2F0
ZWQgZm9yCj4gbGlrZSAxMCB5ZWFycyBhbmQgZG9lcyBub3QgcmVhbGx5IGFwcGx5IHRvIG1vZGVy
biBBUElzLiBJIHdvdWxkCj4gcmVhbGx5Cj4gbGlrZSB0byBrZWVwIHRoaXMgZHJpdmVyIGNvbnRh
aW5lZCB3aXRoIHBsYXRmb3JtIGRhdGEgY29taW5nIGZyb20KPiBhcmNoLwo+IGRhdGEgb25seS4K
PiAKPiBJIHN1Z2dlc3QgeW91IGNyZWF0ZSBhIHJlYWwgTkFORCBjb250cm9sbGVyIGRyaXZlciBi
YXNlZCBvbiB0aGUKPiBnZW5lcmljIG9uZSAoc2hvdWxkIG5vdCBiZSB2ZXJ5IGNvbXBsZXgsIGp1
c3QgZHVwbGljYXRlIHRoZSBjb2RlIHNvCj4gdGhlCj4gbWlncmF0aW9uIHRvIHRoZSB1cC10by1k
YXRlIEFQSSBpcyBlYXNlZCkgYW5kIHlvdSBmbGFnIGl0IGFzICJtdXN0IGJlCj4gdXBkYXRlZCB0
byAtPmV4ZWNfb3AoKSBzb21laG93LiBUaGlzIHdheSBpZiBzb21lb25lIHN0YXJ0cyB0aGUKPiBj
b252ZXJzaW9uLCBpdCBkb2VzIG5vdCBuZWVkIHRvIGNvcGUgd2l0aCB0aGUgNSBvdGhlciB1c2Vy
cyBvZiB0aGUKPiBnZW5lcmljIGRyaXZlciB3aGljaCBhbnl3YXkgc2hhcmUgbm90aGluZyBpbiBj
b21tb24gYmVzaWRlcyB0aGUKPiBkZXByZWNhdGVkIC0+Y21kX2N0cmwoKSBiYWNrYm9uZS4KPiAK
PiBJIHJlYWQgdGhlIGNvbW1lbnRzIG9uIHRoZSBjb3ZlciBsZXR0ZXIsIHBlb3BsZSBhcmUga2lu
ZCBvZiBwdXNoaW5nCj4gb24KPiBoYXZpbmcgdGhpcyBtZXJnZWQgcXVpY2tseS4gSSBhbSBmaW5l
IGFjY2VwdGluZyBhIGxlZ2FjeSBjb250cm9sbGVyCj4gZHJpdmVyIGFuZCBtaWdyYXRpbmcgaXQg
dG8gLT5leGVjX29wKCkgbGF0ZXIsIGJ1dCB0aGUgY3VycmVudCBkcml2ZXIKPiBjb252ZXJzaW9u
IGRvZXMgbm90IGZpdCB0aGUgYXBwcm9hY2ggdGFrZW4geWVhcnMgYWdvIHRvd2FyZHMgYQo+IGNs
ZWFuZXIKPiBtdGQgdHJlZS4KCkRpZCB5b3UgbWVhbiB0aGF0IGkgc2hvdWxkIGF0IGxlYXN0IGlt
cGxlbWVudCBsZWdhY3kgbmFuZCBjb250cm9sbGVyLApsaWtlLCBmb3IgZXhhbXBsZSwgWHdheSAo
eHdheV9uYW5kLmMpID86CgogICAgICAgIGRhdGEtPmNoaXAubGVnYWN5LmNtZF9jdHJsID0geHdh
eV9jbWRfY3RybDsKICAgICAgICBkYXRhLT5jaGlwLmxlZ2FjeS5kZXZfcmVhZHkgPSB4d2F5X2Rl
dl9yZWFkeTsKICAgICAgICBkYXRhLT5jaGlwLmxlZ2FjeS5zZWxlY3RfY2hpcCA9IHh3YXlfc2Vs
ZWN0X2NoaXA7CiAgICAgICAgZGF0YS0+Y2hpcC5sZWdhY3kud3JpdGVfYnVmID0geHdheV93cml0
ZV9idWY7CiAgICAgICAgZGF0YS0+Y2hpcC5sZWdhY3kucmVhZF9idWYgPSB4d2F5X3JlYWRfYnVm
OwogICAgICAgIGRhdGEtPmNoaXAubGVnYWN5LnJlYWRfYnl0ZSA9IHh3YXlfcmVhZF9ieXRlOwog
ICAgICAgIGRhdGEtPmNoaXAubGVnYWN5LmNoaXBfZGVsYXkgPSAzMDsKCkFuZCB0aGUgYmVzdCBz
b2x1dGlvbiB3b3VsZCBiZSBzd2l0Y2hpbmcgdG8gZXhlY19vcCBjb21wbGV0ZWx5ID8KCj4gCj4g
PiArCj4gPiArwqAgcmVnOgo+ID4gK8KgwqDCoCBtYXhJdGVtczogMQo+ID4gKwo+ID4gK8KgICcj
YWRkcmVzcy1jZWxscyc6IHRydWUKPiA+ICvCoCAnI3NpemUtY2VsbHMnOiB0cnVlCj4gPiArCj4g
PiArcmVxdWlyZWQ6Cj4gPiArwqAgLSBjb21wYXRpYmxlCj4gPiArwqAgLSByZWcKPiA+ICsKPiA+
ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IHRydWUKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICvC
oCAtIHwKPiA+ICvCoMKgwqAgbmFuZC1wYXJ0c0AwIHsKPiA+ICvCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAidGVjaG5vbG9naWMsdHM3MjAwLW5hbmQiLCAiZ2VuX25hbmQiOwo+ID4gK8KgwqDCoMKg
wqAgcmVnID0gPDB4NjAwMDAwMDAgMHg4MDAwMDAwPjsKPiA+ICvCoMKgwqDCoMKgICNhZGRyZXNz
LWNlbGxzID0gPDE+Owo+ID4gK8KgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiArCj4g
PiArwqDCoMKgwqDCoCBwYXJ0aXRpb25AMCB7Cj4gPiArwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAi
VFMtQk9PVFJPTSI7Cj4gPiArwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAy
MDAwMD47Cj4gPiArwqDCoMKgwqDCoMKgwqAgcmVhZC1vbmx5Owo+ID4gK8KgwqDCoMKgwqAgfTsK
PiAKPiBQYXJ0aXRpb25zIGFyZSBub3QgdXNlZnVsIGhlcmUsIGJ1dCBpZiB5b3Ugd2FudCB0aGVt
LCB1c2UgdGhlCj4gcGFydGl0aW9ucyBjb250YWluZXIgaW5zdGVhZCwgcGxlYXNlLgo+IAo+ID4g
Kwo+ID4gK8KgwqDCoMKgwqAgcGFydGl0aW9uQDIwMDAwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCBs
YWJlbCA9ICJMaW51eCI7Cj4gPiArwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MDAwMjAwMDAgMHgw
N2QwMDAwMD47Cj4gPiArwqDCoMKgwqDCoCB9Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqAgcGFydGl0
aW9uQDdkMjAwMDAgewo+ID4gK8KgwqDCoMKgwqDCoMKgIGxhYmVsID0gIlJlZEJvb3QiOwo+ID4g
K8KgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDA3ZDIwMDAwIDB4MDAyZTAwMDA+Owo+ID4gK8KgwqDC
oMKgwqDCoMKgIHJlYWQtb25seTsKPiA+ICvCoMKgwqDCoMKgIH07Cj4gPiArwqDCoMKgIH07Cj4g
PiArCj4gPiArLi4uCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
