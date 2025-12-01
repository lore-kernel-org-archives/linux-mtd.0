Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A58BD111A8
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Dec 2025 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5AM46nYsFvalpiIlnmZAVeaEvi7kNTk0VXTRPuPwc8=; b=cmqiAQdnj0jucU
	99nYyaqofq3AFK/yAE2z5DqWWz4QgG/Q3eByPoft/DZgPqO2sJ+8hPZqgffJ2GJvmAPxfWGhX6eII
	4itv468zq8JBzOxsRoER8avJ4UA4cj0GfevESDD1Yfax1tpSXevLUIsYqq+I2IpC/QqAvHkgdX0Zu
	/uS2sNs/O3lGnoZo1i4bq0ZoIzFCi8vlBsTlPvI9Jnrlmd2dE3s2LU/2bBHg+aPhcU7zE0Lx0t2ro
	JfMC5r78DyzKcHm5+bNhZEcvfSCYWHaaEziOxWjsT5RZCA8qFgULXkw6sx0xNk/5a/Eh2hH7nnEZ9
	/Q/Me4k2hxa8yEBRFPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ12y-00000003JDe-2enl;
	Mon, 01 Dec 2025 10:22:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ12s-00000003JCI-45Lj
	for linux-mtd@lists.infradead.org;
	Mon, 01 Dec 2025 10:22:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51CED1A1E86;
	Mon,  1 Dec 2025 10:22:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 269F9606BB;
	Mon,  1 Dec 2025 10:22:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB6C5102F0821;
	Mon,  1 Dec 2025 11:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764584529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Buqta3ItyqbLHXJO/iXxY/9AwhS7IstJEAEb6liuESE=;
	b=ObCOBYmxKORgwekHto8EMUoLRLJ8cMFP6zesZrAiJ8MnGAAArIREW1kckJ47cR9WjHhltT
	IIDURYJs6VhZlSN39gImfDSoS5VMVjzPfVyZ767IkN3c2cIz56ecBmyEJOhGqBSs+VTmIM
	FzlJW/9vo5K9CDtlbxTyQGJHdtNXAnvzoEd14aNBqR3cH7HrObCHia1mfvzDtMv7PpeYl8
	VV+VjDE9Xkd3bPQntqHKE5YouXxY3AoZAolTdj09Q76F/sjeuef9Pt6rGwDKI3+EOkIBIG
	2mwlwWKkCmYtia0JhfpiFbw+RonXSWIuBIBbv3mBYzeC5JaIZTnZ8gbeUB6ISg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.18
In-Reply-To: <mafs0y0nrumwt.fsf@kernel.org> (Pratyush Yadav's message of "Thu,
	27 Nov 2025 23:32:34 +0100")
References: <mafs0y0nrumwt.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 01 Dec 2025 11:22:05 +0100
Message-ID: <87ms42cxiq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022215_144799_66CBA54D 
X-CRM114-Status: UNSURE (   5.08  )
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

SGVsbG8gUHJhdHl1c2gsCgpPbiAyNy8xMS8yMDI1IGF0IDIzOjMyOjM0ICswMSwgUHJhdHl1c2gg
WWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBIZXJl
IGFyZSB0aGUgU1BJIE5PUiBjaGFuZ2VzIGZvciA2LjE5CgpKdXN0IGluIGNhc2UsIHRoZSAnU3Vi
amVjdDonIG1lbnRpb25zIHY2LjE4IDspCgpQdWxsZWQgaW50byBtdGQvbmV4dCwgdGhhbmtzIGEg
bG90IQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
