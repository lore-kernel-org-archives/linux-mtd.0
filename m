Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F08BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3INMmThNG+YiGs06+aDJni+w2SXxSOwzvk45uHzQEfg=; b=hSjhavSGheVqVu
	1AFd8Elae/LmuhMzG4Y3HOAHon8vM7oR1iU8LbXyx1UmeyluB1cr54F07N3z29Uh6Evty5eatPFhk
	pZruT6iP3K3X1ToC9lhR93ZruKA8zqg0Mn6xKbmgbA2zkfIhAJ89QNpw/PNiYvCBN/1pid9d7q6X5
	U71XRrM4N5sVAr0Lue8KTnePozfCH70anJH7/Y/2Bk0+avbBBv8ohwO5ye34IN1CfayIAFDWBc6Zv
	wPHbrniSKTdkEw1eWBQgn1WoJ8yEh4wRx5CI4C7L4IIYCEp7AuSRjJHG0bWzuWK+p+TeIP+4SxvkO
	ONivHVHYir8D8RzBU3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5N-008Gbp-Ia; Tue, 07 Jun 2022 15:25:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5B-008GXH-DC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 15:25:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4y-0003PV-Kc; Tue, 07 Jun 2022 17:25:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4v-0071AX-MQ; Tue, 07 Jun 2022 17:25:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4t-00En7P-HE; Tue, 07 Jun 2022 17:25:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/4] mtd: st_spi_fsm: Some fixes and improvements
Date: Tue,  7 Jun 2022 17:24:54 +0200
Message-Id: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; h=from:subject; bh=cHPFe/kBFJjHhLiRNLwRbZ27pyrkz7rwFvOu4o4ZE0E=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBin222+sysoOLjC672rZTcaTTeEHWdRswwc56jwVd1 XgKFDd+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYp9ttgAKCRDB/BR4rcrsCY7iB/ 4s4TrDNU3neJrWD7EoQRGZpMsXcs/TuIhtkLLWRrvI1R2R8Ibx90jgIvRLcaUekVhKsmzRYXIOpZpP eQUknVzFCt75i5QJgcEYXvZScpD4vBk0o1QTFgv3p2+pejCJ+ZpeksdgHo2RCYnTqXSg9j/HbkozL/ NlYeZ5Z6kK9QviB7YxJVqcBLUbCHbKzwY93i7hkGX9x0P+0gN11CWy3dH3lO/sCmdX4IJxLALfMkYb csR/i7zm4Z4d98OiMtvlZpsjdm1rnP4QZ3n0ASHGxttMh7lQOr1/i+9UJyTZSeyNsXKxUIlIH34ZlG XLE4LSoORtvnhk6kqEzbc8r4uyeRcF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_082525_559559_F97EAEA8 
X-CRM114-Status: GOOD (  12.99  )
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

SGVsbG8sCgpteSBpbnRlbnRpb24gd2FzIHRvIGp1c3QgcmVzZW5kCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8yMDIyMDYwMzIxMDc1OC4xNDg0OTMtNS11LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGUKYmVjYXVzZSBhZnRlciBhIGNoYW5nZSB0aGF0IHdhcyBtZXJnZWQgZm9y
IDUuMTktcmMxIHRoaXMgcGF0Y2ggZGlkbid0CmFwcGx5IGFueSBtb3JlLiBXaGlsZSBwcmVwYXJp
bmcgdGhpcyB1cGRhdGUsIEkgbG9va2VkIGEgYml0IHRvbyBkZWVwCmludG8gdGhlIGRyaXZlciBh
bmQgaWRlbnRpZmllZCBhIGZldyBtb3JlIHBhdGNoIG9wcG9ydHVuaXRpZXMuCgpJIGNvbnNpZGVy
ZWQgc3dhcHBpbmcgdGhlIG9yZGVyIG9mIHBhdGNoZXMgIzIgYW5kICMzIGJlY2F1c2UgIzMgaXMg
YSBmaXgKd2hpY2ggIzIgaXNuJ3QuIEJ1dCBkb2luZyB3b3VsZCByZXF1aXJlIGEgaGVscGVyIHZh
cmlhYmxlIGFkZGVkIHRvCi5yZW1vdmUoKSBpbiAjMiB0aGF0IHRoZW4gaXMgcmVtb3ZlZCBhZ2Fp
biBpbiAjMy4gSWYgeW91IGZlZWwgc3Ryb25nCmhlcmUgKGUuZy4gYmVjYXVzZSB5b3UgdGhpbmsg
IzMgc2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlIGJ1dCAjMgpzaG91bGRuJ3QpLCBJIGNh
biByZXdvcmsgYWNjb3JkaW5nbHkuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5p
ZyAoNCk6CiAgbXRkOiBzdF9zcGlfZnNtOiBBZGQgYSBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBp
biAucHJvYmUoKSdzIGVycm9yIHBhdGgKICBtdGQ6IHN0X3NwaV9mc206IFdhcm4gYWJvdXQgZmFp
bHVyZSB0byB1bnJlZ2lzdGVyIG10ZCBkZXZpY2UKICBtdGQ6IHN0X3NwaV9mc206IERpc2FibGUg
Y2xvY2sgb25seSBhZnRlciBkZXZpY2Ugd2FzIHVucmVnaXN0ZXJlZAogIG10ZDogc3Rfc3BpX2Zz
bTogU2ltcGxpZnkgZXJyb3IgY2hlY2tpbmcgaW4gLnByb2JlKCkgYSBiaXQKCiBkcml2ZXJzL210
ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyB8IDIzICsrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1p
dDogZjI5MDZhYTg2MzM4MWFmYjAwMTVhOWViN2ZlZmFkODg1ZDRlNWE1NgotLSAKMi4zNi4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
