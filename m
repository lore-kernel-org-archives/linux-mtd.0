Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16187C43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ros8H/eKZpWwqOL9Jfou2xz6MXPLT7A0vVUqpXsHwIY=; b=jw2XpZTeWLBrXy
	5Q3qTPsnFMUmZtKTXC2izBwnrHIgbmD6EFgehz5NwLdUTQSzP94yLwYVfbW2wMVGVAi/MkhbEhUy6
	SFuaSk4Z4/fVPLCHXJUsiX6DlPiyTiyh9nch/JLXXBERSPMq7bn//G+lZJuBO1FwktbfVda+pj+Gv
	dcsu5kWFBQ70eAQomW0Zg7IyQ5vpu/VXsBPdYved4UmzJsd6MJfDRodzuypd4XbSWG57ynNYAC5iT
	z/hHW9LDeo1VUxhwts6nUZxbONPMT+dICEy4M0/X1wqbph0fCuxvKIz8ZAQnSCXqF+QtR4kDzIbQo
	lc5asKMh2ID63DqbX9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD7q-0000000Etia-3fpi;
	Mon, 29 Jun 2026 14:38:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD7o-0000000Etgd-1EMp
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:38:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ACA901A0CF1;
	Mon, 29 Jun 2026 14:38:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 814C95FF96;
	Mon, 29 Jun 2026 14:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BC88106F0302;
	Mon, 29 Jun 2026 16:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oQjT8VSYKpJmbYj8BiTpxBFUYIwVy1vf7EXkFzcCt2A=;
	b=zg6Car/D5GNCMDVneV2gyv1huverQE7TRByt47jdvZXrxOugWGE2oYGLiJkH3iUXxZyVP6
	n4OgVZflFwxOns7jEKyWnq9PCAfbhz8VXWT+1BXbrXfiRUvC7q5kDU4zH6x7A5RGxYlv53
	xPWQRwc/jggQTvUrYU6CjHy9/lbFOZOCTpTPIT21ydvfNaHbwS8oGb4u3ZO00ZFcPT2A9S
	RqpbbB5rPxqUq7BWaunhOY0ph9u8rm+m2griZYqa1wc5p1fZfsFp229+Hj+gFxlsM6nfWW
	vl3yf8xKfD/RwPWNDkJSDU6U/L/fAmOMSM0wrrZ/t9jaQRSzOT1juBeQDw7/zA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260613211031.85166-1-enelsonmoore@gmail.com>
References: <20260613211031.85166-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] mtd: maps: correct CONFIG_MTD_COMPLEX_MAPPINGS macro
 name in comment
Message-Id: <178274389054.252933.3001685492796071314.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:38:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_073816_478918_1867EE2E 
X-CRM114-Status: UNSURE (   6.43  )
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

T24gU2F0LCAxMyBKdW4gMjAyNiAxNDoxMDoyOCAtMDcwMCwgRXRoYW4gTmVsc29uLU1vb3JlIHdy
b3RlOgo+IEEgY29tbWVudCBpbiBkcml2ZXJzL210ZC9tYXBzL21hcF9mdW5jcy5jIGluY29ycmVj
dGx5IHJlZmVycyB0bwo+IENPTkZJR19DT01QTEVYX01BUFBJTkdTIGluc3RlYWQgb2YgQ09ORklH
X01URF9DT01QTEVYX01BUFBJTkdTLiBDb3JyZWN0Cj4gaXQuCj4gCj4gRGlzY292ZXJlZCB3aGls
ZSBzZWFyY2hpbmcgZm9yIENPTkZJR18qIHN5bWJvbHMgcmVmZXJlbmNlZCBpbiBjb2RlIGJ1dAo+
IG5vdCBkZWZpbmVkIGluIGFueSBLY29uZmlnIGZpbGUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbWFwczogY29ycmVjdCBDT05GSUdfTVREX0NP
TVBMRVhfTUFQUElOR1MgbWFjcm8gbmFtZSBpbiBjb21tZW50CiAgICAgIGNvbW1pdDogZDI3Njc4
M2U0OTBkNzM1MzYxMzVmOTBmOTZjNTg3NWYyNjM0ODFhYgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
