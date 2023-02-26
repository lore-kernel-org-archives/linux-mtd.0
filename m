Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9521C7EE2D
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Feb 2023 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMoiIVVkhg4DKZtBD73KcT6Y+VhNfnNqRggn5CHfw+Y=; b=T3ey50/rmQPMoP
	WCvBnvX0T1e0jRAwUDFE2sG14om2dNHFG8u9a5Y0yV2tawbW6a7/HogMJUKvJaBEvh7/jUjOAFTFm
	LpUvYGXtTP1EnEbpaMnHMEPwoFf8VABv7Clgm1KQbA0uvf63uak5sCUqQRhgK5eAl9poBO3K/P7dq
	cYZGHWOweemiUO3uId/VaoBCx8Pbn97MfQZIMtzRWGIzSEezMwJISQ7UaBPO5dZd7/U3T35SuLSF0
	WGaULLt62TUCjt1BRv3orUGoizKO9t8/95/On4xnQ5IQ3nZXQm5oWr1aE2xWFrK1ByAkOgftgkR6r
	TKKySQrjn8UyWajFuZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWPUO-007vAd-Be; Sun, 26 Feb 2023 22:27:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWPUI-007v8B-FD
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2023 22:27:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pWPU0-0000v8-AW; Sun, 26 Feb 2023 23:27:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pWPTw-000Uba-C8; Sun, 26 Feb 2023 23:27:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pWPTv-000YPi-0o; Sun, 26 Feb 2023 23:26:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] mtd: maps: pismo: Convert to i2c's .probe_new()
Date: Sun, 26 Feb 2023 23:26:47 +0100
Message-Id: <20230226222654.1741900-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/0eiJPqFeurijjpkwmurJqwpYiXoK4/V9TBQsEVUx4E=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yRBq230DjtR0OENDTBnqh3jGbv7HQJOiXLd 6y9xrOx10OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vckQAKCRDB/BR4rcrs CTA9B/44dD9HbqxPEM1quEbcSClDz0+khag7g3WMiBZYqp0NQUhHoEzVubo0MNIW3eQntOL/jEr BUqYwmnu01MOnvQlonYfDZ9KYnGGSk8yeeoofU6PFw0HPe77Lax0squYs1gYyAAkO6x5MWKEdin 5lH5BwfSpcGaBD8JIj+/CkOUgD/9LCdlw7nhaRI+CaAZEUXGQELlHXUUgh7lUll+g5RfvmfNQJ2 OyWSx7t6ao355A1fdCMEB1f01euonq+Xqw3JhVxOA57vUxBj1qHaOACp0rDCN3TOGMITIj8w4vg aRiaTITHPGxGTNG0hBZmjBmtGs+/bL20DV3Bvq6rMUlq5291
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_142722_523187_8A6923F7 
X-CRM114-Status: GOOD (  14.68  )
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

VGhlIHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3QgbWFrZSB1c2Ugb2YgdGhlIGkyY19kZXZpY2VfaWQg
KiBwYXJhbWV0ZXIgc28gaXQKY2FuIGJlIHRyaXZpYWxseSBjb252ZXJ0ZWQuCgpBY2tlZC1ieTog
UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDIyMTExODIyNDU0MC42MTkyNzYtNDk3LXV3ZUBrbGVpbmUta29lbmln
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbXRkL21hcHMvcGlzbW8uYyB8IDUgKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbWFwcy9waXNtby5jIGIvZHJpdmVycy9tdGQvbWFwcy9waXNtby5jCmlu
ZGV4IDVmY2VmY2QwYmFjYS4uM2UwZmZmM2YxMjllIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9t
YXBzL3Bpc21vLmMKKysrIGIvZHJpdmVycy9tdGQvbWFwcy9waXNtby5jCkBAIC0yMDYsOCArMjA2
LDcgQEAgc3RhdGljIHZvaWQgcGlzbW9fcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
CiAJa2ZyZWUocGlzbW8pOwogfQogCi1zdGF0aWMgaW50IHBpc21vX3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQsCi0JCSAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQp
CitzdGF0aWMgaW50IHBpc21vX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJ
c3RydWN0IHBpc21vX3BkYXRhICpwZGF0YSA9IGNsaWVudC0+ZGV2LnBsYXRmb3JtX2RhdGE7CiAJ
c3RydWN0IHBpc21vX2VlcHJvbSBlZXByb207CkBAIC0yNjAsNyArMjU5LDcgQEAgc3RhdGljIHN0
cnVjdCBpMmNfZHJpdmVyIHBpc21vX2RyaXZlciA9IHsKIAkuZHJpdmVyCT0gewogCQkubmFtZQk9
ICJwaXNtbyIsCiAJfSwKLQkucHJvYmUJCT0gcGlzbW9fcHJvYmUsCisJLnByb2JlX25ldwk9IHBp
c21vX3Byb2JlLAogCS5yZW1vdmUJCT0gcGlzbW9fcmVtb3ZlLAogCS5pZF90YWJsZQk9IHBpc21v
X2lkLAogfTsKLS0gCjIuMzkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
