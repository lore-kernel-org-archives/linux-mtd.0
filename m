Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49863C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jan 2024 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFgcSrwidZMq/g2fZ2j7N4I+YM5z2h7YB8cVDTe1NzE=; b=jb1iKJtsdlKSjM
	LK8VYmYl+RhDSQhtaZOqyKHG54R+t4/8TKqXDxp3cuCqIW51cuPrL28CMtF2EIVTDj6IjqdcaWh4x
	7GqmDYYAPrg7OYUI+p9HolJcC7V6l5bSHk4nvhkMo9Se70Zzr1s1Iq7V3JfM/uYQYcXisJLnhb/iB
	rC6Kag3986iF0T7MODHPf3OMTJkG6h65/1vjox6qzEL+w1i1VyoS5N4zcnwMUkB2hkK845z9+h+gz
	o/fxnFaPsKIyKQyh3JfTzfK5io25e3wnWCqMIfKfkyextwd1IPfBC7seLz+Ihn21IVW3PKh7Ck5rN
	ST5e8HNXj2JmZtMM4LIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPTSW-00A8EN-2T;
	Mon, 15 Jan 2024 20:21:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPTSS-00A8CW-2L
	for linux-mtd@lists.infradead.org;
	Mon, 15 Jan 2024 20:21:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSG-0004kf-Uu; Mon, 15 Jan 2024 21:21:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSF-0005gi-HJ; Mon, 15 Jan 2024 21:21:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSF-000N7t-1R;
	Mon, 15 Jan 2024 21:21:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 13/33] mtd: rawnand: fsl_elbc: Let .probe retry if local bus is missing
Date: Mon, 15 Jan 2024 21:12:59 +0100
Message-ID: <978d5107646800a2dfa3299e32e2587907d53a87.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=s+JADGlY1hU/NStvmmbQ8XZ+UID1ILn7ThT9et4DuL4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpZHPCEJWc7vdLUmy8+BmgzzT8evOP0zLGbYWS ciV2KzQ93yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaWRzwAKCRCPgPtYfRL+ TiVdB/wMSwEC76EmTubxnIK4QkQ+SGwLSbNrGj1gqo0OR0dGoYZmlUtZ4lJgy6bm7ZuExr1OOVZ +nD45sPyuvg6SusiCWNVHmV2Bs/wGWYC+rJogFEKVV1MGghznBcd7jFin7nnYU0ZA6J8MaLmlNA mNILzMZe1SuVNxrbE9VYubQh81lpfU8KVZx/GypYqzbNGLpxZkCZK06v59OSEYcWtmMNtL/KJX1 ZNIvStyr8BUpuLU4UCGrhkA498s3DA+igjki46e0RvjwKnPVPKYB9Z5lCwrut4FVJPrz+aJdpCH gLPB+jWx0B7KKeaqdtcMUayWjw5xqjIZcjLQlqeAH6grisdI
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_122120_761291_DBE9E563 
X-CRM114-Status: GOOD (  13.24  )
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
