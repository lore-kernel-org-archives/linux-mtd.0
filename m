Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37965C4167D
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZNcy4GHUVEFrvsd9XppHt2nzJ1BWfWzBpUOdFpfCK4=; b=PYIvzeeanTykGp
	YOKfi229E40qjLA8OoWSakLKuQaw0WLYFV79s65h9I7G6Xbd8nAEvObf8yUKNQfCqu9Std+BhgeGg
	kreJueUSsR8pkj13CXQKmPSbb2I8ToPRL4L3pOVx+aO6UJHxBqiavEt4y2QNIIYFq6iV+fouzHbrY
	8eLyPoEjxU1CHphjtAHfYbIwGlGyxgEzeNgIVgt9WTRdF2CdLpR+dfC+fcctLSp66kfxCrwTPPvDB
	1lY9z2TdUeYiQWmm5uypc0Yeh6H8PAr0vqpR3nCaOrUsEzTwzXBdGC8TBKOHFZHstQ1u+T84JBR9m
	Efyq6Vi7pxzue3YKJhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmP-00ALkZ-2u;
	Thu, 02 Nov 2023 22:03:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmL-00ALiM-1a
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 22:03:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmF-0007aF-As; Thu, 02 Nov 2023 23:02:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmE-006AFO-NK; Thu, 02 Nov 2023 23:02:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmE-00BwFM-E7; Thu, 02 Nov 2023 23:02:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 2/4] mtd: rawnand: txx9ndfmc: Switch to module_platform_driver()
Date: Thu,  2 Nov 2023 23:02:49 +0100
Message-ID: <20231102220246.3336154-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
References: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6xjRnuAJZOMfkJTn+JXYvJb5E8qnnbDD2dIX8hPRFPs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQXmc47MkmhbaJvSvebMdZN4PmUqmta2Cxq9sPvj7X8i TPzbeM6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIJn/2P5x20zyUzlRIuhz6 7fBfXZGr5diFV9ZMu2rv2/1Wt16mHeH7KDP1VlBY0fqqGQu9fzAuWvZfK1RJWPBLbvl8tqfWHf0 z/WZLLjM1mF4Xkp7yqqFEXGdO6oVpd89/yJh8ScBn5Z5GnsZIXa49qhksXQxSkTNjRLQ2yl3a+3 LKe7Hvxxp4/952qtf8uGPupDqGaj355+aX+XsZtwU7rT+uOKkiWtjORXif9pVurSfXUlOPRd+Mc xJk2lUQpOkmP7FPrnr5Mz3TKWs1FExfXi+WqF5ovd51QYvsBM5rBxPP8/7K0S7mzNLtPH5H6TvD 6cUtZgd9/h+fdN9vQzPTQ10HGZ5XW1Y8aJ92WmlxuSc7AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_150305_554191_C15DD727 
X-CRM114-Status: GOOD (  16.46  )
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

V2hpbGUgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpIG9mZmVycyB0aGUgcG9zc2liaWxp
dHkgdG8gZGlzY2FyZAoucHJvYmUoKSBhbmQgLnJlbW92ZSgpIGluIHNvbWUgc2l0dWF0aW9ucywg
dGhlIGhhbmRsaW5nIGlzIGRpZmZpY3VsdCBhbmQKaW4gdG9kYXkncyBzeXN0ZW1zIHRoZSBmZXcg
aHVuZHJlZCBieXRlcyB0aGF0IGNhbiBiZSBzYXZlZCBoYXZlIGxpdHRsZQppbXBvcnRhbmNlLiBT
byBjb252ZXJ0IHRoZSBkcml2ZXIgdG8gYmUgYSBub3JtYWwgZHJpdmVyIHRoYXQgY2FuIGJlCmJv
dW5kIGFuZCB1bmJvdW5kIGF0IHJ1bnRpbWUgYXMgbW9zdCBvdGhlciBkcml2ZXJzLCB0b28uCgpT
aWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3R4eDluZGZtYy5jCmluZGV4IGVkZGNjMDcyOGE2Ny4uOWQ2YzYyZjczYmI3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYworKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYwpAQCAtMjc2LDcgKzI3Niw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyX29wcyB0eHg5bmRmbWNfY29udHJvbGxlcl9vcHMgPSB7
CiAJLmF0dGFjaF9jaGlwID0gdHh4OW5kZm1jX2F0dGFjaF9jaGlwLAogfTsKIAotc3RhdGljIGlu
dCBfX2luaXQgdHh4OW5kZm1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKK3N0
YXRpYyBpbnQgdHh4OW5kZm1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIHsK
IAlzdHJ1Y3QgdHh4OW5kZm1jX3BsYXRmb3JtX2RhdGEgKnBsYXQgPSBkZXZfZ2V0X3BsYXRkYXRh
KCZkZXYtPmRldik7CiAJaW50IGhvbGQsIHNwdzsKQEAgLTM2OSw3ICszNjksNyBAQCBzdGF0aWMg
aW50IF9faW5pdCB0eHg5bmRmbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQog
CXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IF9fZXhpdCB0eHg5bmRmbWNfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKK3N0YXRpYyBpbnQgdHh4OW5kZm1jX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHR4eDluZGZtY19kcnZkYXRhICpk
cnZkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQgcmV0LCBpOwpAQCAtNDA3
LDE0ICs0MDcsMTQgQEAgc3RhdGljIGludCB0eHg5bmRmbWNfcmVzdW1lKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKmRldikKICNlbmRpZgogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB0
eHg5bmRmbWNfZHJpdmVyID0gewotCS5yZW1vdmUJCT0gX19leGl0X3AodHh4OW5kZm1jX3JlbW92
ZSksCisJLnByb2JlCQk9IHR4eDluZGZtY19wcm9iZSwKKwkucmVtb3ZlCQk9IHR4eDluZGZtY19y
ZW1vdmUsCiAJLnJlc3VtZQkJPSB0eHg5bmRmbWNfcmVzdW1lLAogCS5kcml2ZXIJCT0gewogCQku
bmFtZQk9ICJ0eHg5bmRmbWMiLAogCX0sCiB9OwotCi1tb2R1bGVfcGxhdGZvcm1fZHJpdmVyX3By
b2JlKHR4eDluZGZtY19kcml2ZXIsIHR4eDluZGZtY19wcm9iZSk7Cittb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKHR4eDluZGZtY19kcml2ZXIpOwogCiBNT0RVTEVfTElDRU5TRSgiR1BMIik7CiBNT0RV
TEVfREVTQ1JJUFRJT04oIlRYeDkgU29DIE5BTkQgZmxhc2ggY29udHJvbGxlciBkcml2ZXIiKTsK
LS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
