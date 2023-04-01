Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D3CC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sj0K8Gkt+84C6k5l2/7J7+Qj2WKgus3+PIIcAUty5nM=; b=EQkxs0t+c53cDo
	4QYKXxb6fQ+cZwSocoWvIkNeQvIS81ktIDFH1weQSD1REqKFUUfg8sfUriIkKu7x2R7utILdBcZIZ
	2d54WnDjnkACjjaNJPjvKZYb68oS6TDbvyAju7k4HM79e8LL/y6XfjGVP+fTjVwmsP1Dl/9lHy4aT
	/oJDrytKCpnHFO7np7iOFXkHWXKuGWBJXfs9ByDH8Py5MkselGqKR9LXs0/OpBBD21B7yF4bHEHUH
	2O+/LmTfgw63RUdXIvR6w/QMsRzdYc+7TiUKMg3r/qfX1AdlofAjP67OR7cYeK2ELdCk6doIAJAb3
	7nOwKhDz2Z46GF4s+XBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxo-00AsNL-1z;
	Sat, 01 Apr 2023 16:20:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxb-00AsGW-2k
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QPV9HRMY9LSg4JnVSIQdXFkTx1dU76Wmm+2iMaFj6x0=; b=ooCwshVcKEr2I/zNEUJPQHxcEj
	EbaROZnpfpUYbr1M2GOfs6pL5Ax7ZfTaBqpglAXi+qjcwRwVGYcKw4bgzFYvhS8k9gdvfHDvtODAW
	l1S9Fwg59rViFWhxI+hG225+l6zvIDvIIqKoB/9H7ZEDHCHsDa3AaAD55WuFYyRIwrB4mtOnCWEyn
	FrIL0WlloSl8jDIR+XjUS7Xok4iSEarhJU+B2YowO8LBdarEqndsW41MudjXp7CWtJ8Q3/CFsxCFY
	9Qe8BZxCInUuso3gG7bVNn68n3qfoI/j94Yp54KV1u1IJIuVho/mOD0vlrleto+txL1m18kATsZUN
	srHRRRiA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKw-10
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-0008N8-Et; Sat, 01 Apr 2023 18:19:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRb-LS; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-009kgo-UZ; Sat, 01 Apr 2023 18:19:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 27/49] mtd: rawnand: mtk: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:16 +0200
Message-Id: <20230401161938.2503204-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=e523s9jRh/S6cO5O42rYQ7Q8m7mrxZAiPiAi9ZUPEJY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkn1m1Rxg9dsGd5QzAc25K+CVSCtFVHxMxSh zGEnsX1zBGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZJwAKCRCPgPtYfRL+ TvvGB/4m1l2TIyVfqpOpyosZc+stZOgYdxdZzla9CBSL9m/qBQpJVmNFI3Civ5kIz4GHTJ4axJ1 62s8mhZe20HTIlWfR2BnsWJwOtuzP7+zTcyvcMUrnuSkgwLGA52AkTwmb9qSE8yNmnTD6S51B5l Vhu5A3KRb9dKcjMHVVH+Xi/RXeiBIYIyGtL3flPU+1fHGH3YvaZR9H+wXO4JIyzvgonmPZ5soDy B/ih5y2Sy4L9AsoPcNq1eU77VeQ8AGADEko7yjd2GYQ8p9UVAmYNd7Uq3b3nNfqpznndWHa7N2o TWd84Hb9UlR9s8Mpm1OtCHeNSFt1wcAWqYAxQHzd5DIa+NGC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_646510_156BA14E 
X-CRM114-Status: GOOD (  16.17  )
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
dmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L210a19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCmlu
ZGV4IGQ1NDA0NTRjYmJkZi4uYjJmYTZiMjA3NGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9tdGtfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMK
QEAgLTE2MDEsNyArMTYwMSw3IEBAIHN0YXRpYyBpbnQgbXRrX25mY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgbXRrX25m
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG10a19u
ZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG10a19u
ZmMgKm5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBtdGtfbmZjX25h
bmRfY2hpcCAqbXRrX2NoaXA7CkBAIC0xNjIwLDggKzE2MjAsNiBAQCBzdGF0aWMgaW50IG10a19u
ZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAltdGtfZWNjX3JlbGVh
c2UobmZjLT5lY2MpOwogCW10a19uZmNfZGlzYWJsZV9jbGsoJm5mYy0+Y2xrKTsKLQotCXJldHVy
biAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCkBAIC0xNjYzLDcgKzE2NjEsNyBAQCBz
dGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobXRrX25mY19wbV9vcHMsIG10a19uZmNfc3VzcGVuZCwg
bXRrX25mY19yZXN1bWUpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfbmZj
X2RyaXZlciA9IHsKIAkucHJvYmUgID0gbXRrX25mY19wcm9iZSwKLQkucmVtb3ZlID0gbXRrX25m
Y19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtdGtfbmZjX3JlbW92ZSwKIAkuZHJpdmVyID0gewog
CQkubmFtZSAgPSBNVEtfTkFNRSwKIAkJLm9mX21hdGNoX3RhYmxlID0gbXRrX25mY19pZF90YWJs
ZSwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
