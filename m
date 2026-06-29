Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B4FC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XaNlcT+/0CZBYdlxvk6ZTKHb7Q8Rb66uK+GcGMNFEg=; b=pnHkVwgoThfXWm
	+jOjQN4fSIkK1KU9+E2U6ukYGnM9wJubhcQAdVoZiYlXcyOqEysNIpa8crPa8Ws/dgsHV+N6K8dnY
	4B3c6CrsG8Xs5dE7OxOkGLQ7yJ2QtepGxyQTcRXs5LYHkbDoKryS8BFeyqsRGbb+zfQUerV8HJmO1
	tPgO3fbDF02TtOr//kDQZhR62k6FNbCiH9AYKFGtow9ReWiHzkIbCFJ7pZf5DsUrhENibe+WO+G+o
	GfLGwtzv0ITy8bJ7qBTqPv+OlJ+VEnPV1MvkN9rymI+xAokMcv3pcHGGsHEcwagbKz+aARnywEx7q
	tAmu4vtb23Mlmmprk8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI3-0000000EwLT-2FhW;
	Mon, 29 Jun 2026 14:48:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI2-0000000EwJU-1g2D
	for linux-mtd@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nGVZWrrSL99cJNgObb83FGY2tNVSW1G1qwdqUVXInjw=; b=mHvzv+Vwybl2tPC+F5S0WtL76l
	895FqoTK113GLmJ2WHTIk7Hplw8Bq3rBjTvHXL6+0A6CPgliiQ7AJ0Bc9Z7DTt+QXFTGDAJzPy91o
	83XNdwHgKQL5OKL51BuwfDVZQ7ewsbsxCVtQHaa8CzqPHGSPbnz1wREYeUijvZFITjRQgeiPVIJcw
	ybk0vTTcWeKDlfLVQFe0iL1k8PYZRXl9XYMp+HGwc+eI5DLsS9q36cwj5pKeUotGNhUJZseyElMPp
	ut+lCfKo8jXnM2Fzz4yyvZ87oA4PGDUhMqV0FDYITH/WLQN2hxrrBmAcDc8PmLgeev0TjoKGMFrPT
	2VpiGZOg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weDHy-000000018SU-3XeG
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD22C4E407AE;
	Mon, 29 Jun 2026 14:48:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77F095FF96;
	Mon, 29 Jun 2026 14:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49FFA106F18BF;
	Mon, 29 Jun 2026 16:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nGVZWrrSL99cJNgObb83FGY2tNVSW1G1qwdqUVXInjw=;
	b=I/nJC6UGUxEXE6caFfSulKwBaFHoTc1qbtQhn5MQXYdntRXRKH7eLrExDxFKadf0ZrfkNX
	Nh+O4Avr2Ebj+hqeLqg9efEZIxQaWpth03nMhbN1sW7n34ZGoDu5nKUmVfR7kH2fM6Lzkb
	3ZoUJlaP0TxRjrwNIoBWeMlSn79/6/XQXK2xlHePkLVBjXAvtSuztOfiTZTwVPN6dwDo8F
	6lI9oIAYTyv93i7ilCUhc1Q4LeD6qpsej4XVH+xtYbX9jGjy9jPrhUmoRW1Mya4oOeJ4Oo
	Lk1GyPH5X40N4lkpGGZ0qF5BJ+oEZ/yFEzHjgLEL2hdIG8cjPMagjVrK3zVdbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Aleksei Sviridkin <f@lex.la>
Cc: Richard Weinberger <richard@nod.at>, 
 Maxim Anisimov <maxim.anisimov.ua@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260616132844.43994-1-f@lex.la>
References: <20260616132844.43994-1-f@lex.la>
Subject: Re: [PATCH] mtd: spinand: add support for HeYangTek HYF1GQ4UDACAE
Message-Id: <178274452155.266238.15507368307291850475.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:48:41 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_154847_313392_FB855D7B 
X-CRM114-Status: UNSURE (   7.02  )
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

T24gVHVlLCAxNiBKdW4gMjAyNiAxNjoyODo0NCArMDMwMCwgQWxla3NlaSBTdmlyaWRraW4gd3Jv
dGU6Cj4gVGhlIEhlWWFuZ1RlayBIWUYxR1E0VURBQ0FFIGlzIGEgMSBHYml0ICgxMjggTWlCKSBT
TEMgU1BJLU5BTkQgd2l0aAo+IDIwNDggKyA2NCBieXRlIHBhZ2VzIGFuZCBvbi1kaWUgNC1iaXQg
LyA1MTItYnl0ZSBFQ0M7IGl0cyBKRURFQwo+IG1hbnVmYWN0dXJlciBJRCBpcyAweGM5LiBUaGUg
ZGllIGlzIEdENUYxR1E0LWNvbXBhdGlibGUsIHNvIHRoZSBPT0IKPiBsYXlvdXQgaXMgdGFrZW4g
ZnJvbSB0aGUgaW4tdHJlZSBnZDVmeGdxNHhhLiBUaGUgZGllIGV4cG9zZXMgb25seSBhCj4gY29h
cnNlIDItYml0IEVDQyBzdGF0dXMgd2l0aCBubyBmaW5lLWdyYWluZWQgYml0ZmxpcC1jb3VudCBy
ZWdpc3Rlciwgc28KPiB0aGUgc3RhdHVzIGlzIGRlY29kZWQgaW50byBhIHJlcHJlc2VudGF0aXZl
IG51bWJlciBvZiBjb3JyZWN0ZWQgYml0ZmxpcHMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFu
ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IGFkZCBzdXBwb3J0IGZvciBIZVlh
bmdUZWsgSFlGMUdRNFVEQUNBRQogICAgICBjb21taXQ6IGE4Mzc0NjgzODY4NjM0MDEyYWM4NzNk
NjI4ZmE1ODFmY2M0NTJlOWMKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9s
aW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBu
byByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
