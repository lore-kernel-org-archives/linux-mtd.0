Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F8DC77B62
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MafgmoX4z81Qx4akksna0gsfkhf4D4gSGdfE6l/u7c=; b=h5//JOIePKvSak
	+1S1YZtvHhUG3szH8RIPvpgfK4KJy5D0G/4V/eNQYRA0LdICmm+pC8aedmDgEjNRB+JqqGZkeRb7H
	Z0vW4KudWvnv6JdPByRoVG1wJ2ab8KZYQdT23z5DF2HaYtsOWl9iP1fj5ZBIR+LaBHeRhcOuOJ4Uz
	+00kE9kDCKnunnoLo8UUubWopXaGeV93RmdOBKrzzQWfi5/0xXE+bxF8kUU2UN47zUeVsPNCZqCer
	GQoDzqxAHrAn2g5ESUFCVjX2L69uM4U6/W4KrNSxCO/XX5oKqKErDYf3/7cBacZfeM19N0btnzLiY
	JIw4n63qhuiOXR7CjdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEL-00AwUu-0g;
	Sat, 01 Apr 2023 16:37:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEH-00AwRk-2e
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ph+cnt8Hs7AKVrV6PyLogq7L6B91w1aXM90bs/oHrI4=; b=tZ0LD+e3x/6kwXFA2Arqp1MkWt
	lUZvXSZy35ICP0keWpx1EYsSggFRYhKuXxsXoQXTqJ7rNWTkzzjTdBwr0AeYlAIS2Sa3FJTdjw74d
	oKpCyKfaWOZLpIbz3oxd4rFPI40BwSBhzysP+cCnMaO6ZbZom0b4GXsHnKvOJljbjg19tr8+KtY5Y
	b4m/GZ6XpBW5lB2cfdwsbyHFXbb4P6/pyPXj0RwuQhdVfnSbhZBspRDDgvWMQ1Y+/nKfav6/7jaEY
	CoJsmE33bjgdCrsVmrBq8J2CjesPx1DEuXKOQ/OincnPtc/CZcgtNaIY3F7WvRGgdlphx7iDK+3ag
	O5OGOOHw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYO8-TQ
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-0008Uz-1U; Sat, 01 Apr 2023 18:19:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GSU-Vg; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-009khP-0s; Sat, 01 Apr 2023 18:19:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 37/49] mtd: rawnand: plat: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:26 +0200
Message-Id: <20230401161938.2503204-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mtTC77dY/jlmYhEDaZDGEnIq1bGkztkuMOaio2j3eog=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlHNTC4uIEI8j1kypPD1arzmeVOuF8tH+YqY UTt7RgIWaSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZRwAKCRCPgPtYfRL+ TgcqB/9HUcv0/3C7kfapY8N2T9pH/0cmt1yZUUCRhZ8487Uqux93CGgxAkmi1+uBMphYu3xn/xy V9JVoVRql7lCVjH8rhgzSJBOWNRAkUz94yi/Rspf8Z80/MHvYomHcJ6nCI8zTdRuqPGJFZ/c3CR XFbN+vi4ha+53wo5HaLph6nyFJEwI/IQ7+/Zw0KTUKKXUGNT9kSGo3FwItzl+TDHdsSAgIMAXxR 2cwz2Spks37FDsmDcR3YX7pI72ZXN9UMo9UDlnX8B8jPOO/VIt3JY8vqRuE5pTM6PO8TsFWU1to u5rc17pDtsF+egxFn1nO4lfB2FYk4Ad3ioUtko4Ev35Rr6z+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172004_036866_6547379F 
X-CRM114-Status: GOOD (  13.70  )
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
dmVycy9tdGQvbmFuZC9yYXcvcGxhdF9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9wbGF0X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsYXRfbmFuZC5j
CmluZGV4IDdlMGQwYThkZmQxZS4uYjVjMzc0YjUxZWNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9wbGF0X25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbGF0X25h
bmQuYwpAQCAtMTIyLDcgKzEyMiw3IEBAIHN0YXRpYyBpbnQgcGxhdF9uYW5kX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAvKgogICogUmVtb3ZlIGEgTkFORCBkZXZpY2UuCiAg
Ki8KLXN0YXRpYyBpbnQgcGxhdF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQorc3RhdGljIHZvaWQgcGxhdF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogewogCXN0cnVjdCBwbGF0X25hbmRfZGF0YSAqZGF0YSA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwogCXN0cnVjdCBwbGF0Zm9ybV9uYW5kX2RhdGEgKnBkYXRhID0gZGV2X2dl
dF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKQEAgLTEzNCw4ICsxMzQsNiBAQCBzdGF0aWMgaW50IHBs
YXRfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAluYW5kX2NsZWFu
dXAoY2hpcCk7CiAJaWYgKHBkYXRhLT5jdHJsLnJlbW92ZSkKIAkJcGRhdGEtPmN0cmwucmVtb3Zl
KHBkZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHBsYXRfbmFuZF9tYXRjaFtdID0gewpAQCAtMTQ2LDcgKzE0NCw3IEBAIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIHBsYXRfbmFuZF9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIHBsYXRfbmFuZF9kcml2ZXIgPSB7CiAJLnByb2JlCT0gcGxhdF9uYW5kX3Byb2JlLAot
CS5yZW1vdmUJPSBwbGF0X25hbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gcGxhdF9uYW5kX3Jl
bW92ZSwKIAkuZHJpdmVyCT0gewogCQkubmFtZQkJPSAiZ2VuX25hbmQiLAogCQkub2ZfbWF0Y2hf
dGFibGUgPSBwbGF0X25hbmRfbWF0Y2gsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
