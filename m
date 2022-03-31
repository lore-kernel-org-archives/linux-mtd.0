Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A9C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwEw5BFGor/4ud9IFr3UFVCm7YmLyuTFyswvoXLDlhg=; b=IqaJ5h2AlxCbSu
	fnGIFs9ArsVof6s2BJYUdA1yvHDz/yeZUVe3skINsf2VRsEO6zC7skPcSGGVqkeHUL+V0Q1Z7Aysd
	VOxTzIOdmno2lwy8T6GCzN4ZZfeq7ovr2vnnwJ7UalGvbSCnN0OXNVvegU3U4X3BAykhSh0+nvrb+
	KnOhby/JfGPevnDyHxYm1if0Zf3B6jt2jfAu/gKD76noTlgNqScle5FNS9dKdDsyF0tGlar77P7JB
	Rkg4cpqTSlgfsMGdQxAHXdDPgiVlIfnh4U+8Y0st6zjsM26Dygb/tNm2rFSeQmfsflRe11i6AJSFv
	rBvMTNRHcDy9eYmL3K6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZpM9-0017sS-57; Thu, 31 Mar 2022 07:36:33 +0000
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZpM5-0017qj-GS
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2022 07:36:31 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EB566222D0;
 Thu, 31 Mar 2022 07:36:25 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 09:36:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0063e6c707f-2c73-4ce7-b171-35deabf783d6,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2a411a3e-4b7f-c116-b595-f33bffccb4e7@kaod.org>
Date: Thu, 31 Mar 2022 09:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Tao Ren <rentao.bupt@gmail.com>, Rob Herring
 <robh@kernel.org>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-3-clg@kaod.org>
 <20220330191908.nhg52a5ayzczpzai@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220330191908.nhg52a5ayzczpzai@ti.com>
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 42cf838e-2d6c-452a-9ac1-8df5f67bb224
X-Ovh-Tracer-Id: 6483213140691618762
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeifedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduuedtgedugeehfedvfefhieetieefhfeiudeutefhffekieduueeuheegudegfeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_003629_870014_20680DCB 
X-CRM114-Status: GOOD (  17.98  )
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

