Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AD606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0qLTKXGL;
	dkim=fail reason="signature verification failed" header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=3vrt049d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=vOEWq44Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SkogTNeaBQhBZ5xNu+fQB71EpTmHzG3oUFvbem73IqA=; b=0qLTKXGLwCKFj2oOInxk2BGvZJ
	el++l41/wxbuezK+FPnRTYQEQRjQ40r8g0mEPP7oC/5IkvGdP8Eq1ZlakSpob/AXp2wWDF183UfE7
	IDzx2JAC1tg2/4BHG/DRLDFIoJOgKF37efFQGTT9XY8392/GK8xwqiugGlL8gvRlZtFkWcphe1tPw
	8XvUIjXJUc5u2PebxhoEo7muvnTfa580jSBhYpp36iuCQWxj5huj5whBk8rx8QkPEsfNGgZNpyX6X
	iOx2NN+uyVJLC0soPerALoEgPv4C9RaJGMt2BMzL8aJzO6At9l8/76eyY4NNaguAhN0eBXAFbxeyM
	eGkC3bDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5bz-00000000Cu6-0zrh;
	Fri, 27 Nov 2026 23:44:15 +0000
Received: from [78.108.101.136] (helo=mail.vitkazik.cz)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5bp-00000000Cq0-0HjC
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 23:44:07 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795823030; bh=hyH5xctCfSmUQx/A63BfRYH
	7Qc0jBej0X1hV87nxors=; b=3vrt049dWpX4YUJfs90CfIcbtHU/GLnzfXgfI50wm0yjDw/e77
	e2vM/Hj2wKlLlNQeI7sCDXzOulMpHqZvlaAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795823030; bh=hyH5xctCfSmUQx/A63BfRYH
	7Qc0jBej0X1hV87nxors=; b=vOEWq44Y/9Kyp7Cf58NHxARHNku8nULR6CQtw+GemC7E56dAxz
	1MxMBJaq3OGgVNu1ulnPxEl5y1AiszGueNhw8lECmUI3sLUuBGukdk8iiuuR/ZJn1qjBk6ogomr
	el9wfqfquINls3q3AkZdxrIUi+GaR9xx2JOwuwktK3+mzoYjASC6hR2LYeIvyi7xNs1QXVkIWko
	n99/jX8V3U3Iw6nMrDXzjXTgdGtCNVIiNvBdQT+lZnYJWgveeTIULN2k6P9+wekGBzq2BDB6ymM
	R2viY1k/jLir3UmWJHF8fOXhLdlgT0TT8CLtulyXeXXXPeGeWesf+PBSrH1p14++Ezw==;
From: =?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: tudor.ambarus@linaro.org,
	m.felsch@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
