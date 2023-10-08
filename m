Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB6DE95A67
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcQSForEAZ/xgyIB2tU0wjOu4AR3ramZeG7m/4cfaJY=; b=TN4xFSVKzV5Y1g
	KbNgMmqGtlIaVBw3kyfDk5Bxron6hpe/F41S9UWljJVM3Nk20nw/sAs+1s7AcVXVa3GKypfqBOFwa
	hpiW3ESZBGYe0V9n5U7ZjOhyNA6vjOMAbY70S799buUFr2ENaVrP64oOSvAnNWnkrvhqZFL0hNjuw
	wZIWi4lBXFeKXotL4SrHl1hQ1o9bTVa4nK5rrxCQvTNxdDUkcgzM01oy99SGg85Wa9KkAbxJQX9Tr
	97mgBSE1xpbWgX9JEmHRbzEZIRzeenBGtOTCLokohaSzL7NHy1cZg8fUS3KvXRJCBApwyA4F8rVEN
	HSdToQnQpT0ojqhh5IgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyf-009Dyg-29;
	Sun, 08 Oct 2023 20:02:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyW-009Dsx-2i
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-0001Vx-F8; Sun, 08 Oct 2023 22:01:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-000Eza-Mr; Sun, 08 Oct 2023 22:01:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-00Bf0R-DR; Sun, 08 Oct 2023 22:01:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 08/20] mtd: st_spi_fsm: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:31 +0200
Message-Id: <20231008200143.196369-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=taKSLyrtiZ/aWfzzQN03pzzpl0OhZd0TTf8sHTQ4/Js=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqH82SkTGuXuQdE6iky31HtMIyWjMxY6IJxk 4kZqaMSEQ2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKhwAKCRCPgPtYfRL+ Ts9uB/96qyvsz7FFJW1wf/v+IxQVKs8hGB0NKFLvNldMo9Wji1GrQf2B7EV3BNRga+shXFYhq6d v6usFJ963fvVxv5HqusbML17J5/Y6qCJuwjvCa108X/J5ro26eTJ83N1KkVT5RDW1JIrLFCnhoQ SSwtFpUM+C5DTPAXY9gtFS2fLTjuiScUGBK6/W51wRD45oFGSN/twV6nOGGu1LlBhVfsEx3ISuM SB0h7zPDlOqZj1qorOrwy7W+Dpbf6uSgJzja3hqt2IfXyAq0sgNwFzzeHE/LDZHP8wNx8VZeMv9 4Zb5jpZztdwqKxpu1FCN2OwJjTtXzTQ4q6K+RXNCzb/U5LQ3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130204_874535_E5D6D439 
X-CRM114-Status: GOOD (  15.65  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMK
aW5kZXggOTU1MzBjYmJiMWUwLi4zMjY4ZGU1ZmM3ODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L2RldmljZXMvc3Rfc3BpX2ZzbS5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2Zz
bS5jCkBAIC0yMDk3LDEzICsyMDk3LDExIEBAIHN0YXRpYyBpbnQgc3Rmc21fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gbXRkX2RldmljZV9yZWdpc3RlcigmZnNt
LT5tdGQsIE5VTEwsIDApOwogfQogCi1zdGF0aWMgaW50IHN0ZnNtX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgc3Rmc21fcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHN0ZnNtICpmc20gPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKIAogCVdBUk5fT04obXRkX2RldmljZV91bnJlZ2lzdGVyKCZmc20tPm10
ZCkpOwotCi0JcmV0dXJuIDA7CiB9CiAKICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKQEAgLTIxMzQs
NyArMjEzMiw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0ZnNtX21hdGNoKTsKIAogc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3Rmc21fZHJpdmVyID0gewogCS5wcm9iZQkJPSBz
dGZzbV9wcm9iZSwKLQkucmVtb3ZlCQk9IHN0ZnNtX3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IHN0
ZnNtX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSAic3Qtc3BpLWZzbSIsCiAJCS5v
Zl9tYXRjaF90YWJsZSA9IHN0ZnNtX21hdGNoLAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