SGVsbG8gUHJhdHl1c2gsCgpPbiAzLzMwLzIyIDIxOjE5LCBQcmF0eXVzaCBZYWRhdiB3cm90ZToK
PiBPbiAyNS8wMy8yMiAxMTowOEFNLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4gVGhlICJp
bnRlcnJ1cHQiIHByb3BlcnR5IGlzIG9wdGlvbmFsIGJlY2F1c2UgaXQgaXMgb25seSBuZWNlc3Nh
cnkgZm9yCj4+IGNvbnRyb2xsZXJzIHN1cHBvcnRpbmcgRE1BcyAoTm90IGltcGxlbWVudGVkIHll
dCBpbiB0aGUgbmV3IGRyaXZlcikuCj4+Cj4+IENjOiBDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdf
a3VvQGFzcGVlZHRlY2guY29tPgo+PiBUZXN0ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+Cj4+IFRlc3RlZC1ieTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+PiBS
ZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPj4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9zcGkvYXNw
ZWVkLGFzdDI2MDAtZm1jLnlhbWwgICAgICB8IDg3ICsrKysrKysrKysrKysrKysrKysKPj4gICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKwo+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZt
Yy55YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmUxNmJiY2QzODU2MAo+PiAtLS0gL2Rldi9udWxs
Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFz
dDI2MDAtZm1jLnlhbWwKPj4gQEAgLTAsMCArMSw4NyBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0K
Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL2FzcGVlZCxhc3QyNjAw
LWZtYy55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBBc3BlZWQgU01DIGNvbnRyb2xsZXJzIGJpbmRp
bmdzCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIENoaW4tVGluZyBLdW8gPGNoaW4tdGlu
Z19rdW9AYXNwZWVkdGVjaC5jb20+Cj4+ICsgIC0gQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4KPj4gKwo+PiArZGVzY3JpcHRpb246IHwKPj4gKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJl
cyB0aGUgQXNwZWVkIFN0YXRpYyBNZW1vcnkgQ29udHJvbGxlcnMgKEZNQyBhbmQKPj4gKyAgU1BJ
KSBvZiB0aGUgQVNUMjQwMCwgQVNUMjUwMCBhbmQgQVNUMjYwMCBTT0NzLgo+PiArCj4+ICthbGxP
ZjoKPj4gKyAgLSAkcmVmOiAic3BpLWNvbnRyb2xsZXIueWFtbCMiCj4+ICsKPj4gK3Byb3BlcnRp
ZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgZW51bToKPj4gKyAgICAgIC0gYXNwZWVkLGFz
dDI2MDAtZm1jCj4+ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLXNwaQo+PiArICAgICAgLSBhc3Bl
ZWQsYXN0MjUwMC1mbWMKPj4gKyAgICAgIC0gYXNwZWVkLGFzdDI1MDAtc3BpCj4+ICsgICAgICAt
IGFzcGVlZCxhc3QyNDAwLWZtYwo+PiArICAgICAgLSBhc3BlZWQsYXN0MjQwMC1zcGkKPj4gKwo+
PiArICByZWc6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiByZWdpc3Rl
cnMKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IG1lbW9yeSBtYXBwaW5nCj4+ICsKPj4gKyAgY2xv
Y2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgaW50ZXJydXB0czoKPj4gKyAgICBt
YXhJdGVtczogMQo+PiArCj4+ICtwYXR0ZXJuUHJvcGVydGllczoKPj4gKyAgIkBbMC05YS1mXSsi
Ogo+PiArICAgIHR5cGU6IG9iamVjdAo+PiArCj4+ICsgICAgcHJvcGVydGllczoKPj4gKyAgICAg
IHNwaS1yeC1idXMtd2lkdGg6Cj4+ICsgICAgICAgIGVudW06IFsxLCAyLCA0XQo+IAo+IE5vIG5l
ZWQgZm9yIHRoaXMuIEl0IHNob3VsZCBhbHJlYWR5IGJlIHRha2VuIGNhcmUgb2YgYnkKPiBzcGkt
cGVyaXBoZXJhbC1wcm9wcy55YW1sCgpTbyB3ZSBjb3VsZCBkcm9wIHRoZSB3aG9sZSAncGF0dGVy
blByb3BlcnRpZXMnIHNlY3Rpb24gPwoKPiAKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0gY29t
cGF0aWJsZQo+PiArICAtIHJlZwo+PiArICAtIGNsb2Nrcwo+PiArCj4+ICt1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+PiArICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hc3BlZWQtc2N1LWlj
Lmg+Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2suaD4K
Pj4gKwo+PiArICAgIHNwaUAxZTYyMDAwMCB7Cj4+ICsgICAgICAgIHJlZyA9IDwweDFlNjIwMDAw
IDB4YzQ+LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsKPj4gKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+PiArICAgICAgICBjb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWZtYyI7Cj4+ICsgICAgICAgIGNsb2NrcyA9IDwmc3lz
Y29uIEFTUEVFRF9DTEtfQUhCPjsKPj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM5
IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+IAo+IE5pdHBpY2s6IEFkZCBhIGJsYW5rIGxpbmUgaGVy
ZQo+IAo+PiArICAgICAgICBmbGFzaEAwIHsKPj4gKyAgICAgICAgICAgICAgICByZWcgPSA8IDAg
PjsKPj4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwo+PiAr
ICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKPj4gKyAgICAg
ICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDI+Owo+PiArICAgICAgICB9Owo+IAo+IGFu
ZCBoZXJlCj4gCj4+ICsgICAgICAgIGZsYXNoQDEgewo+PiArICAgICAgICAgICAgICAgIHJlZyA9
IDwgMSA+Owo+PiArICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7
Cj4+ICsgICAgICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+PiAr
ICAgICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8Mj47Cj4+ICsgICAgICAgIH07Cj4g
Cj4gYW5kIGhlcmUuIExvb2tzIGEgYml0IG5pY2VyLgoKVGhhbmtzIGZvciB0aGUgY29tbWVudHMs
IEkgd2lsbCBwcm92aWRlIHRoZSBjbGVhbnVwcyBpbiB2NS4KCkMuCgoKCj4gCj4+ICsgICAgICAg
IGZsYXNoQDIgewo+PiArICAgICAgICAgICAgICAgIHJlZyA9IDwgMiA+Owo+PiArICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+ICsgICAgICAgICAgICAgICAg
c3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+PiArICAgICAgICAgICAgICAgIHNwaS1y
eC1idXMtd2lkdGggPSA8Mj47Cj4+ICsgICAgICAgIH07Cj4+ICsgICAgfTsKPj4gZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5kZXggZWE5ZDc0YjYyMzZmLi43ZDVm
ODFkY2Q4MzcgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5UQUlORVJT
Cj4+IEBAIC0zMDIxLDYgKzMwMjEsMTUgQEAgUzoJTWFpbnRhaW5lZAo+PiAgIEY6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYXNwZWVkLHNkaGNpLnlhbWwKPj4gICBGOglk
cml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZCoKPj4gICAKPj4gK0FTUEVFRCBTTUMgU1BJ
IERSSVZFUgo+PiArTToJQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNv
bT4KPj4gK006CUPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4+ICtMOglsaW51eC1h
c3BlZWRAbGlzdHMub3psYWJzLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4+
ICtMOglvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmli
ZXJzKQo+PiArTDoJbGludXgtc3BpQHZnZXIua2VybmVsLm9yZwo+PiArUzoJTWFpbnRhaW5lZAo+
PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYw
MC1mbWMueWFtbAo+PiArCj4+ICAgQVNQRUVEIFZJREVPIEVOR0lORSBEUklWRVIKPj4gICBNOglF
ZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51eC5pYm0uY29tPgo+PiAgIEw6CWxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwo+PiAtLSAKPj4gMi4zNC4xCj4+Cj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
