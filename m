Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA5FC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBvou3neFyLaP5DgZoxTX60ExLmR9YKC23ABHRYYlzg=; b=qY6+Y+KOVFjkmy
	f+5/RptqPPvtKuTG0eZ9g92EFiYErqI98RpBr1dFlEHHVOlukrqW9lxjvavZkoCjhBzLBDzc2haBf
	j70AZPj05L8boTHypQxgso9VOR7wbfg3GENBh2p2e0PhSZ1vUli7rL85/JZswx9lw4UBnXJRy5CZQ
	nKcmpgDGMERyqZpiDECyU+6S+ihQWygh78p5aCHwLs/twuo+XVPaF7RURl4XczYXnQbIu3ooEVA+U
	ePa9AW6n/wEHX5bGuoM7L7byByqUiUwwnqsvjuxB7KGnWytdl11Z7chAd8Phuy7OBzH6bI84x4q49
	dK0yYrtLqDcvEH4F4U6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHzE-0023GQ-AS; Thu, 09 Jun 2022 13:14:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvR-0020nP-BM
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:10:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 53A35FF804;
	Thu,  9 Jun 2022 13:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fZAr2WPn2Py9dO/VBavVCMnAy5wPwAECGiY0a3kUsg=;
	b=ZDRKTntDgyN2Q9veYOQT2FbPId0LDe/mYJCHaynrZYYAJ57KnKA7bQCzf8WS6Jks2zPcWz
	yZj1fkDVUz2IMMlFx3rYyySimRb/SiLl8itygydaNeH1XoYNRstAdZosQLVoEql9g3GpCZ
	umFzBWmh9Qo3rBAgo7lAaBC7Fc7cN7pa1umWWHPNoUg/c7l/LJz5kFKzTGtLTrGAz+W3zU
	uToqCWz8vnYrDng13iPj7L3Oc0ZeglwtXhQwtu8zHF00dqxPyKQVwgTK8ap4iGtlLKhbfE
	rJ0UhGGrrAwj5wrpJTTCi/1HmJPDjD9LEoo43Kmuk1hXnUFYhM73qY8s1WChSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 01/14] mtd: hyperbus: Make hyperbus_unregister_device() return void
Date: Thu,  9 Jun 2022 15:10:09 +0200
Message-Id: <20220609131009.293455-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-2-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0c90466a7985d39355f743e9cd2139da3e86c4d8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_061013_567595_673A12CC 
X-CRM114-Status: UNSURE (   9.23  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjQ1IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSBvbmx5IHRoaW5nIHRoYXQgY291bGQgdGhlb3JldGlj
YWxseSBmYWlsIGluIHRoYXQgZnVuY3Rpb24gaXMKPiBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoKS4g
SG93ZXZlciBpdCdzIG5vdCBzdXBwb3NlZCB0byBmYWlsIGFuZCB3aGVuCj4gdXNlZCBjb3JyZWN0
bHkgaXQgZG9lc24ndC4gU28gd2FpbCBsb3VkbHkgaWYgaXQgZG9lcyBhbnlob3cuCj4gCj4gVGhp
cyBtYXRjaGVzIGhvdyBvdGhlciBkcml2ZXJzIChlLmcuIG5hbmQvcmF3L25hbmRzaW0uYykgdXNl
Cj4gbXRkX2RldmljZV91bnJlZ2lzdGVyKCkuCj4gCj4gVGhpcyBpcyBhIHByZXBhcmF0aW9uIGZv
ciBtYWtpbmcgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4gdm9pZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
