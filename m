Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CA6C021B2
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJ97stLiYdZfzNBYO7SYau+VX3NmjfC6LN7teR38Stw=; b=glu3w3jSTaIlrP
	g9A7SGJeDIdXQ+M/TsTsaXJj41PXlIjIDJejFJMSjmt3jo7bUq6K0tdYSesEsBVuZ6DCG7p96D0Tb
	DT6xoaxISIjRz/gJL6NRS/3XXeAhTWyBOGCUq2X4wqjpDuCliW6mxhrwiPNlzU58ce/qs3pp6mkQg
	SZtuMGkmQaspDVLFWq49znqJCBxL/8vgN1FOwMVm0erGNbpRsAwAwCaHj+Ut1FcSLkDuOUQ9+kHLy
	ETR2Y8auD2zmG8HYBzysAB/kdW/EkX3CwmpEJCiYh0COeHvlNeErD6AUFx/ZLzLqBxJLmNWBk5Qyv
	fYnSvRa1FSQ984HLa/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77b-00000001C14-23v1;
	Thu, 20 Feb 2025 14:01:47 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl74I-00000001B8D-0prf
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 13:58:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0AE4431ED;
	Thu, 20 Feb 2025 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740059897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNBQaKv78uyH4ef165+GkBaMZfZdRktVOqIdHeYNWzk=;
	b=FMA3lDV7hCRVqyQ/E+LjfD1dzkugxVVlcCfmenjFy+lsYQwomH7vMbqzwokO3D+MiHg5kg
	DvaX2vXR1mFrmtuEkeb6RY+DWf5IJ8HgCIV6/dMvzVvhHcTKK8iLYJYly6OooLWS+gRhWI
	JK3bM3AZcX67CSYh8LE0uRzo4B9g7Xwt9Rhsrdjxdb12chs5+KXY6n0JhKphDmr6f80ydd
	nnDzwZgKL8Vp9+cf/uY5yaXCqq8rX2L2Nv2ftlKg4kIJns8yjJyKcNPItZ/WzmAvUH4bJE
	vP483JM8VZ5L0PnBXPNISRFf4cZB4dMvaGIpc5FiJTdkGBECadV22Ek6SyUU/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>,  Buildroot Mailing
 List <buildroot@busybox.net>,  "Josh Boyer (Fedora)"
 <mtd-utils-maintainers@fedoraproject.org>,  "Bastian Germann (Debian)"
 <bage@debian.org>, (Rosa Linux) <a.proklov@rosalinux.ru>,
  Embedded Gentoo <embedded@gentoo.org>,  "Robin H. Johnson"
 <robbat2@gentoo.org>,  "John (OpenWRT)" <john@phrozen.org>, "Michael Tross
 (T2 SDE)" <michael@tross.org>,  "Oliver Schinagl (Alpine)"
 <oliver@schinagl.nl>,  "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,  "Silvan Calarco
 (openmamba)" <silvan.calarco@mambasoft.it>,  "Viric (nixpkgs)"
 <viric@viric.name>,  "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
  "Levente Polyak (Arch)" <anthraxx@archlinux.org>,  =?utf-8?Q?Llu=C3=ADs?=
 Batlle i Rossell
 (NixOS) <shaba@altlinux.org>,  Richard Weinberger <richard@nod.at>, Zhihao
 Cheng <chengzhihao1@huawei.com>
Subject: Re: [ANNOUNCE] mtd-utils-2.3.0 is released
In-Reply-To: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at> (David
	Oberhollenzer's message of "Sat, 15 Feb 2025 17:05:53 +0100")
References: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Feb 2025 14:58:13 +0100
Message-ID: <87zfigk9ai.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigfeufedvhfekfeehueeiheehleeifedvjefhtdehfeefueejgfekveduhfejnecuffhomhgrihhnpehinhhfrhgrrhhoohhtrdgrthenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvihgurdhosggvrhhhohhllhgvnhiivghrsehsihhgmhgrqdhsthgrrhdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhshigsohigrdhnvghtpdhrtghpthhtohepmhhtugdquhhtihhlshdqmhgrihhnt
 hgrihhnvghrshesfhgvughorhgrphhrohhjvggtthdrohhrghdprhgtphhtthhopegsrghgvgesuggvsghirghnrdhorhhgpdhrtghpthhtoheprgdrphhrohhklhhovhesrhhoshgrlhhinhhugidrrhhupdhrtghpthhtohepvghmsggvugguvggusehgvghnthhoohdrohhrghdprhgtphhtthhopehrohgssggrthdvsehgvghnthhoohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_055822_537328_024CC64B 
X-CRM114-Status: UNSURE (   7.74  )
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

SGVsbG8gRGF2aWQsCgorWmhpaGFvCgpPbiAxNS8wMi8yMDI1IGF0IDE3OjA1OjUzICswMSwgRGF2
aWQgT2JlcmhvbGxlbnplciA8ZGF2aWQub2JlcmhvbGxlbnplckBzaWdtYS1zdGFyLmF0PiB3cm90
ZToKCj4gSGksCj4KPiBtdGQtdXRpbHMtMi4zLjAgaXMgcmVsZWFzZWQuCgpUaGFua3MgYSBsb3Qg
Zm9yIHRoaXMgbmV3IHJlbGVhc2UhIEkgd2FudGVkIHRvIGJ1bXAgdGhlIHBhY2thZ2UgdmVyc2lv
bgppbiBCdWlsZHJvb3QgYnV0IEkgZ290IGlzc3VlcywgcGVyaGFwcyB5b3UgY2FuIGhlbHAuCgpB
IHJlZ3VsYXIgYC4vY29uZmlndXJlIC0taG9zdD08YXJtPiAmJiBtYWtlYCB3b3JrcyB3ZWxsIHdo
ZW4gY2xvbmluZyB0aGUKR2l0IHJlcG9zaXRvcnksIGhvd2V2ZXIgQnVpbGRyb290IHVzZWQgdG8g
ZG93bmxvYWQgdGhlIHRhcmJhbGwsIHdoaWNoIGluCnByYWN0aWNlIGRvZXMgbm90IGNvbnRhaW4g
YWxsIHRoZSAuZ3ogZmlsZXM6Cmh0dHBzOi8vZ2l0LmluZnJhcm9vdC5hdC9tdGQtdXRpbHMuZ2l0
L3RyZWUvdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvaW1hZ2VzCgpUaGlzIG9mIGNvdXJzZSBsZWFk
cyB0byBhIGJ1aWxkIGZhaWx1cmU6Cm1ha2VbMV06ICoqKiBObyBydWxlIHRvIG1ha2UgdGFyZ2V0
ICd0ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvZ29vZC5neicsIG5lZWRlZCBieSAnYWxs
LWFtJy4gIFN0b3AuCgpUaGUgY29tbWl0cyBmcm9tIFpoaWhhbyBhY3R1YWxseSBsaXN0IHRoZXNl
IC5neiBmaWxlcyBpbiB0aGUgLmFtIGZpbGVzLAphbmQgdGhleSBhbHNvIGFwcGVhciBpbiB0aGUg
TWFrZWZpbGUuaW4gYXMKCiAgICBAQlVJTERfVEVTVFNfVFJVRUBhbV9fYXBwZW5kXzIyCgp5ZXQg
dGhleSBhcmUgbm90IHBhcnQgb2YgdGhlIGZpbmFsIGRpc3RyaWJ1dGVkIHRhcmJhbGwuIEFueSBp
ZGVhIGhvdyB0bwpmaXggdGhhdCBwcm9wZXJseT8KClRoYW5rcyEKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
