Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7208ECAAD3
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Sep 2022 02:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5+1cMbh2L3Lcenrz00/RZ4bPHKMIHkwbLdltz1Mxbg=; b=BSisy2d4+cE6DE
	+1yJOlNV3HMwduWBSSXoZ+YPnfJYDTHmqFUcPgtEXcnDhYNRylryxzrTmWYS/lsjVz0h4XLtiCbqR
	SNByHVuybMbYa+etQbZmx3S0ZKbwmFoGtpKXtiMSKqj5/HaelomQAlyoVltiubHLChP7Dbw4AUOwx
	pSvZ1/EzC02AsZdTIUXalOs89RplPHeRfn9zH7My/tGe4uo9fe7NZLxGZhxOjqz4IMnNSK0hyal2N
	AypAtHz6mGKp0lsXoKuceORwL8ChBfS6YFm0wUCCZN5Ap/3fPMjUyLWfsgtlGOd2BXCJ4QgoLSb+d
	VRNc81ZlgkBqrlJ4Fo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVOCN-001h9F-SF; Tue, 06 Sep 2022 02:20:23 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVOCA-001gsB-Fo; Tue, 06 Sep 2022 02:20:12 +0000
Received: from [10.28.39.72] (10.28.39.72) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2507.6; Tue, 6 Sep 2022 10:20:04 +0800
Message-ID: <3cb82d2d-d957-b080-2154-f07deefc0858@amlogic.com>
Date: Tue, 6 Sep 2022 10:20:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v8 0/5] fix the meson NFC clock
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
	<khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
	<victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
	YongHui Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20220905075027.19114-1-liang.yang@amlogic.com>
 <b9886af8-8580-e553-13b4-d730d1113456@baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <b9886af8-8580-e553-13b4-d730d1113456@baylibre.com>
X-Originating-IP: [10.28.39.72]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_192010_589261_7707DCFB 
X-CRM114-Status: GOOD (  13.17  )
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

