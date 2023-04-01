Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9F7C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmzA7krTcLMoYjd3SrlHSdZNUXTuGqJcqM4ALouZckY=; b=HecmP88CrKqp4N
	I3TcBwVyz1segUd3kgkDgQfJPCTsM/xULO/ZOjwDV3vqZOvcW+pdEIWLPhcXAgg6tUN5BgiK7USYh
	SXBFV5Mw+wyxexN6Z/kk3QPOIZ2ut1FuTcy2POupCnUIGm6KC7AC+JmsdvnIbF496Hgm1GnPWuexK
	SWK7N7zitFtWjSnulbSeRDqmS/qeK8+jc9yQtnmya8mXQ97/QTHuWH5hhvedg7j6JVJ13tZzAkgtU
	xvvJzs0RszgJUHqjb1Sll3PRUMB8XZeqjUL0275FuJNCnLbd1dCL9HocdmsY/R8XHMGWQ87tuAOCG
	x9j+ydFPZ6gBB45ktZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxl-00AsLx-1l;
	Sat, 01 Apr 2023 16:20:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As8t-0S
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-00089E-Uj; Sat, 01 Apr 2023 18:19:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-008GPa-2l; Sat, 01 Apr 2023 18:19:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxC-009kfA-EH; Sat, 01 Apr 2023 18:19:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 01/49] mtd: nand: mxic-ecc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:50 +0200
Message-Id: <20230401161938.2503204-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NGvYn0k/gn9DbRBQZa8+JZhOJBeUk/AzPgAnpYjZcME=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNiI8r2NvZel6pqcv3ifSsPhW8kMdp8/V6IakTs2uLr 07X3P6pk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJHBBl/58gx6m5VHx7d12D SMTqQmnT/OCzE/5mVB3N4re/uOb+tt3+xnvYg7fsOeXEJthyqdt9RqrXE6ZzrU8vGLDoKAcpefL FLwxN3S2/8c+0/Z7rbdfdZLLy+fS/IMZNm2Hf0eeXszQYBfh0dvRN3v/3767OqUGTbh1g+HIvyC 4v6MCG/Kt33ydzOS108fxru/XHmfnW7qa7WU1yzvvxyIrKWdmEzzdPuD5nkkyjitzLrusxu+c0z mZoS5+0WUWxm2H9yp5HvHbCr4sqH+6eJO1wV2NNmL/cD67Tggtm8PI57bDO8pSJ+Ma2+Nf0S3It N/fwiTVZyieG/XcI9rMsmzjFsYyjnbGriiWj8bSQoScrAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_198170_1FA61524 
X-CRM114-Status: GOOD (  15.85  )
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
dmVycy9tdGQvbmFuZC9lY2MtbXhpYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9lY2MtbXhpYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9lY2MtbXhpYy5jCmluZGV4IDhhZmRjYTcz
MWI4Ny4uOTE1YWFkZDFhMTcwIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL2VjYy1teGlj
LmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9lY2MtbXhpYy5jCkBAIC04NDcsMTMgKzg0NywxMSBA
QCBzdGF0aWMgaW50IG14aWNfZWNjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgbXhpY19lY2NfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBteGljX2VjY19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbXhpY19lY2NfZW5naW5lICpteGljID0g
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKIAluYW5kX2VjY191bnJlZ2lzdGVyX29uX2hv
c3RfaHdfZW5naW5lKCZteGljLT5leHRlcm5hbF9lbmdpbmUpOwotCi0JcmV0dXJuIDA7CiB9CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14aWNfZWNjX29mX2lkc1tdID0gewpA
QCAtODcwLDcgKzg2OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG14aWNfZWNj
X2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gbXhpY19lY2Nfb2ZfaWRzLAogCX0sCiAJ
LnByb2JlID0gbXhpY19lY2NfcHJvYmUsCi0JLnJlbW92ZQk9IG14aWNfZWNjX3JlbW92ZSwKKwku
cmVtb3ZlX25ldyA9IG14aWNfZWNjX3JlbW92ZSwKIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KG14aWNfZWNjX2RyaXZlcik7CiAKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
