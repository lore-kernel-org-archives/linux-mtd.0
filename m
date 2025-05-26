Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235D4C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXY96jl8qtsTEO7RW72F6G3m7ZGwKRZVhd/romTt/xQ=; b=hZGS1cA5gLU4Fb
	W00xBkeGfcrwukgvqaPhgzMJP3O8SLhah5JSEwpV8tSsgWQP35ZDvRPAaOTdkKiz17ROzi5upzgB2
	djAHR5/27zMFHdNMuCK8Kgid6A6nQsyJsLvJHT9DYpbY5gnDdwYEaeGHyqqhg2fW4EddgeJU0GrkE
	Xm3htjmMC0NwMlZz++javX8Q5/MUldbPLgAjSZxpsVFy7Jgh/UfecTBus4jqDRMClSklwY3BXlqkI
	WfnCW+/9RH2/LEora0h36vBh7rOeEYssiPM0UAryavYEe5oBXkUEj2P6BaO3SG4w48r+X4R+zHEre
	HCAPT2dqDLZNtBytMj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT0h-00000008Mmw-3Lpl;
	Mon, 26 May 2025 08:16:39 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSxs-00000008MJs-0Xb3
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 08:13:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49AB6432E9;
	Mon, 26 May 2025 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748247220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPkgd48Z0fU+G9rkmci+M6NLNIeowZJAaBi38kKpI/4=;
	b=GSXFkOTy/bPwBna80bRK3A7S6b3mQ+AVesQBtrPG37HgK95uhweCltEuc5zaZpIHH12Isz
	bTaikgUSgYB7xMY42Wo2O4BAU+Zu8xP0qMDfcc8h+LdRx+0GH6LbbzschM/rBy404ZyYAI
	U5ChMgTkEJS0H61LTNX6qGwf27MJDBLYmnBOzRN6BICHwvbZ1sHoLfxPGR472mtWBRrO8L
	16UqoF4kUa4LJGebsY0yfkXQereAoynP34DDGInSKFivas4mTF1B/Hr/O8xcuVx/SqF2TP
	xDFSa68fGAAneBXVz6uqRodG3rgs2DM0sbzUCXQx5vKDSpHa4b/UDa7AIYs2KA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] spi: spi-qpic-snand: avoid memory corruption
In-Reply-To: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
	(Gabor Juhos's message of "Sun, 25 May 2025 19:05:34 +0200")
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 10:13:39 +0200
Message-ID: <87r00b23ik.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedtudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgti
 hhntgdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_011344_309019_66C76E40 
X-CRM114-Status: UNSURE (   9.65  )
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

SGkgR2Fib3IsCgpPbiAyNS8wNS8yMDI1IGF0IDE5OjA1OjM0ICswMiwgR2Fib3IgSnVob3MgPGo0
Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgJ3NwaS1xcGljLW5hbmQnIGRyaXZlciBtYXkg
Y2F1c2UgbWVtb3J5IGNvcnJ1cHRpb24gdW5kZXIgc29tZQo+IGNpcmN1bXN0YW5jZXMuIFRoZSBm
aXJzdCBwYXRjaCBpbiB0aGUgc2VyaWVzIGNoYW5nZXMgdGhlIGRyaXZlciB0bwo+IGF2b2lkIHRo
YXQsIHdoZXJlYXMgdGhlIHNlY29uZCBhZGRzIHNvbWUgc2FuaXR5IGNoZWNrcyB0byB0aGUgY29t
bW9uCj4gUVBJQyBjb2RlIGluIG9yZGVyIHRvIG1ha2UgZGV0ZWN0aW5nIHN1Y2ggZXJyb3JzIGVh
c2llciBpbiB0aGUgZnV0dXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogR2Fib3IgSnVob3MgPGo0Zzh5
N0BnbWFpbC5jb20+Cj4gLS0tCj4gR2Fib3IgSnVob3MgKDIpOgo+ICAgICAgIHNwaTogc3BpLXFw
aWMtc25hbmQ6IHJlYWxsb2NhdGUgQkFNIHRyYW5zYWN0aW9ucwo+ICAgICAgIG10ZDogbmFuZDog
cXBpY19jb21tb246IHByZXZlbnQgb3V0IG9mIGJvdW5kcyBhY2Nlc3Mgb2YgQkFNCj4gYXJyYXlz
CgpBcmUgdGhlc2UgdHdvIHBhY2hlcyByZWxhdGVkIHNvbWVob3c/IE9yIGNhbiB3ZSBhcHBseSB0
aGVtIGluCnR3byBkaWZmZXJlbnQgdHJlZXM/IElmIHllcywgcGxlYXNlIHNlbmQgdGhlIHBhdGNo
ZXMgc2VwYXJhdGVseSwgd2hpY2gKZWFzZXMgb3VyIHdvcmsuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
