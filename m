Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3422EC3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jan 2024 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qFgcSrwidZMq/g2fZ2j7N4I+YM5z2h7YB8cVDTe1NzE=; b=HnPIMFNVwhYzxB
	PAodip/Nh8UdJjTCnZO94y35t6T9lMSMw/dQAqmpgIEnrLq+FWLI1YGUfO2bouEkxVFn9vPebLBVF
	IfLEcj5ssvG+eT1ctzXDiFWXNwQoePEYH2HsTG1wEtDUOq+liP1AHd5d7jk4JdPiGtkYElguwLOPJ
	nYHjD/Hw7FQ8LWV1DJBllHQ0fBc0ZVI1RHbN/VsuqMTDYI7uYRAJAm1B16Ff+Pvdn5pMRZDzf9s0I
	ZIhEvrjGOeGbSQexUzFuUpHJ7+GFf0a1snbTmcFcQ2qr3qISryONe1oCjgwVfrjRVHV0+BMUB4j9R
	ufyzVBvMTux6eAOA7RmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPNiK-009BHN-0y;
	Mon, 15 Jan 2024 14:13:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPNiF-009BGr-1Y
	for linux-mtd@lists.infradead.org;
	Mon, 15 Jan 2024 14:13:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPNi6-0000uM-8K; Mon, 15 Jan 2024 15:13:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPNi5-0002IY-CU; Mon, 15 Jan 2024 15:13:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPNi5-0008KV-0y;
	Mon, 15 Jan 2024 15:13:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] mtd: rawnand: fsl_elbc: Let .probe retry if local bus is missing
Date: Mon, 15 Jan 2024 15:12:46 +0100
Message-ID: <20240115141245.3415035-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=s+JADGlY1hU/NStvmmbQ8XZ+UID1ILn7ThT9et4DuL4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpT1eRLyF5FHl9JItDHYNj77sl3YOvEjGkyk8q /kadI+MdXGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaU9XgAKCRCPgPtYfRL+ TirzCACubFS92ueND4JpTwROF00Nx+kY4QqLmstx5YgHzn3c4fdhe4R7dy7q7q/LXEQNs6cJRcS lRrFFEITUatA83EU6rlLuomWFiRRG2MO2c0JxQ15pr/9pPULngKDBUxJ6uZROijJ64a/FqmH2K3 bfJgVE1S0vRF7HYs7OWtFapD0wFPM/Q1JuQtdvPL9OyiZcirUPd8vzCMTLG9lQ6L7jPmOG9HfDA Ozyl5rEWA8JQM7u7l524Fu/y30IY7kS2GEYesB+F9D1MammVRq9VAcl8bTgVC4ROkUv8U2qe1ru 8P1LmY/p9GNaeUf0yVab8/VBbODong59hjEnwAF3a7oMP3dd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_061315_517992_6F1EF546 
X-CRM114-Status: GOOD (  12.64  )
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

SWYgZHVyaW5nIHByb2JlIGZzbF9sYmNfY3RybF9kZXYgaXMgTlVMTCB0aGF0IG1pZ2h0IGp1c3Qg
YmUgYmVjYXVzZSB0aGUKZnNsX2xiYyBkcml2ZXIgZGlkbid0IGJpbmQgeWV0LiBTbyByZXR1cm4g
LUVQUk9CRV9ERUZFUiBpbiB0aGlzIGNhc2UgdG8KbWFrZSB0aGUgZHJpdmVyIGNvcmUgcmV0cnkg
cHJvYmluZyBsYXRlci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2Vs
YmNfbmFuZC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMKaW5kZXggMWUzYTgwZjA2
ZjMzLi5kZjZhMGQ1Yzg2YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9l
bGJjX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMKQEAg
LTg2OSw3ICs4NjksOCBAQCBzdGF0aWMgaW50IGZzbF9lbGJjX25hbmRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZDsKIAogCWlmICghZnNs
X2xiY19jdHJsX2RldiB8fCAhZnNsX2xiY19jdHJsX2Rldi0+cmVncykKLQkJcmV0dXJuIC1FTk9E
RVY7CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIC1FUFJPQkVfREVGRVIsICJs
YmNfY3RybF9kZXYgbWlzc2luZ1xuIik7CisKIAlsYmMgPSBmc2xfbGJjX2N0cmxfZGV2LT5yZWdz
OwogCWRldiA9IGZzbF9sYmNfY3RybF9kZXYtPmRldjsKIAotLSAKMi40My4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
