Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE63C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJaaHW6P+/gWCmQMyO0RDpvE8bVj4TMEWx+7OyqnEzE=; b=3rjC8gl/aOIopW
	4sFtHKZe/rRpHzDuJ5WT2bupDOTUw6Xal/7SQGbvCvuoom2a0RrqGq+LBr8groLzQsCTIbAiw87EH
	EKaAQX6GQjdVbIrwdU4q37phCV+ZOEvSHFgJX1xZv1exP3ntmoA5u/sIpJz3+y7F4f3G8lmRGzeAv
	yvuXmFO5FBt89Bagxr9HFRoVNbdMDeDGh0c09QxnniaRZz6p6r4Wj0+ly18IKmTngovglHjoOSrZu
	J4X0x6tgLVJ/GbSsJgITud5d5mKTxlbnre9ZBHlMIPGfZUnOceLMEReft2PMG/n7JDXd+g1y6lQT7
	tRHDY3QRPJ7XftKbAnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH7Zg-00BGIW-8y; Mon, 07 Feb 2022 17:13:12 +0000
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH7Zd-00BGHm-Dh
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 17:13:11 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C7C002175D;
 Mon,  7 Feb 2022 17:13:02 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Feb
 2022 18:13:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0044853b68b-cd97-4ce1-aeb7-00b726bfd98e,
 E2445A8A547341F0C4F33C36BF67DED8627CB71E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <53d53523-7174-89fd-8661-550346d53141@kaod.org>
Date: Mon, 7 Feb 2022 18:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
CC: Patrick Williams <patrick@stwcx.xyz>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Potin Lai
 <potin.lai@quantatw.com>, <linux-kernel@vger.kernel.org>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-arm-kernel@lists.infradead.org>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com> <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com> <20220103171721.46c8e697@xps13>
 <YdSP6tKyQ2ZRUC+2@heinlein> <20220105063244.lno3xur64uepa7i5@ti.com>
 <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
 <20220124153644.m3iwlvq5ld5cpbyz@ti.com>
 <b222361a-288a-55b2-fc02-04c0b93b4220@kaod.org>
 <20220124203708.lm23sgsub234wlhq@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124203708.lm23sgsub234wlhq@ti.com>
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0889bc72-794a-48f3-bc90-e1c137db6e97
X-Ovh-Tracer-Id: 5989224557367692280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgvdefheejgfelvefhudfghffgvdeuffeifefhheefvdeliedtleehuddvuefftdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_091309_789173_BD3B22B4 
X-CRM114-Status: GOOD (  29.03  )
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

