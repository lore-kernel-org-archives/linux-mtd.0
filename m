Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26515C87FCA
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Aug 2025 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEmZ/45DVo8S/5IEpZ1DT0gZj2iB/ngYfbIgDoVZOCI=; b=oayqJzGzyVFS8r
	Nd5zMV+pFlJD6iMzFGGzyNnu/zp9QhwHbsk2monxe6eYaRSQ9ps0dpCtoRQ/ox8Mu5r0piVLDTQT1
	Ti46anE2aN70sZVVhhmeEc4OU4mqDb/LdJe5oan88IYlREng6SF1CQTeM0Do8FMPfWbSr+gDUkUao
	xsRNpNBuiDLKo4kX6QNRUiGUIZl2GxS0D3UgoN7urNSVBHyf/z6WaOMGA7/VhlCbahx8Gl/7W9rpG
	2YTp9rUtuCZf2xr1dxB24vp9SmIG39pWmHPgksZ3MvHlsMfdKhnJ2IYliuF3oba+huXcZW5nhtnOU
	jdK6Sx1P7R8tpSkhsKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYBE-0000000ET5E-0ppq;
	Wed, 06 Aug 2025 07:03:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY5N-0000000ES3j-2qPD
	for linux-mtd@lists.infradead.org;
	Wed, 06 Aug 2025 06:57:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E1D1443DA;
	Wed,  6 Aug 2025 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754463434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ztuv9Zl/QP1Ykqjs14qunqoxFKoTE2QwVzuw0OQI20w=;
	b=bTEsT08TkeiaIq96drOmkJ7sImQn4KK3dOcj8ShyXHIfwHc4Wusod2Jj36LQJDRYElj8UA
	mye6o7RNqHrs4Tyl0RHJzV8KshA/poEqfR2CALXd3vY8ZcIwNlSjWmFX/PV4FGICyIiuID
	LPVaWnYBBGWTfkrolK9VSef1yDC8p4fFE0kDY4CCocjWgWtpOiTUI9f7Q7Z4eAQQKh/hJK
	qxwfujUchf3HBner1wH3v7yyq1SCQ5DI0P9K5+d4DK+zeKvHLg3A3gIlhMSR/KRQO8ZOUD
	4R63fjJRkK193w0ncGJABjdR34qFoOmvKcHfbyPnDwbbKxi3TArVkjDpLs7rng==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: expose ooblayout information via sysfs
In-Reply-To: <20250719-mtd-ooblayout-sysfs-v1-1-e0d68d872e17@gmail.com> (Gabor
	Juhos's message of "Sat, 19 Jul 2025 14:06:48 +0200")
References: <20250719-mtd-ooblayout-sysfs-v1-1-e0d68d872e17@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 06 Aug 2025 08:57:11 +0200
Message-ID: <87tt2ley48.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_235718_690423_C65470E8 
X-CRM114-Status: UNSURE (   8.17  )
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

SGVsbG8gR2Fib3IsCgpPbiAxOS8wNy8yMDI1IGF0IDE0OjA2OjQ4ICswMiwgR2Fib3IgSnVob3Mg
PGo0Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBBZGQgdHdvIG5ldyBzeXNmcyBkZXZpY2UgYXR0
cmlidXRlcyB3aGljaCBhbGxvd3MgdG8gZGV0ZXJtaW5lIHRoZSBPT0IKPiBsYXlvdXQgdXNlZCBi
eSBhIGdpdmVuIE1URCBkZXZpY2UuIFRoaXMgY2FuIGJlIHVzZWZ1bCB0byB2ZXJpZnkgdGhlCj4g
Y3VycmVudCBsYXlvdXQgZHVyaW5nIGRyaXZlciBkZXZlbG9wbWVudCB3aXRob3V0IGFkZGluZyBl
eHRyYSBkZWJ1Zwo+IGNvZGUuIFRoZSBleHBvc2VkIGluZm9ybWF0aW9uIGFsc28gbWFrZXMgaXQg
ZWFzaWVyIHRvIGFuYWx5emUgTkFORAo+IGR1bXBzIHdpdGhvdXQgdGhlIG5lZWQgb2YgY3Jhdmxp
bmcgb3V0IHRoZSBsYXlvdXQgZnJvbSB0aGUgZHJpdmVyCj4gY29kZS4KCkkgd291bGQgcHJlZmVy
IGEgZGVidWdmcyBlbnRyeSwgYXMgdGhpcyBpcyBtb3N0bHkgZm9jdXNpbmcgb24KZGV2ZWxvcG1l
bnQgYW5kIGRlYnVnZ2luZyBwdXJwb3Nlcy4gc3lzZnMgaGFzIGEgc3RhYmxlIEFQSSwgd2hpY2gg
bWFrZXMKaXQgYSBsZXNzIHJlbGV2YW50IHBsYWNlIGluIHRoaXMgY2FzZS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
