Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5323AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 13:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH4rDDl727uoIIurBdrLzvszR07dLlgfdmDLva9MpV0=; b=gKZy4c7ljgEHWx
	7gcUNx07klSyCrG1UUqV6XE4U4LnDsoijcF0WPcd0BdDJsaPb21Ar7r3ael6H/0HPXRCygB5B5nXP
	rLWCQ0aS4QvLBrXFDMdQgtF5D0+tlT0x3JPDs/oHeOZxWqrO0d5nCJUeRh98kxQZYPKRKrc4w0YLu
	JmMIDbPTbTY49sUg7zOvfT8oxQN2BJgbdnxIooUtolNx3PAuJY6esIoGhC3Uf68ZMrRu1PcBJVu59
	swUGfryU58wDUZbYcN7aRh+twiokXQ9mpYRN8p4VgK+NhvRTgqeT2E9qyks986KDuxHrkMl2lRdt4
	g7KO7UN+Gap9uvi4Nysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxYs-00E3d5-88; Tue, 17 May 2022 13:48:30 +0000
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxRp-00DztL-7O
 for linux-mtd@lists.infradead.org; Tue, 17 May 2022 13:41:17 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 198B4276A6;
 Tue, 17 May 2022 13:41:06 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 17 May
 2022 15:41:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00468999d79-193f-4c38-8695-8964d1044880,
 BB146B841C735870D6401592F5D215EFF71F43F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad7650a2-883b-3c1d-8628-353ae3528848@kaod.org>
Date: Tue, 17 May 2022 15:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC driver
 to spi-mem
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <andrew@aj.id.au>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <richard@nod.at>, <joel@jms.id.au>,
 <tudor.ambarus@microchip.com>, <chin-ting_kuo@aspeedtech.com>,
 <linux-aspeed@lists.ozlabs.org>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
 <20220517110509.2e6xbwot63yl6a3c@ti.com>
 <a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org>
 <20220517143713.47676b4c@xps-13>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220517143713.47676b4c@xps-13>
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb8babb7-c5e9-4c21-ab82-43c65d86be41
X-Ovh-Tracer-Id: 11957338486556756868
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfekkeekveduudfhfeffkedvhfeiueelfefggeevvdelfeejueektdeuleetteeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_064113_649084_79C68097 
X-CRM114-Status: GOOD (  26.84  )
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

