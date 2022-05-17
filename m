Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4B8C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRmsliJ0PUjLV+0e+DpdGtG3uKUh+PvbEg9AciYiJq0=; b=QTIZ/wRAP1M6Md
	06JN9dPdOr7DBFO/OxUjDrWfWannltvW/62rjD4hEQAB75NBGx0W22SVuRH2VnOIj2J3ACxtgohem
	rm8bMXZMYiiBBNW68r6fs+9toFSerYP1jeHNM6Y4pCaatmIAZ+HX/j9NtWttYDh8WoyxCSaY2Fseg
	IfTUbaFbp1fIg79HvMKTNyuM9Xa/3Yu/JMVLj22uBLS3f/IvmZuz1j9ci+WGe+G/whITrMxznA9T+
	SZ8P6lS1cotth1CRn8CnbVYwKIYhhsTegKzOC+xlxgL4gLUY2iAMunG67qm0scTvtpEyDpztJLp0X
	WZxh/zaTlUo4CB/BTUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqvvD-00DSU2-OR; Tue, 17 May 2022 12:03:27 +0000
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqvv6-00DSQR-Ku
 for linux-mtd@lists.infradead.org; Tue, 17 May 2022 12:03:22 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 99C30272DB;
 Tue, 17 May 2022 12:03:05 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 17 May
 2022 14:03:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00170ed3db5-be56-4885-81a9-6c1aa5207cce,
 BB146B841C735870D6401592F5D215EFF71F43F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org>
Date: Tue, 17 May 2022 14:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC driver
 to spi-mem
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <andrew@aj.id.au>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <richard@nod.at>, <joel@jms.id.au>,
 <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <chin-ting_kuo@aspeedtech.com>, <linux-aspeed@lists.ozlabs.org>,
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
 <20220517110509.2e6xbwot63yl6a3c@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220517110509.2e6xbwot63yl6a3c@ti.com>
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 80e81b9c-232a-483c-aa21-84c362e6a333
X-Ovh-Tracer-Id: 10302265625168612228
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehkeelieetvddtlefgveeuheduheetledvtdfgfeffledvjeekjeegledvkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_050321_033237_F273BA07 
X-CRM114-Status: GOOD (  16.80  )
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

