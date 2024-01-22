Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C30C47DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 18:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFgcSrwidZMq/g2fZ2j7N4I+YM5z2h7YB8cVDTe1NzE=; b=H21yQ6rkQV+jj3
	TUAo1x8x9ra2drA3/r2h+UWQjRmRXdFX6OwPMIPgQLFnru6A6hGkS7MmrUTX1YgT6G/lEPS4ctgUC
	XNrtAvOttB7XsWRUn8UaupqY68UEf9fwpG11ujOdZKHPaRz/4cM7v/uFcWsOBtQ21pkwbdGfi4Ybi
	Gj9R8sUI9y5V5/CtJWFtAsghiws3wwXEecGlltg3dTqrcm5NyCQzzcAoxI3TXKnYaOuREDg9uwDXP
	nSiu0CAFOY8dJF1Z9TuEkn+kjaNEiY+eCVNlG/y/qULPDPLPiyjRY0UQutF/9L9G6RFO2wbLffRvC
	kLnaVTjk5F821DcPY6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyir-00DQmZ-1Q;
	Mon, 22 Jan 2024 18:08:37 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyin-00DQhX-2T
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 18:08:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiW-0001rV-Ds; Mon, 22 Jan 2024 19:08:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiV-001ePz-Cl; Mon, 22 Jan 2024 19:08:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiV-005ZxZ-0z;
	Mon, 22 Jan 2024 19:08:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH v2 13/33] mtd: rawnand: fsl_elbc: Let .probe retry if local bus is missing
Date: Mon, 22 Jan 2024 19:07:08 +0100
Message-ID: <41a042207ef791c4c5bcb46f09f63c40c6aa321b.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=s+JADGlY1hU/NStvmmbQ8XZ+UID1ILn7ThT9et4DuL4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7SqRa5xnri+sBGWXS2mxTR2+yeexp9NbmI0 L90hkTAH++JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6u0gAKCRCPgPtYfRL+ TlAHB/wMg26k1Tpck9mHijZsRHTQvJplBT8Z+vC2kUhBSyWEZB0dKmES+fZW3CeCceTvoNOyFuV 7TDzPHUuzbznk6NIljGX94AwdH91fGCAnFs7MXcPZdppmViEw8kW4jG+dVtd/2vXlq8Fs+JMbBg X3rsJQGwDZjlubTx88jvefyRVTkWUObB/F62pE7+t1zSpAka5vi4w4s9TC437a89kT6z3KJVs/B 5D8PuO2JS7sqyvGPTuWxX7CKUYRb14q6ysKoafrx5mNB0ymUIcbqI4rwPlRVTHgWk6aeRto3npM JsgwpMCWKefupKmykKqsyBIf58VxW9M/7YtKjYKc/tPhJJYR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_100833_799592_841ED3AE 
X-CRM114-Status: GOOD (  13.48  )
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