SGkgTmVpbCwKCk9uIDIwMjIvOS81IDIwOjM3LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiBIaSwKPiAKPiBPbiAwNS8wOS8yMDIyIDA5OjUwLCBMaWFuZyBZ
YW5nIHdyb3RlOgo+PiBFTU1DIGFuZCBOQU5EIGhhdmUgdGhlIHNhbWUgY2xvY2sgY29udHJvbCBy
ZWdpc3RlciBuYW1lZCAnU0RfRU1NQ19DTE9DSycKPj4gd2hpY2ggaXMgZGVmaW5lZCBpbiBFTU1D
IHBvcnQgaW50ZXJuYWxseS4gYml0MH41IG9mICdTRF9FTU1DX0NMT0NLJyBpcwo+PiB0aGUgZGl2
aWRlciBhbmQgYml0Nn43IGlzIHRoZSBtdXggZm9yIGZpeCBwbGwgYW5kIHh0YWwuIEF0IHRoZSBi
ZWdpbm5pbmcsCj4+IGEgY29tbW9uIE1NQyBhbmQgTkFORCBzdWItY2xvY2sgd2FzIGRpc2N1c3Nl
ZCBhbmQgcGxhbmVkIHRvIGJlIAo+PiBpbXBsZW1lbnRlZAo+PiBhcyBORkMgY2xvY2sgcHJvdmlk
ZXIsIGJ1dCBub3cgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBvZiBhIGNvbW1vbiBNTUMgYW5kCj4+
IE5BTkQgc3ViLWNsb2NrIGFyZSBuZXZlciBiZWluZyBhY2NlcHRlZCBhbmQgdGhlIGN1cnJlbnQg
YmluZGluZyB3YXMgbmV2ZXIKPj4gdmFsaWQuIHRoZSByZWFzb25zIGFyZToKPj4gMS4gRU1NQyBh
bmQgTkFORCwgd2hpY2ggYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZSBhbnl3YXkKPj4gMi4gY291cGxp
bmcgdGhlIEVNTUMgYW5kIE5BTkQuCj4+IDMuIGl0IHNlZW1zIHRoYXQgYSBjb21tb24gTU1DIGFu
ZCBOQU5EIHN1Yi1jbG9jayBpcyBvdmVyIGVuZ2luZWVyZWQuCj4+IGFuZCBsZXQgdXMgc2VlIHRo
ZSBsaW5rIGZvciBtb3JlIGluZm9ybWF0aW9uOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMjAxMjEwNzQ1MDguNDIxNjgtNS1saWFuZy55YW5nQGFtbG9naWMuY29tCj4+IHNvIFRo
ZSBtZXNvbiBuZmMgY2FuJ3Qgd29yayBub3csIGxldCB1cyByZXdvcmsgdGhlIGNsb2NrLgo+Pgo+
PiBDaGFuZ2VzIHNpbmNlIHY3IFs4XQo+PiDCoCAtIHVzZSBDT01NT05fQ0xLICYmIChBUkNIX01F
U09OIHx8IENPTVBJTEVfVEVTVCkgaW5zdGVhZCBvZgo+PiDCoMKgwqAgQVJDSF9NRVNPTiB8fCBD
T01QSUxFX1RFU1QgfHwgQ09NTU9OX0NMSy4KPj4gwqAgLSBjb2xsZWN0IHRoZSByZXZpZXcgYW5k
IGFjawo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHY2IFs3XQo+PiDCoCAtIHVzZSBDT01NT05fQ0xLIGlu
c3RlYWQgb2YgIUhBVkVfTEVHQUNZX0NMSwo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHY1IFs2XQo+PiDC
oCAtIGFkZCBjaGFuZ2UgbG9nIGZvciBwYXRjaCAzLzUKPj4gwqAgLSBhZGQgcGF0Y2ggNS81IHRv
IGZpeCB0aGUgcmVwb3J0aW5nIGVycm9yIG9mIHRlc3Qgcm9ib3QKPj4KPj4gQ2hhbmdlcyBzaW5j
ZSB2NCBbNV0KPj4gwqAgLSBzcGxpdCB0aGUgZHQgYmluZGluZyBwYXRjaCBpbnRvIHR3byBwYXRj
aGVzLCBvbmUgZm9yIGZpeGluZywKPj4gwqDCoMKgIGNsb2NrLCB0aGUgb3RoZXIgZm9yIGNvdmVy
dGluZyB0byB5YW1sCj4+IMKgIC0gc3BsaXQgdGhlIG5mYyBkcml2ZXIgcGF0Y2ggaW50byB0d28g
cGF0Y2hlcywgb25lIGZvciBmaXhpbmcKPj4gwqDCoMKgIGNsb2NrLCB0aGUgb3RoZXIgZm9yIHJl
ZmluaW5nIHRoZSBnZXQgbmZjIHJlc291cmNlLgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYzIFs0XQo+
PiDCoCAtIHVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lCj4+IMKgIC0g
ZHRfYmluZGluZ19jaGVjayBmb3IgbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4+Cj4+IENo
YW5nZXMgc2luY2UgdjIgWzNdCj4+IMKgIC0gdXNlIGZ3X25hbWUgZnJvbSBkdHMsIGluc3RlYWQg
dGhlIHdyb25nIHdheSB1c2luZyBfX2Nsa19nZXRfbmFtZQo+PiDCoCAtIHJlZyByZXNvdXJjZSBz
aXplIGNoYW5nZSB0byAweDgwMAo+PiDCoCAtIHVzZSByZWctbmFtZXMKPj4KPj4gQ2hhbmdlcyBz
aW5jZSB2MSBbMl0KPj4gwqAgLSB1c2UgY2xrX3BhcmVudF9kYXRhIGluc3RlYWQgb2YgcGFyZW50
X25hbWVzCj4+IMKgIC0gZGVmaW5lIGEgcmVnIHJlc291cmNlIGluc3RlYWQgb2Ygc2RfZW1tY19j
X2Nsa2MKPj4KPj4gWzFdIAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjIwMTA2MDMz
MTMwLjM3NjIzLTEtbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbQo+PiAgICAgIAo+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjIwMTA2MDMyNTA0LjIzMzEwLTEtbGlhbmcueWFuZ0BhbWxvZ2lj
LmNvbQo+PiBbMl0gCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDIxNzA2MzM0
Ni4yMTY5MS0xLWxpYW5nLnlhbmdAYW1sb2dpYy5jb20KPj4gWzNdIAo+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMjAzMTgxMjQxMjEuMjYxMTctMS1saWFuZy55YW5nQGFtbG9naWMu
Y29tCj4+IFs0XSAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNDAyMDc0OTIx
LjEzMzE2LTEtbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbS8gCj4+Cj4+IFs1XSAKPj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTEzMTIzNDA0LjQ4NTEzLTEtbGlhbmcueWFuZ0BhbWxv
Z2ljLmNvbS8gCj4+Cj4+IFs2XSAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIw
NjA3MDY0NzMxLjEzMzY3LTEtbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbS8gCj4+Cj4+IFs3XSAKPj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNjI0MTMxMjU3LjI5OTA2LTEtbGlhbmcu
eWFuZ0BhbWxvZ2ljLmNvbS8gCj4+Cj4+Cj4+IExpYW5nIFlhbmcgKDUpOgo+PiDCoMKgIGR0LWJp
bmRpbmdzOiBuYW5kOiBtZXNvbjogZml4IG1lc29uIG5mYyBjbG9jawo+PiDCoMKgIG10ZDogcmF3
bmFuZDogbWVzb246IGZpeCB0aGUgY2xvY2sKPj4gwqDCoCBtdGQ6IHJhd25hbmQ6IG1lc29uOiBy
ZWZpbmUgcmVzb3VyY2UgZ2V0dGluZyBpbiBwcm9iZQo+PiDCoMKgIGR0LWJpbmRpbmdzOiBuYW5k
OiBtZXNvbjogY29udmVydCB0eHQgdG8geWFtbAo+PiDCoMKgIG10ZDogcmF3bmFuZDogbWVzb246
IG5vdCBzdXBwb3J0IGxlZ2FjeSBjbG9jawo+Pgo+PiDCoCAuLi4vYmluZGluZ3MvbXRkL2FtbG9n
aWMsbWVzb24tbmFuZC50eHTCoMKgwqDCoMKgwqAgfCA2MCAtLS0tLS0tLS0tLS0tCj4+IMKgIC4u
Li9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWzCoMKgwqDCoMKgIHwgODggKysr
KysrKysrKysrKysrKysrKwo+PiDCoCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9tZXNvbl9uYW5kLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA4NiArKysrKysr
KystLS0tLS0tLS0KPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgMTA1
IGRlbGV0aW9ucygtKQo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQgCj4+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+PiDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgCj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPj4KPiBJdCBzZWVtcyB5b3Ugc2VudCBvbmx5IHBhdGNo
IDQKeWVzLCBpIG9ubHkgc2VudCBwYXRjaCA0IGFuZCB0aGlzIGNvdmVyIGxldHRlci4KaSB3aWxs
IHNlbmQgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBhZ2Fpbi4KdGhhbmtzLgo+IAo+IE5laWwKPiAK
PiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
