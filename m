Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4858C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTgHl4TsVCPQsNckdrDyBKhBCIeRVIe9pNp7FRzjIcA=; b=r1dVb4mvVP5viu
	jgI5D4tOMbgR5n5+DrBXVYwG8ualg9+woAt7NSa+RYg7afPdgMItu3/naX8hh9D7fJISyRvlyEjEC
	FWitnALYDRDfb1mdpZSq1oavA4UQf1dp2CmcjQi8iRBt7tmCrxLI4Mj9JF0A14NgzKXmbSBodYIBI
	ikqn8loL9+Wb5lMOM2nLt0GTmF86XXd1Kv4PUCemrfkFCM/tlEyKoZvvNwN17RGm4KHDsJxiKYbDY
	3VKnNLQ53D8CIjDMDKJjtexQ6RDXWUxRqjcAKWiFol6hGJ1UcmJfZVHV8afTW5uBrXppK1GEjUA6Q
	QQRLlGZY0hrNEeKKPwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHAk-00Dcq0-Hv; Mon, 04 Apr 2022 07:30:46 +0000
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHAW-00DclT-Vp
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 07:30:36 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 13CB5224F4;
 Mon,  4 Apr 2022 07:30:27 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 09:30:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0041c6325e6-010e-462f-a9ff-e43c6fe6fcff,
 193BEDB8EED17CFBFC1316EE01F9191BF107EB6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8c88e726-0ddb-e2ba-35df-676cfc3d0475@kaod.org>
Date: Mon, 4 Apr 2022 09:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 08/11] spi: aspeed: Calibrate read timings
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Tao Ren <rentao.bupt@gmail.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-9-clg@kaod.org>
 <20220331164115.w5q3wxlmwcg3w4ns@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331164115.w5q3wxlmwcg3w4ns@ti.com>
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 06f63634-85ae-4b96-a96f-c3ad2ae45158
X-Ovh-Tracer-Id: 11426476679860161351
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejuddguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrvghnthgrohdrsghuphhtsehgmhgrihhlrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_003033_376241_F366278F 
X-CRM114-Status: GOOD (  23.56  )
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