SGVsbG8gTWlxdWVsLAoKT24gNS8xNy8yMiAxNDozNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDw6lkcmljLAo+IAo+IGNsZ0BrYW9kLm9yZyB3cm90ZSBvbiBUdWUsIDE3IE1heSAyMDIyIDE0
OjAzOjAyICswMjAwOgo+IAo+PiBQcmF0eXVzaCwKPj4KPj4gT24gNS8xNy8yMiAxMzowNSwgUHJh
dHl1c2ggWWFkYXYgd3JvdGU6Cj4+PiBIaSBDZWRyaWMsCj4+Pgo+Pj4gT24gMTYvMDUvMjIgMDc6
MzlQTSwgTWFyayBCcm93biB3cm90ZToKPj4+PiBPbiBNb24sIDkgTWF5IDIwMjIgMTk6NTY6MDUg
KzAyMDAsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+Pj4+PiBUaGlzIHNlcmllcyBhZGRzIGEg
bmV3IFNQSSBkcml2ZXIgdXNpbmcgdGhlIHNwaS1tZW0gaW50ZXJmYWNlIGZvciB0aGUKPj4+Pj4g
QXNwZWVkIHN0YXRpYyBtZW1vcnkgY29udHJvbGxlcnMgb2YgdGhlIEFTVDI2MDAsIEFTVDI1MDAg
YW5kIEFTVDI0MDAKPj4+Pj4gU29Dcy4KPj4+Pj4KPj4+Pj4gICAgKiBBU1QyNjAwIEZpcm13YXJl
IFNQSSBNZW1vcnkgQ29udHJvbGxlciAoRk1DKQo+Pj4+PiAgICAqIEFTVDI2MDAgU1BJIEZsYXNo
IENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCj4+Pj4+ICAgICogQVNUMjUwMCBGaXJtd2FyZSBT
UEkgTWVtb3J5IENvbnRyb2xsZXIgKEZNQykKPj4+Pj4gICAgKiBBU1QyNTAwIFNQSSBGbGFzaCBD
b250cm9sbGVyIChTUEkxIGFuZCBTUEkyKQo+Pj4+PiAgICAqIEFTVDI0MDAgTmV3IFN0YXRpYyBN
ZW1vcnkgQ29udHJvbGxlciAoYWxzbyByZWZlcnJlZCBhcyBGTUMpCj4+Pj4+ICAgICogQVNUMjQw
MCBTUEkgRmxhc2ggQ29udHJvbGxlciAoU1BJKQo+Pj4+Pgo+Pj4+PiBbLi4uXQo+Pj4+Cj4+Pj4g
QXBwbGllZCB0bwo+Pj4+Cj4+Pj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKPj4+Pgo+Pj4+IFRoYW5r
cyEKPj4+Pgo+Pj4+IFswMi8xMV0gZHQtYmluZGluZ3M6IHNwaTogQ29udmVydCB0aGUgQXNwZWVk
IFNNQyBjb250cm9sbGVycyBkZXZpY2UgdHJlZSBiaW5kaW5nCj4+Pj4gICAgICAgICAgIGNvbW1p
dDogY2U5ODU4ZWE0OTlkYTAyNTY4NGE3YTVmMTk4MjNjMmMzZjE0YmRjZQo+Pj4+IFswMy8xMV0g
c3BpOiBzcGktbWVtOiBDb252ZXJ0IEFzcGVlZCBTTUMgZHJpdmVyIHRvIHNwaS1tZW0KPj4+PiAg
ICAgICAgICAgY29tbWl0OiA5YzYzYjg0NmU2ZGY0M2U1YjNkMzEyNjNmN2RiNTQ1ZjMyZGVlZGEz
Cj4+Pj4gWzA0LzExXSBzcGk6IGFzcGVlZDogQWRkIHN1cHBvcnQgZm9yIGRpcmVjdCBtYXBwaW5n
Cj4+Pj4gICAgICAgICAgIGNvbW1pdDogOWRhMDZkN2JkZWM3ZGFkODAxOGMyM2IxODBlNDEwZWYy
ZTdhNDM2Nwo+Pj4+IFswNS8xMV0gc3BpOiBhc3BlZWQ6IEFkanVzdCBkaXJlY3QgbWFwcGluZyB0
byBkZXZpY2Ugc2l6ZQo+Pj4+ICAgICAgICAgICBjb21taXQ6IGJiMDg0Zjk0ZTFiY2E0YTVjNGY2
ODlkN2FhOWI0MTAyMjBjMWVkNzEKPj4+PiBbMDYvMTFdIHNwaTogYXNwZWVkOiBXb3JrYXJvdW5k
IEFTVDI1MDAgbGltaXRhdGlvbnMKPj4+PiAgICAgICAgICAgY29tbWl0OiA1Nzg1ZWVkZWU0MmMz
NGNmZWM0OTYxOTlhODBmYThlYzlkZGNmN2ZlCj4+Pj4gWzA3LzExXSBzcGk6IGFzcGVlZDogQWRk
IHN1cHBvcnQgZm9yIHRoZSBBU1QyNDAwIFNQSSBjb250cm9sbGVyCj4+Pj4gICAgICAgICAgIGNv
bW1pdDogNTM1MjZhYjI3ZDljMjU2NTA0ZjI2NzcxM2FlYTYwZGI3YWYxOGZiMAo+Pj4+IFswOC8x
MV0gc3BpOiBhc3BlZWQ6IENhbGlicmF0ZSByZWFkIHRpbWluZ3MKPj4+PiAgICAgICAgICAgY29t
bWl0OiBlZWFlYzFlYTA1YzBlMGYwOGUwNGM2ODQ0ZjIwY2MyNGEyZmNjMGY0Cj4+Pgo+Pj4gSSBo
YXZlIHJlcGVhdGVkbHkgb2JqZWN0ZWQgdG8gdGhpcyBwYXRjaCBbMF1bMV1bMl0gYW5kIHlvdSBo
YXZlCj4+PiByZXBlYXRlZGx5IGRlY2lkZWQgdG8gbm90IGFkZHJlc3MgbXkgb2JqZWN0aW9ucy4K
Pj4gVGhhdCdzIGEgdmVyeSBoYXJzaCB3YXkgb2Ygc2F5aW5nIHRoaW5ncy4gSSBkaWQgbm90IGRl
Y2lkZSBhbnl0aGluZwo+PiBvciBpZ25vcmUgeW91ciBjb21tZW50cy4gSSBhbnN3ZXJlZCB5b3Vy
IHF1ZXN0aW9ucyBhbmQgYWNrbm93bGVkZ2VkCj4+IHRoYXQgaW5kZWVkIHRoZSByZWFkIHRyYWlu
aW5nIHdhcyBkb25lIHVuZGVyIHRoZSBkaXJtYXAgaGFuZGxlciBidXQKPj4gdGhpcyB3YXMgbm90
IGEgY29uY2VybiB0b2RheSBzaW5jZSB3ZSBoYWQgYWxsIHRoZSByZXF1aXJlZCBpbmZvcm1hdGlv
bgo+PiBmcm9tIHNwaW1lbS4KPj4KPj4gV2Ugd2FpdGVkIF90b2dldGhlcl8sIDUgb3IgNiB3ZWVr
cywgZm9yIG1vcmUgaW5wdXRzIG9uIGhvdyB0byBhZGRyZXNzCj4+IHRoZSBjb25jZXJucyB5b3Ug
cmFpc2VkIHJlZ2FyZGluZyB0aGUgc3VzdGFpbmFiaWxpdHkgb2YgdGhpcyBtZXRob2QuCj4+Cj4+
PiBJIHdvbid0IHNwZW5kIGFueSBtb3JlIHRpbWUgZmlnaHRpbmcgaXQuCj4+IFRoaXMgaXMgbm90
IGEgZmlnaHQuIEkgZG9uJ3Qga25vdyB3aHkgeW91IGludGVycHJldCBpdCB0aGF0IHdheS4KPj4K
Pj4gTm93LCBzaW5jZSB5b3Ugb2JqZWN0IHNvIGV4cGxpY2l0bHksIGFuZCBzaW5jZSB0aGlzIHBh
dGNoc2V0IGhhcwo+PiBub3QgcmVhY2hlZCB0aGUgTGludXgga2VybmVsIHlldCwgd2Ugc2hvdWxk
IGNvbnNpZGVyIGRyb3BwaW5nIGl0Lgo+PiBJIHJhdGhlciBkbyB0aGF0IHRoYW4gcHVzaCBjcmFw
IGluIG1haW5saW5lLiBCdXQgdGhlbiwgcGxlYXNlLAo+PiBwcm92aWRlIHNvbHV0aW9ucyBhbmQg
bm90IG9ubHkgb2JqZWN0aW9ucyAhCj4+Cj4+PiBCdXQgSSB3aWxsIHNheSB0aGF0IHlvdSBzaG91
bGQgbm90IGV4cGVjdCBhbnkKPj4+IGd1YXJhbnRlZXMgdGhhdCBTUEkgTk9SIG9yIFNQSSBOQU5E
IHdpbGwgbm90IGJyZWFrIHlvdXIgY2FsaWJyYXRpb24gaW4KPj4+IHRoZSBmdXR1cmUgaWYgdGhl
eSBkZWNpZGUgdG8gbW92ZSB0aGUgZGlybWFwX2NyZWF0ZSgpIGNhbGwgYXJvdW5kLgo+Pgo+PiBJ
ZiB0aGF0J3MgdGhlIGNhc2Ugb25lIGRheSwgd2UgaGF2ZSBtdWx0aXBsZSBzb2x1dGlvbnMgOgo+
Pgo+PiAgICAgLSBzdG9wIGRvaW5nIHRoZSB0cmFpbmluZwo+IAo+IE5vdCByZWFsbHkgYW4gb3B0
aW9uLCBpc24ndCBpdD8KCndlbGwsIEkgd291bGQgcmVhbGx5IHJhdGhlciBrZWVwIHRoZSB0cmFp
bmluZy4gRWxzZSB0aGUgZGV2aWNlIHdvdWxkIGJlCmNyaXBwbGVkIGFuZCBydW4gYXQgbG93IHNw
ZWVkLiAxLzE2IEhDTEsgaXMgdGhlIGRlZmF1bHQgOi8KCj4gCj4+ICAgICAtIG1vdmUgdGhlIHRy
YWluaW5nIHRvIHRoZSBhcHByb3ByaWF0ZSBoYW5kbGVyIGlmIGl0IGV4aXN0cwo+IAo+IFNvcnJ5
IGZvciBqdW1waW5nIGluIHNvIGxhdGUsIGJ1dCB3aHkgbm90IHVzaW5nIHRoaXMgc29sdXRpb24g
YWxyZWFkeQo+IGlmIHRoZXJlIGFyZSBjb25jZXJucyBhYm91dCB0aGUgY3VycmVudCBsb2NhdGlv
bj8gSXQgZG9lcyBub3QgbG9vayBsaWtlCj4gYSBjb21wbGV4IHNvbHV0aW9uIHRvIGltcGxlbWVu
dCwgYnV0IEkgbWlnaHQgYmUgb3Zlcmxvb2tpbmcgc29tZXRoaW5nLgoKSSB0aGluayB3ZSBuZWVk
IHNvbWUgbW9yZSBmZWVkYmFjayBvbiB0aGlzIHByb3Bvc2FsIFswXS4KCklmIHRoYXQncyBub3Qg
YWNjZXB0YWJsZSwgdGhlbiBsZXQncyBkaXNjdXNzIG9uIGRpcm1hcF9jcmVhdGUoKSBhbmQKc2Vl
IGlmIGl0IHdvdWxkIGJlIGFjY2VwdGFibGUgdG8gZG8gY2FsaWJyYXRpb24gdW5kZXIgdGhpcyBo
b29rLgpXaGljaCBpcyB3aGF0IHRoaXMgcGF0Y2hzZXQgaXMgcHJvcG9zaW5nIHNpbmNlIHRoZSBz
cGltZW0gaW50ZXJmYWNlCm9mZmVycyBhbGwgdGhlIHJlcXVpcmVkIGluZm9ybWF0aW9uIHRvIGRv
IHNvLgoKSG93ZXZlciwgUHJhdHl1c2ggd291bGQgcHJlZmVyIGEgc3RhYmxlIGludGVyZmFjZSwg
aGVuY2UgWzBdLgoKVGhhdCBzYWlkLCBpZiBvbmUgZGF5IHdlIG1lcmdlIGEgZG9fY2FsaWJyYXRp
b24oKSBob29rIGxpa2UgcHJvcG9zZWQKaW4gWzBdLCB3ZSBjYW4gY2hhbmdlIHRoZSBjdXJyZW50
IEFzcGVlZCBwYXRjaHNldCB0byB1c2UgaXQuIFRoYXQncwp3aHkgSSBkaWRuJ3Qgc2VlIHRoZSBs
YWNrIG9mIHNwZWNpZmljIGNhbGlicmF0aW9uIGhvb2sgYXMgYSBibG9ja2VyLgoKPiBUaGlzIGNh
biBhbHNvIGJlIGRvbmUgZm9yIHRoZSBuZXh0IGtlcm5lbCByZWxlYXNlLgoKSSB3YXMgaG9waW5n
IHRoaXMgb25lLiBXZSB3b3VsZCBuZWVkIGEgY29tbWVudCBvbiB0aGUgdXNlIG9mIHRoZQpkaXJt
YXBfY3JlYXRlKCkgaG9vayB0byBjbGFyaWZ5LgoKVGhhbmtzICEKCkPDqWRyaWMKClswXSBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvP3Nlcmllcz0y
MzM1MDQmc3RhdGU9JTJBJmFyY2hpdmU9Ym90aAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
