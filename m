Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D789CC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyvLblC+a7O+wEncHeKA0ws3UeZt6bFt0gm5uhiwhqE=; b=XVqEfhpq+3cuT+
	ivO+cW8Ig3aVHx+fo5o8dWqawrmK7EaA3VooKBTLf5n2FBQITO/7ju/GADuhTLvszzw37Rp5D1htr
	EzMTXn9L1t8yehuVYiq8HX+isvpIKfglsxTS0wGzA0Mai1lUzokk0M/w9xKenOcfUpaHpKYtL49pv
	Bfk1Tulj1mtS8QIJT3jH2X6vJMRlQe7S2no5lvhE0WIrOamfwZxKtqILBc4k9kkKiOB5Sv5qWysg9
	S4NxvtP22b838F/vaPexHadvKGF4KY55XFL1fTweogF4DJBdkAbl7CY0muNgB3tSJeYOByGt8gXsl
	tYXbdHS9cXzQzl40VJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmP-00ALkO-14;
	Thu, 02 Nov 2023 22:03:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmL-00ALiO-1a
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 22:03:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmF-0007aH-As; Thu, 02 Nov 2023 23:02:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmE-006AFR-TQ; Thu, 02 Nov 2023 23:02:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmE-00BwFP-KL; Thu, 02 Nov 2023 23:02:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 3/4] mtd: rawnand: txx9ndfmc: Drop if block with always false condition
Date: Thu,  2 Nov 2023 23:02:50 +0100
Message-ID: <20231102220246.3336154-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
References: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EOT4tuoYaMGSiz+JGI2Ssxi6EmaUfL7o6Fw82PZD52g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlRByKou9+xizm8HLMJz+dsQRL5X61f16Uo+229 qPCQTPU0FiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUQcigAKCRCPgPtYfRL+ TmCCB/sGljuBzeR6FWB628pi2wpEKzOdYYmsNGi4QxjG0kOsKm+HMRq2ofdo0rFw3vi4oQLZedk 420WRmMonLnPenyUT6beBJTF07Dw+YBiiTuKnfgZchrv3YAIdI2kW5c7pm5jz5Hdadli2vTBR+D 8ml2eIIsS5aY1p1PayEft9xw3LSr4pEiBG3Sa4+R7KlcjbNYZfEjERaCNhKvklJriRH2fnh0Am6 NrQOkwFagzqX/AmaxmI/dyX0odxdFCbsTDAAKegUo3rIXhdVcFDHxgrpxqIwH0Wi9sss1NmQyyy 63fcRzLRyV8wO8W7OTvxb1uIX7qUikdit0XvCfKwdBKBK3jZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_150305_550855_F92DAB30 
X-CRM114-Status: GOOD (  12.78  )
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

dHh4OW5kZm1jX3JlbW92ZSgpIGlzIG9ubHkgY2FsbGVkIGFmdGVyIHR4eDluZGZtY19wcm9iZSgp
IGNvbXBsZXRlZApzdWNjZXNzZnVsbHkuIEluIHRoaXMgY2FzZSBwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YSgpIHdhcyBjYWxsZWQgd2l0aCBhCm5vbi1OVUxMIGFyZ3VtZW50IGFuZCBzbyBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YSgpIHdvbid0IHJldHVybiBOVUxMLgoKU2ltcGxpZnkgYnkgcmVtb3ZpbmcgdGhl
IGlmIGJsb2NrIHdpdGggdGhlIGFsd2F5cyBmYWxzZSBjb25kaXRpb24uCgpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5k
Zm1jLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYwppbmRleCA5ZDZjNjJmNzNi
YjcuLmZkY2RmYmVhMGNiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5k
Zm1jLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMKQEAgLTM3NCw4ICsz
NzQsNiBAQCBzdGF0aWMgaW50IHR4eDluZGZtY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2KQogCXN0cnVjdCB0eHg5bmRmbWNfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKGRldik7CiAJaW50IHJldCwgaTsKIAotCWlmICghZHJ2ZGF0YSkKLQkJcmV0dXJu
IDA7CiAJZm9yIChpID0gMDsgaSA8IE1BWF9UWFg5TkRGTUNfREVWOyBpKyspIHsKIAkJc3RydWN0
IG10ZF9pbmZvICptdGQgPSBkcnZkYXRhLT5tdGRzW2ldOwogCQlzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwOwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