T24gMy8zMS8yMiAxODo0MSwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjUv
MDMvMjIgMTE6MDhBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRvIGFjY29tbW9kYXRl
IHRoZSBkaWZmZXJlbnQgcmVzcG9uc2UgdGltZSBvZiBTUEkgdHJhbnNmZXJzIG9uIGRpZmZlcmVu
dAo+PiBib2FyZHMgYW5kIGRpZmZlcmVudCBTUEkgTk9SIGRldmljZXMsIHRoZSBBc3BlZWQgY29u
dHJvbGxlcnMgcHJvdmlkZSBhCj4+IHNldCBvZiBSZWFkIFRpbWluZyBDb21wZW5zYXRpb24gcmVn
aXN0ZXJzIHRvIHR1bmUgdGhlIHRpbWluZyBkZWxheXMKPj4gZGVwZW5kaW5nIG9uIHRoZSBmcmVx
dWVuY3kgYmVpbmcgdXNlZC4gVGhlIEFTVDI2MDAgU29DIGhhcyBvbmUgb2YgdGhlc2UKPj4gcmVn
aXN0ZXJzIHBlciBkZXZpY2UuIE9uIHRoZSBBU1QyNTAwIGFuZCBBU1QyNDAwIFNvQ3MsIHRoZSB0
aW1pbmcKPj4gcmVnaXN0ZXIgaXMgc2hhcmVkIGJ5IGFsbCBkZXZpY2VzIHdoaWNoIGlzIHByb2Js
ZW1hdGljIHRvIGdldCBnb29kCj4+IHJlc3VsdHMgb3RoZXIgdGhhbiBmb3Igb25lIGRldmljZS4K
Pj4KPj4gVGhlIGFsZ29yaXRobSBmaXJzdCByZWFkcyBhIGdvbGRlbiBidWZmZXIgYXQgbG93IHNw
ZWVkIGFuZCB0aGVuIHBlcmZvcm1zCj4+IHJlYWRzIHdpdGggZGlmZmVyZW50IGNsb2NrcyBhbmQg
ZGVsYXkgY3ljbGUgc2V0dGluZ3MgdG8gZmluZCBhIGJyZWFraW5nCj4+IHBvaW50LiBUaGlzIHNl
bGVjdHMgYSBkZWZhdWx0IGdvb2QgZnJlcXVlbmN5IGZvciB0aGUgQ0V4IGNvbnRyb2wgcmVnaXN0
ZXIuCj4+IFRoZSBjdXJyZW50IHNldHRpbmdzIGFyZSBhIGJpdCBvcHRpbWlzdGljIGFzIHdlIHBp
Y2sgdGhlIGZpcnN0IGRlbGF5IGdpdmluZwo+PiBnb29kIHJlc3VsdHMuIEEgc2FmZXIgYXBwcm9h
Y2ggd291bGQgYmUgdG8gZGV0ZXJtaW5lIGFuIGludGVydmFsIGFuZAo+PiBjaG9vc2UgdGhlIG1p
ZGRsZSB2YWx1ZS4KPj4KPj4gQ2FsaWJyYXRpb24gaXMgcGVyZm9ybWVkIHdoZW4gdGhlIGRpcmVj
dCBtYXBwaW5nIGZvciByZWFkcyBpcyBjcmVhdGVkLgo+PiBTaW5jZSB0aGUgdW5kZXJseWluZyBz
cGktbm9yIG9iamVjdCBuZWVkcyB0byBiZSBpbml0aWFsaXplZCB0byBjcmVhdGUKPj4gdGhlIHNw
aV9tZW0gb3BlcmF0aW9uIGZvciBkaXJlY3QgbWFwcGluZywgd2Ugc2hvdWxkIGJlIGZpbmUuIEhh
dmluZyBhCj4+IHNwZWNpZmljIEFQSSB3b3VsZCBjbGFyaWZ5IHRoZSByZXF1aXJlbWVudHMgdGhv
dWdoLgo+Pgo+PiBDYzogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+PiBSZXZpZXdl
ZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPj4gVGVzdGVkLWJ5OiBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+PiBUZXN0ZWQtYnk6IFRhbyBSZW4gPHJlbnRhby5idXB0
QGdtYWlsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4KPj4gLS0tCj4+ICAgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8IDI4MSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyODEg
aW5zZXJ0aW9ucygrKQo+Pgo+IFsuLi5dCj4+IEBAIC01MTcsNiArNTI3LDggQEAgc3RhdGljIGlu
dCBhc3BlZWRfc3BpX2NoaXBfYWRqdXN0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpj
aGlwLAo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW50IGFzcGVlZF9z
cGlfZG9fY2FsaWJyYXRpb24oc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCk7Cj4+ICsKPj4g
ICBzdGF0aWMgaW50IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0ZShzdHJ1Y3Qgc3BpX21lbV9kaXJt
YXBfZGVzYyAqZGVzYykKPj4gICB7Cj4+ICAgCXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gc3Bp
X2NvbnRyb2xsZXJfZ2V0X2RldmRhdGEoZGVzYy0+bWVtLT5zcGktPm1hc3Rlcik7Cj4+IEBAIC01
NjUsNiArNTc3LDggQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0
IHNwaV9tZW1fZGlybWFwX2Rlc2MgKmRlc2MpCj4+ICAgCWNoaXAtPmN0bF92YWxbQVNQRUVEX1NQ
SV9SRUFEXSA9IGN0bF92YWw7Cj4+ICAgCXdyaXRlbChjaGlwLT5jdGxfdmFsW0FTUEVFRF9TUElf
UkVBRF0sIGNoaXAtPmN0bCk7Cj4+ICAgCj4+ICsJcmV0ID0gYXNwZWVkX3NwaV9kb19jYWxpYnJh
dGlvbihjaGlwKTsKPj4gKwo+IAo+IEkgYW0gc3RpbGwgbm90IGNvbnZpbmNlZCB0aGlzIGlzIGEg
Z29vZCBpZGVhLiBUaGUgQVBJIGRvZXMgbm90IHNheQo+IGFueXdoZXJlIHdoYXQgZGlybWFwX2Ny
ZWF0ZSBtdXN0IGJlIGNhbGxlZCBhZnRlciB0aGUgZmxhc2ggaXMgY29tcGxldGVseQo+IGluaXRp
YWxpemVkLCB0aG91Z2ggdGhhdCBpcyB3aGF0IGlzIGRvbmUgY3VycmVudGx5IGluIHByYWN0aWNl
LiAKClllcyBiZWNhdXNlIHdlIHdvdWxkbid0IGhhdmUgYSBjb3JyZWN0ICdzcGlfbWVtX2Rpcm1h
cF9pbmZvJyBpZiBpdCB3YXNuJ3QKdGhlIGNhc2UuIE1heSBiZSBjaGFuZ2UgdGhlIGRvY3VtZW50
YXRpb24gPwoKPiBJIHRoaW5rCj4gYW4gZXhwbGljaXQgQVBJIHRvIG1hcmsgZmxhc2ggYXMgInJl
YWR5IGZvciBjYWxpYnJhdGlvbiIgd291bGQgYmUgYQo+IGJldHRlciBpZGVhLgoKT0suIFNpbmNl
IHRoZSBhYm92ZSBpcyBhIG9uZWxpbmVyLCBpdCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSB0byBt
b3ZlCml0IHVuZGVyIGEgbmV3IGhhbmRsZXIgaWYgbmVlZGVkLgoKVGhlIGRpcm1hcF9jcmVhdGUo
KSBoYW5kbGVyIGV4cGVjdHMgdGhlIHNwaS1tZW0gZGVzY3JpcHRvciBhbmQgdGhlIGZpZWxkCidk
ZXNjLT5pbmZvLm9wX3RtcGwnIHRvIGJlIGNvcnJlY3RseSBpbml0aWFsaXplZCBpbiBvcmRlciB0
byBjb21wdXRlIHRoZQpjb250cm9sIHJlZ2lzdGVyIHZhbHVlLCB3aGljaCBpcyBhIHJlcXVpcmVt
ZW50IGZvciBkaXJtYXBfcmVhZCgpLiBUaGUKY2FsaWJyYXRpb24gc2VxdWVuY2Ugc2ltcGx5IGNv
bWVzIGFmdGVyLgoKQUZBSUNULCB0aGVyZSBpcyBub3RoaW5nIGluY29ycmVjdCB0b2RheS4KCj4g
VHVkb3IvTWFyay9NaXF1ZWwsIHdoYXQgZG8geW91IHRoaW5rPwoKClRoYW5rcywKCkMuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
