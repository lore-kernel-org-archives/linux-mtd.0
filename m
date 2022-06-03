Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78772C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CZGvovazcomFrcmlEqNk30LNJzzUENK5i2eYbZQpSw=; b=WI4qTKqsEMcPwi
	HuCmrD0NoZhp7f2r/9o/uJtxJ2FIsruFK7aJJBXDTeq1O2XYRfteE9R7GTDSPfHdn5Bs1V9vcVJ4I
	3RdcEYx2DzZq5SbgQ55WT25fOh42/CZdpsiz4YoaRr5Q4EYh9DsEBD8PbL5GJ/9CIYESF8KSz1zol
	qGaC9u3doShdnFz4oS5NV4hHl8lEyj+/jtW95YvCUYgRmUE38QV1JDDYqlWQN0Cb4YZqyVJxJzqk9
	nDB4A9cJbV6j7ifFlsN13n3ejC53UGy6xEcKlcH4TdqYGChioYnmZi9RbDHcIcbRb5bfzPLEKngjG
	BcAxzUEuV9p8G+5XQnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEX2-008h7Y-J8; Fri, 03 Jun 2022 21:08:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gvh-HD
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-0003rI-LJ; Fri, 03 Jun 2022 23:08:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006HqE-93; Fri, 03 Jun 2022 23:08:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-00E1Ha-1X; Fri, 03 Jun 2022 23:08:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 09/14] mtd: rawnand: omap2: Suppress error message after WARN in .remove()
Date: Fri,  3 Jun 2022 23:07:53 +0200
Message-Id: <20220603210758.148493-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210; i=uwe@kleine-koenig.org; h=from:subject; bh=ELG8qOjf2/T9BUL2Xunbya/g8RaDWFL7cEYLQyWIUOw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfh3iJ8plb1/Q61O2ouwowAkGC3KPMYhbWqs1xj 5IzXCk+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp34QAKCRDB/BR4rcrsCZJVB/ 9tjy90VzlJWaHRSpVKTHdUcNYSuJgj5Sx2BC/uCShaf8bf4vJBcbLyaPHDyb0RvfgmRiOzTf0xEn2i v8qaBtc49orUjrK0x3bO2mGotl8YCUkldTwLp+ATAViMznbBQdBW3K9JAu6CjO3SUrm+afhYjhWd4v icx+SsyTBv9cjyalNLJccI7YnRbas/CI13emtSmkQp7dCDKcfIY72UglPejhcv5CXb/pM/DLBam68k qq+IsTlp5Os+MRUDQCkwS0OHqR6rPxn8DSbY/FBVZdOw24dJa/0mOal6/sdMMxi16nsjMGm7Vzu4fg kgpS05sE40Z4bJrkSB+Nq3hbrKogPZ
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_675544_7DECC7A6 
X-CRM114-Status: GOOD (  15.27  )
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

UmV0dXJuaW5nIGFuIGVycm9yIHZhbHVlIGluIGEgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
c3VsdHMgaW4gYW4gZXJyb3IKbWVzc2FnZSBiZWluZyBlbWl0dGVkIGJ5IHRoZSBwbGF0Zm9ybSBj
b3JlLCBidXQgb3RoZXJ3aXNlIGl0IGRvZXNuJ3QgbWFrZQphIGRpZmZlcmVuY2UuIEFmdGVyIHRo
ZSBXQVJOIHNwbGF0IHRoaXMgZ2VuZXJpYyBlcnJvciBtZXNzYWdlIGRvZXNuJ3QgYWRkCmFueSB2
YWx1ZSwgc28gcmV0dXJuIDAgdW5jb25kaXRpb25hbGx5CgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L29tYXAyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9vbWFwMi5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYwppbmRleCA1OGMzMmExMTc5
MmUuLjRhOWYyYjZjNzcyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIu
YworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jCkBAIC0yMjc4LDE2ICsyMjc4LDE0
IEBAIHN0YXRpYyBpbnQgb21hcF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7
CiAJc3RydWN0IG5hbmRfY2hpcCAqbmFuZF9jaGlwID0gbXRkX3RvX25hbmQobXRkKTsKIAlzdHJ1
Y3Qgb21hcF9uYW5kX2luZm8gKmluZm8gPSBtdGRfdG9fb21hcChtdGQpOwotCWludCByZXQ7CiAK
IAlyYXduYW5kX3N3X2JjaF9jbGVhbnVwKG5hbmRfY2hpcCk7CiAKIAlpZiAoaW5mby0+ZG1hKQog
CQlkbWFfcmVsZWFzZV9jaGFubmVsKGluZm8tPmRtYSk7Ci0JcmV0ID0gbXRkX2RldmljZV91bnJl
Z2lzdGVyKG10ZCk7Ci0JV0FSTl9PTihyZXQpOworCVdBUk5fT04obXRkX2RldmljZV91bnJlZ2lz
dGVyKG10ZCkpOwogCW5hbmRfY2xlYW51cChuYW5kX2NoaXApOwotCXJldHVybiByZXQ7CisJcmV0
dXJuIDA7CiB9CiAKIC8qIG9tYXBfbmFuZF9pZHMgZGVmaW5lZCBpbiBsaW51eC9wbGF0Zm9ybV9k
YXRhL210ZC1uYW5kLW9tYXAyLmggKi8KLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
