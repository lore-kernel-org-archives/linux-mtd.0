Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94019C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kduUfWXWqdx1wfbsKopDMpl4q5uskySu6LXnFyiQ4TU=; b=2bNOKyw7dLjuOq
	1BsyBAFOp2Hq8z0xaznkLIywYTis9DimuBm7Gp8pG5NEizWnepHoT95bH43zBZAktKY3KtrjzAtln
	8Qoz8tNdDnqcdnQf+a2EYAGq2k/rPaQ0D4qZofVaohGtffLvADzpsoifCDmzadbm4CT/MuOky4TEl
	hUjM/BkcEdY9G81s7hFpGQhH4YN6Q8RbSjlV6GOgCZ9nLF0xCzeJKFEiSsBOtuHH9QSzm7565cEPA
	Gor2aq7IxGax8GAoZV8ggxO5spTGxNAmC6MqGfbRegXQqRuKJtv9EDJ6yFo9tM9q+QptjRexx1JV6
	QBWMedwNchUh8iF8Cymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5H-008GaC-DM; Tue, 07 Jun 2022 15:25:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5B-008GXJ-D9
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 15:25:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4y-0003Pp-Ka; Tue, 07 Jun 2022 17:25:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4w-0071Al-8Y; Tue, 07 Jun 2022 17:25:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4u-00En7b-7z; Tue, 07 Jun 2022 17:25:08 +0200
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
Subject: [PATCH 4/4] mtd: st_spi_fsm: Simplify error checking in .probe() a bit
Date: Tue,  7 Jun 2022 17:24:58 +0200
Message-Id: <20220607152458.232847-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
References: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; h=from:subject; bh=o5H1jC7/6G9wlRAh5/csKl0ZFZFqRyIpFnfdF8rC0pU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBin23Hif/h8sszQ/5gU9lgiqo0TFSnlN85VYBFX6tE EeFjTXyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYp9txwAKCRDB/BR4rcrsCcDwB/ sFIRSuv/YlesaXanjXgheqm/3VggT14p3BFdymqLykFQUYfdSBFA0tOr9rhiAz4tiKwVGmXZTiYbdn 8FlxlloPO2Co64vYJBSRDGOCQgYxn1wfz8n3eOpoxirkPfF2rolx00gBxhmtzglJIeu/GFKkB3h/Uf chAsfAyi5/n0JZJpD3u1XU2mqwTU0p/qZumMMwLzPuZs6BYIduTglJTFB7KcTjVzVQwJwq8+ra2CNH rGW30oRofRM5Pgc8wPOIh/9lO2rFtnsxxy6mO/XT2B8x2sDSBJHL9VFLFWcWjYLS1uVscb+usvZg0i Hn5CR/Wu5OudY7M6FDEt3SLKIy3wmS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_082525_556022_977F6C7B 
X-CRM114-Status: GOOD (  15.76  )
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

SW5zdGVhZCBvZiBlbmRpbmcgZWFjaCBpZiBicmFuY2ggd2l0aCB0aGUgc2FtZSBjaGVjaywgZG8g
aXQgb25jZQp1bmNvbmRpdGlvbmFsbHkgYWZ0ZXIgdGhlIGlmIGJsb2NrLgoKU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0t
Ck5vdCBlbnRpcmVseSBzdXJlIHRoaXMgaXMgYW4gb2JqZWN0aXZlIGltcHJvdmVtZW50LCBidXQg
SSBsaWtlIGl0IGJldHRlcgp0aGlzIHdheS4KCkl0IGNvdWxkIGJlIHNob3J0ZWQgb25lIHN0ZXAg
ZnVydGhlciBieSBkb2luZwoKCXJldCA9IChpbmZvLT5jb25maWcgPzogc3Rmc21fcHJlcGFyZV9y
d2Vfc2Vxc19kZWZhdWx0KShmc20pOwoJaWYgKHJldCkKCQlnb3RvIGVycl9jbGtfdW5wcmVwYXJl
OwoKYnV0IElNSE8gcmVhZGFiaWxpdHkgc3VmZmVycyBoZXJlLgoKIGRyaXZlcnMvbXRkL2Rldmlj
ZXMvc3Rfc3BpX2ZzbS5jIHwgMTEgKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNl
cy9zdF9zcGlfZnNtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwppbmRleCA5
ZjZkNGRkOGJhZGUuLjU0ODYxZDg4OWMzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNl
cy9zdF9zcGlfZnNtLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKQEAg
LTIwODQsMTUgKzIwODQsMTIgQEAgc3RhdGljIGludCBzdGZzbV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCSAqIENvbmZpZ3VyZSBSRUFEL1dSSVRFL0VSQVNFIHNlcXVlbmNl
cyBhY2NvcmRpbmcgdG8gcGxhdGZvcm0gYW5kCiAJICogZGV2aWNlIGZsYWdzLgogCSAqLwotCWlm
IChpbmZvLT5jb25maWcpIHsKKwlpZiAoaW5mby0+Y29uZmlnKQogCQlyZXQgPSBpbmZvLT5jb25m
aWcoZnNtKTsKLQkJaWYgKHJldCkKLQkJCWdvdG8gZXJyX2Nsa191bnByZXBhcmU7Ci0JfSBlbHNl
IHsKKwllbHNlCiAJCXJldCA9IHN0ZnNtX3ByZXBhcmVfcndlX3NlcXNfZGVmYXVsdChmc20pOwot
CQlpZiAocmV0KQotCQkJZ290byBlcnJfY2xrX3VucHJlcGFyZTsKLQl9CisJaWYgKHJldCkKKwkJ
Z290byBlcnJfY2xrX3VucHJlcGFyZTsKIAogCWZzbS0+bXRkLm5hbWUJCT0gaW5mby0+bmFtZTsK
IAlmc20tPm10ZC5kZXYucGFyZW50CT0gJnBkZXYtPmRldjsKLS0gCjIuMzYuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
