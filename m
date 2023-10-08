Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CF6E95A98
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHjcpBqWz0Y1CZbIhxYMY7ct6t9hDFOJpQgd4VjljjQ=; b=MVT3r46mRvh9SK
	J4RgOpSVNnOrISwjd+cBa3KZuZ/aildKsdAwBiOqCPlYwwmIEahekgn3kyqi+8HhcocyD30XF4ELN
	NVTRUU5QcA6d3cLOrwKIYRCTjHbjHyBPui452X7WskFtzDbOttjlH8HfEYRWU/f/KoNy5RWF2CLxZ
	Q3KRiKAzJKasMggchbWNsRbr///ZQWFY2LSD1CtOQBzOmFUMB4yaGJBRdDTAGtWObHnw978W/MQcy
	9rTFFVeXg4aAnEgkgsCNv4aFzpsEw4el95Y0Mh1XdK/BzAg28F91Cp/Zu9eKGgyCAR88E5tsS3phj
	qTzgEJE9sWS1IwhqIB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyn-009E5k-0i;
	Sun, 08 Oct 2023 20:02:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyf-009Dxj-0G
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyS-0001jy-7z; Sun, 08 Oct 2023 22:02:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyR-000F0J-6O; Sun, 08 Oct 2023 22:01:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-00Bf1I-TB; Sun, 08 Oct 2023 22:01:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 20/20] mtd: spi-nor: nxp-spifi: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:43 +0200
Message-Id: <20231008200143.196369-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=naz45ZlLPwuwObvGjtIvJZJclRSSvFqpgxi8Vbmk5oQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqgidnwISLnn2wlQt26cGtIzR7Y6RfHiW5ew nWe+F3AGviJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKoAAKCRCPgPtYfRL+ TpZLB/wMwRsJwHP5D+q/AN+C7fE2cZticbk4ps8j7K6f/A+ZuDkYkXnnxY8rkLY098OXTKNqg6k k4UWUeBEwapzxprlQulJ5QCDqFhgr7L7+amLT7D6ovilKTlYhabfqKR0ppMJT8qFsDore19Mc06 n2lWdKEI9xDgDdjXOHO4BFgYe7keLLrh6qQ15PsRRfN5+yn+pWE1Eey9a3g1ypjqXrhhIjDqW/6 icqS/G63POyYuDDfNWBZ9LnEXWoSvU2H99F6Jm0agBsNrSdlWmk7Kp5ASvmZvbzdLpxwFoaCjsm 4lvzmOubUyGt3KquyDUIYH1td9UO/oquiQSZJ360Xs7lCGeo
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130213_128284_61141C44 
X-CRM114-Status: GOOD (  16.26  )
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
ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL254cC1zcGlmaS5jIHwgNiArKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmkuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29udHJvbGxlcnMvbnhwLXNwaWZpLmMKaW5kZXggNWQ4ZjQ3YWIxNDZmLi41YWVl
NjJmNTEwMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvbnhw
LXNwaWZpLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmku
YwpAQCAtNDMxLDEzICs0MzEsMTEgQEAgc3RhdGljIGludCBueHBfc3BpZmlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBueHBf
c3BpZmlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBu
eHBfc3BpZmlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IG54cF9zcGlmaSAqc3BpZmkgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAogCW10ZF9k
ZXZpY2VfdW5yZWdpc3Rlcigmc3BpZmktPm5vci5tdGQpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG54cF9zcGlmaV9tYXRjaFtdID0gewpAQCAt
NDQ4LDcgKzQ0Niw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG54cF9zcGlmaV9tYXRjaCk7
CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG54cF9zcGlmaV9kcml2ZXIgPSB7CiAJ
LnByb2JlCT0gbnhwX3NwaWZpX3Byb2JlLAotCS5yZW1vdmUJPSBueHBfc3BpZmlfcmVtb3ZlLAor
CS5yZW1vdmVfbmV3ID0gbnhwX3NwaWZpX3JlbW92ZSwKIAkuZHJpdmVyCT0gewogCQkubmFtZSA9
ICJueHAtc3BpZmkiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBueHBfc3BpZmlfbWF0Y2gsCi0tIAoy
LjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
