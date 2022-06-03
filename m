Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04D8C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yfl3/2gczsUBJm6pMXbprIX/7/Qd0gHaFGM+mPtwKp4=; b=F6xYvMHFXisa5f
	4rHsw9qBYjkxp21RnfEyeTnu1HvlLmFJ6k/3gAIgWiBV6dpCizDV2Bv97sAJcdjNuInfkB6aGNcqa
	NwHLj7yIlgP0ZpPpLWXzmjhaOvrhWLETNsZ8ujUW/6sZ9iIQqTCEmEWHKfthBNt1/ybre3isbMkIZ
	6Y78j++PkLKsIA2Mrxs7CuLILLlpuyCCm6CDQMPpPFg8vhSA61iulJ+I6AWUEeKbMHS8RpHdniqJR
	izDnSpbRxsk/+O9xn2VolE8QmgrmlkoVQTandyOWvPzvwFoGpLQ7bfiQTM7aACOG6yQnmRI6t7r8r
	/22Tol/FAIfpqV5DlPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWx-008h4q-7V; Fri, 03 Jun 2022 21:08:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gwA-HA
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-0003rJ-Pj; Fri, 03 Jun 2022 23:08:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006HqH-Cb; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWa-00E1HT-JU; Fri, 03 Jun 2022 23:08:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 07/14] mtd: spear_smi: Drop if with an always false condition
Date: Fri,  3 Jun 2022 23:07:51 +0200
Message-Id: <20220603210758.148493-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; i=uwe@kleine-koenig.org; h=from:subject; bh=luBv8UR7dXw90SiwPs6+n3Bdfd3lJzY6UDFPwviizNo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfbBW0o91pkJwpTgYfeyyPugde6C1BHRE9mZICK Dt66j7qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp32wAKCRDB/BR4rcrsCUsMB/ 9enuY1SEOS4JLPqM0JjLw34iWzNTB0AV9MjRxWtnYImQhz3YmoWLua6VPaG0BYgLscDWFmZZNarnOu 1KaFpGu74mvQA8zmQoVs8v6ZpXFhMdEB/W5wnZVQL73icESSFtyDmllXDxyamlkAVu0kce9vqX/g9h YruAh1A8B9hzSEz1AZBvI2ZBqBQH9G3o24nnzT7QlWAjsAJYL9PfTGXrUaqlf944lnbMcgJMLEfSKE 3qgxP/DX23Hg82+0rtZZijjQpkIb1tMyMJviXl/JKyi5tLJnV9fSM4U/4zEZhcR/yRCbYiqmaUqj5K b6iWYpxH55BoZyhYNc1K32ETt7eimY
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_680472_76EC0667 
X-CRM114-Status: GOOD (  12.92  )
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

VGhlIHJlbW92ZSBjYWxsYmFjayBpcyBvbmx5IGNhbGxlZCBhZnRlciBwcm9iZSBjb21wbGV0ZWQg
c3VjY2Vzc2Z1bGx5LgpJbiB0aGlzIGNhc2UgcGxhdGZvcm1fc2V0X2RydmRhdGEoKSB3YXMgY2Fs
bGVkIHdpdGggYSBub24tTlVMTCBhcmd1bWVudAphbmQgc28gZGV2IGlzIG5ldmVyIE5VTEwuCgpU
aGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2tz
IHJldHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3Nt
aS5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9z
cGVhcl9zbWkuYwppbmRleCBmNmZlYmU2NjYyZGIuLmY1ODc0MjQ4NmQzZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYworKysgYi9kcml2ZXJzL210ZC9kZXZpY2Vz
L3NwZWFyX3NtaS5jCkBAIC0xMDQ4LDEwICsxMDQ4LDYgQEAgc3RhdGljIGludCBzcGVhcl9zbWlf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaW50IGk7CiAKIAlkZXYgPSBw
bGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQlpZiAoIWRldikgewotCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJkZXYgaXMgbnVsbFxuIik7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KIAogCS8qIGNs
ZWFuIHVwIGZvciBhbGwgbm9yIGZsYXNoICovCiAJZm9yIChpID0gMDsgaSA8IGRldi0+bnVtX2Zs
YXNoZXM7IGkrKykgewotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
