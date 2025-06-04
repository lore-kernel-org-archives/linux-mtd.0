Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C772C5B543
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZ32JczTTtbb0wK/Q1pRipsxom7ABDUiIlzAO4u7GWw=; b=l2jhT2VdpZmKCV
	LDtI8VPfBOpp9S9BXJEIjvOiqQ7bmNusq8RUqpwwhyK+Ffh5SVQd/GtdxY8Vqzf5adP2EhG6GiZXS
	WeexdyBObMIIuvL5y8oRg5XmAYB+Hlw0rCVSakhQdXFUODlnGLILAaO5fzNZdB2lD1tH1bWEIC5lD
	q0U1cRi/mqWnN61FHuQln0EAhkdRqMnn88ryuBVyPy/zweig87e7OwfO8cX/P7/GM6YFnVe/QNBim
	r6ppDVG08gugftMBaRVZh9ypazcZc4tKne5JhseGgrEyGgBhNjoSrGIil9I6GOZC5e+B0+xtcuA7w
	XNJ2KkpG90iwpOJj9NkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjk1-0000000Cvke-0Rw4;
	Wed, 04 Jun 2025 08:44:57 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjNk-0000000Cswy-2zl2
	for linux-mtd@lists.infradead.org;
	Wed, 04 Jun 2025 08:21:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 132B741DF4;
	Wed,  4 Jun 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749025312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARK4ijAucPeE4qCV1xVX4pQHEcXz2x/7N4iFgPfnZ0M=;
	b=RJ8zO+l82jyuNiy2HFZ7/KyFcElAhMahVKs7JPWxjfv0P8EoptkLA+RBG7PwDYmBxNJJ3t
	mCUQ4x6/k1fI9mrIh9b+pujdCMlqpvSbNL06qzvDw7Q92ISgbKWIbK0HtLFCs29SrWMWHH
	duJPQWtQZ5FsY92KUbQ7UIF5IddFhxCLF7J++jLIuHezzZ+LBZH/1/zUSBY/9WtgtijB2x
	lkXR0HW4wUxOQrVSuXBaKSX4bIC1Oa8RrfZln5NG738CMANzzrxbfKt9FWUGaDaoebFLy4
	58M90GxOxQGNNsDiPzt/YkqetPwlbvQwRcsfVX6guYPnXl7LqFeEsYF6to8kkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <robh@kernel.org>,
  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <git@amd.com>,
  <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v13 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <20250603194209.1341374-4-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Wed, 4 Jun 2025 01:12:09 +0530")
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
	<20250603194209.1341374-4-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Jun 2025 10:21:50 +0200
Message-ID: <87sekfkjc1.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_012157_526020_DFA6B7C7 
X-CRM114-Status: GOOD (  15.82  )
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

SGkgQW1pdCwKCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvY29uY2F0LmgKPiArKysgYi9pbmNs
dWRlL2xpbnV4L210ZC9jb25jYXQuaAo+IEBAIC0yOCw1ICsyOCwzNyBAQCBzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZF9jb25jYXRfY3JlYXRlKAo+ICAKPiAgdm9pZCBtdGRfY29uY2F0X2Rlc3Ryb3koc3Ry
dWN0IG10ZF9pbmZvICptdGQpOwo+ICAKPiArLyoqCj4gKyAqIG10ZF92aXJ0X2NvbmNhdF9ub2Rl
X2NyZWF0ZSAtIENyZWF0ZSBhIGNvbXBvbmVudCBmb3IgY29uY2F0ZW5hdGlvbgo+ICsgKgo+ICsg
KiBSZXR1cm5zIGEgcG9zaXRpdmUgbnVtYmVyIHJlcHJlc2VudGluZyB0aGUgbm8uIG9mIGRldmlj
ZXMgZm91bmQgZm9yCj4gKyAqIGNvbmNhdGVuYXRpb24sIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29k
ZS4KPiArICoKPiArICogTGlzdCBhbGwgdGhlIGRldmljZXMgZm9yIGNvbmNhdGVuYXRpb25zIGZv
dW5kIGluIERUIGFuZCBjcmVhdGUgYQo+ICsgKiBjb21wb25lbnQgZm9yIGNvbmNhdGVuYXRpb24u
Cj4gKyAqLwo+ICtpbnQgbXRkX3ZpcnRfY29uY2F0X25vZGVfY3JlYXRlKHZvaWQpOwo+ICsKPiAr
LyoqCj4gKyAqIG10ZF92aXJ0X2NvbmNhdF9hZGQgLSBhZGQgbXRkX2luZm8gb2JqZWN0IHRvIHRo
ZSBsaXN0IG9mIHN1YmRldmljZXMgZm9yIGNvbmNhdGVuYXRpb24KPiArICogQG10ZDogcG9pbnRl
ciB0byBuZXcgTVREIGRldmljZSBpbmZvIHN0cnVjdHVyZQo+ICsgKgo+ICsgKiBSZXR1cm5zIHRy
dWUgaWYgdGhlIG10ZF9pbmZvIG9iamVjdCBpcyBhZGRlZCBzdWNjZXNzZnVsbHkgZWxzZSByZXR1
cm5zIGZhbHNlLgo+ICsgKgo+ICsgKiBUaGUgbXRkX2luZm8gb2JqZWN0IGlzIGFkZGVkIHRvIHRo
ZSBsaXN0IG9mIHN1YmRldmljZXMgZm9yIGNvbmNhdGVuYXRpb24uCj4gKyAqIEl0IHJldHVybnMg
dHJ1ZSBpZiBhIG1hdGNoIGlzIGZvdW5kLCBhbmQgZmFsc2UgaWYgYWxsIHN1YmRldmljZXMgaGF2
ZQo+ICsgKiBhbHJlYWR5IGJlZW4gYWRkZWQgb3IgaWYgdGhlIG10ZF9pbmZvIG9iamVjdCBkb2Vz
IG5vdCBtYXRjaCBhbnkgb2YgdGhlCj4gKyAqIGludGVuZGVkIE1URCBkZXZpY2VzLgo+ICsgKi8K
PiArYm9vbCBtdGRfdmlydF9jb25jYXRfYWRkKHN0cnVjdCBtdGRfaW5mbyAqbXRkKTsKPiArCj4g
Ky8qKgo+ICsgKiBtdGRfdmlydF9jb25jYXRfY3JlYXRlX2pvaW4gLSBDcmVhdGUgYW5kIHJlZ2lz
dGVyIHRoZSBjb25jYXRlbmF0ZWQgTVREIGRldmljZQo+ICsgKgo+ICsgKiBSZXR1cm5zIG9uIHN1
Y2Nlcywgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlLgo+ICsgKgo+ICsgKiBDcmVhdGVzIGFuZCBy
ZWdpc3RlcnMgdGhlIGNvbmNhdGVuYXRlZCBNVEQgZGV2aWNlCj4gKyAqLwo+ICtpbnQgbXRkX3Zp
cnRfY29uY2F0X2NyZWF0ZV9qb2luKHZvaWQpOwo+ICAjZW5kaWYKCkRvbid0IHdlIG1pc3Mgc29t
ZSBkZXN0cnVjdG9ycz8gSXQgc2VlbXMgdGhhdCByZW1vdmluZyB0aGUgbXRkIGRldmljZSBvcgp0
aGUgY29uY2F0IG1vZHVsZSBtaWdodCBsZWFkIHRvIGFuIHVuc3RhYmxlIHN0YXRlLiBDYW4geW91
IHBsZWFzZSB0ZXN0CnRoZXNlIHR3byBzaXR1YXRpb25zPwoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
