Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B52C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/nsjGeZZzZqs7Z489x6TKcHavCimtI7uRRqoWs5g7w=; b=cbP/sZ5UJ5LQLJ
	nTmRAuZ7n4eP22F4hJf4+xd75IaCAgO+mHrLWdRo2+b9SKc7EtQj11M775YChlK7Vp6FsVXdxDRUV
	tA6hE+LOnF5UjvZGCIQBi++tG7GDPLhF65d1O5+xyLuWI18pyGfFrJk/t1Vri7CoxK08tdyQy4zn+
	VhgPtyVuhjV6s7NoF3EqhIEuBdLFuFG+Jggp9F59HgwHQoZvaCyyRwaYi/1tHcPt54BbZzWoGP6BZ
	TqaFAauLLBt+Haw+pvLDGCnLh9Wp/4GekvBG6eeN4LyohNlr32RcFEvRg3AypoFMfo/Q0fLKrq6No
	QyOPUGV3LUgON7KCi4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEXw-008hpQ-6f; Fri, 03 Jun 2022 21:09:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWo-008gz1-0i
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWf-0003rl-JF; Fri, 03 Jun 2022 23:08:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006Hqb-Ub; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-00E1Hd-7g; Fri, 03 Jun 2022 23:08:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/14] mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister() failed
Date: Fri,  3 Jun 2022 23:07:54 +0200
Message-Id: <20220603210758.148493-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=uwe@kleine-koenig.org; h=from:subject; bh=irb1oiaimsbDKo87nqTOgZKRASJYgqZ1ZPCZwfsS6XY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnflbW3ealPvT9b+g3B+cAJsmzQc8G+AdxD7vvKD MCcxz0yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp35QAKCRDB/BR4rcrsCXtNB/ 48c7Jbr99RVPnriaCqngFSv8q/ISnJI5bbk7lzv40z/dlUnOd1vh7n0ep/VZVJyJ/1T9VxPAx1c33r 6sXHxkWURm0mExha/gkghuyl3HWSLRvfucWjnCRr+zGrUqJlAC4l347mg8oVxl9wo3tAiXS4E7Kk4I p9VeaeRccRlOS+9sV5aU968/ba+OoRWW/aTPSqE896XnKMst29bbH8vaosKMrpos+p8mSnYfRn24yP blX5FD8jmCmWkp2iYoNIhaiJ8kSwAS9SQA+ai1VjeCVTP9ns37N2ME6U0wvbtgdsJQcBPasU9qHg7V NQOyhmC7HM9x8iqUH8o5OoB+8Fu3gG
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140818_095926_EE60D9B5 
X-CRM114-Status: GOOD (  13.49  )
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

SWYgbXRkX2RldmljZV91bnJlZ2lzdGVyKCkgZmFpbHMgKHdoaWNoIGl0IGRvZXNuJ3Qgd2hlbiB1
c2VkIGNvcnJlY3RseSksCnRoZSByZXNvdXJjZXMgYm91bmQgYnkgdGhlIG5hbmQgY2hpcCBzaG91
bGQgYmUgZnJlZWQgYW55aG93IGFzIHJldHVybmluZwphbiBlcnJvciB2YWx1ZSBkb2Vzbid0IHBy
ZXZlbnQgdGhlIGRldmljZSBnZXR0aW5nIHVuYm91bmQuCgpJbnN0ZWFkIHVzZSBXQVJOX09OIG9u
IHRoZSByZXR1cm4gdmFsdWUgc2ltaWxhciB0byBob3cgb3RoZXIgZHJpdmVycyBkbwppdC4KClRo
aXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3Mg
cmV0dXJuIHZvaWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25h
bmQuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMKaW5kZXggYjM2ZTUyNjBhZTI3Li5lMTJm
OWY1ODBhMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYwor
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMKQEAgLTEyMjMsMTEgKzEyMjMs
OCBAQCBzdGF0aWMgaW50IHRlZ3JhX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJc3RydWN0IHRlZ3JhX25hbmRfY29udHJvbGxlciAqY3RybCA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBjdHJsLT5jaGlwOwog
CXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Ci0JaW50IHJldDsKIAot
CXJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcihtdGQpOwotCWlmIChyZXQpCi0JCXJldHVybiBy
ZXQ7CisJV0FSTl9PTihtdGRfZGV2aWNlX3VucmVnaXN0ZXIobXRkKSk7CiAKIAluYW5kX2NsZWFu
dXAoY2hpcCk7CiAKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
