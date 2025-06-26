Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33CEC77B7F
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jun 2025 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcoLrBeAtGVhXW5LCHs8G1JV8LwBSUGgct7Up/xg6qM=; b=xJfLiWBESoRyFV
	Q+aetMw9fKsJqCrBXW/uUXsgc1eLskclobKt4Jl7hUp3/MJ70B2u74d97Cq1jAF+yZjjZgfpocwlp
	WcdFNMKF2taKbQfM1jrgqMPw88z+LQ0nzhp/KcP1tZ0T7I5EhbOM069Tp1arTkSj0HYJy2RAvxKVc
	HgSSM1l+zbRzidX0U/fl7EcKOMvgxfrSgrmr5l984pNejPWDlOHXBomcHSdZQJK+j9ZbUUQcQSeW8
	ZA6QeaDhLAOfDLstagcNt7BqOqQRQFi1PZL9z75DAWLvN2mHI5HO2T2hiqFzSFrEJErONix3CLBeF
	jycyvou6wzKTuBCIIt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUgzk-0000000Anr9-1Dwf;
	Thu, 26 Jun 2025 07:26:04 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUgzf-0000000Anqh-0avu
	for linux-mtd@lists.infradead.org;
	Thu, 26 Jun 2025 07:26:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6541044A0C;
	Thu, 26 Jun 2025 07:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750922755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cP+LS+JT48xAm+OMUAjyBYcTGTWWmH6uA1TAjVp0oik=;
	b=Tf9KD+6HR5QRq1KpbRFlU6OXd/2oZFt2nMpY3dRF2jQlBntgE/uXldQe4ASkyQuEFeGFpU
	x54Kx+uyFahHqD3gLmlKtEeKISIFQ3cFUyziK87YXTImfrxfbju0VCXhTsvDnQf8BdN7O8
	G+zSkknpujMQcnwoCAGu3wP0+pY75y1JNixyG/vHrgLA+Xz2GjaglsXBYqN65JcNmkJ2IG
	CHr/pRPQ8jqPg5GqRIOY8ZPudj3lLBUSn3TIOdglIrwN8v5Vv1JujssPROvaReJZsZkxOD
	dkBbPLZ+LpAu3fgJ86CilDjP0TbjiVkr+5k4q4FmlPID1oN06B+OH98gZbKc7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gabor Juhos <j4g8y7@gmail.com>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Lakshmi Sowjanya D
 <quic_laksd@quicinc.com>
Subject: Re: [PATCH v3 0/2] spi: spi-qpic-snand: avoid memory corruption
In-Reply-To: <aFx7ix0uikB8dkm4@finisterre.sirena.org.uk> (Mark Brown's message
	of "Wed, 25 Jun 2025 23:43:23 +0100")
References: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
	<aFx7ix0uikB8dkm4@finisterre.sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 26 Jun 2025 09:25:53 +0200
Message-ID: <8734bnx8u6.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvhedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomhdprhgtphhtt
 hhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_002559_923209_ABB1C9A8 
X-CRM114-Status: GOOD (  11.59  )
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

SGkgTWFyaywKCk9uIDI1LzA2LzIwMjUgYXQgMjM6NDM6MjMgKzAxLCBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCAxMDoyMjo0
OFBNICswMjAwLCBHYWJvciBKdWhvcyB3cm90ZToKPj4gVGhlICdzcGktcXBpYy1uYW5kJyBkcml2
ZXIgbWF5IGNhdXNlIG1lbW9yeSBjb3JydXB0aW9uIHVuZGVyIHNvbWUKPj4gY2lyY3Vtc3RhbmNl
cy4gVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgY2hhbmdlcyB0aGUgZHJpdmVyIHRvCj4+
IGF2b2lkIHRoYXQsIHdoZXJlYXMgdGhlIHNlY29uZCBhZGRzIHNvbWUgc2FuaXR5IGNoZWNrcyB0
byB0aGUgY29tbW9uCj4+IFFQSUMgY29kZSBpbiBvcmRlciB0byBtYWtlIGRldGVjdGluZyBzdWNo
IGVycm9ycyBlYXNpZXIgaW4gdGhlIGZ1dHVyZS4KPj4gCj4+IFByZWZlcmFibHksIHRoZSB0d28g
cGF0Y2hlcyBzaG91bGQgZ28gYWxvbmcgaW4gdmlhIHRoZSBTUEkgdHJlZS4KPj4gSXQgaXMgbm90
IGEgc3RyaWN0IHJlcXVpcmVtZW50IHRob3VnaCwgaW4gdGhlIGNhc2UgdGhlIHNlY29uZCBwYXRj
aAo+PiBnZXRzIGluY2x1ZGVkIHNlcGFyYXRlbHkgdGhyb3VnaCB0aGUgTVREIHRyZWUgaXQgcmV2
ZWFscyB0aGUgYnVnCj4+IHdoaWNoIGlzIGZpeGVkIGluIHRoZSBmaXJzdCBwYXRjaC4KPgo+IE1p
cXVlbCwgYXJlIHlvdSBPSyB3aXRoIHRoaXMgcGxhbiBmb3IgbWVyZ2luZyB2aWEgdGhlIFNQSSB0
cmVlPwoKQWJzb2x1dGVseSwgbXkgQWNrIGlzIGFscmVhZHkgdGhlcmUsIHRoYW5rcyBmb3IgYXNr
aW5nLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
