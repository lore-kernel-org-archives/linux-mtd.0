Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBC7C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W97z1odyv6ZOCt+n4LE64bLSBi3ZH4VUtuh4YpZk9hA=; b=lpewYN077jSyG4
	e5UQtHlv7G54hhVGt/FRljLnuLXxZh0A7ULpxK/8qvkB1zw9bHwfXAxClku8Fx/nTdCCynLyix+Ju
	vWkP57dfEjgoSoyzabCmPJI9L3swLVmvfRmumcGLAAKzH5GfZ1EvZDdF0z9U9aoCDMesjiYkPpG6f
	lLvOWmHAPfH1rKAUVbHFNWObWaN3BEm1F5SYJVYLeB3i86cO1cc/49xX4Vhc20ou7zHiPOAmrd6T9
	cJt1kq+OwjYSq74O5dhMxjJddC2LHzjzJ/xnAz4xBpQ/o4Ogc54I/cDGe3VhxoqRhyFZMYyXcoC4h
	PCdp5hUFH5glbY3hT31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEG-00AwSH-2V;
	Sat, 01 Apr 2023 16:37:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieED-00AwRk-2n
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DLAmKykExcbO0JzUBYJlHYgvFIZhTW7HXMdbM8jxP00=; b=Je30Q56fqMRzqYrd5PuIFvvddW
	wdxyg2sLfJCxIlIqHnKs4npUACVWulzqcOI+f1erxQVm2Yj4DOykugWVWLWcYsenP0Z/C2iKTdz5H
	cuxAbaDO0LkcSFkCljWcYdTIvJjqR43oJUNFQ4OUBiSu4Faes+oDeY2pwk4uE9o0SaBqTyDJz1dei
	xUNrMQazQFW+Du8pAyPBZ8eNf3lO75e5JjmtcFoThmZC6odFFw2x+f5HdlPPujVJAxnwIJbf7laZB
	EIay6ZPXyEzvk1OZTuWn/Gp26jY65F4jnfAaG5wlC5w7Q1aB3bJhVKqTMWjxCV7jmUCnEUbqjKIO4
	ZpSfUvQA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYOC-Eo
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-0008N9-PW; Sat, 01 Apr 2023 18:19:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRc-La; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-009kgc-G9; Sat, 01 Apr 2023 18:19:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Richard Weinberger <richard@nod.at>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 25/49] mtd: rawnand: meson: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:14 +0200
Message-Id: <20230401161938.2503204-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1PHui4ayscbjWOMu4Uq3reeTu+VKa/h2YMHVa3mMo4E=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNSNUOl7hP66SrrV2+lljt0Hb/xmVvatC+pN1NjO/oN tNZatqdjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEykNYODoX17UEXF9pg3/Xa7 L92WelVlb8fmtq7FvPwTT3hqtXx2nHjAUu81ve3b7l4WzJt0xSRgUeTN/5vZeC4s2PmiMHWV0fb Q185bPpiJpbPWveUL8Qk2fryksHr/wV6tuBqt2WfktWPUdxXUtZ1W6TfaK5F3umXWzNlHX5wteb m8o6AgjH/Ru4Uuc4zsKmNTTVdv2SnxNu5W7NyXJ7eWtU+f+eaWdPpJ1efH5GUOzJE8njfxfUd85 5SC6gmbWzrK8nfrlNipGYequ6yUTdw5e/aG/PAol3V2Rd8Kqk5xrRDLt9qk9zVTPf+i1SaHMu9l z3o/O63+/SnGIj+bNfrunmSu1rl3N8cHn1xT9EZC518vAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_658736_57EB645C 
X-CRM114-Status: GOOD (  12.60  )
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
dmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFu
ZC5jCmluZGV4IDVlZTAxMjMxYWM0Yy4uMjRmMWFkMDI1Y2RhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCkBAIC0xNDM0LDIwICsxNDM0LDE4IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3Rh
dGljIGludCBtZXNvbl9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitz
dGF0aWMgdm9pZCBtZXNvbl9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiB7CiAJc3RydWN0IG1lc29uX25mYyAqbmZjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7
CiAKIAltZXNvbl9uZmNfbmFuZF9jaGlwX2NsZWFudXAobmZjKTsKIAogCW1lc29uX25mY19kaXNh
YmxlX2NsayhuZmMpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIG1lc29uX25mY19kcml2ZXIgPSB7CiAJLnByb2JlICA9IG1lc29uX25mY19wcm9iZSwK
LQkucmVtb3ZlID0gbWVzb25fbmZjX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IG1lc29uX25mY19y
ZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgID0gIm1lc29uLW5hbmQiLAogCQkub2ZfbWF0
Y2hfdGFibGUgPSBtZXNvbl9uZmNfaWRfdGFibGUsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
