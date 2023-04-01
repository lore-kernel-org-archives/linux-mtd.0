Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE7EC6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6LWRSq3dP1m0nBDXEqbzTlwZGbe6tzFRKDVqnpy2iQ=; b=ojDE3j2if9otHN
	sNZP/GAl0UuZSU1zvs64oUl7hir7nMNTar26PbvEFeLCnd9FmJn8Ownke33EhnEUNs61OTrMiIm7C
	StzqPRFLYSEmR50b12v6anvS974pi4Nxze452V+bPlD+T+OuTJ1LiXWxQiax1AAb9wGKf6ATIMUnu
	CAj5H8nCU1XWElnkRHfTplHuqz6XJuUpEbsV4TPqExowa4bq578mFVmOf/y5VkRNN5/LCpJAvwNCT
	QI+olp/sciRL1PuM/uHsnVKKJI2iROZmobi9RppDhmdc3+F0zrBiIrTx6VGLPBXazKchX9oR8b34+
	9CBSKvIUrmMoheWxY6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pifJG-00B4AH-2x;
	Sat, 01 Apr 2023 17:46:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEK-00AwRk-0m
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=F4wck+ks+4to/R4TiUTZ2YDPxWlJIYAoZYky0TKDG4g=; b=QvKpLmtCNupcAxlk2E7Og8/URw
	qkCU7I1lwsb6RbW4JD3LekR+U2O5rXD/2pLMtF8peezKMukXYxmWYDpW/tMuiS4w7O1CeoM4j+fo9
	wiJ1LCQR9qHzf2gq4SANapm1q3Aarl9+vZY2RVLLGrlS1hMJNy0suLZrFKA6b1IOIhKNqbWlLhQp9
	kyK72fuPhIl9rjgR8V9nts9BEf/xsi/LwZwZlerOk4mQDmYOGFbQ5d+DbhhtmsvHnrpdaaYJ2D4Gs
	U4ap5JBmn+UZ/roGoNAStHCnE0WltWdnkmMrgb2cWXbOGv4o55witxKlfkN7b3LGGk9zjKHtyFl+5
	Dg4agLMg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxS-00CYOX-TG
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxO-0000FH-Bd; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-008GSx-D1; Sat, 01 Apr 2023 18:19:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-009khm-1h; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miaoqian Lin <linmq006@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 42/49] mtd: rawnand: sh_flctl: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:31 +0200
Message-Id: <20230401161938.2503204-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OxxfogUXdY3Kq+QGkZ0cg1gQEnSA/05REu23SWtVrzU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlND+8tMOdKWG94IDfmEmWxp61KDsqraKv/L 3uihieVIAGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZTQAKCRCPgPtYfRL+ Ti+zB/44Fh984vvSJFO/W8rj4GtOK3p3ViwY3py0aFQ1VcuUVOFZB1lK75XdurX1s3993MfKUZB iXXl9AHV/88uCuK3nm4Co4PS5I7LZCmtthPFBtf/UXlGQYBGD0hbGo932Bcq9PdnVT00QpK8xzU /qvQBn5bo3fQ6QLxB7pVFwYrFv2GK8+4WxVd1+wJYYRGOQt+t/ZY6AcfwjS0Uwem+hDYVg9xNLD NGL2rvnEDMTy1RxqYc521ivoXAiJCRFWQow+ANTqk1J4l3Et8VmhZVCwGK8jYXkQGSvS9J8GOMU 0IX0hMb8I3CQFiZKmKia+cTy7xdBNnMiJXhHBJQvnazMSe87
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172004_010497_60BEE7A7 
X-CRM114-Status: GOOD (  12.56  )
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
dmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3NoX2ZsY3RsLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jCmlu
ZGV4IGEyNzg4Mjk0NjlkNi4uNjNiZjIwYzQxNzE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9zaF9mbGN0bC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMK
QEAgLTEyMDMsNyArMTIwMyw3IEBAIHN0YXRpYyBpbnQgZmxjdGxfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGZsY3RsX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgZmxjdGxfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHNoX2ZsY3RsICpm
bGN0bCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAgPSAmZmxjdGwtPmNoaXA7CkBAIC0xMjE0LDEyICsxMjE0LDEwIEBAIHN0YXRpYyBpbnQgZmxj
dGxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJV0FSTl9PTihyZXQpOwog
CW5hbmRfY2xlYW51cChjaGlwKTsKIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Ci0K
LQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZmxjdGxfZHJp
dmVyID0gewotCS5yZW1vdmUJCT0gZmxjdGxfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gZmxjdGxf
cmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gInNoX2ZsY3RsIiwKIAkJLm9mX21hdGNo
X3RhYmxlID0gb2ZfZmxjdGxfbWF0Y2gsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
