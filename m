Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B567CCA473
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTJmMGfgH6UOlOeyv9xiXTPnkIJK1svdET4Cew0iPS4=; b=HgmQwJSsZLaPcv
	kHQ8cQ8+GzeVG3PgPWm3v7rcOBlyYwlyYYl/xih9wuZOCEW/+G5L/ZJKd0lKTOuWZdZpdO03nBsi4
	nwK/XeoOFOT+jZ3vGF6iHllbmIqW/lFUt2d56783OUTzrus8woSb3Ubr4OXQCMpP0IkM12hHHCIHm
	ozDLjZJ4otSutgHWrrioYO6uY6TALFwENvoYdumUKyLBQoZXSLs35rNb8EbRXkv7eUTdtYd1hbsdc
	H1xh/YADMKkBJm55cWcDol3B627t3tV93nur1KHXMmsoKMGydHJY5+w6Re6WkX3RHWP8A18PK7nvY
	uBkF1byahKgPQo3HEkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEX0-008h6R-Oi; Fri, 03 Jun 2022 21:08:30 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gvk-GF
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-0003qo-OM; Fri, 03 Jun 2022 23:08:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-006Hpx-4w; Fri, 03 Jun 2022 23:08:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1HH-V0; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 04/14] mtd: st-spi_fsm: Warn about failure to unregister mtd device
Date: Fri,  3 Jun 2022 23:07:48 +0200
Message-Id: <20220603210758.148493-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=uwe@kleine-koenig.org; h=from:subject; bh=Ey4JE0XoLndZ5ZKiVN7rixjJkYfQXfGzGCyFgT+Sc2s=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfR/3TQQcJHLbesqcjY7sWAMAsvppGmYvgraYS4 Sh6tABCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp30QAKCRDB/BR4rcrsCdzyCA CJ11QYJFve04cq4JB/NXNqh718GzpTGlPnP2JPCnlaNNUytKCx6g+p8k3uhl7aljnkDhCNv/xITtPM 031kYPMIxMf52AE3vKpTdIiUbh3L3NbFdxfhdIKXwOtAtPpi8tuBgYvpZtUe4UGiZxXwW6flE0nLxw +27AkulPkS6l3pz2BOe1bkpEHcgdxPwyMiRf/wRiT8wqpVpsePvlbSlwdcKW9AO4G3+/vl8Um0LLba n8kXfWzC8Q9hY6MqxD9k8vJp3dpCJmuNtU1Tw00qmVIRehbVNps46A0O0++JUkD8FSz/8/AAhgYJsM tQCKaTHqcMB8QZe2Y0dRKK6H3koqdD
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_670673_055035AA 
X-CRM114-Status: GOOD (  14.38  )
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
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL3N0X3Nw
aV9mc20uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIv
ZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKaW5kZXggOTgzOTk5YzAyMGQ2Li5mMWQz
MjY2ZGRhMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCisr
KyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCkBAIC0yMTI2LDcgKzIxMjYsOSBA
QCBzdGF0aWMgaW50IHN0ZnNtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBzdGZzbSAqZnNtID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKLQly
ZXR1cm4gbXRkX2RldmljZV91bnJlZ2lzdGVyKCZmc20tPm10ZCk7CisJV0FSTl9PTihtdGRfZGV2
aWNlX3VucmVnaXN0ZXIoJmZzbS0+bXRkKSk7CisKKwlyZXR1cm4gMDsKIH0KIAogI2lmZGVmIENP
TkZJR19QTV9TTEVFUAotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
