Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8000FC28B28
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJ41fqYkCJYqD9Gog6GpXAS4M76LrH3KC91NeikEPHE=; b=xUx4pu+9PUZm1o
	NSQLVIZWpXAdN/0r9HqflpBrM9QVi/YbhRyNxQCC+pyMx6ubTD6iKtxKCxGt32U3spGtCXOtxlO0R
	YhU0u4Rk9NmLaT+Tpv5X0IJEIne0xKTPHmVQU66otljF3SHsSqNtR0Gd2drBDJ9m8nnDoTJYpt2wt
	Gd8iMzxt8OTFmE6BvkHLSn4iSJumwaRs4otAowQ3U7wjeU3U5+WiS+SpEhZh4Zt2vJYGXNZzAr/hv
	yM7qp1O3yQYJDVo0/B2iyKF6JVW9Q06jxNKG2vTrk94MkGA6Z3ajlL++T1+W3oB2Bai8Utfhd122c
	qhFXEvF0GtRGPA0SA8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZwz-00000006YrO-3iuL;
	Tue, 18 Mar 2025 16:37:57 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZjE-00000006W8I-1FQk
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 16:23:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5238A442BF;
	Tue, 18 Mar 2025 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742315021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p45NB3sSky+nUbHHIqs/ofey6rSOVyyWpJL2ZVNm1Lc=;
	b=ThcD7NNCKtA7FsmcGaUbM7hY6Y3as25mezPe2v/LIp3PRbAgP+VFdhxD1XFMokygS9bXM+
	fMU7FOJ3YRf66UXJxeeJS2edC7PCxsHjiisRvTl9/DlZldkKBaG5rUU8q9lubvLIxQ8M3I
	vs1gD90DOwIBEGjbIGCC1V1pMzWrpuTQMbRLFX8NnUDp5JGjOMXzBdxAJ+3nYptGZDDE38
	zHf3RlV6Nl/LDpYylQYWGxP91mk7Xi3DXashjwMSnh2bqUR4bugO40u0uzdThol9u2yczS
	kzvmXGFqZUhydpCdP/k8IUOa5+/o49kmUQU7CaJkSQM5HdrIOPuUQwNfEM+2lQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix a kdoc comment
In-Reply-To: <174231458436.979692.11846172650554767394.b4-ty@bootlin.com>
	(Miquel Raynal's message of "Tue, 18 Mar 2025 17:17:09 +0100")
References: <20250305194955.2508652-1-miquel.raynal@bootlin.com>
	<174231458436.979692.11846172650554767394.b4-ty@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 17:23:37 +0100
Message-ID: <87y0x25muu.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhts
 hdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092344_479797_8E07D719 
X-CRM114-Status: UNSURE (   6.02  )
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

T24gMTgvMDMvMjAyNSBhdCAxNzoxNzowOSArMDEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIDA1IE1hciAyMDI1IDIwOjQ5OjU1ICsw
MTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBUaGUgbWF4X2JhZF9lcmFzZWJsb2Nrc19wZXJf
bHVuIG1lbWJlciBvZiBuYW5kX2RldmljZSBvYnZpb3VzbHkKPj4gZGVzY3JpYmVzIGEgbnVtYmVy
IG9mICptYXhpbXVtKiBudW1iZXIgb2YgYmFkIGVyYXNlYmxvY2tzIHBlciBMVU4uCj4+IAo+PiBG
aXggdGhpcyBvYnZpb3VzIHR5cG8uCj4+IAo+PiAKPgo+IEFwcGxpZWQgdG8gbmFuZC9uZXh0IGFm
dGVyIGZpeGluZyB0aGUgQ2Mgc3RhYmxlIGxpbmUgYXMgYWR2aXNlZCBieQo+IFR1cm9kLCB0aGFu
a3MhCgpUdWRvciosIHNvcnJ5IGZvciB0aGUgdHlwbyAoOgoKPgo+IFsxLzFdIG10ZDogbmFuZDog
Rml4IGEga2RvYyBjb21tZW50Cj4gICAgICAgY29tbWl0OiBjYThjYmJiMmJlOGY5MDZkOTYwMmE2
ZTQzMjRmOGFkZjI3OWU5Y2MyCj4KPiBLaW5kIHJlZ2FyZHMsCj4gTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
