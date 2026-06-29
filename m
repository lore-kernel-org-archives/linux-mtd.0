Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14560C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MggkqbtTX6w9CXPrJqLkcxOU5h1ykJUtuK9BmoczM3o=; b=Uwd3Ac3GhvCDte
	IQIV4m/iaxOKyiKJMSsrlQBNIkyBrUjYbMXn0m53o6087qQoH71NwNgCVwk0Hx/OX6YQvuY13Ltsp
	nkmkbPRLmrcl5pu5Dij09v3CLEk0nhWsQC9kI+sk8swNc2Hk6KmM+tGM3NsMqJ79iT367JDztoRGb
	c1K+WlAHNfpoWQ5zsq/tTgaI8kiWKKgJC50FDIt1nsUm9A1Ws6CNHDepu+ub4MvXDxUJyOn8xBnLP
	XgX4RnLhetPDsKMI5RxIodqT+lOGQYmIEmqTgn3zXJa02tlSM8CqHi8S7ZmhF4lPcthYzH0mpM3V5
	0IctGKhHvkazbPRM5uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDee-0000000F21L-19PG;
	Mon, 29 Jun 2026 15:12:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDeb-0000000F20p-0DXl
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:12:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C31BAC6B3B0;
	Mon, 29 Jun 2026 15:12:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2AA55FF96;
	Mon, 29 Jun 2026 15:12:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F1E8106F183A;
	Mon, 29 Jun 2026 17:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iuzknU/f74uT0ytqu3gxiCOOylQAXqdxI4XkYGkJpuk=;
	b=kPjRaPwLmkXC6NZQcobyKE/k/l+nsLoAWzqJct8Zi5kQpcAxPdMc6fRDNV6obtzE/Djx2F
	0SF4GNNQIsfJ/HVVzenfx43JygyxIUfp7LlDHHfkz7Nk64nEhHR80pbgT1AD6K3df2RTgx
	3RcLmuzKfawrXJdk1OPLMrAvQ6Dy+B7e316By2LN49CLej8nTYzbXQzppnrw44scAakT0K
	2B1tZ8hlCnmJbqp/edMQVwW4w2F8jAVjm1ejVOnv1jJiEL8lx1lQK9xAmf8qVRb/d782J4
	49FcQEFrbm28JbvxPI4/AE0R2u1Z+SKMayPyJHbZ5w5WLDWsJpDrIg0J6nu4mQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <2vxz4iismi2m.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	24 Jun 2026 10:57:37 +0200")
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:12:03 +0200
Message-ID: <87pl19s7ng.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_081209_257728_A558C627 
X-CRM114-Status: UNSURE (   4.11  )
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

SGVsbG8sCgo+PiBodHRwczovL2dpdGh1Yi5jb20vc2FzaGlrby1kZXYvc2FzaGlrby9ibG9iL21h
aW4vTUFJTlRBSU5FUlNfR1VJREUubWQKClRoZXJlIGFyZSBhIGNvdXBsZSBtb3JlIHF1ZXN0aW9u
cyB3ZSBzaG91bGQgYW5zd2VyIHJlZ2FyZGluZyBlLW1haWwKZGVsaXZlcnk6CgotIFNoYWxsIFNh
c2hpa28gcmVwbHkgdG8gYWxsL2p1c3QgdGhlIGF1dGhvci9hIGxpc3Qgb2YgaW5kaXZpZHVhbHM/
CgogIElmIHdlIGdvIGZvciBlLW1haWxzLCBJJ2QgYW5zd2VyIHRvIHRoZSB0aHJlYWQsIHNvICJy
ZXBseV9hbGwiLiBCdXQKICBJJ20gb3Blbi4KCi0gU2hhbGwgd2Ugc2V0IGFuIGVtYmFyZ28/Cgog
IEknZCBiZSB0ZW1wdGVkIHRvIHNheSAibm8iKS4KCi0gU2hhbGwgU2FzaGlrbyBzZW5kIGEgcG9z
aXRpdmUgcmV2aWV3IGluIGNhc2Ugbm90aGluZyB3YXMgc3BvdD8KCiAgSWYgd2UgZW5hYmxlIGUt
bWFpbHMsIEknZCBiZSB0ZW1wdGVkIHRvIHNheSAieWVzIi4KClRoYW5rcyBmb3IgeW91ciBmZWVk
YmFjay4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
