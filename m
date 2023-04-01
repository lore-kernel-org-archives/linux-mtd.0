Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC880C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXPbLio0BQT7HugkU1YLM8ccpX1HgOAo8wOmT8ICb68=; b=x3JqMOVbOX5VqY
	Q7LCTq6nma4VV01vezUAMXVbVF6/9r64Kd0+68PS6cPpEGK04m6odX98MypYpjKtSmyccaye+NlZG
	chFci7SMUgzF2HIaSzoEI1VomtrJDu8nhu7jKuCBuvdPm5ByzBWeO3yt30pwqD7iMcDCh0FRWfd3h
	BEYO/khYfskdnHArNAshIk3N6HbtDCrU+PuqFzQxnbCUfTfDfHkSad9JoYfXrjxDonNnnF3gY5s7H
	JWkeIy60NNET+btWClBLlkpSZPPFYHDwHNrwBuhBETSg1yr546uqxhD8W6BABAwc0TGpmooUPbjVs
	tCCfvzVtXiVovrjguYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyE-00AsaT-2l;
	Sat, 01 Apr 2023 16:20:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As98-0d
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-0008AA-O8; Sat, 01 Apr 2023 18:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-008GQF-4C; Sat, 01 Apr 2023 18:19:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-009kfe-4Q; Sat, 01 Apr 2023 18:19:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 09/49] mtd: rawnand: bcm47xxnflash: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:58 +0200
Message-Id: <20230401161938.2503204-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vBbbS66OwtQuWqNU5RP4uqe0iTYZjagBym+7MxdQoqI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFj6xaViYZ6pypactGh+k76eGvuQOcm1Rgw+q vgDHOfsnGOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY+gAKCRCPgPtYfRL+ TnNLCAC7oH7/FuiWDo7A+RZQZacjEW/vANwwJnuzqeTJE66h6JslbwXoEDV9vM689vfqMfWm2rJ WYi4S3IOzMrwrfpcAZiClB/5G33aXMF+XqTi0qnG6tG2tWdHeKAQyADNtp5Np96YOkG2WV5c59P ebHxVMUfajSJOWD0EhUkIfDXC5VGxtYMRWXHAMwopXweKMo+WGVyXoDe7RoSL+0QoZPSq1ReybW mmKB4aLRdXwUUzm475kI/dIGNDKR2zVW0NZpXoiq2x3jqZ/bjZbwx7faSDHovpiBhqHIhOHp3Re NMPKIwnC+OVNkTqPcw6ZPmBxS5ZU3W+ihTP7lvigNnfFBlq0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_261609_39B56CFD 
X-CRM114-Status: GOOD (  16.22  )
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
dmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9tYWluLmMgfCA2ICsrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2JjbTQ3eHhuZmxhc2gvbWFpbi5jCmluZGV4IGRjYzcwZDlkYzZlNS4uZWJjZjUwOGUw
NjA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4u
YworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYwpAQCAtNTcs
NyArNTcsNyBAQCBzdGF0aWMgaW50IGJjbTQ3eHhuZmxhc2hfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBiY200N3h4bmZsYXNo
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgYmNtNDd4
eG5mbGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qg
YmNtNDd4eG5mbGFzaCAqbmZsYXNoID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZuZmxhc2gtPm5hbmRfY2hpcDsKQEAgLTY2LDEzICs2Niwx
MSBAQCBzdGF0aWMgaW50IGJjbTQ3eHhuZmxhc2hfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJcmV0ID0gbXRkX2RldmljZV91bnJlZ2lzdGVyKG5hbmRfdG9fbXRkKGNoaXAp
KTsKIAlXQVJOX09OKHJldCk7CiAJbmFuZF9jbGVhbnVwKGNoaXApOwotCi0JcmV0dXJuIDA7CiB9
CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGJjbTQ3eHhuZmxhc2hfZHJpdmVyID0g
ewogCS5wcm9iZQk9IGJjbTQ3eHhuZmxhc2hfcHJvYmUsCi0JLnJlbW92ZSA9IGJjbTQ3eHhuZmxh
c2hfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gYmNtNDd4eG5mbGFzaF9yZW1vdmUsCiAJLmRyaXZl
ciA9IHsKIAkJLm5hbWUgPSAiYmNtYV9uZmxhc2giLAogCX0sCi0tIAoyLjM5LjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
