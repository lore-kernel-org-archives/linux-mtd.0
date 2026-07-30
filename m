Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E637C531D0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2026 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6Mhx36Ywyp4nabAVKHqDZa1oQ67aUoirL/PMZujRG0=; b=A4zSKF+Fn8qmKE
	EyMEtev8zP8OyMgOF2h/IhVX3pBC6HkNsoUbn+zxqn6AAOs4YnznHYsVEKK5f0D57yDCyUugbTLqW
	AsYJj4dLSOBeUWi+iR4OBZ+vbhD9TWxcbdHZy0jJkKjQVdL8bheRv+IYS0uCzEGEM6fiOpvwBkyse
	RX3dCX8ShqxwglizePd3j0Mj9sY9vWN8gU8XkNHpWROuKvcV2KOzshgKxqeEhxbKsHzakLLYXh3HM
	3rqt5nh1ghGzWtet9VVh8ee/cfohM3ChuX4eY4DMGKQHDH6qh4PdTuYr/+Iat4A3menWpfxJfbvko
	F3XPZ58Dd3vPfXwXGpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLKm-00000009l4m-1ncP;
	Thu, 30 Jul 2026 07:37:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLKg-00000009l2J-1pLn
	for linux-mtd@lists.infradead.org;
	Thu, 30 Jul 2026 07:37:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3941B4E41000;
	Thu, 30 Jul 2026 07:37:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2EDE602B8;
	Thu, 30 Jul 2026 07:37:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C673311C15795;
	Thu, 30 Jul 2026 09:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785397050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3KgoRkJyKXAHYdT+xa4fqZCBbSwdt9rddpR33e1hafQ=;
	b=qKwKZchpTgq3hol1lT602NCULisSa5RdLUXN+3OcNXyRHo+ECkStzLcj68ja9QesW3B+pb
	MFd/Eg9s5bT7td+4kFAyp1mGgXyijBlxuf5bfqoYlEXPSMeb9/OYiI1p8Z1uNrIQPrJ069
	2cBbY/OwP8/RqRgP9YkpWeQObFmGAps3Z6ox97kGUqOOlBcdAPu551iCrvMkSUHBAzq19Z
	hnZ9YjmkVFDjcmMvUX0OitENLt9cObTYahIiO2fhsKvHvp1pL8KadlXSXVKv6XCp+wMH6N
	fRumHlVP7t0UKpwtcFmYALAvMYkIuugenlieOpYY0hf/7uJTANjAG1ASj9Fv4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  praneeth@ti.com,  u-kumar1@ti.com,  p-mantena@ti.com,  a-dutta@ti.com,
  s-k6@ti.com,  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 0/4] mtd/spi-mem: Enable DQS support
In-Reply-To: <e2acbded-b8bc-4f45-a852-0abecec45de2@sirena.org.uk> (Mark
	Brown's message of "Thu, 30 Jul 2026 00:29:46 +0100")
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
	<e2acbded-b8bc-4f45-a852-0abecec45de2@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 30 Jul 2026 09:37:25 +0200
Message-ID: <87tsphj5ca.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_003735_811960_3B52232B 
X-CRM114-Status: UNSURE (   6.29  )
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

SGVsbG8sCgo+PiBiYXNlLWNvbW1pdDogYzU4ODQ0NDlkMDI1NzVjNzk4NDAwMGViMzBkMmEyOTcx
YzdkZmNjNwo+Cj4gSSBkb24ndCBhcHBlYXIgdG8gaGF2ZSB0aGlzIGNvbW1pdCBhbmQgdGhpcyBk
b2Vzbid0IHNlZW0gdG8gYXBwbHkKPiBhZ2FpbnN0IGFueXRoaW5nIEkgZG8gaGF2ZSwgY2FuIHlv
dSBwbGVhc2UgcmVzZW5kIGF0IGxlYXN0IHRoZSBmaXJzdAo+IHBhdGNoIGFnYWluc3QgbXkgdHJl
ZSBvciBMaW51cycgdHJlZS4KCk9mIGNvdXJzZSwgbm8gcHJvYmxlbS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
