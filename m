Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D0C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  8 May 2022 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYpRB+uXmytYCfs4H/zfNLkMEfsxRO0BS7E8f9onSks=; b=g3BEKL4//YufMZ
	uU46KF44MzJItx4313HEZYgZ8rbpnq5umpgjOW76r4GA0QUmQxpqjqCuFlvR1tdc9pyVXe6DiukBg
	aPjjnNAKeN7JOgfj3yg2JO2UiezlYpAScDQT4TEZPj8F/8C517lpG10M/EE29px8wXI9J9UQXeQJo
	rW0P/csvpTUjAC8Z/VmVcuwdLftR3TzE9Skpx9w82wIrVRSBa0Z3IadWSY2FWfgvMi9cZkROOkshZ
	wofz0drWOmspqqYTqr3jdPR4zS5IKdQSe/yBJ+aY3oZS8W8ap4kojHPf+lXeLwfOEBrXkoCK/Z0Aa
	FeO1hShF/VQ9/TvJghUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnb8Q-009Ma0-IF; Sun, 08 May 2022 07:15:18 +0000
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnb8D-009MXl-J4
 for linux-mtd@lists.infradead.org; Sun, 08 May 2022 07:15:07 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5870E22521;
 Sun,  8 May 2022 07:14:55 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Sun, 8 May 2022
 09:14:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002fbf65d7b-541b-4859-a882-6af3346e7bf3,
 6A42E68C8A7CF0A161EF91BD72A2EC4D9931BD41) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.250.26.110
Message-ID: <4af36c47-0895-bce4-b074-c934749e6faf@kaod.org>
Date: Sun, 8 May 2022 09:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 03/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Tao Ren <rentao.bupt@gmail.com>, Jae Hyun Yoo
 <quic_jaehyoo@quicinc.com>
References: <20220503060634.122722-1-clg@kaod.org>
 <20220503060634.122722-4-clg@kaod.org> <YnFseFBfe5eaIqg0@robh.at.kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YnFseFBfe5eaIqg0@robh.at.kernel.org>
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb910b0c-0e8b-44c4-8db7-9c6365255b15
X-Ovh-Tracer-Id: 7921550270037658570
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhitggpjhgrvghhhihoohesqhhuihgtihhntgdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_001505_940924_FF1A1270 
X-CRM114-Status: GOOD (  21.99  )
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

