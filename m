Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A43C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sR4noA/kqBI19PsnlG1LKu9+GJMk9Wd+RhuM2ZDbXqU=; b=vC1dQbrxQzuCRa
	IUyO58rjY4QRtqVnt2yIKWV90SGRos1l5Vcfj7bTzLHtYtRpTK5EVY2Yfq8AhRVJvuMiTlFcaaOR8
	9Niz2JFV/g4KnPgX9dubE12eYuzbehLEpVPVEMv35VwATkjE+S8Eq2Yg1rX43cZgWNiF8aFSXyDuN
	qjir+UOTv1TsVpaUKh9vAN0fXlWS2hloHezh66S4fWrEKgJ18asYJ0VoEGVnUCwohyfN2vXlbDlyr
	c2QhN/dSksS0/CGsRWuxCuwgP4jL7kftIO5dw44N1Hf7HtAqrCQ3S56lBwj2TY+XQpc9BTOyVgwpU
	bmuFDXARLZ0Ku8AAvD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEX4-008h8d-Kp; Fri, 03 Jun 2022 21:08:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWn-008gyn-HP
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWe-0003rb-M0; Fri, 03 Jun 2022 23:08:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006HqY-TE; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-00E1Hl-Iw; Fri, 03 Jun 2022 23:08:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: kernel@pengutronix.de,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 12/14] mtd: rawnand: meson: Drop cleaning platform data in .remove()
Date: Fri,  3 Jun 2022 23:07:56 +0200
Message-Id: <20220603210758.148493-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=643; i=uwe@kleine-koenig.org; h=from:subject; bh=QI3xNybBVzTrq5z+h5wqtr2aUkInAgi2QgwCgBOyH0A=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfr83/o7FfahL01ZrKFGzLyTxREIUALxhkKpbDA hgwbbyeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp36wAKCRDB/BR4rcrsCcbtB/ 9tzRUJL7X+1CFqZr6hYdcWjFD4JcWnW0JkP7qh1eH+8w6aAFzxupJ1CLztI0A1zEZ7k2WWMoVinDk8 jfypWaP96xYn+xhu4BiEfqYNEeLmeuH6C+2ZES8DkVcjhoZphr2qQWaP8smQITC3nCSnoTmxoy3FPL 3ZXlf5qYxmgNbBmcoyNv/Wf6oRoowLSIFsZmmkYOVXl1pSjfj6l/xcsVRYnCjnFtB4PLIyn3+ghTRf Q5vMF60CgV1hcNgfctSJBwAfbojxm975Cfw2nF7B1LGqYeyIb2RQ811lIP4zGgqX8m4J7YBNkXMKzG h/uvhx4uFPaGJWzrUaQYE1+w1bvecs
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140817_607333_A2FD810E 
X-CRM114-Status: GOOD (  10.46  )
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

VGhlIGRyaXZlciBjb3JlIGNhcmVzIGZvciB1bnNldHRpbmcgcGxhdGZvcm0gZGF0YSAoc2VlCmRl
dmljZV91bmJpbmRfY2xlYW51cCgpKSBvbiByZW1vdmUuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwppbmRleCA3NDhlMTE1YjBiYjcuLjRl
NmQxYTZhMTljNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwpAQCAtMTQ0NSw4ICsxNDQ1
LDYgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAKIAltZXNvbl9uZmNfZGlzYWJsZV9jbGsobmZjKTsKIAotCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsIE5VTEwpOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMzYuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
