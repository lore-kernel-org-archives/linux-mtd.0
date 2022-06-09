Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCED8C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yzf6sf0HFvuKklPDPJsthomBBYamy+PLAJzZAU8Dru8=; b=4nxLBv+P6QE2XE
	d/sbjhG0RexTQ+VDlqbQjLxqLurLlkORMPiEw6P/ZLyb6gB6QvwlcQfhucnZkMxpbQjq8N8kAW+by
	k5UNCtzjCnX08g7sPGcQnqdSUhZZCU2+L/ElpvsaUcTnnNJZ7TIoYltq9AQ6ujFymFTlOhmH9RqWR
	HKlnGFffZFuIBj5ktccnqDdYLQNppQr5lUoceWyXkIslOzley7B0Tq1wdqnPPiaPGf+ZoB4h4RkFw
	1sC0yXDHBpwvjkKTQM7PSIcLqAp601qBVjLSFYJNl+Spf+tDGdjkQHz/cQGllST7yMQuhJuiYauYJ
	KA0Fur7CYRgITM+oz/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuR-0020Cj-Jo; Thu, 09 Jun 2022 13:09:11 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuN-00209N-16
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78571100009;
	Thu,  9 Jun 2022 13:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d9Z6rRQuSWvQ/v8vdwzMhI2qyUthCKq6aS6ko++6jY=;
	b=j0SVGNqVfa7IcgpFZHCP7vhXpK1q4W4gqenkNQIiwoljZVoRkD00vS2MMDcF3HDAIhFb/r
	9cJTFZ8SF+6BgPyhzjm6KAqZMfvKARXdaAcPf0f7i7i7bhYF5ogTX9KqVunlYrmItYKv5H
	M0/lQAJ0TPlieDtHz+3aecoiZj9dWbO/79/1+Sf9m+s4n26K9dPAMbcaQjyYPH2NRHJ3mp
	WzMgviLEclAISzicOobCoOM3EJvAOEfSKUHFuI+guprh/PgGSgRG3VSNvHu3X/murnXaSJ
	31mDS0fqZvQ2cJ+7iR1n8C3Fm7Tkwmt8rQi9TOLcbj8eq23CUsdaOT6zpSntlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 2/4] mtd: st_spi_fsm: Warn about failure to unregister mtd device
Date: Thu,  9 Jun 2022 15:08:59 +0200
Message-Id: <20220609130859.293012-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607152458.232847-3-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cfa7847f150c4343903d8ff2cd219418c1768205'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060907_245530_948DBE5A 
X-CRM114-Status: UNSURE (   9.64  )
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

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDE1OjI0OjU2IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIHNob3VsZG4ndCBm
YWlsLiBXYWlsIGxvdWRseSBpZiBpdCBkb2VzIGFueWhvdy4KPiAKPiBUaGlzIG1hdGNoZXMgaG93
IG90aGVyIGRyaXZlcnMgKGUuZy4gbmFuZC9yYXcvbmFuZHNpbS5jKSB1c2UKPiBtdGRfZGV2aWNl
X3VucmVnaXN0ZXIoKS4KPiAKPiBCeSByZXR1cm5pbmcgMCBpbiB0aGUgcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIGEgZ2VuZXJpYyBlcnJvciBtZXNzYWdlCj4gYnkgdGhlIGRldmljZSBjb3JlIGlz
IHN1cHByZXNzZWQsIG5vdGhpbmcgZWxzZSBjaGFuZ2VzLgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJh
dGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