Subject: [PATCH v2] mtd: spinand: micron: add support for MT29F1G01AAADD
Date: Sat, 28 Nov 2026 00:43:01 +0100
Message-ID: <20261127234301.262679-1-vitkazik@vitkazik.cz>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_154405_149921_2FEA4922 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIHN1cHBvcnQgZm9yIHRoZSBNaWNyb24gTVQyOUYxRzAxQUFBREQgKE02OEEpLCBhIDFHYiAz
LjNWIFNQSSBOQU5ECndpdGggMjA0OCs2NCBieXRlIHBhZ2VzLCA2NCBwYWdlcyBwZXIgYmxvY2ss
IHR3byBwbGFuZXMgYW5kIDQtYml0Cm9uLWRpZSBFQ0MuCgpUaGUgNjQgc3BhcmUgYnl0ZXMgYXJl
IHNwbGl0IGludG8gZm91ciAxNi1ieXRlIHNlY3Rpb25zLCBlYWNoIHdpdGgKMiByZXNlcnZlZCBi
eXRlcywgMiBieXRlcyBvZiB1bnByb3RlY3RlZCBtZXRhZGF0YSwgNCBieXRlcyBvZgpFQ0MgcHJv
dGVjdGVkIG1ldGFkYXRhIGFuZCA4IEVDQyBieXRlcy4gQWRkIGEgbGF5b3V0IHRoYXQgZXhwb3Nl
cwpvbmx5IHRoZSBFQ0MgcHJvdGVjdGVkIGJ5dGVzIDQtNyBvZiBlYWNoIHNlY3Rpb24gYXMgZnJl
ZSBPT0Igc3BhY2UuCgpUZXN0ZWQgb24gYSBNb3Rvcm9sYSBOQ0FQLTUwMCAoQXRoZXJvcyBBUjcy
NDIpIHJ1bm5pbmcgT3BlbldydAp3aXRoIGtlcm5lbCA2LjE4LjY0LCB1c2luZyBVQkkgd2l0aCBV
QklGUy4KVGhlIGNoaXAgaXMgZGV0ZWN0ZWQgY29ycmVjdGx5OgoKICBzcGktbmFuZCBzcGkwLjE6
IE1pY3JvbiBTUEkgTkFORCB3YXMgZm91bmQuCiAgc3BpLW5hbmQgc3BpMC4xOiAxMjggTWlCLCBi
bG9jayBzaXplOiAxMjggS2lCLAogIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0CgpTaWdu
ZWQtb2ZmLWJ5OiBWw610IEthesOtayA8dml0a2F6aWtAdml0a2F6aWsuY3o+Ci0tLQp2MjoKLSBl
eHBvc2Ugb25seSBieXRlcyA0LTcgb2YgZWFjaCBzZWN0aW9uIGFzIGZyZWUgT09CIHNwYWNlCgog
ZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9u
LmMKaW5kZXggMzZmNmNiYmQ3NDYyLi4zNGE4ZWE3N2MzZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvc3BpL21pY3Jvbi5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5j
CkBAIC0xMzQsNiArMTM0LDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9v
cHMgbWljcm9uXzRfb29ibGF5b3V0ID0gewogCS5mcmVlID0gbWljcm9uXzRfb29ibGF5b3V0X2Zy
ZWUsCiB9OwogCitzdGF0aWMgaW50IG1pY3Jvbl9tNjhhX29vYmxheW91dF9mcmVlKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKKwkJCQkgICAgICBzdHJ1Y3QgbXRkX29vYl9yZWdp
b24gKnJlZ2lvbikKK3sKKwlpZiAoc2VjdGlvbiA+PSA0KQorCQlyZXR1cm4gLUVSQU5HRTsKKwor
CS8qIDIgYnl0ZXMgZm9yIHRoZSBCQk0gKyAyIGJ5dGVzIG9mIG5vbi1FQ0MgcHJvdGVjdGVkIG1l
bW9yeSAqLworCXJlZ2lvbi0+b2Zmc2V0ID0gKHNlY3Rpb24gKiAxNikgKyA0OworCXJlZ2lvbi0+
bGVuZ3RoID0gNDsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9v
b2JsYXlvdXRfb3BzIG1pY3Jvbl9tNjhhX29vYmxheW91dCA9IHsKKwkuZWNjID0gbWljcm9uXzRf
b29ibGF5b3V0X2VjYywKKwkuZnJlZSA9IG1pY3Jvbl9tNjhhX29vYmxheW91dF9mcmVlLAorfTsK
Kwogc3RhdGljIGludCBtaWNyb25fc2VsZWN0X3RhcmdldChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQsCiAJCQkJdW5zaWduZWQgaW50IHRhcmdldCkKIHsKQEAgLTQwNCw2ICs0MjIsMTYg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gbWljcm9uX3NwaW5hbmRfdGFibGVb
XSA9IHsKIAkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKIAkJCQkg
ICAgIG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKSwKIAkJICAgICBTUElOQU5EX1NFTEVDVF9UQVJH
RVQobWljcm9uX3NlbGVjdF90YXJnZXQpKSwKKwkvKiBNNjhBIDFHYiAzLjNWICovCisJU1BJTkFO
RF9JTkZPKCJNVDI5RjFHMDFBQUFERCIsCisJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JFQURJ
RF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweDEyKSwKKwkJICAgICBOQU5EX01FTU9SRygxLCAyMDQ4
LCA2NCwgNjQsIDEwMjQsIDIwLCAyLCAxLCAxKSwKKwkJICAgICBOQU5EX0VDQ1JFUSg0LCA1MTIp
LAorCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmeDRfcmVhZF9jYWNoZV92YXJpYW50
cywKKwkJCQkJICAgICAgJngxX3dyaXRlX2NhY2hlX3ZhcmlhbnRzLAorCQkJCQkgICAgICAmeDFf
dXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKKwkJICAgICAwLAorCQkgICAgIFNQSU5BTkRfRUNDSU5G
TygmbWljcm9uX202OGFfb29ibGF5b3V0LCBOVUxMKSksCiAJLyogTTY5QSAyR2IgMy4zViAqLwog
CVNQSU5BTkRfSU5GTygiTVQyOUYyRzAxQUFBRUQiLAogCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFO
RF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg5RiksCgpiYXNlLWNvbW1pdDogZWMxZTg0
NGI5NDg2MzAyYTQ4OGFiYzAzZWE5MThkYjYwNzA5NzY2ZQotLSAKMi41Ni4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
