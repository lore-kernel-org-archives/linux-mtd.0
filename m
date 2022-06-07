Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61BDC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aw/pOmyPu5I5eEd+ZzUAg2FlrbtOvYs5Ks56A4uXOK0=; b=Rw4JPGEHPPCtm6
	ui8d1ogPTorw/m22ffsk8PR1SJ1Df4om/LywNxWNIuno+2Zf310E7wtRpLn8jn0L5VmhstEQzV4nM
	8r3cZeimPfm150SYZVRcXOT9+QeN+SemdfDOl/PsqGUIE4pw+vDwpJXY687MuU3HHUymvoZ4+Oal4
	E5eeeT7z7rtuQMYrFRmuqUWC4e6qyk5fKUyAIxe3JexTsxD505xsBv9EENr0IMCn+Ef/66NTXqDiS
	R+ghaGgpTEilE/E0Tg6Uv8WhUhIlVkNdv8ZJX3Yj8ZluYFnJUEdtyQNXnJa47ZcexTKg0RXRaVleT
	Ah2LGxRdBQD9a/F5OBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5F-008GZF-KO; Tue, 07 Jun 2022 15:25:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyb5B-008GXI-DA
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 15:25:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4y-0003PZ-Kd; Tue, 07 Jun 2022 17:25:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4v-0071Ab-Ot; Tue, 07 Jun 2022 17:25:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyb4t-00En7S-MO; Tue, 07 Jun 2022 17:25:07 +0200
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
Subject: [PATCH 1/4] mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
Date: Tue,  7 Jun 2022 17:24:55 +0200
Message-Id: <20220607152458.232847-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
References: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; h=from:subject; bh=HKTCpAVmTDUjSLFUBAQZ76VBs7ELFOI+wXkFkLcsLag=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBin226LpfDiH0T0hYEEIB1znu6/w+1DNNcJX7f/OSj qEQC4KmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYp9tugAKCRDB/BR4rcrsCdw9B/ 46x0PPgpx3wop6fAOcrmseyP08mnvzEGSjjNjfg4UwMAGufIy/gYr2cudHnNGi0b7RGqAISa0CgTME Od56IQNhygaDZUKrsdne7dWGWQWqLW+CDad//owAPha09EcPsvH+uNMSXVQ1hJVVLsu1BtRQK0Hll8 DgzGAeZkeYM4NfV7K19z5y3iq6p7jziW2yBNfwvO0VofvG7J34iICQF72XuIGPapzQefdg0pJCUAdS qFQatQ2JZ7b6Qrz7OWDBdZsj0jssDMMlfW2IGBM5/40NVKkgN/PqXECV7VTksLwS/zA53weUFvrq/k utRvXblEkkWT5gJEQr/pyh7vjtVF3p
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_082525_567734_45D5C046 
X-CRM114-Status: GOOD (  13.69  )
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

Rm9yIGFsbCBidXQgb25lIGVycm9yIHBhdGggY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgaXMgYWxy
ZWFkeSB0aGVyZS4gQWRkCml0IHRvIHRoZSBvbmUgbG9jYXRpb24gd2hlcmUgaXQncyBtaXNzaW5n
LgoKRml4ZXM6IDQ4MTgxNWE2MTkzYiAoIm10ZDogc3Rfc3BpX2ZzbTogSGFuZGxlIGNsa19wcmVw
YXJlX2VuYWJsZS9jbGtfZGlzYWJsZV91bnByZXBhcmUuIikKRml4ZXM6IDY5ZDVhZjhkMDE2YyAo
Im10ZDogc3Rfc3BpX2ZzbTogT2J0YWluIGFuZCB1c2UgRU1JIGNsb2NrIikKU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0t
CiBkcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyB8IDggKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3Nw
aV9mc20uYwppbmRleCBkMzM3N2IxMGZjMGYuLjUyYTc5OWNhZTQwMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9z
dF9zcGlfZnNtLmMKQEAgLTIxMTUsMTAgKzIxMTUsMTIgQEAgc3RhdGljIGludCBzdGZzbV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQkobG9uZyBsb25nKWZzbS0+bXRkLnNp
emUsIChsb25nIGxvbmcpKGZzbS0+bXRkLnNpemUgPj4gMjApLAogCQlmc20tPm10ZC5lcmFzZXNp
emUsIChmc20tPm10ZC5lcmFzZXNpemUgPj4gMTApKTsKIAotCXJldHVybiBtdGRfZGV2aWNlX3Jl
Z2lzdGVyKCZmc20tPm10ZCwgTlVMTCwgMCk7Ci0KKwlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lzdGVy
KCZmc20tPm10ZCwgTlVMTCwgMCk7CisJaWYgKHJldCkgewogZXJyX2Nsa191bnByZXBhcmU6Ci0J
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGZzbS0+Y2xrKTsKKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KGZzbS0+Y2xrKTsKKwl9CisKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjM2LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
