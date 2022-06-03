Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C4C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTpM+fry9QCYECRmtXhVxUG2TXGHBfBO8wt522Gqpng=; b=SoT1WuOq0QPr19
	kqullhB8eXzQKwVLmQCd2MtqSVqcmvwQeNfwLuVegYAkhG8q8BsRaYP8pBrEcHNjDNdb/QkXalGi0
	oTQCGD8ft1QadqMexr7PzDlp85Fu0uUnKqhqEOhZ1aJlIicS7fp9sQ4hAMTWx0zAgNtFJMS0qNWWT
	DmXKJzxa/DrwTexGIxvwjFToCJuBedYsc5dRs7ALR/de9z+7pGozLnKP56rAP+B5MYR66lotfg8/I
	yzwclwZbqhpRw05OwhYykZJ7q15q6LsNumk4yOr0BvQxi9YgMNSoRLpzXYwd0zgjno91UOCMJlYOc
	1s0x+vjJnLA+nq978sLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWv-008h3m-67; Fri, 03 Jun 2022 21:08:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gw0-Gw
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-0003rL-6Y; Fri, 03 Jun 2022 23:08:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006HqQ-LE; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWa-00E1HL-6F; Fri, 03 Jun 2022 23:08:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 05/14] mtd: lpddr2_nvm: Warn about failure to unregister mtd device
Date: Fri,  3 Jun 2022 23:07:49 +0200
Message-Id: <20220603210758.148493-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=uwe@kleine-koenig.org; h=from:subject; bh=vIRDubgUeESI04gjcXWO/J9lfdTB5CIUsEdVIv6fAbs=; b=owEBbAGT/pANAwAKAcH8FHityuwJAcsmYgBimnfUiugu+EZH9rYmO/jrgBiM+fDzYlJXg8weOBjy Dah+X02JATIEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp31AAKCRDB/BR4rcrsCWnWB/ iDS7W9pfkijoRqnkhf6yJetntItAOlYduFaSENss3QkGyV6tFhKmykbKR6QA/vH44aJSUaZBUq33DL wwGX/eNcW8Egmns11TkaUVTzdhqWOU/gEeQ9zl8NquHfVLAEsy3aoMM8NPnOnj3gl2Y4pcL+Kir1cG fDZTaegnmbeg7Lpv9VRNM+oMxdHminLt19BlpMFEDXnrQdKNFDP13WYlVfFnvMQVrLPNSnjPxty5B+ EV2KeYGfnH2nKF5/Rjp4TlI05ilzrJ1wYSggDZY6Ml39IivxoqWOeBdPHium+F1JLb3isBRo9Jc8Ep W/G9rX8WNZdtIjzS30/jcJk0c+1pA=
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_643024_BC8761C3 
X-CRM114-Status: GOOD (  15.05  )
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
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9scGRkci9scGRkcjJf
bnZtLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9scGRkci9scGRkcjJfbnZtLmMgYi9kcml2
ZXJzL210ZC9scGRkci9scGRkcjJfbnZtLmMKaW5kZXggNzJmNWM3YjMwMDc5Li4zNjdlMmQ5MDZk
ZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyMl9udm0uYworKysgYi9kcml2
ZXJzL210ZC9scGRkci9scGRkcjJfbnZtLmMKQEAgLTQ3OCw3ICs0NzgsOSBAQCBzdGF0aWMgaW50
IGxwZGRyMl9udm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICAqLwogc3Rh
dGljIGludCBscGRkcjJfbnZtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewotCXJldHVybiBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5k
ZXYpKTsKKwlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdpc3RlcihkZXZfZ2V0X2RydmRhdGEoJnBk
ZXYtPmRldikpKTsKKworCXJldHVybiAwOwogfQogCiAvKiBJbml0aWFsaXplIHBsYXRmb3JtX2Ry
aXZlciBkYXRhIHN0cnVjdHVyZSBmb3IgbHBkZHIyX252bSAqLwotLSAKMi4zNi4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
