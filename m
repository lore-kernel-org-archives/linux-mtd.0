Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A55C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxqUR+wh4HkszGFXz46SYTtX8ReQahgSYSR+uAdA3us=; b=X516BccM26FfdF
	7QQcaRwezmkWHCYJw7g7kqNFPrnALbPtkdUNYcww/NkaqujwsTqKvBo5UurCBxej8BRZLWn+2fTSa
	hUyN6m4MMKZS3nMeChRohQKcZfTRqefnomvzIwpNIQX4sR2eMCUsMptXTOnMI06OiKwSBuIGc4/JR
	3onz6s8+lRKbZ02ZSIeL7F2JFOeKKxL4q4qWx0BJdXhNFpc/y6X0uqp4iPFGATm3wGtgtNbxO7JYc
	lx1U3LdJaIqQr6HfjvwwAW1hWvVUiQ7cZ/lUrIrqik+qOLpBjAzQj16/le3xfPagJO3dYZqhrMCKS
	hMLl8JYWxhviWK4ukLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKcSB-009Zd4-IE; Thu, 17 Feb 2022 08:47:55 +0000
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKcHu-009U3F-II; Thu, 17 Feb 2022 08:37:22 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id ECDFB24EAF;
 Thu, 17 Feb 2022 08:37:04 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 09:37:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002328e9798-957d-4e35-ae92-239b6e2566ca,
 6074F5EAC11FD030A47E229993F36105E76D55A4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a77fe4bb-c4d6-4329-b25e-26e990e8092b@kaod.org>
Date: Thu, 17 Feb 2022 09:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/10] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-3-clg@kaod.org> <YgwV5ZGCbrNhlk0s@robh.at.kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YgwV5ZGCbrNhlk0s@robh.at.kernel.org>
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03c1adce-a0aa-4472-8090-987f0bcc8d30
X-Ovh-Tracer-Id: 662029147249740676
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudeutdegudegheefvdefhfeiteeifefhieduueethfffkeeiudeuueehgedugeefnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_003718_937026_F38675CA 
X-CRM114-Status: GOOD (  15.49  )
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

