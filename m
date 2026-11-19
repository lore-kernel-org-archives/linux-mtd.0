Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A80606A337
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xl8WOP/4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DzS57S0w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z/PZtCwScDJy+b9fLFuH1fZKimXEw4/Qh2H8z5LgvFU=; b=xl8WOP/4m8kn8TXm6Vqu0ktAu3
	qYZ8jM58fLyOiOGa2h4w7xVPavbamkNKzlW3JkxqEdTH5hgN95CAg/QPKAy/ZvkZBhtiAUZJ9o7No
	FAs0zqjWH9zPYG+8iagLOrU7KPlbjwX+RUcBjuTMMCooINNE7QoDo9IETizoFreN4mVvjsCMFJcHH
	xlyL4Wq4FdNHl2wVILg2qDeDTr8i+GpwokOWaiFCqo/eJh/e1AlRgdEBdISd3P8hV/dyp7oBQz607
	L0DbYtQFa9snP5dG/vgY5C2r4tv/37seiwoTIm3+jv+aDb0xxIl9kCD/Ldrf7pl74fHzol+uZYa1e
	cMfnz64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OR-0000000BrTt-29M8;
	Thu, 19 Nov 2026 12:37:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OF-0000000BrMM-2PDz
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4BC47C4CBF1
	for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 12:37:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F18960237;
	Thu, 19 Nov 2026 12:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9686B11BC0662;
	Thu, 19 Nov 2026 13:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091841; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dEW7y7XAqeBD7xaDjDBvP0fFGQoFweZsJxNTbP4g5PA=;
	b=DzS57S0w4Q/Wfag9dbeGY7Y5VyDZmMUYpkFzrU0CsSrhkx7hz+bnMFqLzPgiweIGoOrB4t
	C/WxQ3kGbJkV00+wLUs3cuX1YBrMP6+dx86wCOM5+OSgsidlvaTqi44vGTA8wdspAzRVAd
	l/lSw5Cm/QG7KQ6bhJW19zAbRvUiw2m+gtNmmwhEVJSOt44nKdP9qToYZDpOSXWNKQ5fOT
	MWKYAZbS8bgM1AI4f3H9w92KwD5zOuY3nOJrRSUhrAoze1VUrRU15v0VEOPwq/qeI9N9ki
	qp87fFyejJn09aCxciRELib+cB7TB7krFWLdx3xrQMIfpZ98Nj2zcaUQQLNtJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: paul@crapouillou.net, harveyhuntnexus@gmail.com, 
 Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mips@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 liuwb@xiaopeng.com, stable@vger.kernel.org
In-Reply-To: <20261118020751.1833498-1-zhugl3@xiaopeng.com>
References: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
 <20261118020751.1833498-1-zhugl3@xiaopeng.com>
Subject: Re: [PATCH v3 1/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4725b_correct()
Message-Id: <179509183841.2889394.14531200887089182050.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043723_759399_BD46B336 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAxOCBOb3YgMjAyNiAxMDowNzo1MCArMDgwMCwgR3VhbmdsZWkgWmh1IHdyb3RlOgo+
IFRoZSBKWjQ3MjVCIEJDSCBjb250cm9sbGVyIHJlcG9ydHMgZWFjaCBjb3JyZWN0ZWQgYml0IGVy
cm9yIGFzIGFuCj4gaW5kZXggaW50byB0aGUgY29kZXdvcmQgaXQgd2FzIGFza2VkIHRvIGRlY29k
ZSwgaW4gdGhlIElOREVYMC9JTkRFWDEKPiBmaWVsZHMgb2YgdGhlIEJDSF9CSEVSUiByZWdpc3Rl
cnMuIFRoZXNlIGZpZWxkcyBhcmUgMTMgYml0cyB3aWRlLCBidXQKPiBub3RoaW5nIGluIGp6NDcy
NWJfY29ycmVjdCgpIGNoZWNrcyB0aGUgcmVwb3J0ZWQgaW5kZXggYWdhaW5zdCB0aGUKPiBzaXpl
IG9mIHRoZSBkYXRhIGJ1ZmZlciBiZWluZyBjb3JyZWN0ZWQ6Cj4gCj4gICAgIGJ1ZlsoYml0ID4+
IDMpXSBePSBCSVQoYml0ICYgMHg3KTsKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQs
IHRoYW5rcyEKClsxLzJdIG10ZDogcmF3bmFuZDogaW5nZW5pYzogdmFsaWRhdGUgQkNIIGVycm9y
IGluZGV4IGluIGp6NDcyNWJfY29ycmVjdCgpCiAgICAgIGNvbW1pdDogNWM2MjE0ODJkZWJlNjQy
NjIzZmY5NzRkYzZiZWZmNzAxNTM3MWZjNwpbMi8yXSBtdGQ6IHJhd25hbmQ6IGluZ2VuaWM6IHZh
bGlkYXRlIEJDSCBlcnJvciBpbmRleCBpbiBqejQ3ODBfY29ycmVjdCgpCiAgICAgIGNvbW1pdDog
MjFjYjg3M2EwMWM1NzA2YjQ0M2I2ZDgzMjhjNTdkZThjZTA3Y2ZmYwoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
