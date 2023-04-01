Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C96C77B62
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tlic0Ovg4jSMHWvTTyBuzRiiQ6o3xcGSLfwyYadEUA=; b=t4pvO19jROpNK3
	8RFhJGn0BxD1fkFFukvDdElgZnADUmC2w7oSKsvM+l/aVQx2g3FaRSSxxit8ebnvtY1+9n4KwLhNW
	CQK9gtftgR1k08LbNz+w0s0TCh4AoSpXaZk9xqJxRJingz+jAokwskXFYK8A1JT2xR4uTt6vfygoh
	V/nd7PjXm0lRizKWOhAVpO18usl7yD/EldGROh17WEF4YdIgA8MqrdaYmAguGbcvF2itDSX/J0Yz+
	ounkA4hAprarWLLK+EnCMif4awOIKUePoh16Cap5mleVnc6fMY90Z2ZwlXou8+nK3vxxhfPSi5WmL
	n7smZ5SbhGKfCBD4OAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pif4m-00B2QG-35;
	Sat, 01 Apr 2023 17:31:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9B-15
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-00089F-Up; Sat, 01 Apr 2023 18:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-008GPe-8E; Sat, 01 Apr 2023 18:19:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxC-009kfD-LG; Sat, 01 Apr 2023 18:19:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 02/49] mtd: onenand: generic: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:51 +0200
Message-Id: <20230401161938.2503204-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iVoDRea/XJ4anuADCYCoACan08EveYf2jBCG/YgECZo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFjyde/ucaZLYiIg2Pl6gRVFmeD/cos/tlIuG Nu/0jGlFrKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY8gAKCRCPgPtYfRL+ TpviB/47lsRE5JJBQB+mD2MJ9+GIzyW1b7iPyKiua9PzhGm9Dcyf9dlIBCxFzK/mjpkiZl4eTG7 4LCcaMPX9hflvxORig+4kOHv7+IKaSCmgnba8QEg1BcrmDgeyRNDeg9Wr2U6Onm9C3S/YadWHMH M2y35lFtGCKCm8TjoTrhOdk5X19uszrcZyp1lgbBqvGNn9K1sF5uchm2ygHHcY0OjTdsv8TQbQy 7p5iLGolVhoEPNEy+hOdztWhJyQ/q8uAblkYy+2fVssR3XWRDq88Eih5x0x0XW37tl8OE4TzALd BPKLayFd93o3/TQ4OmxB+zF8HOvHm7JN+60JImf0iVujr3Zy
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_420030_5A467786 
X-CRM114-Status: GOOD (  16.32  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9vbmVuYW5kL2dlbmVyaWMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvb25lbmFuZC9nZW5lcmljLmMgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvZ2Vu
ZXJpYy5jCmluZGV4IGE0YjhiNjVmZTE1Zi4uNGU3ZGU0OGYwN2E2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvZ2VuZXJpYy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25l
bmFuZC9nZW5lcmljLmMKQEAgLTg1LDcgKzg1LDcgQEAgc3RhdGljIGludCBnZW5lcmljX29uZW5h
bmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gZXJyOwogfQog
Ci1zdGF0aWMgaW50IGdlbmVyaWNfb25lbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKK3N0YXRpYyB2b2lkIGdlbmVyaWNfb25lbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgb25lbmFuZF9pbmZvICppbmZvID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHJlc291cmNlICpyZXMgPSBwZGV2LT5yZXNv
dXJjZTsKQEAgLTk3LDggKzk3LDYgQEAgc3RhdGljIGludCBnZW5lcmljX29uZW5hbmRfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWlvdW5tYXAoaW5mby0+b25lbmFuZC5i
YXNlKTsKIAkJa2ZyZWUoaW5mbyk7CiAJfQotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGdlbmVyaWNfb25lbmFuZF9kcml2ZXIgPSB7CkBAIC0xMDYsNyAr
MTA0LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZ2VuZXJpY19vbmVuYW5kX2Ry
aXZlciA9IHsKIAkJLm5hbWUJCT0gRFJJVkVSX05BTUUsCiAJfSwKIAkucHJvYmUJCT0gZ2VuZXJp
Y19vbmVuYW5kX3Byb2JlLAotCS5yZW1vdmUJCT0gZ2VuZXJpY19vbmVuYW5kX3JlbW92ZSwKKwku
cmVtb3ZlX25ldwk9IGdlbmVyaWNfb25lbmFuZF9yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKGdlbmVyaWNfb25lbmFuZF9kcml2ZXIpOwotLSAKMi4zOS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
