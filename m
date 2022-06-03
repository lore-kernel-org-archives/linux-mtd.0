Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A38C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxXV0czExtUx5489k1RVZA7Qgh9pRWJihaj+JPvEu3s=; b=ilCBM7/m/9tIda
	rTgKEOEPgocIGDxrA4jwGVyIcDn3jV7uLp/bh8m5b6NTImiSdGWH/nocsyLV0HzN4slbG2NBkTo1q
	fQXR8TIgqos5mkDwgxzm/1KVLS4vsQzmjGskjT7Tld9y6JVgjA06dKy3BG3oOy0Z9uDYiZz5SGbo4
	UzVHm8aMGaTf1C7P0ct33S4MY1o2jWhTgEQ6gLasueqytzRj5V2kIOOKDrVeZD5+Nb5tyow9edbJ5
	H+BgVmY5aZiY7YLGiRAodQEL1huMtS9CFveBf9vA/Zpn28FNMQR9lgpB3zO3F/HPAwQP6rwBLF3eJ
	1WHUMLvPWrEbckLQB6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEY4-008hwF-Qc; Fri, 03 Jun 2022 21:09:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWu-008h34-J3
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWg-0003qq-Pj; Fri, 03 Jun 2022 23:08:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-006Hq3-Ia; Fri, 03 Jun 2022 23:08:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1HE-PC; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: kernel@pengutronix.de,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/14] mtd: powernv_flash: Warn about failure to unregister mtd device
Date: Fri,  3 Jun 2022 23:07:47 +0200
Message-Id: <20220603210758.148493-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=uwe@kleine-koenig.org; h=from:subject; bh=BqRV/9hKw8b2WjPNF+2ddr2O2osZm5bSPlugKTkUS+o=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMSTNKj83X/71MqWvlX+PpngtPls+x7t2+yHHLRO4bLjNQjdm GlendzIaszAwcjHIiimy1BVpiU2QWPPfrmQJN8wgViaQKQxcnAIwkZfu7P89Xv+V9tKQP/JmkdaCM6 w6N5RZVnOY6HhXhgbuWDJZI1VWebUR/8vfFUct5quf3Nn01VukSlc6ZNrKnN8Wz0Iy/q7tiVk2vVm1 r+jqS9fsUBEBA7dfUjYyvf0MS+/kqC7lXqLMf2O5QpHfTCUplU1ebVx9SaKBpdoHxbtTiphOfla35z ta67x6g48YV7b+tf2/TezOMos8nmy1ePW7BV5psp2O1U5b+1Xu5lrMEXZkLg/9sMz8yaHlKh1V/A9D fk04s89cSLS1167RZ5v5pM4+7lMp5saldXv39YpO1g3e1DPVvrrhWev3vxcb007ueuG/Iuxvzk3Ti1 cY07q5A/9NC2cXYn6Z6O51faI3AA==
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140824_676845_B95CDAE7 
X-CRM114-Status: GOOD (  14.97  )
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

bXRkX2RldmljZV91bnJlZ2lzdGVyKCkgc2hvdWxkbid0IGZhaWwuIFdhaWwgbG91ZGx5IGlmIGl0
IGRvZXMgYW55aG93LgoKVGhpcyBtYXRjaGVzIGhvdyBvdGhlciBkcml2ZXJzIChlLmcuIG5hbmQv
cmF3L25hbmRzaW0uYykgdXNlCm10ZF9kZXZpY2VfdW5yZWdpc3RlcigpLgoKQnkgcmV0dXJuaW5n
IDAgaW4gdGhlIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBhIGdlbmVyaWMgZXJyb3IgbWVzc2Fn
ZQpieSB0aGUgZGV2aWNlIGNvcmUgaXMgc3VwcHJlc3NlZCwgbm90aGluZyBlbHNlIGNoYW5nZXMu
CgpUaGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2tzIHJldHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL3Bvd2Vy
bnZfZmxhc2guYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9mbGFz
aC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9wb3dlcm52X2ZsYXNoLmMKaW5kZXggNjk1MGE4NzY0
ODE1Li4zNmUwNjAzODZlNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJu
dl9mbGFzaC5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jCkBAIC0y
NzAsNyArMjcwLDkgQEAgc3RhdGljIGludCBwb3dlcm52X2ZsYXNoX3JlbGVhc2Uoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgcG93ZXJudl9mbGFzaCAqZGF0YSA9IGRldl9n
ZXRfZHJ2ZGF0YSgmKHBkZXYtPmRldikpOwogCiAJLyogQWxsIHJlc291cmNlcyBzaG91bGQgYmUg
ZnJlZWQgYXV0b21hdGljYWxseSAqLwotCXJldHVybiBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoJihk
YXRhLT5tdGQpKTsKKwlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdpc3RlcigmZGF0YS0+bXRkKSk7
CisKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcG93
ZXJudl9mbGFzaF9tYXRjaFtdID0gewotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