T24gMi8xNS8yMiAyMjowNiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9uLCBGZWIgMTQsIDIw
MjIgYXQgMTA6NDI6MjNBTSArMDEwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoZSAi
aW50ZXJydXB0IiBwcm9wZXJ0eSBpcyBvcHRpb25hbCBiZWNhdXNlIGl0IGlzIG9ubHkgbmVjZXNz
YXJ5IGZvcgo+PiBjb250cm9sbGVycyBzdXBwb3J0aW5nIERNQXMgKE5vdCBpbXBsZW1lbnRlZCB5
ZXQgaW4gdGhlIG5ldyBkcml2ZXIpLgo+Pgo+PiBDYzogQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5n
X2t1b0Bhc3BlZWR0ZWNoLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIg
PGNsZ0BrYW9kLm9yZz4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYw
MC1mbWMueWFtbCAgICAgIHwgOTIgKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA5MiBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKPj4KPj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVk
LGFzdDI2MDAtZm1jLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Bp
L2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZWQ3MWM0ZDg2OTMwCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFt
bAo+PiBAQCAtMCwwICsxLDkyIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwjCj4+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
Pj4gKwo+PiArdGl0bGU6IEFzcGVlZCBTTUMgY29udHJvbGxlcnMgYmluZGluZ3MKPj4gKwo+PiAr
bWFpbnRhaW5lcnM6Cj4+ICsgIC0gQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0
ZWNoLmNvbT4KPj4gKyAgLSBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+PiArCj4+
ICtkZXNjcmlwdGlvbjogfAo+PiArICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIHRoZSBBc3BlZWQg
U3RhdGljIE1lbW9yeSBDb250cm9sbGVycyAoRk1DIGFuZAo+PiArICBTUEkpIG9mIHRoZSBBU1Qy
NDAwLCBBU1QyNTAwIGFuZCBBU1QyNjAwIFNPQ3MuCj4+ICsKPj4gK2FsbE9mOgo+PiArICAtICRy
ZWY6ICJzcGktY29udHJvbGxlci55YW1sIyIKPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29t
cGF0aWJsZToKPj4gKyAgICBlbnVtOgo+PiArICAgICAgLSBhc3BlZWQsYXN0MjYwMC1mbWMKPj4g
KyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtc3BpCj4+ICsgICAgICAtIGFzcGVlZCxhc3QyNTAwLWZt
Ywo+PiArICAgICAgLSBhc3BlZWQsYXN0MjUwMC1zcGkKPj4gKyAgICAgIC0gYXNwZWVkLGFzdDI0
MDAtZm1jCj4+ICsgICAgICAtIGFzcGVlZCxhc3QyNDAwLXNwaQo+PiArCj4+ICsgIHJlZzoKPj4g
KyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJlZ2lzdGVycwo+PiArICAgICAg
LSBkZXNjcmlwdGlvbjogbWVtb3J5IG1hcHBpbmcKPj4gKwo+PiArICBjbG9ja3M6Cj4+ICsgICAg
bWF4SXRlbXM6IDEKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+
ICsKPj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+PiArICAiQFswLTlhLWZdKyI6Cj4+ICsgICAgdHlw
ZTogb2JqZWN0Cj4+ICsKPj4gKyAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgc3BpLXJ4LWJ1cy13
aWR0aDoKPj4gKyAgICAgICAgZW51bTogWzEsIDIsIDRdCj4+ICsKPj4gKyAgICByZXF1aXJlZDoK
Pj4gKyAgICAgIC0gcmVnCj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4g
KyAgLSByZWcKPj4gKyAgLSBjbG9ja3MKPj4gKwo+PiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQo+PiArCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPj4gKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXNwZWVkLXNjdS1pYy5oPgo+PiArICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hc3QyNjAwLWNsb2NrLmg+Cj4+ICsKPj4gKyAg
ICBzcGlAMWU2MjAwMDAgewo+PiArICAgICAgICByZWcgPSA8IDB4MWU2MjAwMDAgMHhjNAo+PiAr
ICAgICAgICAgICAgICAgIDB4MjAwMDAwMDAgMHgxMDAwMDAwMCA+Owo+PiArICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsgICAg
ICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtZm1jIjsKPj4gKyAgICAgICAgY2xvY2tz
ID0gPCZzeXNjb24gQVNQRUVEX0NMS19BSEI+Owo+PiArICAgICAgICBzdGF0dXMgPSAiZGlzYWJs
ZWQiOwo+IAo+IFdoeSBpcyB5b3VyIGV4YW1wbGUgZGlzYWJsZWQ/IERyb3AgJ3N0YXR1cycuCgpt
eSBiYWQuIEkgdG9vayB0aGUgYmFzaWMgZGVmaW5pdGlvbiBvZiB0aGUgU29DIGFuZCB0aGUgZGV2
aWNlcwphcmUgYWN0aXZhdGVkIGluIHRoZSBib2FyZHMuIEkgd2lsbCBmaXggaW4gdjIuCgpUaGFu
a3MsCgpDLgoKCj4gCj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzOSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKPj4gKyAgICAgICAgZmxhc2hAMCB7Cj4+ICsgICAgICAgICAgICAgICAg
cmVnID0gPCAwID47Cj4+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGkt
bm9yIjsKPj4gKyAgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47
Cj4+ICsgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiAKPiBEaXR0by4KPiAK
Pj4gKyAgICAgICAgfTsKPj4gKyAgICAgICAgZmxhc2hAMSB7Cj4+ICsgICAgICAgICAgICAgICAg
cmVnID0gPCAxID47Cj4+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGkt
bm9yIjsKPj4gKyAgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47
Cj4+ICsgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gKyAgICAgICAgfTsK
Pj4gKyAgICAgICAgZmxhc2hAMiB7Cj4+ICsgICAgICAgICAgICAgICAgcmVnID0gPCAyID47Cj4+
ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKPj4gKyAgICAg
ICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47Cj4+ICsgICAgICAgICAg
ICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gKyAgICAgICAgfTsKPj4gKyAgICB9Owo+PiAt
LSAKPj4gMi4zNC4xCj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
