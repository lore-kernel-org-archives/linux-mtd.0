Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A64EC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 19:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqIb62DqfuTG4DCgUfpWmKBG5pxAGQQM7vq6I9n6n/Y=; b=OOeKKLQOA4gqck
	y8D8t53vyn9Z7+LilFu/qCQg4v1A41KPRjnb01mIRXXdLMNKD+ZbQhBR4ia8M+Ce2AM6w0AK8k7sN
	ZsP3cN+Qxj8MHLLBvIdDA0Ajn0aXTc7CRp0yRNA6znBBldZV6JVjkUQpf/hjW3IBDBoJ9guUD1Az8
	FPynWPy/1oc5hM73RWXYlP04VbhF60y8CB7s5XL8vy4+hsC5DCj1eGF6tz8daBff+hRwlEybhm7Lg
	2pfeDn4fPnakvRdngYQUIdvyWY8tGbfnnUmE2qEk3zq1DfjJ0a80OkZCpwD7ZMb3nempghF9/JAHO
	XHbRHvcJdAoCJwmA+Fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8ms-0000000CrNL-3psm;
	Wed, 15 Jan 2025 19:10:46 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8mq-0000000CrMO-1EDp
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 19:10:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B0B8E0008;
	Wed, 15 Jan 2025 19:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736968241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lgg79FAUQ3apwglQPr9QuwItHd0jkyUfYOTHfbHRuMk=;
	b=dYW3fNqcQAO7L28FMjnZEpKLztgO40DTmoX0CmXkXWeQYGhBSzwtQ8tqV/eCbHbiuQBX42
	ksQdrBwswuqCm54kIOXJxolbfDYEOq1nz9v4nkUgkIdFLkjr6GmNrPhaLeNKD/H0/yVrQG
	TbDgelA0SEw7ypOiFtnpUdJT8PzXkYhZ83X3eS0UeKm7E0miDB1DFPDTzhn7PzE5HaKhAk
	rFtZNkN3x4yR53WmXiZxmjRmpBLqxTnMWeQSnmaCqcOhK5vGJ2go6/ThZW6mI1ic6rLCxH
	1Q3mbgJJkkpJ5lZfxFr5fvXuQutkfWv4ngmlfJ85be9JwYAeKbMjDiixZXtrPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <mafs08qrc5g44.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	15 Jan 2025 14:03:23 +0000")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
	<mafs0ldve7qms.fsf@kernel.org> <87a5btslfl.fsf@bootlin.com>
	<mafs08qrc5g44.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 20:10:39 +0100
Message-ID: <87zfjrlwpc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_111044_477858_58042CC1 
X-CRM114-Status: GOOD (  12.95  )
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

SGVsbG8gUHJhdHl1c2gsCgo+IE9rYXksIEkgYW0gY29uZnVzZWQgYmVjYXVzZSB5b3Ugc2FpZCBl
YXJsaWVyIHRoYXQ6Cj4KPj4gVGhlIGJ1ZyB0aGF0IGhhcyBiZWVuIGV4cGVyaWVuY2VkIGZvbGxv
d2VkIHRoaXMgc2VxdWVuY2U6Cj4+IC0gc2VuZCB0aGUgd3JpdGUgZW5hYmxlIGNvbW1hbmQgKG5v
bi12b2xhdGlsZSkKPj4gLSB3YWl0IGZvciB0aGUgcmVhZHkvYnVzeSBiaXQsIGllLiB3YWl0IGZv
ciB0aGUgV0VMIGJpdCB0byBiZSBzZXQKPj4gICBiZWNhdXNlIGl0IGlzIG5vbi12b2xhdGlsZSB3
cml0ZQo+PiAtIGFjdGl2ZSBkaWUgaXMgcmVhZHksIChidXQgaWRsZSBkaWUgaXMgbm90ISkKPj4g
LSBlbnRlciA0LWJ5dGUgYWRkcmVzcyBtb2RlLCBvbmx5IHRoZSBkaWUgdGhhdCBpcyByZWFkeSBw
cm9jZXNzZXMgdGhlCj4+ICAgY29tbWFuZC4KPgo+IFdoaWNoIHNheXMgdGhlIFdFTCBiaXQgYmVp
bmcgc2V0IGl0c2VsZiBpcyByYWN5LiBXaGF0IEkgdW5kZXJzdGFuZCBmcm9tCj4gdGhhdCBpcyBv
bmUgZGllIGlzIHJlYWR5IHRvIHRha2Ugd3JpdGVzIGFuZCB0aGUgb3RoZXIgaXMgbm90LiBOb3cg
d2hlbgo+IHlvdSB0cnkgdG8gd3JpdGUgdGhlIFNSIHRvIGVuYWJsZSA0QiBtb2RlLCBpdCB3b3Vs
ZCBvbmx5IHdvcmsgb24gdGhlIGRpZQo+IHRoYXQgZ290IHRoZSBXRUwgc2V0LiBUaGUgb3RoZXIg
b25lIGlnbm9yZXMgaXQgYW5kIHN0YXlzIGluIDNCIG1vZGUuIERvCj4gSSB1bmRlcnN0YW5kIHRo
aXMgY29ycmVjdGx5PyBUbyBmaXggdGhpcyB5b3UgbmVlZCB0byB3YWl0IGFmdGVyIHRoZQo+IHdy
aXRlIGVuYWJsZSwgYmVmb3JlIHlvdSBpbml0aWF0ZSB0aGUgd3JpdGUgU1Igb3BlcmF0aW9uLgoK
QWN0dWFsbHkgSSB0aGluayB5b3UncmUgcmlnaHQuIFRoZSB0aGluZyBpcywgV2luYm9uZCBXRUwg
Yml0IGFyZQpub24tdm9sYXRpbGUgYnkgZGVmYXVsdCwgd2hlcmVhcyB5b3Ugd2VyZSBhc3N1bWlu
ZyBpdCB3b3VsZCBiZS4gTWF5YmUKdGhlIHByb3BlciBmaXggaXMgdG8gZG8gYm90aD8KLSBVc2lu
ZyB0aGUgdm9sYXRpbGUgJ3dyaXRlIGVuYWJsZScKYW5kCi0gTWFraW5nIHN1cmUgd2Ugd2FpdCBh
ZnRlciB0aGUgKG90aGVyKSBjb21tYW5kcyB0YW1wZXJpbmcgd2l0aCBhbGwgZGllcy4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
