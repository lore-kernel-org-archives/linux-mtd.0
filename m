Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5C0CDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v1O7prGnjNJsPIfApcWWoiUBr0w42vjaNy35Ikjfbyo=; b=XF6zECWuXHDVqL
	G7VIy7LpgjL+KHOaQLxuGaswy7bLZtZu9KV41hKxgWkCJThsffX8pA5dEoMELW+GgfRNbr+08VsAx
	PrkSGiYve4KnRYnopFENFWwG3lYxYamFakrA13R+kKPud6vfYPC1BdjB1dq1XZkTC3/GSfj8hN4T7
	VlQM8/UyE/ERAbhufPcktXYe+Ap34CMZhDsZ/4N2NNNaN9SVoMEu2lrbDd018PXqpdQ9VakQJfZtm
	yqYV9ZTal2Y8MC/B0mgfrY2nOsAqrIcQJjM3Ak78HGk1aWQ5sE2OS1amuStmZxd8HWwVeJGGEv1zI
	cUcUVolbm/9Rfa6ckuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKxH-009L9N-2Y;
	Mon, 16 Oct 2023 10:36:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKxE-009L8P-2I
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 10:36:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsKx7-0004Zt-9V; Mon, 16 Oct 2023 12:36:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsKx4-0023qp-VB; Mon, 16 Oct 2023 12:35:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsKx4-00H9F0-Ki; Mon, 16 Oct 2023 12:35:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangtao Li <frank.li@vivo.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] mtd: rawnand: sh_flctl: Convert to module_platform_driver()
Date: Mon, 16 Oct 2023 12:35:41 +0200
Message-ID: <20231016103540.1566865-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Kp/Zi8HJnfZLJ9cul2M0kezcrmdfNTy0nBofqKKfv8c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlLRH9OMlYdZvDTva32anyYuKXoQC7vCObg/gTh YA7/jeh7lKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZS0R/QAKCRCPgPtYfRL+ TgiRCAC2OEZp8THAYP6Xlj7Fd/BzQ/5wTxLVNPBLZQbIArnMXSq1tfuS7i+Rxfh4eSiZH64tdGA 6LM6EZoSWhSr2yc1pjFO/19jNGudKQSbDbryPtMxc8rSStNgVk9FwdSJAMWZ9oh27bUaY9hRTw8 b7QWjSr+VAiOneQVOzuFqABKnoEtd+y58yI61wXcq2QINHwUKn3zxCEauEA3JwMsml0e0/+UamJ PQj7hedjwgWiURMQIbw3Mx98utHwe/avRw0BX+/pJ5DDTc8Dr6UnBu5f0SP4AmfC4HjeCRubI1x K4gxnz8A+wKEO/mQLjvw4v+Ju7lcISjc3xMVNshVfZQ3pZ/3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_033608_749016_540E435C 
X-CRM114-Status: GOOD (  13.86  )
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

VGhlIGRyaXZlciBkb2Vzbid0IGJlbmVmaXQgZnJvbSB0aGUgYWR2YW50YWdlcyB0aGF0Cm1vZHVs
ZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSBhbGxvd3MgKGkuZS4gcHV0dGluZyB0aGUgcHJvYmUg
ZnVuY3Rpb24KaW4gLmluaXQudGV4dCBhbmQgdGhlIC5yZW1vdmUgZnVuY3Rpb24gaW50byAuZXhp
dC50ZXh0KS4KU28gdXNlIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSBpbnN0ZWFkIHdoaWNoIGFs
bG93cyB0byBiaW5kIHRoZSBkcml2ZXIKYWxzbyBhZnRlciBib290aW5nIChvciBtb2R1bGUgbG9h
ZGluZykgYW5kIHVuYmluZGluZyB2aWEgc3lzZnMuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3NoX2ZsY3RsLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3No
X2ZsY3RsLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jCmluZGV4IDNlNWRmNzVj
YmM5OC4uMmE4MTY0ZWZiMjczIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9m
bGN0bC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMKQEAgLTEyMTUsNiAr
MTIxNSw3IEBAIHN0YXRpYyB2b2lkIGZsY3RsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBmbGN0bF9kcml2ZXIg
PSB7CisJLnByb2JlCQk9IGZsY3RsX3Byb2JlLAogCS5yZW1vdmVfbmV3CT0gZmxjdGxfcmVtb3Zl
LAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gInNoX2ZsY3RsIiwKQEAgLTEyMjIsNyArMTIyMyw3
IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGZsY3RsX2RyaXZlciA9IHsKIAl9LAog
fTsKIAotbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZShmbGN0bF9kcml2ZXIsIGZsY3RsX3By
b2JlKTsKK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZmxjdGxfZHJpdmVyKTsKIAogTU9EVUxFX0xJ
Q0VOU0UoIkdQTCB2MiIpOwogTU9EVUxFX0FVVEhPUigiWW9zaGloaXJvIFNoaW1vZGEiKTsKCmJh
c2UtY29tbWl0OiA0ZDA1MTViMjM1ZGVjNzg5NTc4ZDEzNWE1ZGI1ODZiMjVjNTg3MGNiCi0tIAoy
LjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