T24gNS8zLzIyIDE5OjU1LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIE1heSAwMywgMjAy
MiBhdCAwODowNjoyNkFNICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4gVGhpcyBT
UEkgZHJpdmVyIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBzdGF0aWMgbWVtb3J5IGNvbnRy
b2xsZXJzCj4+IG9mIHRoZSBBU1QyNjAwLCBBU1QyNTAwIGFuZCBBU1QyNDAwIFNvQ3MgdXNpbmcg
dGhlIHNwaS1tZW0gaW50ZXJmYWNlLgo+Pgo+PiAgICogQVNUMjYwMCBGaXJtd2FyZSBTUEkgTWVt
b3J5IENvbnRyb2xsZXIgKEZNQykKPj4gICAgIC4gQk1DIGZpcm13YXJlCj4+ICAgICAuIDMgY2hp
cCBzZWxlY3QgcGlucyAoQ0UwIH4gQ0UyKQo+PiAgICAgLiBPbmx5IHN1cHBvcnRzIFNQSSB0eXBl
IGZsYXNoIG1lbW9yeQo+PiAgICAgLiBkaWZmZXJlbnQgc2VnbWVudCByZWdpc3RlciBpbnRlcmZh
Y2UKPj4gICAgIC4gc2luZ2xlLCBkdWFsIGFuZCBxdWFkIG1vZGUuCj4+Cj4+ICAgKiBBU1QyNjAw
IFNQSSBGbGFzaCBDb250cm9sbGVyIChTUEkxIGFuZCBTUEkyKQo+PiAgICAgLiBob3N0IGZpcm13
YXJlCj4+ICAgICAuIDIgY2hpcCBzZWxlY3QgcGlucyAoQ0UwIH4gQ0UxKQo+PiAgICAgLiBkaWZm
ZXJlbnQgc2VnbWVudCByZWdpc3RlciBpbnRlcmZhY2UKPj4gICAgIC4gc2luZ2xlLCBkdWFsIGFu
ZCBxdWFkIG1vZGUuCj4+Cj4+ICAgKiBBU1QyNTAwIEZpcm13YXJlIFNQSSBNZW1vcnkgQ29udHJv
bGxlciAoRk1DKQo+PiAgICAgLiBCTUMgZmlybXdhcmUKPj4gICAgIC4gMyBjaGlwIHNlbGVjdCBw
aW5zIChDRTAgfiBDRTIpCj4+ICAgICAuIHN1cHBvcnRzIFNQSSB0eXBlIGZsYXNoIG1lbW9yeSAo
Q0UwLUNFMSkKPj4gICAgIC4gQ0UyIGNhbiBiZSBvZiBOT1IgdHlwZSBmbGFzaCBidXQgdGhpcyBp
cyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIKPj4gICAgIC4gc2luZ2xlLCBkdWFsIG1vZGUu
Cj4+Cj4+ICAgKiBBU1QyNTAwIFNQSSBGbGFzaCBDb250cm9sbGVyIChTUEkxIGFuZCBTUEkyKQo+
PiAgICAgLiBob3N0IGZpcm13YXJlCj4+ICAgICAuIDIgY2hpcCBzZWxlY3QgcGlucyAoQ0UwIH4g
Q0UxKQo+PiAgICAgLiBzaW5nbGUsIGR1YWwgbW9kZS4KPj4KPj4gICAqIEFTVDI0MDAgTmV3IFN0
YXRpYyBNZW1vcnkgQ29udHJvbGxlciAoYWxzbyByZWZlcnJlZCBhcyBGTUMpCj4+ICAgICAuIEJN
QyBmaXJtd2FyZQo+PiAgICAgLiBOZXcgcmVnaXN0ZXIgc2V0Cj4+ICAgICAuIDUgY2hpcCBzZWxl
Y3QgcGlucyAoQ0UwIOKIvCBDRTQpCj4+ICAgICAuIHN1cHBvcnRzIE5PUiBmbGFzaCwgTkFORCBm
bGFzaCBhbmQgU1BJIGZsYXNoIG1lbW9yeS4KPj4gICAgIC4gc2luZ2xlLCBkdWFsIGFuZCBxdWFk
IG1vZGUuCj4+Cj4+IEVhY2ggY29udHJvbGxlciBoYXMgYSBtZW1vcnkgcmFuZ2Ugb24gd2hpY2gg
Zmxhc2ggZGV2aWNlcyBjb250ZW50cyBhcmUKPj4gbWFwcGVkLiBFYWNoIGRldmljZSBpcyBhc3Np
Z25lZCBhIHdpbmRvdyB0aGF0IGNhbiBiZSBjaGFuZ2VkIGF0IGJvb3RpbWUKPj4gd2l0aCB0aGUg
U2VnbWVudCBBZGRyZXNzIFJlZ2lzdGVycy4KPj4KPj4gRWFjaCBTUEkgZmxhc2ggZGV2aWNlIGNh
biB0aGVuIGJlIGFjY2Vzc2VkIGluIHR3byBtb2RlczogQ29tbWFuZCBhbmQKPj4gVXNlci4gV2hl
biBpbiBVc2VyIG1vZGUsIFNQSSB0cmFuc2ZlcnMgYXJlIGluaXRpYXRlZCB3aXRoIGFjY2Vzc2Vz
IHRvCj4+IHRoZSBtZW1vcnkgc2VnbWVudCBvZiBhIGRldmljZS4gV2hlbiBpbiBDb21tYW5kIG1v
ZGUsIG1lbW9yeQo+PiBvcGVyYXRpb25zIG9uIHRoZSBtZW1vcnkgc2VnbWVudCBvZiBhIGRldmlj
ZSBnZW5lcmF0ZSBTUEkgY29tbWFuZHMKPj4gYXV0b21hdGljYWxseSB1c2luZyBhIENvbnRyb2wg
UmVnaXN0ZXIgZm9yIHRoZSBzZXR0aW5ncy4KPj4KPj4gVGhpcyBpbml0aWFsIHBhdGNoIGFkZHMg
c3VwcG9ydCBmb3IgVXNlciBtb2RlLiBDb21tYW5kIG1vZGUgbmVlZHMgYSBsaXR0bGUKPj4gbW9y
ZSB3b3JrIHRvIGNoZWNrIHRoYXQgdGhlIG1lbW9yeSB3aW5kb3cgb24gdGhlIEFIQiBidXMgZml0
cyB0aGUgZGV2aWNlCj4+IHNpemUuIEl0IHdpbGwgY29tZSBsYXRlciB3aGVuIHN1cHBvcnQgZm9y
IGRpcmVjdCBtYXBwaW5nIGlzIGFkZGVkLgo+Pgo+PiBTaW5nbGUgYW5kIGR1YWwgbW9kZSBSWCB0
cmFuc2ZlcnMgYXJlIHN1cHBvcnRlZC4gT3RoZXIgdHlwZXMgdGhhbiBTUEkKPj4gYXJlIG5vdCBz
dXBwb3J0ZWQuCj4+Cj4+IFJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
Pgo+PiBUZXN0ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4+IFRlc3RlZC1i
eTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+PiBUZXN0ZWQtYnk6IEphZSBIeXVu
IFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRp
bmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBD
w6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9z
cGktbm9yL2NvbnRyb2xsZXJzL2FzcGVlZC1zbWMuYyAgfCA5MjEgLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+ICAgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyAgICAgICAgICAgICAgICAgIHwgNzE3
ICsrKysrKysrKysrKysrCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FzcGVlZC1z
bWMudHh0ICAgIHwgIDUxIC0KPiAKPiBUaGlzIGJlbG9uZ3Mgd2l0aCB0aGUgYmluZGluZyBwYXRj
aC4gQnV0IHRoZW4gaXQgaXMgY29udmVydGluZyByYXRoZXIKPiB0aGFuIGFkZGluZyBhIGJpbmRp
bmcuIFlvdSBzaG91bGQgYmUgY29udmVydGluZyB0aGUgYmluZGluZyBhbmQgdGhlbgo+IGFkZGlu
ZyB0byBpdCAobGlrZSBhZGRpbmcgMjYwMCBzdXBwb3J0KS4KCk9LLgoKU28sIEkgd2lsbCBzZW5k
LCBzb21lIHRpbWUgbmV4dCB3ZWVrLCBhIHY3IHBhdGNoc2V0IHVwZGF0aW5nIHRoZSBiaW5kaW5n
CnBhdGNoIDAyLzExIHRvIGluY2x1ZGUgdGhlIHJlbW92YWwgb2YgdGhlIG9sZCBiaW5kaW5nLgoK
VGhhbmtzLAoKQy4KCj4gCj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKPj4gICBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL0tj
b25maWcgICAgICAgfCAgMTAgLQo+PiAgIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMv
TWFrZWZpbGUgICAgICB8ICAgMSAtCj4+ICAgZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDExICsKPj4gICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+PiAgIDggZmlsZXMgY2hhbmdlZCwgNzMwIGluc2Vy
dGlvbnMoKyksIDk4MyBkZWxldGlvbnMoLSkKPj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMKPj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FzcGVlZC1zbWMudHh0CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
