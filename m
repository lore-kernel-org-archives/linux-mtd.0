Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5C5C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bcf8BZOEZqMPelC2JVwPn4uxwxS97+alV8xRmIrXjKQ=; b=b0DU2xSzFVBvV6
	Henq6h9jZIq3ICIamY9L46Gu0fRoBSVMm64r7iPx/z4D3NnnHv69p9n8Cqw/z/UWbvRdwBGPbhGtA
	GnZVRxIWxijCpp9BncPAqhm+BgDYZnWnmhE1/Dm99nD+I59e988MNHQGYX3/1SOivUH9r0kufzAzi
	/dwoYuYS7aLh/TGUN7Iw9jB92IlcyrP49JSVMnbYwE+6h7fpHwAFotP73k1JQt6alxVoZW5YWt2Po
	IzrOOGaqboybMUpQLqeo94v6elhq1KA5xU4NTZi5eiWy5CjJeU9UnHpnnYQvwoNZxIkouW7u3D5sn
	MN0fZgVGZIW/x2UxCjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyL-00Asg2-0v;
	Sat, 01 Apr 2023 16:20:57 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxd-00AsHc-1v
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2GBW08o9sTvlTKfiDQpR1H3c6dpyS4I0ZoJMTPm2OzM=; b=NuZert1lmm6ucUCoCB05UcygZ7
	sWjFg1SPyW9HJlBv1TfXk3l8VkFj9STcYDbkeZkokCmVgg1OyvT1KmFSMLqim2beojy8Z6+tWri6f
	fBduuYN1D/AMtoD2l1DhGcAmapoa8QhP3CZqNO2xKfm8/6JwgEQG3mDJSIsZ1uaChxOGhM+hpSJLc
	93m6EKYq90nnVUmA3m93zJEl3604p+7XETx16iI/ODFdq9Nm7TxQhRRW/nYN/YZ6HqdUe5d8LFnVQ
	GRm0SZ/e+h25x/vcyofw4MLf5T4SfUeJWToWOZ8ml78Yiyg+fGCY1tyHt1mjsSqFQx6bAqkekvFHf
	fClCbCRA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKn-2c
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008Iv-HG; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GR5-JB; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-009kg8-Q5; Sat, 01 Apr 2023 18:19:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 17/49] mtd: rawnand: gpio: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:06 +0200
Message-Id: <20230401161938.2503204-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Qa0UNc0ZLq5BiHzyZQHe7oOtRkhVAwb/C37f8QKiCIg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkDDoqKcvCvM36bnCMSmTLzMEL9FaZobvqbk HnwgOPymZyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZAwAKCRCPgPtYfRL+ TkkcB/9PL5+WTs93Q17vScnxfBpWbznl+xUvpL8jGLwvbHdet19/2n3z0llWMcQI6AsNixAuvsr 4evR4K+aoIieWmTdJaIzSE55RZqsOsS1nmdokBIQrOE2ir6cO2JMIFG7iF24H9ESwzmekrWCDn4 HhtfG/Mu8vHzMTFyxXqlLxY8xUgMQW7nr5lO3JHk41XoRfZ8GfPRMv9lq59lAo2PvOV/RrsxQSK 8voa6kst0BaPzo0V6uf0SqvNt3XO4s3zOp7IJHnSuzJo8FJhJMAFIGpv4WJk/DnMY211PWzNINj cSoqspa/BvE5KJE17diR5YynArdFWTbcNbw1Rcaz+kUtpPV2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_094039_F625ACA4 
X-CRM114-Status: GOOD (  16.06  )
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
dmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZ3Bpby5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jCmluZGV4IGRjZjI4Y2Zm
NzYwZC4uZDZjYzJjYjY1MjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncGlv
LmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jCkBAIC0yNjUsNyArMjY1LDcgQEAg
Z3Bpb19uYW5kX2dldF9pb19zeW5jKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0
dXJuIHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMSk7CiB9CiAK
LXN0YXRpYyBpbnQgZ3Bpb19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQorc3RhdGljIHZvaWQgZ3Bpb19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogewogCXN0cnVjdCBncGlvbXRkICpncGlvbXRkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CiAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZncGlvbXRkLT5uYW5kX2NoaXA7CkBA
IC0yODAsOCArMjgwLDYgQEAgc3RhdGljIGludCBncGlvX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWdwaW9kX3NldF92YWx1ZShncGlvbXRkLT5ud3AsIDApOwog
CWlmIChncGlvbXRkLT5uY2UgJiYgIUlTX0VSUihncGlvbXRkLT5uY2UpKQogCQlncGlvZF9zZXRf
dmFsdWUoZ3Bpb210ZC0+bmNlLCAwKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IGdw
aW9fbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQpAQCAtMzk0LDcgKzM5
Miw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGdwaW9fbmFuZF9kcml2ZXIg
PSB7CiAJLnByb2JlCQk9IGdwaW9fbmFuZF9wcm9iZSwKLQkucmVtb3ZlCQk9IGdwaW9fbmFuZF9y
ZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBncGlvX25hbmRfcmVtb3ZlLAogCS5kcml2ZXIJCT0gewog
CQkubmFtZQk9ICJncGlvLW5hbmQiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIo
Z3Bpb19uYW5kX2lkX3RhYmxlKSwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
