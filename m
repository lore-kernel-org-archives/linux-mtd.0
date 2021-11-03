Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BB6C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D481861139
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D481861139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djPdKfGQkJAEv8BTw3nQgyDVwmaaWYu9XQdVxJ9knqs=; b=AdIud5CcGtBEaFJjgf0pe7GhMb
	CncLwvrnyAIfWLtOt7Pll1Izd3fqqhkYSD0kcFHEDuV+sIfwuTnI9IvMVGJm8kvd9+DDTjJt08OZR
	1fEBqyiaV1kvAh1D5ini3MwNspI5997QJY2YZLiEqzT8tn1RtSv2Qk+mESd5E18UDg3aVL/6FgUVK
	bp8aFqI0UMnNFu9nRQ0sy9WNs/qxeNYHfBXo0wifOR3ID4PljRsYKw4p//SeDx8bRQJd72LZyldNQ
	16T/ST+8L5VrvcpMU7UAdBCaFo05jNBTNzImBGPGXOn9bug2M55FUFNtv3cx5drfydokwnqJ5qmlb
	Y2M+BhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKcO-0065ka-Ni; Wed, 03 Nov 2021 18:04:13 +0000
Received: from 7.mo561.mail-out.ovh.net ([46.105.57.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKcK-0065gQ-E8
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 18:04:10 +0000
Received: from player694.ha.ovh.net (unknown [10.108.16.32])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 8A3C723283
 for <linux-mtd@lists.infradead.org>; Wed,  3 Nov 2021 18:04:00 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id B171E23D29938;
 Wed,  3 Nov 2021 18:03:46 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 03 Nov 2021 19:03:46 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: support "no-wp" DT property
In-Reply-To: <c59157a1-2c15-928f-f5a7-fab7128e8dd2@gmail.com>
References: <20211103151117.18690-1-zajec5@gmail.com>
 <20211103151117.18690-2-zajec5@gmail.com>
 <c59157a1-2c15-928f-f5a7-fab7128e8dd2@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f4694a87a459ac19fea451294fda45ef@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 14920144091594271578
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeffudffgfejgfdvieegudekffefveehjeeuieekheduieduhedvieefudetheeinecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_110408_831400_476CC2C6 
X-CRM114-Status: GOOD (  16.28  )
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

T24gMjAyMS0xMS0wMyAxODo1MCwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiBPbiAxMS8zLzIx
IDg6MTEgQU0sIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gRnJvbTogUmFmYcWCIE1pxYJlY2tp
IDxyYWZhbEBtaWxlY2tpLnBsPgo+PiAKPj4gU29tZSBib2FyZHMgbWF5IHVzZSBXUC1jYXBhYmxl
IGNvbnRyb2xsZXIgYnV0IHN0aWxsIGhhdmUgV1Agbm90Cj4+IGNvbm5lY3RlZC4gVGhpcyBjaGFu
Z2UgZml4ZXM6Cj4+IFsgICAgMS4xNzU1NTBdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFuZDog
dGltZW91dCBvbiBzdGF0dXMgcG9sbCAKPj4gKGV4cGVjdGVkIGMwMDAwMDQwIGdvdCBjMDAwMDBj
MCkKPj4gWyAgICAxLjE4NDUyNF0gYmNtNjMxMzhfbmFuZCBmZjgwMTgwMC5uYW5kOiBuYW5kICNX
UCBleHBlY3RlZCBvbgo+PiBbICAgIDEuMjg1NTQ3XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5h
bmQ6IHRpbWVvdXQgb24gc3RhdHVzIHBvbGwgCj4+IChleHBlY3RlZCBjMDAwMDA0MCBnb3QgYzAw
MDAwYzApCj4+IFsgICAgMS4yOTQ1MTZdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFuZDogbmFu
ZCAjV1AgZXhwZWN0ZWQgb24KPj4gWyAgICAxLjM5NTU0OF0gYmNtNjMxMzhfbmFuZCBmZjgwMTgw
MC5uYW5kOiB0aW1lb3V0IG9uIHN0YXR1cyBwb2xsIAo+PiAoZXhwZWN0ZWQgYzAwMDAwNDAgZ290
IGMwMDAwMGMwKQo+PiBbICAgIDEuNDA0NTE3XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5hbmQ6
IG5hbmQgI1dQIGV4cGVjdGVkIG9uCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyB8IDMgKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYyAKPj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jCj4+IGluZGV4IGY3NTkyOTc4M2I5NC4uOGI2MTY3NDU3ZjBjIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPj4gQEAgLTcxNCw3ICs3
MTQsOCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JldmlzaW9uX2luaXQoc3RydWN0IAo+PiBicmNt
bmFuZF9jb250cm9sbGVyICpjdHJsKQo+PiAgCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgw
NTAwKQo+PiAgCQljdHJsLT5mZWF0dXJlcyB8PSBCUkNNTkFORF9IQVNfMUtfU0VDVE9SUzsKPj4g
Cj4+IC0JaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA3MDApCj4+ICsJaWYgKGN0cmwtPm5h
bmRfdmVyc2lvbiA+PSAweDA3MDAgJiYKPj4gKwkgICAgIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChj
dHJsLT5kZXYtPm9mX25vZGUsICJuby13cCIpKQo+PiAgCQljdHJsLT5mZWF0dXJlcyB8PSBCUkNN
TkFORF9IQVNfV1A7Cj4gCj4gU2hvdWxkIG5vdCB0aGlzIGJlIGEgbG9naWNhbCBPUiBoZXJlIG9y
IHJhdGhlciwgc2hvdWxkIGl0IGJlIG1vdmVkIG91dAo+IG9mIHRoZSBjaGVjayBvbiBjdHJsLT5u
YW5kX3ZlcnNpb24gZW50aXJlbHk/IFdoYXQgcmV2aXNpb24gb2YgdGhlIE5BTkQKPiBjb250cm9s
bGVyIGRvIHlvdSBoYXZlIG9uIHRoYXQgY2hpcD8KCkl0J3MgTkFORCBjb250cm9sbGVyIHZlcnNp
b24gMHgwNzAxICh2Ny4xKSBhbmQgSSB0aGluayBpdCdzIGNvcnJlY3QuCgpJIHRoaW5rIHdlIHdh
bnQgV1AgZW5hYmxlZCBvbiByZXYgNy4wKyB1bmxlc3MgaXQgd2FzIGV4cGxpY2l0bHkgCmRpc2Fi
bGVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
