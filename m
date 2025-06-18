Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F0FC7115C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0ZLLhcX6uwtEco2ElnXUNVtbpqstnyMoHXsi3eBnDI=; b=vU7/XxY8cOTL0o
	60qYbWtDtka3FCxQiGkMhFZLUdM+OmzNpAG+PBkISOQSAa5Tpv90A7G4HuL853Cgd8GO4HsqrnFy9
	Xp0dUcvlBnLHhZV3f6WtDUukU3r1qYQos1Km8BT9g+clViMZ+FI5xxEJRfIdG5A/ycYZ3IPsoogrJ
	640BP2vJ+8M5TzEwCHNPWZxZjrZyH4b5nlQHWq/EYDrsy6WHoXYdhB5FVHJSsWqGmmcs/fYLNjB5+
	xLtrCI+4+TlEqxfKDeiCD9fz7NTI2/TQkY76d5SIoSe51R6lLrH/qc++TADs/kZpt0JYJ9Iix/t5M
	sroFKH5nnhhHMVCxMLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouQ-00000009VvG-1i7N;
	Wed, 18 Jun 2025 09:16:42 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoo5-00000009V3W-28Bf
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 09:10:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 689344433E;
	Wed, 18 Jun 2025 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750237805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgQOfMbFxztDP2nlWlJ15tAY4uV13x4KJbbJIFc48SU=;
	b=QyEeUZQOtYGtZZ7s+/jjwU1bR7RxoA9AwwimvYYVWW+k0CnoW6oFWXlxhT/FOcaainQtzI
	Uv0CnM0wjkAVvkgOrImN14fwu0tTqFAOT/NmRh/SYRi42vM4LE3e0mTsWWhF5XAjzGiUrb
	MpMwQ3KebB008hebpkhFnPsdNHaDQg1jGeXypimmVHHu+Mk6Zs2sBpolExjkYVOqOWQ1Cn
	fMQ76ctBG+Pd6Ea/o7oNtEVb2+sAtFTRaEIYtb2S62BzsZkgMXgRcNFVEPqgV/9zFkytRK
	MgrkEVg6DExjOXYkuvLvbhdbN1Wh74nbYEnV+UGo91Rg9Ur5Dv3xYFDyMkmQAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: fix memory leak of ECC engine conf
In-Reply-To: <e56ab56f-9ceb-4c95-a134-ad7186951b34@freebox.fr> (Pablo
	MARTIN-GOMEZ's message of "Mon, 9 Jun 2025 20:02:08 +0200")
References: <e56ab56f-9ceb-4c95-a134-ad7186951b34@freebox.fr>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Jun 2025 11:10:05 +0200
Message-ID: <878qlpmn4i.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepphhmrghrthhinhdqghhomhgviiesfhhrvggvsghogidrfhhrpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_021009_693154_1C36D929 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGFibG8sCgpPbiAwOS8wNi8yMDI1IGF0IDIwOjAyOjA4ICswMiwgUGFibG8gTUFSVElOLUdP
TUVaIDxwbWFydGluLWdvbWV6QGZyZWVib3guZnI+IHdyb3RlOgoKPiBNZW1vcnkgYWxsb2NhdGVk
IGZvciB0aGUgRUNDIGVuZ2luZSBjb25mIGlzIG5vdCByZWxlYXNlZCBkdXJpbmcgc3BpbmFuZAo+
IGNsZWFudXAuIEJlbG93IGttZW1sZWFrIHRyYWNlIGlzIHNlZW4gZm9yIHRoaXMgbWVtb3J5IGxl
YWs6Cj4KPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZmZmODAwNjRmMDBlMCAoc2l6ZSA4KToK
PiDCoCBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmllcyA0Mjk0OTM3NDU4Cj4gwqAgaGV4
IGR1bXAgKGZpcnN0IDggYnl0ZXMpOgo+IMKgwqDCoCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4uLi4u
Cj4gwqAgYmFja3RyYWNlIChjcmMgMCk6Cj4gwqDCoMKgIGttZW1sZWFrX2FsbG9jKzB4MzAvMHg0
MAo+IMKgwqDCoCBfX2ttYWxsb2NfY2FjaGVfbm9wcm9mKzB4MjA4LzB4M2MwCj4gwqDCoMKgIHNw
aW5hbmRfb25kaWVfZWNjX2luaXRfY3R4KzB4MTE0LzB4MjAwCj4gwqDCoMKgIG5hbmRfZWNjX2lu
aXRfY3R4KzB4NzAvMHhhOAo+IMKgwqDCoCBuYW5kZGV2X2VjY19lbmdpbmVfaW5pdCsweGVjLzB4
MjdjCj4gwqDCoMKgIHNwaW5hbmRfcHJvYmUrMHhhMmMvMHgxNjIwCj4gwqDCoMKgIHNwaV9tZW1f
cHJvYmUrMHgxMzAvMHgyMWMKPiDCoMKgwqAgc3BpX3Byb2JlKzB4ZjAvMHgxNzAKPiDCoMKgwqAg
cmVhbGx5X3Byb2JlKzB4MTdjLzB4NmU4Cj4gwqDCoMKgIF9fZHJpdmVyX3Byb2JlX2RldmljZSsw
eDE3Yy8weDIxYwo+IMKgwqDCoCBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NTgvMHgxODAKPiDCoMKg
wqAgX19kZXZpY2VfYXR0YWNoX2RyaXZlcisweDE1Yy8weDFmOAo+IMKgwqDCoCBidXNfZm9yX2Vh
Y2hfZHJ2KzB4ZWMvMHgxNTAKPiDCoMKgwqAgX19kZXZpY2VfYXR0YWNoKzB4MTg4LzB4MjRjCj4g
wqDCoMKgIGRldmljZV9pbml0aWFsX3Byb2JlKzB4MTAvMHgyMAo+IMKgwqDCoCBidXNfcHJvYmVf
ZGV2aWNlKzB4MTFjLzB4MTYwCj4KPiBGaXggdGhlIGxlYWsgYnkgY2FsbGluZyBuYW5kZGV2X2Vj
Y19lbmdpbmVfY2xlYW51cCgpIGluc2lkZQo+IHNwaW5hbmRfY2xlYW51cCgpLgo+Cj4gU2lnbmVk
LW9mZi1ieTogUGFibG8gTWFydGluLUdvbWV6IDxwbWFydGluLWdvbWV6QGZyZWVib3guZnI+CgpU
aGlzIHBhdGNoIG5vIGxvbmdlciBhcHBsaWVzIG9uIHY2LjE2LXJjMSwgY2FuIHlvdSBwbGVhc2Ug
cmViYXNlIGFuZApyZXNlbmQgPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
