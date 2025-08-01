Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD65C87FCA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Aug 2025 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zn7K1Baq/s7mWv4X8lkS9AGmpZBNgCXrFQMrk5qzCCA=; b=T+HdyXtZ1ctC/I
	7k+x08xtxMQ5i1P7mDAFdM85Qp7HzUyyI7vx2qZ/JwuagEp7uItugMpZbnNHyui3/1OKIuyvh/HnA
	cojBCyxXUx9pG1w30CYrk7+IUVYI1nhkrZsZUYRGyXUm3ch52DoPnp3LVYYTNZZnuoaR+9UhWK4FB
	WXqO05RmXnDbJVz8prfwdYhDlBFBcFYziDGKawJJMDXiMugTB7VLET2FxSyXGjiTObaWliO3IDJnG
	ad/p6NK2yV70/vaJOb+Mk2VDJBYQUDFSaCbDj1s0C5ikba4JL8PRwwoQGlZjBf1yAmVmuJBrXpjcD
	jSaN/ki+UbT7UsARs3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrOt-00000006Jry-2GPS;
	Fri, 01 Aug 2025 15:10:27 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrGk-00000006IY2-0Pbs
	for linux-mtd@lists.infradead.org;
	Fri, 01 Aug 2025 15:02:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05FEB4313C;
	Fri,  1 Aug 2025 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754060518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHeQ+iNjCeeStCG+4u33K+6ZFUSjcu8esN2e6wzi/bs=;
	b=DsfMI65liwAPWXYXlAlEY3n+9o2pwz27UGoR/CDW03Ilq3W0kHlb/ridnt6MzFTlWgXRUn
	GYMu93UWTdYziRKSKdWnSPWH87xvA4KXdmRTOtKwgg039AaixBwA5c+o/+i+pJeY4VWbrJ
	5fwnpxnQ3ZPf/+q7QJ4etlVbWEObikaDQ16xj/1h02sokcghPPFaHuHS2RyZKlq0CJt9e8
	VBiBBQE/s7RA42A817JgYnR3SsZbRMQTXfRNRi5oiuGabL3TN2AWK7U7kg8FEbPPujL1PD
	J4YP+x5/aVVJyCB99+auYhajXJeHk6q+rJQgDrFc8McjZw1Mh+SMnpULPtRKsw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  Richard Weinberger
 <richard@nod.at>,  Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Michael Walle <michael@walle.cc>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: Changes for 6.17
In-Reply-To: <mafs0v7n7cd5a.fsf@kernel.org> (Pratyush Yadav's message of "Fri,
	01 Aug 2025 16:47:13 +0200")
References: <87o6t08fen.fsf@bootlin.com> <mafs0v7n7cd5a.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 01 Aug 2025 17:01:56 +0200
Message-ID: <87cy9f5bmj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvfhuughorhdrtehmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehfr
 hhivgguvghrrdhstghhrhgvmhhpfheskhhonhhtrhhonhdruggvpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_080202_623380_94C82A97 
X-CRM114-Status: GOOD (  12.92  )
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

SGVsbG8gUHJhdHl1c2gsCgo+PiAqIFNQSSBOT1IgY2hhbmdlczoKPj4KPj4gQSBub3RhYmxlIGNo
YW5nZXMgaXMgdGhlIGZpeCBmb3IgZXhpdGluZyA0LWJ5dGUgYWRkcmVzc2luZyBvbiBJbmZpbmVv
bgo+PiBTRU1QRVIgZmxhc2hlcy4gVGhlc2UgZmxhc2hlcyBkbyBub3Qgc3VwcG9ydCB0aGUgc3Rh
bmRhcmQgRVg0Qgo+PiBvcGNvZGUgKEU5aCksIGFuZCB1c2UgYSB2ZW5kb3Itc3BlY2lmaWMgb3Bj
b2RlIChCOGgpIGluc3RlYWQuCj4+Cj4+IFRoZXJlIGlzIGFsc28gYSBmaXggZm9yIHVubG9ja2lu
ZyBmbGFzaGVzIHRoYXQgYXJlIHdyaXRlLXByb3RlY3RlZCBhdAo+PiBwb3dlci1vbi4gVGhpcyB3
YXMgY2F1c2VkIGJ5IHVzaW5nIGFuIHVuaW5pdGlhbGl6ZWQgbXRkX2luZm8gaW4KPj4gc3BpX25v
cl90cnlfdW5sb2NrX2FsbCgpLgo+Cj4gSSBwZXJzb25hbGx5IHRoaW5rIGJ1bGxldCBwb2ludHMg
YXJlIGEgYml0IGVhc2llciB0byByZWFkIGZvciBjaGFuZ2Vsb2dzCj4gY29tcGFyZWQgdG8gcGFy
YWdyYXBocyBzaW5jZSB0aGVyZSBpcyBsZXNzIGZpbGxlciB0ZXh0IG5lZWRlZC4gRm9yCj4gZXhh
bXBsZSwgbXkgb3JpZ2luYWwgbWVyZ2UgbWVzc2FnZSBkaWRuJ3QgdGhlICJ0aGVyZSBpcyBhbHNv
IGEgZml4IGZvciIuCj4gSXQganVzdCBzYWlkICJGaXggdW5sb2NraW5nIG9mLi4uIi4KPgo+IEFu
eXdheSwgaWYgeW91IHN0aWxsIHByZWZlciBwYXJhZ3JhcGhzIHRoZW4gZG8gbGV0IG1lIGtub3cg
YW5kIEknbGwgdXNlCj4gdGhvc2UgbmV4dCB0aW1lIGFyb3VuZCBhbmQgc2F2ZSB5b3Ugc29tZSBl
ZGl0aW5nLgoKU29tZSB0aW1lIGFnbyBMaW51cyBhc2tlZCBtZSB0byBjaGFuZ2UgdGhlIGNvbnRl
bnQgb2YgdGhlIFBSIGRlc2NyaXB0aW9uCihJIHdhcyBtb3N0bHkgbGlzdGluZyB0aGUgcGF0Y2hl
cykgYW5kIHBvaW50ZWQgdG8gZXhhbXBsZXMgd2hpY2ggd2VyZQptb3N0bHkgcGxhaW4gRW5nbGlz
aCwgbm90IGJ1bGxldCBwb2ludHMuIFNvIEkgY2hhbmdlZCBib3RoIHRoZSBjb250ZW50CihoaW50
aW5nIHdoYXQgYXJlIHRoZSBtYWpvciBjaGFuZ2VzIGFuZCByb3VnaGx5IGRlc2NyaWJpbmcgdGhl
IHNtYWxsCm9uZXMpIGFuZCB0aGUgZm9ybSAobm8gYnVsbGV0IHBvaW50cykuIEkndmUga2VwdCBz
cGxpdHRpbmcgdGhlCnN1YnN5c3RlbXMgd2l0aCAnKicgdGhvdWdoLCBhcyB0aGUgY2hhbmdlcyBp
biBlYWNoIHN1YnN5c3RlbSBhcmUKbW9zdGx5IHVucmVsYXRlZC4KCkknbSBmaW5lIGVpdGhlciB3
YXlzLCBidXQgSSBhc3N1bWVkIHVudGlsIG5vdyB0aGF0IHRoZSBwcmVmZXJyZWQgZm9ybQp3YXMg
cGxhaW4gdGV4dCBkZXNjcmlwdGlvbnMuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
