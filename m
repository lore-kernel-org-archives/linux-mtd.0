Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ECEC71157
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clc1PaPvp4TvJBeLJZkYoN8hr9IV5yhiSp8xg/jrEvY=; b=Wqp60aUHwZBISa
	Rx0H0MuFVRSstlAZF+dx4+CkuUYf2jZYteSHumdLqY7hUdmODXBJwqA4gwVjVu/u5mCTGp4TrVMRs
	gEaRA+8cCq/MllLkpKzCwhBh6OUvRh53xiUmipVSorCnajUzmF+hqldaVbwk+N6l5p8+FPXdWkgMn
	tWGBit0oUlXWnDv6203aEYzkXmA+PedbDa3Q0fwHmyBhUgEUVT3nb7EFhP6UwuXO4wmZkPUilRLmj
	Z0mj8ag7M8jgOzp97PB4ISUyrXe1sE+aK7fLoOV/7L4C3h/CCnpwFbSMdhsi+P4b4mVoXhDZl4YS5
	tvpjRNZmJ5okGs+DZbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRovD-00000009WrI-2BtG;
	Wed, 18 Jun 2025 09:17:31 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoqL-00000009VJN-0HPO
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 09:12:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F216C442DD;
	Wed, 18 Jun 2025 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750237946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cj6KRD0up+ErYS+u+qJncczJtEr5FTwpg3NwGMa9s/c=;
	b=Zy1RwuwuMUY2gqRqK8VF9qHB4Zg8JNw0Z6EJbt6lzo982uKdDFH16wzC1d858R3tjaoaEn
	UTAPopdQetgAQrAXZlHbn/ZsxEllWfCzZKnu8IrI0/5lyjJUvFzhWnOu4CX0QT9LGAX1Zj
	bgEbLI69ACbdtti9XaBGiaI3x9NOEZVkzgxdgNp1YkOH6hOP9GAj2rASp3M1ttRpWAqgr4
	qia26896ElN3P5rt+fyIij8/xnBPoHb1rBhB7iVOWaDEArjqFJAK1RY3J5zVrAcwk2L0+M
	6xFLCUrY2Uik3mGlmC3fkmE4fSk6029rnab0VhuCJf5eotjro8QSIr/PHDvhZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: document the limited bit error
 reporting capability
In-Reply-To: <20250527-qpic-snand-limited-biterr-caps-v1-1-61f7cf87be1e@gmail.com>
	(Gabor Juhos's message of "Tue, 27 May 2025 13:08:16 +0200")
References: <20250527-qpic-snand-limited-biterr-caps-v1-1-61f7cf87be1e@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Jun 2025 11:12:25 +0200
Message-ID: <87zfe5l8g6.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomhdprhgtphhtthhop
 ehlihhnuhigqdhsphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_021229_232600_1350D11C 
X-CRM114-Status: UNSURE (   6.40  )
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

SGkgR2Fib3IsCgpPbiAyNy8wNS8yMDI1IGF0IDEzOjA4OjE2ICswMiwgR2Fib3IgSnVob3MgPGo0
Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgUVBJQyBoYXJkd2FyZSBpcyBub3QgY2FwYWJs
ZSBvZiByZXBvcnRpbmcgdGhlIGV4YWN0IG51bWJlciBvZiB0aGUKPiBjb3JyZWN0ZWQgYml0IGVy
cm9ycywgaXQgb25seSByZXBvcnRzIHRoZSBudW1iZXIgb2YgdGhlIGNvcnJlY3RlZCBieXRlcy4K
Pgo+IERvY3VtZW50IHRoaXMgYmVoYXZpb3VyIGluIHRoZSBjb2RlLCBhbmQgYWxzbyBpc3N1ZSBh
IHdhcm5pbmcgbWVzc2FnZQo+IHRvIGluZm9ybSB0aGUgdXNlciBhYm91dCBpdC4KPgo+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdhYm9yIEp1aG9zIDxqNGc4eTdA
Z21haWwuY29tPgoKVGhpcyBjaGFuZ2Ugbm8gbG9uZ2VyIGFwcGxpZXMgb24gdjYuMTYtcmMxLCBj
YW4geW91IHBsZWFzZSByZWJhc2UgYW5kCnJlc2VuZD8KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
