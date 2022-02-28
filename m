Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F20C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PDuTGvAay3Qb4p4XuVql8U1yt5nKYf2FKlu4VQx/p0=; b=i5vNCD/uI/Q2SU
	hbHNXrGiRwv9P45v1s1zRMmOTkr5qRz+NI/Pb03UDwRpWMJ9XumxSbqlwHlpYwTdrJUwVMla56Ooy
	WrCSA3XofFpj3pzFGnUUCbKkEctdr8jNYNt0hqaZJIS5CrNQf6KHkroXOb1hX/WRYfvmia14gsyXI
	DOyc7mh3OUWmJdzMryFelvobii02KdoA+fzF1HssZpUKndQCYYlQJ1NUe2GUQlqRFuwIZUiGpIJgf
	TtcnQj/sPMTSFtQZWbYpC19YsA318V9RCj/dwtpSEgDUn6axIv+AlIKW0DrvItTQ1wxFKzwJaB05h
	gCWyl6xfYeHc0Qyc7mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOhIn-00D0au-Ry; Mon, 28 Feb 2022 14:47:06 +0000
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOh9r-00Cx8X-9z; Mon, 28 Feb 2022 14:37:53 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.107])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 050CE2339A;
 Mon, 28 Feb 2022 14:37:45 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 28 Feb
 2022 15:37:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003a3ef605e-0c0a-4f25-99c2-225566a87550,
 252894939833E8233A028C6995915A29C4CB1534) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <423d3bfa-c963-c765-fa65-700db9980804@kaod.org>
Date: Mon, 28 Feb 2022 15:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: Pratyush Yadav <p.yadav@ti.com>, <linux-spi@vger.kernel.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, devicetree <devicetree@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-2-clg@kaod.org>
 <20220225073155.f2cxfhm7surf34d4@ti.com>
 <688b7a65-d4b6-682b-494a-1d4178699dba@kaod.org>
 <CACPK8XeCfLmEJSLV6q5BLpCVztzG3dZehCgqrjgrNr7LaOiReQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XeCfLmEJSLV6q5BLpCVztzG3dZehCgqrjgrNr7LaOiReQ@mail.gmail.com>
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cd52e354-2258-48f9-a7dc-fd9434f95e6a
X-Ovh-Tracer-Id: 16012829951295261572
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_063751_687040_DA83CA44 
X-CRM114-Status: GOOD (  19.85  )
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

T24gMi8yOC8yMiAwNzowNywgSm9lbCBTdGFubGV5IHdyb3RlOgo+IE9uIFN1biwgMjcgRmViIDIw
MjIgYXQgMTg6NTAsIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+IHdyb3RlOgo+Pgo+
PiBPbiAyLzI1LzIyIDA4OjMxLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPj4+IE9uIDE0LzAyLzIy
IDEwOjQyQU0sIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+Pj4+IFRvIHByZXBhcmUgdHJhbnNp
dGlvbiB0byB0aGUgbmV3IEFzcGVlZCBTTUMgU1BJIGNvbnRyb2xsZXIgZHJpdmVyIHVzaW5nCj4+
Pj4gdGhlIHNwaS1tZW0gaW50ZXJmYWNlLCBjaGFuZ2UgdGhlIGtlcm5lbCBDT05GSUcgb3B0aW9u
IG9mIHRoZSBjdXJyZW50Cj4+Pj4gZHJpdmVyIHRvIHJlZmxlY3QgdGhhdCB0aGUgaW1wbGVtZW50
YXRpb24gdXNlcyB0aGUgTVREIFNQSS1OT1IgaW50ZXJmYWNlLgo+Pj4+IE9uY2UgdGhlIG5ldyBk
cml2ZXIgaXMgc3VmZmljaWVudGx5IGV4cG9zZWQsIHdlIHNob3VsZCByZW1vdmUgdGhlIG9sZCBv
bmUuCj4+Pgo+Pj4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSByZWFzb25pbmcgYmVoaW5k
IHRoaXMuIFdoeSBrZWVwIHRoZSBvbGQKPj4+IGRyaXZlciBhcm91bmQ/IFdoeSBub3QgZGlyZWN0
bHkgcmVwbGFjZSBpdCB3aXRoIHRoZSBuZXcgb25lPyBEb2VzIHRoZQo+Pj4gbmV3IG9uZSBoYXZl
IGFueSBsaW1pdGF0aW9ucyB0aGF0IHRoaXMgb25lIGRvZXNuJ3Q/Cj4+Cj4+IE5vLiBUaGUgb2xk
IG9uZSBoYXMgbW9yZSBsaW1pdGF0aW9ucyB0aGFuIHRoZSBuZXcgb25lLiBUaGUgb2xkIG9uZSBp
bgo+PiBtYWlubGluZSBpcyBoYWxmIGJha2VkIHNpbmNlIHdlIGNvdWxkIG5ldmVyIG1lcmdlIHRo
ZSBuZWNlc3NhcnkgYml0cwo+PiBmb3IgdHJhaW5pbmcuIFdlIGhhdmUgYmVlbiBrZWVwaW5nIGEg
ZnVsbCB2ZXJzaW9uIGluIHRoZSBPcGVuQk1DIHRyZWUuCj4+Cj4+IEpvZWwsIGNvdWxkIHdlIHNp
bXBseSBkcm9wIHRoZSBvbGQgZHJpdmVyIGluIG1haW5saW5lIGFuZCBrZWVwIHRoZSBvbGQKPj4g
b25lIGluIHRoZSBPcGVuQk1DIHRyZWUgdW50aWwgd2UgZmVlbCBjb21mb3J0YWJsZSA/IEkgZ3Vl
c3Mgd2UgbmVlZAo+PiBtb3JlIHRlc3RpbmcuCj4gCj4gSSB3b3VsZCBhbnN3ZXIgUHJhdHl1c2gn
cyBxdWVzdGlvbiB3aXRoOiB0aGUgb2xkIG9uZSBpcyB3ZWxsIHRlc3RlZCwKPiBhbmQgdGhlIG5l
dyBvbmUgaXMgbm90LiBXZSB3b3VsZCBpbnRlbmQgdG8ga2VlcCB0aGUgb2xkIG9uZSBhcm91bmQg
Zm9yCj4gYSByZWxlYXNlIGN5Y2xlIG9yIHR3bywgYW5kIG9uY2Ugd2UncmUgY29uZmlkZW50IHRo
ZSBuZXcgb25lIGlzIHN0YWJsZQo+IHdlIHdvdWxkIHJlbW92ZSB0aGUgb2xkLgoKeWVzIGJ1dCB3
ZSBjb3VsZCBoYW5kbGUgdGhlIHRyYW5zaXRpb24gaW4gdGhlIE9wZW5CTUMgdHJlZSB3aXRob3V0
IHB1dHRpbmcKdGhlIGJ1cmRlbiBvbiBtYWlubGluZS4KICAKbWFpbmxpbmUgd291bGQgb25seSBo
YXZlIHRoZSBuZXdlciBzcGktbWVtIGJhc2VkIGRyaXZlciwgdGhlIE9wZW5CTUMgdHJlZQp3b3Vs
ZCBoYXZlIGl0IGFsc28sIGFsb25nIHdpdGggdGhlIG9sZGVyIFNQSS1OT1IgYmFzZWQgZHJpdmVy
LgoKU28gdGhpcyBwYXRjaCByZW5hbWluZyB0aGUgS2NvbmZpZyBvcHRpb24gd291bGQgb25seSBh
cHBseSB0byB0aGUgT3BlbkJNQwp0cmVlLgoKQy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
