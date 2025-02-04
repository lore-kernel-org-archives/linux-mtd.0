Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDF3C0218F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sy7CB3EfcsF+sAhRxN2kRHe/tjKgHHh6++e8rg/21pA=; b=G22uUaM9zyMT1Q
	XDc9ZZqxWE1ZJBQYfMgK9pwTYYrgOavXhK8pijKWXNWYecYgtEVf41/4FOKXDTdS6kmvtN0A4FaWK
	Vpfyj7BZ2hFbjzvbSSmSH/F5O7ziPPWB9Z2jDDBRY0U7ImTm7HHYsEq0nbJ5PV7lkM22xlCCW803y
	9yaJODS6NzZutHocN6x+l1QMHmr0+Ze/+0foxRVzkvJXirkl5HHciX5+ikHWuK/CYgykot4owYLWE
	6zS1Qmn6CKO7pxFKVAG/Zw0yrqsAQTTznitzmzFWNZdK011rNjrKETPwXOwP39I0TeAoepyo/n5Ra
	0b1zrsjt+sbWKjtv6kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfF3U-000000000o0-0ADn;
	Tue, 04 Feb 2025 09:17:16 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfF3Q-000000000lt-2wjZ
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 09:17:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C70A433EE;
	Tue,  4 Feb 2025 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738660628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Pf++fNZ1y9QMLFR6ETO34MAg1FfYx4Pu5f8G7fuOM=;
	b=JmN3oXNDLKbEPH2wPN7l6KyhmKxUJUkMe0agLNer0Od+ffjgyCjaBAQ5InH4bCM6hFNWFT
	dVJdrad0rCVH53cEkcfrJGcNHAFYM5OKRAzhtrCaegXPMUS2Clq+d2rl5vedUhj9cVzOPz
	oBY3CMu0sx00S5iZiaLW47YyDfKCGnr4iRBsaSM/hwS0LtMB95uTOUWCY7/oEyEtV1brgs
	z8vukh291L6GcDbg7vn+LdU3LYLIhNApEcwTgEETh2mguj0QIPlbp1t/L1gzDVkSb+R/k7
	dgUbsHm4FM4zekKsshDTKf2oQqRl5sB6kIbNU8B2FvMyojalRtHOTd1tTf87WA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: christophe.jaillet@wanadoo.fr,  gmpy.liaowx@gmail.com,  kees@kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  richard@nod.at,  vigneshr@ti.com,  stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: Add check and kfree() for kcalloc()
In-Reply-To: <20250204023323.14213-1-jiashengjiangcool@gmail.com> (Jiasheng
	Jiang's message of "Tue, 4 Feb 2025 02:33:23 +0000")
References: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
	<20250204023323.14213-1-jiashengjiangcool@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 10:17:07 +0100
Message-ID: <87wme683xo.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepjhhirghshhgvnhhgjhhirghnghgtohholhesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrjhgrihhllhgvthesfigrnhgrughoohdrfhhrpdhrtghpthhtohepghhmphihrdhlihgrohifgiesghhmrghilhdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_011713_036970_6D677B52 
X-CRM114-Status: UNSURE (   7.85  )
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

SGVsbG8sCgo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbXRkcHN0b3JlLmMKPiBAQCAtNDE4LDEwICs0MTgsMTcgQEAgc3RhdGljIHZvaWQgbXRkcHN0
b3JlX25vdGlmeV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAo+ICAJbG9uZ2NudCA9IEJJ
VFNfVE9fTE9OR1MoZGl2X3U2NChtdGQtPnNpemUsIGluZm8tPmttc2dfc2l6ZSkpOwo+ICAJY3h0
LT5ybW1hcCA9IGtjYWxsb2MobG9uZ2NudCwgc2l6ZW9mKGxvbmcpLCBHRlBfS0VSTkVMKTsKPiAr
CWlmICghY3h0LT5ybW1hcCkKPiArCQlnb3RvIGVuZDsKCldlIHByZWZlciB0byByZXR1cm4gaW1t
ZWRpYXRlbHkgaW4gdGhpcyBjYXNlLgoKQWxzbywgYW55IHJlYXNvbnMgbm90IHRvIHVzZSBkZXZt
X2tjYWxsb2MoKT8gVGhpcyB3b3VsZCBiZSB0aGUgY29ycmVjdAphcHByb2FjaCBhcyBvZiB0b2Rh
eSBhcyBsb25nIGFzIHRoZSBsaWZldGltZSBvZiB0aGUgZGV2aWNlIGlzIGtub3duLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