UHJhdHl1c2gsCgpPbiA1LzE3LzIyIDEzOjA1LCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPiBIaSBD
ZWRyaWMsCj4gCj4gT24gMTYvMDUvMjIgMDc6MzlQTSwgTWFyayBCcm93biB3cm90ZToKPj4gT24g
TW9uLCA5IE1heSAyMDIyIDE5OjU2OjA1ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToK
Pj4+IFRoaXMgc2VyaWVzIGFkZHMgYSBuZXcgU1BJIGRyaXZlciB1c2luZyB0aGUgc3BpLW1lbSBp
bnRlcmZhY2UgZm9yIHRoZQo+Pj4gQXNwZWVkIHN0YXRpYyBtZW1vcnkgY29udHJvbGxlcnMgb2Yg
dGhlIEFTVDI2MDAsIEFTVDI1MDAgYW5kIEFTVDI0MDAKPj4+IFNvQ3MuCj4+Pgo+Pj4gICAqIEFT
VDI2MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9sbGVyIChGTUMpCj4+PiAgICogQVNUMjYw
MCBTUEkgRmxhc2ggQ29udHJvbGxlciAoU1BJMSBhbmQgU1BJMikKPj4+ICAgKiBBU1QyNTAwIEZp
cm13YXJlIFNQSSBNZW1vcnkgQ29udHJvbGxlciAoRk1DKQo+Pj4gICAqIEFTVDI1MDAgU1BJIEZs
YXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCj4+PiAgICogQVNUMjQwMCBOZXcgU3RhdGlj
IE1lbW9yeSBDb250cm9sbGVyIChhbHNvIHJlZmVycmVkIGFzIEZNQykKPj4+ICAgKiBBU1QyNDAw
IFNQSSBGbGFzaCBDb250cm9sbGVyIChTUEkpCj4+Pgo+Pj4gWy4uLl0KPj4KPj4gQXBwbGllZCB0
bwo+Pgo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvYnJvb25pZS9zcGkuZ2l0IGZvci1uZXh0Cj4+Cj4+IFRoYW5rcyEKPj4KPj4gWzAyLzExXSBk
dC1iaW5kaW5nczogc3BpOiBDb252ZXJ0IHRoZSBBc3BlZWQgU01DIGNvbnRyb2xsZXJzIGRldmlj
ZSB0cmVlIGJpbmRpbmcKPj4gICAgICAgICAgY29tbWl0OiBjZTk4NThlYTQ5OWRhMDI1Njg0YTdh
NWYxOTgyM2MyYzNmMTRiZGNlCj4+IFswMy8xMV0gc3BpOiBzcGktbWVtOiBDb252ZXJ0IEFzcGVl
ZCBTTUMgZHJpdmVyIHRvIHNwaS1tZW0KPj4gICAgICAgICAgY29tbWl0OiA5YzYzYjg0NmU2ZGY0
M2U1YjNkMzEyNjNmN2RiNTQ1ZjMyZGVlZGEzCj4+IFswNC8xMV0gc3BpOiBhc3BlZWQ6IEFkZCBz
dXBwb3J0IGZvciBkaXJlY3QgbWFwcGluZwo+PiAgICAgICAgICBjb21taXQ6IDlkYTA2ZDdiZGVj
N2RhZDgwMThjMjNiMTgwZTQxMGVmMmU3YTQzNjcKPj4gWzA1LzExXSBzcGk6IGFzcGVlZDogQWRq
dXN0IGRpcmVjdCBtYXBwaW5nIHRvIGRldmljZSBzaXplCj4+ICAgICAgICAgIGNvbW1pdDogYmIw
ODRmOTRlMWJjYTRhNWM0ZjY4OWQ3YWE5YjQxMDIyMGMxZWQ3MQo+PiBbMDYvMTFdIHNwaTogYXNw
ZWVkOiBXb3JrYXJvdW5kIEFTVDI1MDAgbGltaXRhdGlvbnMKPj4gICAgICAgICAgY29tbWl0OiA1
Nzg1ZWVkZWU0MmMzNGNmZWM0OTYxOTlhODBmYThlYzlkZGNmN2ZlCj4+IFswNy8xMV0gc3BpOiBh
c3BlZWQ6IEFkZCBzdXBwb3J0IGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJvbGxlcgo+PiAgICAg
ICAgICBjb21taXQ6IDUzNTI2YWIyN2Q5YzI1NjUwNGYyNjc3MTNhZWE2MGRiN2FmMThmYjAKPj4g
WzA4LzExXSBzcGk6IGFzcGVlZDogQ2FsaWJyYXRlIHJlYWQgdGltaW5ncwo+PiAgICAgICAgICBj
b21taXQ6IGVlYWVjMWVhMDVjMGUwZjA4ZTA0YzY4NDRmMjBjYzI0YTJmY2MwZjQKPiAKPiBJIGhh
dmUgcmVwZWF0ZWRseSBvYmplY3RlZCB0byB0aGlzIHBhdGNoIFswXVsxXVsyXSBhbmQgeW91IGhh
dmUKPiByZXBlYXRlZGx5IGRlY2lkZWQgdG8gbm90IGFkZHJlc3MgbXkgb2JqZWN0aW9ucy4gCgpU
aGF0J3MgYSB2ZXJ5IGhhcnNoIHdheSBvZiBzYXlpbmcgdGhpbmdzLiBJIGRpZCBub3QgZGVjaWRl
IGFueXRoaW5nCm9yIGlnbm9yZSB5b3VyIGNvbW1lbnRzLiBJIGFuc3dlcmVkIHlvdXIgcXVlc3Rp
b25zIGFuZCBhY2tub3dsZWRnZWQKdGhhdCBpbmRlZWQgdGhlIHJlYWQgdHJhaW5pbmcgd2FzIGRv
bmUgdW5kZXIgdGhlIGRpcm1hcCBoYW5kbGVyIGJ1dAp0aGlzIHdhcyBub3QgYSBjb25jZXJuIHRv
ZGF5IHNpbmNlIHdlIGhhZCBhbGwgdGhlIHJlcXVpcmVkIGluZm9ybWF0aW9uCmZyb20gc3BpbWVt
LgoKV2Ugd2FpdGVkIF90b2dldGhlcl8sIDUgb3IgNiB3ZWVrcywgZm9yIG1vcmUgaW5wdXRzIG9u
IGhvdyB0byBhZGRyZXNzCnRoZSBjb25jZXJucyB5b3UgcmFpc2VkIHJlZ2FyZGluZyB0aGUgc3Vz
dGFpbmFiaWxpdHkgb2YgdGhpcyBtZXRob2QuCgo+IEkgd29uJ3Qgc3BlbmQgYW55IG1vcmUgdGlt
ZSBmaWdodGluZyBpdC4gCgpUaGlzIGlzIG5vdCBhIGZpZ2h0LiBJIGRvbid0IGtub3cgd2h5IHlv
dSBpbnRlcnByZXQgaXQgdGhhdCB3YXkuCgpOb3csIHNpbmNlIHlvdSBvYmplY3Qgc28gZXhwbGlj
aXRseSwgYW5kIHNpbmNlIHRoaXMgcGF0Y2hzZXQgaGFzCm5vdCByZWFjaGVkIHRoZSBMaW51eCBr
ZXJuZWwgeWV0LCB3ZSBzaG91bGQgY29uc2lkZXIgZHJvcHBpbmcgaXQuCkkgcmF0aGVyIGRvIHRo
YXQgdGhhbiBwdXNoIGNyYXAgaW4gbWFpbmxpbmUuIEJ1dCB0aGVuLCBwbGVhc2UsCnByb3ZpZGUg
c29sdXRpb25zIGFuZCBub3Qgb25seSBvYmplY3Rpb25zICEKCj4gQnV0IEkgd2lsbCBzYXkgdGhh
dCB5b3Ugc2hvdWxkIG5vdCBleHBlY3QgYW55Cj4gZ3VhcmFudGVlcyB0aGF0IFNQSSBOT1Igb3Ig
U1BJIE5BTkQgd2lsbCBub3QgYnJlYWsgeW91ciBjYWxpYnJhdGlvbiBpbgo+IHRoZSBmdXR1cmUg
aWYgdGhleSBkZWNpZGUgdG8gbW92ZSB0aGUgZGlybWFwX2NyZWF0ZSgpIGNhbGwgYXJvdW5kLgoK
SWYgdGhhdCdzIHRoZSBjYXNlIG9uZSBkYXksIHdlIGhhdmUgbXVsdGlwbGUgc29sdXRpb25zIDoK
CiAgIC0gc3RvcCBkb2luZyB0aGUgdHJhaW5pbmcKICAgLSBtb3ZlIHRoZSB0cmFpbmluZyB0byB0
aGUgYXBwcm9wcmlhdGUgaGFuZGxlciBpZiBpdCBleGlzdHMKICAgLSB1c2UgYSBkZWZhdWx0IHZh
bHVlCiAgCj4+IFsxMS8xMV0gbXRkOiBzcGktbm9yOiBhc3BlZWQ6IHNldCB0aGUgZGVjb2Rpbmcg
c2l6ZSB0byBhdCBsZWFzdCAyTUIgZm9yIEFTVDI2MDAKPj4gICAgICAgICAgY29tbWl0OiA3M2Fl
OTdlM2NhYmI1ODA2MzlmMDJmMTJhMTkyMzI0YTUzYzRiZWJiCj4+Cj4gCj4gWzBdIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9zcGktZGV2ZWwtZ2VuZXJhbC9wYXRjaC8yMDIy
MDMyNTEwMDg0OS4yMDE5MjA5LTktY2xnQGthb2Qub3JnLwo+IFsxXSBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3Qvc3BpLWRldmVsLWdlbmVyYWwvcGF0Y2gvMjAyMjAyMTQwOTQy
MzEuMzc1MzY4Ni05LWNsZ0BrYW9kLm9yZy8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjIwMjA4MTkwNjM2Lmg2ZHVia3RrbXVvc3ZkeG9AdGkuY29tLwoKUmVnYXJkcywKCkPD
qWRyaWMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