SGVsbG8sCgpPbiAxLzI0LzIyIDIxOjM3LCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPiBPbiAyNC8w
MS8yMiAwNzozNFBNLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4+PiBzcGltZW0gbmVlZHMg
YW4gZXh0ZW5zaW9uIEkgdGhpbmsuIFNvcnJ5IEkgaGF2ZSBub3QgYmVlbiBhYmxlIHRvCj4+Pj4g
cHVzaCB0aGF0IGZvcndhcmQuIExhY2sgb2YgdGltZSBhbmQgb3RoZXIgdGFza3MgdG8gYWRkcmVz
cyBvbiB0aGUKPj4+PiBob3N0IHNpZGUgb2YgdGhlIG1hY2hpbmUuIFRoaXMgaXMgcmVhbGx5IGEg
c29mdHdhcmUgcHJvYmxlbSwgd2UKPj4+PiBoYXZlIHRoZSBIVyBwcm9jZWR1cmVzIHJlYWR5LiBJ
ZiBhIHNwaW1lbSBleHBlcnQgY291bGQgZ2V0IGludm9sdmVkCj4+Pj4gdG8gbWFrZSBhIGZldyBw
cm9wb3NhbHMsIEkgd291bGQgYmUgaGFwcHkgdG8gaGVscCBhbmQgZG8gc29tZSB0ZXN0aW5nLgo+
Pj4+IFFFTVUgbW9kZWxzIGFyZSBnb29kIGVub3VnaCBmb3IgdGhlIHNvZnR3YXJlIHBhcnQuIFdl
IGNhbiBkbyB0aGUKPj4+PiB0cmFpbmluZyB2YWxpZGF0aW9uIG9uIHJlYWwgSFcgd2hlbiByZWFk
eS4KPj4+Cj4+PiBXaGF0IGluZm9ybWF0aW9uIGFib3V0IHRoZSBmbGFzaCBkbyB5b3UgbmVlZCBm
b3IgdGhpcyB0cmFpbmluZz8KPj4KPj4gTGFzdCB0aW1lIEkgbG9va2VkLCB3ZSBsYWNrZWQgc29t
ZSBwb3N0X2luaXQgaGFuZGxlciB0byBzZXR1cCBhIHNsYXZlOgo+PiBjb25maWd1cmUgdGhlIHJl
Z2lzdGVycyBkZWZpbmluZyB0aGUgQUhCIHdpbmRvd3MgZm9yIGVhY2ggZmxhc2gKPj4gc2xhdmUg
YW5kIHBlcmZvcm0gdGhlIHJlYWQgdGltaW5nIGNhbGlicmF0aW9uLiBjYWxpYnJhdGlvbiBzaG91
bGQKPj4gb25seSBiZSBkb25lIG9uY2UuCj4+Cj4+IFNlZSBob3cgdGhlIGFzcGVlZF9zcGlfZmxh
c2hfaW5pdCgpIHJvdXRpbmUgZG9pbmcgdGhlIGNhbGlicmF0aW9uCj4+IGlzIGhvb2tlZCB1cCB1
bmRlciBhc3BlZWRfc3BpX2NsYWltX2J1cygpIGluIHRoZSB1LWJvb3QgZHJpdmVyIDoKPiAKPiBN
eSBwYXRjaCBzZXJpZXMgc2hvdWxkIHByb3ZpZGUgYSBob29rIGZvciBkb2luZyB0aGUgY2FsaWJy
YXRpb24gX2FmdGVyXwo+IHRoZSBmbGFzaCBpcyBpbml0aWFsaXplZC4KCllvdSBjYW4gYWxzbyB1
c2UgdGhlIC5kaXJtYXBfY3JlYXRlIGhhbmRsZXIuIFRoZSBmbGFzaCBkZXZpY2UgaGFzCmJlZW4g
c2Nhbm5lZCB3aGVuIGNhbGxlZCBhbmQgdGhlIHNpemUgaXMgYXZhaWxhYmxlIGluIHRoZSBzcGkt
bWVtCmRpcm1hcCBkZXNjcmlwdG9yLgoKSSByZXdvcmtlZCB0aGUgY3VycmVudCBBc3BlZWQgZHJp
dmVyIHdpdGggdGhpcyBhcHByb2FjaCBhbmQgaXQKc2VlbXMgc3VmZmljaWVudCBmb3IgcmVhZCBj
YWxpYnJhdGlvbi4KClRoYW5rcywKCkMuCgoKPiAKPj4KPj4gICAgaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvdS1ib290L2Jsb2IvdjIwMTkuMDQtYXNwZWVkLW9wZW5ibWMvZHJpdmVycy9zcGkv
YXNwZWVkX3NwaS5jCj4+Cj4+IE5vdCBnb29kIGVub3VnaCBmb3IgdXBzdHJlYW0sIExpbnV4IHdv
dWxkIGJlIHRoZSBzYW1lIDovCj4+Cj4+PiBJIHByb3Bvc2VkIGEgcGF0Y2ggc2VyaWVzIFswXSBz
b21lIHRpbWUgYWdvIHRyeWluZyB0byBpbXBsZW1lbnQgdHJhaW5pbmcKPj4+IGZvciBUSSBTb0Nz
LiBJdCBkaWQgbm90IGdldCBtZXJnZWQgYnV0IEkgZG8gaW50ZW5kIHRvIHJlc3BpbiBpdCBhbmQg
Z2V0Cj4+PiBpdCB0aHJvdWdoLiBXb3VsZCB0aGlzIEFQSSB3b3JrIGZvciB5b3VyIHR1bmluZyBh
cyB3ZWxsPwo+Pgo+PiBJIHdpbGwgdGFrZSBhIGxvb2suCj4+PiBBbHNvLCBJIGFtIGN1cmlvdXMg
aG93IHlvdXIgdHJhaW5pbmcgd29ya3MuIFdoYXQgZGF0YSBkbyB5b3UgcmVhZCBmb3IKPj4+IHRy
YWluaW5nIGRlbGF5cz8gV2hlcmUgaXMgaXQgc3RvcmVkPwo+Pgo+PiBUaGUgZHJpdmVyIHJlYWRz
IHRoZSBmaXJzdCAxNksgYXQgc2xvdyBzcGVlZCAodGhhdCdzIHdoeSB3ZSBuZWVkIGEKPj4gYmFz
aWMgbWluaW1hbCBzZXR1cCBvZiB0aGUgc2xhdmUpIGFuZCBjaGVja3MgaWYgdGhlIGJ1ZmZlciBp
cyB2YWxpZAo+PiBlbm91Z2ggZm9yIHRoZSBjYWxpYnJhdGlvbiA6Cj4+Cj4+ICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTUuMTUvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMjTDk5OAo+Pgo+PiBpdCB0aGVuIHBlcmZvcm1zIHJl
YWRzIGJ5IGNoYW5naW5nIHRoZSBmcmVxdWVuY3kgYW5kIGRlbGF5cyBhbmQKPj4gY29tcGFyZXMg
cmVzdWx0cyB3aXRoIHRoZSBpbml0aWFsIGRlZmF1bHQgYnVmZmVyLgo+IAo+IFRoaXMgc2VlbXMg
c2ltaWxhciB0byB0aGUgdHVuaW5nIEkgaW1wbGVtZW50ZWQsIGV4Y2VwdCBtaW5lIHVzZXMgYQo+
IHByZS1kZWZpbmVkIHBhdHRlcm4gYXQgYSBwcmUtZGVmaW5lZCBsb2NhdGlvbi4KPiAKPj4KPj4g
aWYgbm90LCB0aGVuIHRoZSBkcml2ZXIgc3RheXMgaW4gYSBzYWZlIG1vZGUgKHNsb3cpLgo+IAo+
IFNhbWUgZm9yIG15IHBhdGNoZXMuCj4gCj4+Cj4+PiBJbiBvdXIgY2FzZSB3ZSBuZWVkIHRvIGZs
YXNoIGEKPj4+IGtub3duIHBhdHRlcm4gYXQgc29tZSBsb2NhdGlvbiAod2hpY2ggaXMgcGFzc2Vk
IGluIHZpYSBEVCkuIERvIHlvdSBuZWVkCj4+PiB0byBydW4gaXQgZm9yIGV2ZXJ5IHJlYWQgdHJh
bnNhY3Rpb24gb3IganVzdCBvbmNlIGFmdGVyIHRoZSBmbGFzaCBpcwo+Pj4gaW5pdGlhbGl6ZWQ/
Cj4+Cj4+IEp1c3Qgb25jZSBiZWNhdXNlIGl0IGlzIGEgaGVhdnkgcHJvY2Vzcy4gU2VlIHRoZSBk
ZWJ1ZyBvdXRwdXRzIGJlbG93Lgo+PiBPbmNlIHdlIGhhdmUgZ29vZCByZWFkIHRpbWluZ3MgYW5k
IGZyZXF1ZW5jeSwgdGhlcmUgaXMgbm8gbmVlZCB0byBkbwo+PiBpdCBlYWNoIHRpbWUuCj4gCj4g
SXQgbG9va3MgdmVyeSBzaW1pbGFyIHRvIHRoZSB0dW5pbmcgSSBpbXBsZW1lbnRlZCBpbiBteSBw
YXRjaCBzZXJpZXMuCj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSB0aG9zZSBBUElzIGZvciB5
b3VyIHR1bmluZyBhcyB3ZWxsLiBCdXQgaXQKPiBzaG91bGQgbm90IGJsb2NrIHRoZSBTUEkgTUVN
IHBvcnQuIFRoZSBjdXJyZW50IHVwc3RyZWFtIGRyaXZlciBkb2VzIG5vdAo+IHNlZW0gdG8gaW1w
bGVtZW50IHRoaXMgdHVuaW5nIGFueXdheS4KPiAKPj4KPj4+IFswXSBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvP3Nlcmllcz0yMzM1MDQmc3RhdGU9
JTJBJmFyY2hpdmU9Ym90aAo+PiBUaGFua3MsCj4+Cj4+IEMuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
