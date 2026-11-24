Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB1606A687
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c6KIPdA8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0zOH+RBN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2vOVFs38QAdUP4ET/VcRxtC0qsSHrjcEMrDaqdF169M=; b=c6KIPdA8TrNwq/1FRPOkgzYI+O
	Mtb+MWgycpzKSP5hSjRdeObrpeLjhKH7JOa1HdioTM8hl9rRmE2tOsU2PTUZKQZK0M/KTZG6wYf9c
	ZlKChYd7PwWRnlymvZ5BWzff/HjHFPT9Xa9goEfmRRJTijk2NeYJSVUDqwDSEwHx4CJK7hoG6Oord
	ZFuAGu6Ezqos++Y8lGU21rCO5bx7LfCum7rFonO2io4nqike2w9aKkyOzlTbM/zZwMnRHhFgTOLzH
	Z6tAjEBKMv4IyNczFmE3FgwKAekuHuwhr2DmWNNHTTv4JJcAPoAW5wR/+Sd61gXSyDJLuNweQLyqv
	CZIAgMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqlD-00000006eo7-247z;
	Tue, 24 Nov 2026 13:40:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVql8-00000006eiq-45go
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 13:40:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B3224E4175E;
	Tue, 24 Nov 2026 13:40:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBD83601E1;
	Tue, 24 Nov 2026 13:40:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1233B11E693D6;
	Tue, 24 Nov 2026 14:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795527627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shErw5dZCNwMc8bI9hdpVPwYuPWVh/mruGsCFe1/Ngg=;
	b=0zOH+RBNnFPCrYL7eZLEVQPtOIUR2I2MlrubeF0PDqim4cn6JTDJZtsgNp4RBs68ko5HSf
	q0Qut7eAxwDp9FevbB0OuK7u+C/ow62VPDQwkiFO/W1MRW46Rq+NA7S8o5v9zmQDYZiogi
	z2asUIjmCXm4IPQtQITki+DzofvOXlALYn+/5ICeD/djnUEKErHZ806FR81IQIZZxdOkRI
	8t6CxtGSvCkwqhw7yaN5NMqK9yurCG4ONY+1D3Mamu9g0q+oRVwXK1xWt6t+oN8UiR7ldz
	YsBs1NkvXFcfiE43lgMRG4XMhm50r2/E1jN0Lm+wNVvuZ9lqByxBFx5elfk1yQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Teng Wu <gigadevice2025@gmail.com>
Cc: linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  linux-kernel@vger.kernel.org,  teng.wu@gigadevice.com,
  weijie.huang@gigadevice.com
Subject: Re: [PATCH] mtd: rawnand: Skip timing mode readback check for
 GigaDevice NAND
In-Reply-To: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain> (Teng Wu's message of
	"Tue, 24 Nov 2026 21:06:21 +0800")
References: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 14:40:24 +0100
Message-ID: <87qzgas5yv.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054035_170065_568A5237 
X-CRM114-Status: UNSURE (   8.17  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+ICAJaWYgKHJlcXVlc3QgIT0gdG1vZGVfcGFyYW1bMF0pIHsKPiArCQkvKgo+ICsJCSog
R2lnYURldmljZSByYXcgTkFORCBjaGlwcyAobWFudWZhY3R1cmVyIElEIDB4QzgpIHN1cHBvcnQK
PiArCQkqIHRoZSB0aW1pbmcgbW9kZXMgYWR2ZXJ0aXNlZCBpbiB0aGVpciBPTkZJIHBhcmFtZXRl
ciBwYWdlLgo+ICsJCSogU2tpcCB0aGUgc3RyaWN0IGFjayBjaGVjazsga2VlcCBpdCBmb3Igb3Ro
ZXIgdmVuZG9ycy4KPiArCQkqLwo+ICsJCWlmIChjaGlwLT5pZC5kYXRhWzBdID09IDB4QzgpIHsK
PiArCQkJZ290byB1cGRhdGVfaW50ZXJmYWNlX2NvbmZpZzsKPiArCQl9Cj4gKwoKVGhlcmUgaXMg
YSB2ZW5kb3IgZHJpdmVyLCB5b3Ugc2hhbGwgdXNlIGl0IHJhdGhlciB0aGFuIHBvbGx1dGluZyB0
aGUKY29yZSB3aXRoIHZlbmRvciBzcGVjaWZpYyBmaXh1cHMuIENoZWNrIHdoYXQKbWFjcm9uaXhf
bmFuZF9maXhfYnJva2VuX2dldF90aW1pbmdzKCkgZG9lcyBmb3IgZXhhbXBsZS4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
