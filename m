Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95F4C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ox8KJRBPDHTPkRAUiY8zaHXN4/0LxrUUlRAabY6zwc=; b=zXsDrXjS9LtU1E
	WmrHiBHzJlXTfLrCtLGTblNajxpwcEY78n4yRe11ulynwH5MLxDZojX+F0Pk6UBmCxOmVG3oqZ1ix
	grhNUnOdynOYb8yQCfcYKxM8mzEnQDLjba6zin+gxNmwAZwQhYJ07d+THg8xCgayQ+mR9H/5G3w/X
	eEE7EadVCwcuHQxAnTqcIqymT5rR7lz4ltaoyZijQjtjlRZSfhOV8F52ldYjmcOdz4BdA8rkQh6tP
	VJRrtCYQPpZorv1dv92Mrn5vNPuF93itmZIL9hvJg2d8tiWkxc12Vo9mlvvIJx6ezPBmLynIlBn7h
	fExLdLb2V2Z3vHQHI/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxn-00AsN2-2k;
	Sat, 01 Apr 2023 16:20:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxb-00AsGV-2l
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7NGiJ81IrYLn/swek120Jnkdjqchm2Fjao1ggs2HpR8=; b=qRf72L8L9xeziN+GPoDyOWNQWN
	qhfZU4f8gE0YNfkdxYKeMkcTcZz4hUfhxfW6p3SlSqQzKVqqf/kIB1fSsmnIdt6Uk1gb6gMHahVK2
	IqXCGGeClPQDggAx6WQ4p/qQInXJJKIvYpSOZMzLI0ST80tw/pRa9qwnWrWiaFo7PdhN0LNzVMHIG
	I26oYf8jvuKwnx/L16KGUXJYoYi3igXRta1PTYyb5KE0sOIbZ3JbRXCwEJY0o7zPsnd0laM6OqiMR
	yFxG6qWiTXJlgdZH0q6rJ4p7j45J8A+1wfbkpJJMVsaVOLR9cjUo1GGq7SQcqIclzB0AimuF8mWVP
	ZKMl+7BQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKv-1j
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008Ib-RM; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GR0-Hl; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-009kgO-JY; Sat, 01 Apr 2023 18:19:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 21/49] mtd: rawnand: intel: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:10 +0200
Message-Id: <20230401161938.2503204-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fLR/Y8m4G0IqzpSPFOMpcGWek4i+WvFtu6lKjj+Ive8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkWFuhcoX4heRZmiJs/e9xqg+lSJZJnBVELz +hCHtt3PQCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZFgAKCRCPgPtYfRL+ TqYJCACFLSKf6YwAy9aD+0bHyVf/4M3y4muobC073ZwMfodzdjxvLU/NDA7vrTkODi3Xz2cedb+ 7533Lzek8vsY5MsWiXzl32pVs/qYqCTZFrk+US2CBp918qCYBpPvP1jLfP1ZX3O3Xt+ejhHzo1c Lw9ei0lxbXiVL4CdCdeWvzoLCk9Thdha3RV+tvdI6471TddL8URbZ6z2Igr6kbl/yUVAB+koFdu YmU0Q0Kk4RpLX6e2lHSZzBXRhk4CBvLu/RPFCTzP7FFUtwkeWNQwbjra4hVKkiNXh16h2E+6Ffi Wsaj60ilrWf7ovHFC3QM8sUpR/ovrAN++OH7Jm+WxIJV9LM0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_884681_EA549C22 
X-CRM114-Status: GOOD (  16.21  )
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
dmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVyLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jCmluZGV4IDZmNGNlYTgxZjk3Yy4u
YTk5MDllYjA4MTI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5k
LWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRy
b2xsZXIuYwpAQCAtNzA2LDcgKzcwNiw3IEBAIHN0YXRpYyBpbnQgZWJ1X25hbmRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50
IGVidV9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZv
aWQgZWJ1X25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3Ry
dWN0IGVidV9uYW5kX2NvbnRyb2xsZXIgKmVidV9ob3N0ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CiAJaW50IHJldDsKQEAgLTcxNyw4ICs3MTcsNiBAQCBzdGF0aWMgaW50IGVidV9uYW5k
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWVidV9uYW5kX2Rpc2FibGUo
JmVidV9ob3N0LT5jaGlwKTsKIAllYnVfZG1hX2NsZWFudXAoZWJ1X2hvc3QpOwogCWNsa19kaXNh
YmxlX3VucHJlcGFyZShlYnVfaG9zdC0+Y2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBlYnVfbmFuZF9tYXRjaFtdID0gewpAQCAtNzI5LDcg
KzcyNyw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGVidV9uYW5kX21hdGNoKTsKIAogc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZWJ1X25hbmRfZHJpdmVyID0gewogCS5wcm9iZSA9
IGVidV9uYW5kX3Byb2JlLAotCS5yZW1vdmUgPSBlYnVfbmFuZF9yZW1vdmUsCisJLnJlbW92ZV9u
ZXcgPSBlYnVfbmFuZF9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAiaW50ZWwtbmFu
ZC1jb250cm9sbGVyIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gZWJ1X25hbmRfbWF0Y2gsCi0tIAoy
LjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
