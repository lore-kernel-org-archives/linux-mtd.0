Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA92C77B6E
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hHJ6X6/01Fgz4ay2EYjb8blT0spxgH9RzoMrxwIhXk=; b=HNCaf4em1NULHJ
	8IrAFTtJMyPJhuF0WustJHQNQwjgKPTK7uC+tBKx7ylKVCYU9iap2FiFOsPRS3R7QmZElftIgLW8M
	8eZuu4ZuTc8eNLgdUCoKhF3/7HpEkQSgSI35IL+nn4O46+fBQr1Die2/sCr9GbZ9HGFkhq7ozvbfB
	NcwiZrymyGsTiG2P4NoeKk7HiNCdZ0/sVNB5c83/UDR1/uA+PfbPqqaXplWaUUNSK942gALCfNedU
	OHvN06YfI41L2THcNH9Kkf5aRes/oOWsdQ27XWmzSgCdcrRqlJQI8jzGiZv8C9RC+37qT+BBMN2tt
	x6y3DDfT1T8QErwWQzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxr-00AsOi-0P;
	Sat, 01 Apr 2023 16:20:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As8p-0k
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-00089J-Uk; Sat, 01 Apr 2023 18:19:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-008GPs-Re; Sat, 01 Apr 2023 18:19:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-009kfN-8Q; Sat, 01 Apr 2023 18:19:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 05/49] mtd: rawnand: ams-delta: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:54 +0200
Message-Id: <20230401161938.2503204-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VtI+ygXkmxX71/ikFzjg+mq47iFVFdJLSTwb8ONqOvM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj1D/c0e3ml2OyzJJCcbGz2zS36rkT0rwK5W cIOUjYX0QiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY9QAKCRCPgPtYfRL+ TkBlB/oCW8MQOYBxMUx4vozICJ7xHt0uicFs8nNJalU01QgdMUZrHfM+75CbIOfSpYS0jkWiv9t Sm9oKsU2yNCkc6WjCaQp4LAnZYAYb5iPeChDEbeZcP+eBcp6aSc5lbuILjoeFriYrqxPUWwAOAo K7yKTgIZ/d8yDPIp1HyB6P6/aTIXRr4oXfN+V5DbkfgKHdj/rDyjRApl6oxkduJdmerhqgncSIn aEJJROXZ353DgBaQ1/uDzUs4EolslP75RWcqxXG8t3O+oEYnGDpGWRT8MgjF443Mmzyubwmgt+3 X7y+Vd4+GBvoBQDSQu7H//sS7i+Az4loQ5QbAT3jm5BqVpXD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_283454_5654A0A8 
X-CRM114-Status: GOOD (  16.52  )
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
dmVycy9tdGQvbmFuZC9yYXcvYW1zLWRlbHRhLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9hbXMtZGVsdGEuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Ftcy1kZWx0YS5j
CmluZGV4IDEzZGUzOWFhMzI4OC4uZmE2MjFmZmE2NDkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9hbXMtZGVsdGEuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hbXMtZGVs
dGEuYwpAQCAtMzk3LDcgKzM5Nyw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19uYW5kX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAvKgogICogQ2xlYW4gdXAgcm91dGluZQogICovCi1z
dGF0aWMgaW50IGdwaW9fbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
K3N0YXRpYyB2b2lkIGdwaW9fbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3QgZ3Bpb19uYW5kICpwcml2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7CiAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZCgmcHJpdi0+bmFuZF9jaGlw
KTsKQEAgLTQxMCw4ICs0MTAsNiBAQCBzdGF0aWMgaW50IGdwaW9fbmFuZF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXQgPSBtdGRfZGV2aWNlX3VucmVnaXN0ZXIobXRk
KTsKIAlXQVJOX09OKHJldCk7CiAJbmFuZF9jbGVhbnVwKG10ZF90b19uYW5kKG10ZCkpOwotCi0J
cmV0dXJuIDA7CiB9CiAKICNpZmRlZiBDT05GSUdfT0YKQEAgLTQzNCw3ICs0MzIsNyBAQCBNT0RV
TEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBncGlvX25hbmRfcGxhdF9pZF90YWJsZSk7CiAKIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGdwaW9fbmFuZF9kcml2ZXIgPSB7CiAJLnByb2Jl
CQk9IGdwaW9fbmFuZF9wcm9iZSwKLQkucmVtb3ZlCQk9IGdwaW9fbmFuZF9yZW1vdmUsCisJLnJl
bW92ZV9uZXcJPSBncGlvX25hbmRfcmVtb3ZlLAogCS5pZF90YWJsZQk9IGdwaW9fbmFuZF9wbGF0
X2lkX3RhYmxlLAogCS5kcml2ZXIJCT0gewogCQkubmFtZQk9ICJhbXMtZGVsdGEtbmFuZCIsCi0t
IAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
