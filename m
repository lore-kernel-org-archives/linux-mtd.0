Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD806C3601E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ShEd9RVb0GhBW+DLqNEPumThmIRy+2RlMqKt/xzhWM4=; b=0WvfTI6JK1pNr+
	6OdkJZmRQwufV5imng/2pvM1VUoDKbQ8ETOGhKh4gS4rPEwBKydiMqwQDJpeSOEYzxDuFH0/hj626
	xiiK9+ycA1fHfPFdZW4eLyH++mZl3WOH0OiijFj5cwp7HqmSzLwF5+1zp4OHikwvZcM+SbdcXzn1l
	vdsdZib/kobkILM2aSvbBRGYlBATFPUJyE1paOWyjsYnN94jlbwiPdwdtj0Cq1+xcPVDbxg9bcPbh
	uJIkzoX48Hp/YSZ/sZEt7aCs4U9twzxR3A7+iMOHrC83gn+PIkThn0T+D5m/VqzDIrSWSltY/RMBs
	qJmN25abPRLZJl4vfJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mx5-00000009gEh-1rpc;
	Thu, 10 Apr 2025 08:07:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mVo-00000009bMX-31TJ
	for linux-mtd@bombadil.infradead.org;
	Thu, 10 Apr 2025 07:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=utDOyqXBu3ziLqOWFxiPJPgqXBLbtynYSgp1ekWV2HE=; b=ff/VbzTYdJbLlXYdxy7IqSk9np
	S/OLFzcjLo8ZxYZ/ArJ3rpeS1CyqtLYviNHyZglkjroZUPE90IreWpXjg/NKO0HLJ+9OQS80Nqq3w
	PtIzBtOj1/nNYGWhh+Y6wit9lCSo7WFhewPO6JChIx6RvGAqMJcTChyEbXLPP71E+tdv3hOjF5SIQ
	hfCLXjcR3QK9/OG1wrvJga7HccOmpqVF0+jz4lrewuR3o1ZToqv8T2mP5++OLdZlckfVJXDkJnHCo
	MTZBXBFk4hwuMjcOX7FzsRQJQCgkYr9Dq6kv8qwNbSArh6j3AC6ZWvwb8dH3nb/DiclWBu7Fdukv6
	5Z0k6BcQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2mVl-00000008lvg-0mKT
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 07:39:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C102C44446;
	Thu, 10 Apr 2025 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744270781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=utDOyqXBu3ziLqOWFxiPJPgqXBLbtynYSgp1ekWV2HE=;
	b=Tlb2TjN2F3YsUCo38VSfNpCpuJLIAmdB934tMW3OeoLMaA7PEtZNy+XEMCPra9t8nWLT59
	RKB25ywPT1b8KImoYheB72ZzLdnqEVCpp1TLTePAzq0EHb3mlIP0lvaPiepXgAl8Roq0ia
	f2l7fv0oSlZYu1beC6FielkS1b5tZLBriet8+y43xqxKS8lzaeE71MG1stMFgnxFsmsln/
	ZEScfQBy8hGmAsKeHNbxfpWIXfUlZGwkDBqzCrSJRxIvwwd3ILtXmtbfusHL5wraCOZ/UI
	yt1KpFuE5l4Bstw1CKvFWzGsY+WMbvqbNeljU++SQOCKXb851+CNPs4p39GkRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.15-rc2
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 10 Apr 2025 09:39:39 +0200
Message-ID: <87h62wcvno.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejheegjefhtefgtddvfeevieetjeevleeffeegvdeifedvfeelkeeugeehleekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggstdelmeektdegheemugdulegrmeejgedufhemleefrggumegttgeiheemjeeijeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemkedtgeehmeguudelrgemjeegudhfmeelfegrugemtggtieehmeejieejledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvfhuughorhdrtehmsggrrhhushesl
 hhinhgrrhhordhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehfrhhivgguvghrrdhstghhrhgvmhhpfheskhhonhhtrhhonhdruggvpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_083945_383055_FD2C13C5 
X-CRM114-Status: UNSURE (   7.19  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciA2LjE1LXJjMi4KClRoYW5rcywKTWlx
dcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwYWYyZjZiZTFiNDI4MTM4
NWI2MThjYjg2YWQ5NDZlZGVkMDg5YWM4OgoKICBMaW51eCA2LjE1LXJjMSAoMjAyNS0wNC0wNiAx
MzoxMTozMyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4
LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNi4xNS1yYzIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byAxYzFmZDM3NGEyZmU3MmI4YTZkZGU2MmQzYzNhOWZkMTUzZTc1ODFjOgoKICBtdGQ6
IHNwaW5hbmQ6IEZpeCBidWlsZCB3aXRoIGdjYyA8IDcuNSAoMjAyNS0wNC0wNyAwOTowNTozMSAr
MDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KVHdvIGltcG9ydGFudCBmaXhlczogdGhlIGJ1aWxkIG9mIHRoZSBTUEkg
TkFORCBsYXllciB3aXRoIG9sZCBHQ0MKdmVyc2lvbnMgYXMgd2VsbCBhcyB0aGUgZml4IG9mIHRo
ZSBRcGljIE1ha2VmaWxlIHdoaWNoIHdhcyB3cm9uZyBpbiB0aGUKZmlyc3QgcGxhY2UuCgpUaGVy
ZSBhcmUgYWxzbyB0d28gc21hbGxlciBmaXhlcyBhYm91dCBhIG1pc3NpbmcgZXJyb3IgYW5kIHN0
YXR1cyBjaGVjay4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KR2VlcnQgVXl0dGVyaG9ldmVuICgxKToKICAgICAgbXRkOiBu
YW5kOiBEcm9wIGV4cGxpY2l0IHRlc3QgZm9yIGJ1aWx0LWluIENPTkZJR19TUElfUVBJQ19TTkFO
RAoKTWlxdWVsIFJheW5hbCAoMSk6CiAgICAgIG10ZDogc3BpbmFuZDogRml4IGJ1aWxkIHdpdGgg
Z2NjIDwgNy41CgpXZW50YW8gTGlhbmcgKDIpOgogICAgICBtdGQ6IGluZnRsY29yZTogQWRkIGVy
cm9yIGNoZWNrIGZvciBpbmZ0bF9yZWFkX29vYigpCiAgICAgIG10ZDogcmF3bmFuZDogQWRkIHN0
YXR1cyBjaGFjayBpbiByODUyX3JlYWR5KCkKCiBkcml2ZXJzL210ZC9pbmZ0bGNvcmUuYyAgICAg
fCA5ICsrKysrLS0tLQogZHJpdmVycy9tdGQvbmFuZC9NYWtlZmlsZSAgIHwgMyAtLS0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L3I4NTIuYyB8IDMgKysrCiBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5k
LmggfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
