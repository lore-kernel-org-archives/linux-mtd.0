Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA89606A320
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=17mVEJ9q;
	dkim=fail reason="signature verification failed" header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=DhTcSk5g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=p3y1RGps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5ntIJ6DUm9jk7EqnK4/3wAiJIU7ovWo75WHmNr/o8BQ=; b=17mVEJ9qwIfhP/vvtGZjF8oNMF
	BM+v3PjrgRqalFHQdvbldUd1H1cM7tTYeerO8rS+cPQQbJ4qrBTA1hvaGiy0xK3Rj3S5lXrs8lOMT
	uapcswoSxHV79BlLtMpCfqjuK199Ijl2jHFqO/xMQDlFQhXYogPUPZoXVyPfBcg+K08pMDGwrW/Ik
	FpTNM4JjPFGrK0FsfIijHWhKgR5feFpLh0leptcem/ijH93R+D0hG6rqAGKE7wMeKiMhe33a2ExD/
	DxxXRETpDlIlm1jBBtBD3Yn4Jm5z71zGBv2tDO489dHKtlLX++YwHqKCngkqIbTdIMDB0xICGpUY1
	VM3fMH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUurH-00000000YLu-19Vp;
	Sat, 21 Nov 2026 23:51:03 +0000
Received: from [78.108.101.136] (helo=mail.vitkazik.cz)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUurE-00000000YLW-1RSC
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 23:51:01 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795304609; bh=dQxHVLXRVtvTiVK3ZDZFUT2
	JZy2SgYhBAEXijNGW5Ak=; b=DhTcSk5gg7W9N7KvtLhlquKHbMZa4TvdAUkT8LKpvq67haQz2U
	2IyOi1+ZayUbvhX2Ar4V5/kOEvUxVWxsNkCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1795304609; bh=dQxHVLXRVtvTiVK3ZDZFUT2
	JZy2SgYhBAEXijNGW5Ak=; b=p3y1RGpsyLwg5jvxIQAW6ow4EQ5F6b1nNU1PijVEzuqQrcvJjv
	dAD1DZbhmLen2EOdVLpZNii4CRZo2UArs3zs6axnDwEjt3SrMuImOPkkwT9IemZjGGZ3fvWEsUm
	FSrKOhSwvZv3eg6Ntc8FoBF0xctxYKOHctfZqMjSy5yTsHWe5na3Dc61aCzdlCNZ+dlZnDUnBWu
	ngeAsKRMRhEUCAq55oaw9MmF3jjpyS182/bEctrlVx1g5g6jSZSLLfJV0WF3T7WocctcY0uYX4f
	W0rG3BTwXeDY4TZr9l7a1Z7oK+4Uv2aFkyyWIuFupXl4VWDK5O+QBk7c42IQjwBeqDQ==;
From: =?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADt=20Kaz=C3=ADk?= <vitkazik@vitkazik.cz>
Subject: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Date: Sun, 22 Nov 2026 00:41:24 +0100
Message-ID: <20261121234125.16093-1-vitkazik@vitkazik.cz>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_155100_488841_6702800A 
X-CRM114-Status: GOOD (  10.95  )
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
eXRlcywgNiBmcmVlIGJ5dGVzIGFuZCA4IEVDQyBieXRlcy4gVGhlIGV4aXN0aW5nCm1pY3Jvbl80
X29vYmxheW91dCByZXBvcnRzIHRoZSByZXNlcnZlZCBieXRlcyBvZiBzZWN0aW9ucyAxLTMgYXMK
ZnJlZSwgc28gYWRkIGEgbGF5b3V0IHRoYXQgZXhwb3NlcyBvbmx5IGJ5dGVzIDItNyBvZiBlYWNo
IHNlY3Rpb24uCgpUZXN0ZWQgb24gYSBNb3Rvcm9sYSBOQ0FQLTUwMCAoQXRoZXJvcyBBUjcyNDIp
IHJ1bm5pbmcgT3BlbldydAp3aXRoIGtlcm5lbCA2LjE4LjM5LCB1c2luZyBVQkkgd2l0aCBVQklG
UyBmb3IgYWJvdXQgMyBtb250aHMuClRoZSBjaGlwIGlzIGRldGVjdGVkIGNvcnJlY3RseToKCnNw
aS1uYW5kIHNwaTAuMTogTWljcm9uIFNQSSBOQU5EIHdhcyBmb3VuZC4Kc3BpLW5hbmQgc3BpMC4x
OiAxMjggTWlCLCBibG9jayBzaXplOiAxMjggS2lCLApwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXpl
OiA2NAoKU2lnbmVkLW9mZi1ieTogVsOtdCBLYXrDrWsgPHZpdGthemlrQHZpdGthemlrLmN6Pgot
LS0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jIHwgMjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWlj
cm9uLmMKaW5kZXggMzZmNmNiYmQ3NDYyLi5jYzZlZmYwZTU0YzIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jv
bi5jCkBAIC0xMzQsNiArMTM0LDIzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91
dF9vcHMgbWljcm9uXzRfb29ibGF5b3V0ID0gewogCS5mcmVlID0gbWljcm9uXzRfb29ibGF5b3V0
X2ZyZWUsCiB9OwogCitzdGF0aWMgaW50IG1pY3Jvbl9tNjhhX29vYmxheW91dF9mcmVlKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKKwkJCQkgICAgICBzdHJ1Y3QgbXRkX29vYl9y
ZWdpb24gKnJlZ2lvbikKK3sKKwlpZiAoc2VjdGlvbiA+PSA0KQorCQlyZXR1cm4gLUVSQU5HRTsK
KworCXJlZ2lvbi0+b2Zmc2V0ID0gKHNlY3Rpb24gKiAxNikgKyAyOworCXJlZ2lvbi0+bGVuZ3Ro
ID0gNjsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9vb2JsYXlv
dXRfb3BzIG1pY3Jvbl9tNjhhX29vYmxheW91dCA9IHsKKwkuZWNjID0gbWljcm9uXzRfb29ibGF5
b3V0X2VjYywKKwkuZnJlZSA9IG1pY3Jvbl9tNjhhX29vYmxheW91dF9mcmVlLAorfTsKKwogc3Rh
dGljIGludCBtaWNyb25fc2VsZWN0X3RhcmdldChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5h
bmQsCiAJCQkJdW5zaWduZWQgaW50IHRhcmdldCkKIHsKQEAgLTQwNCw2ICs0MjEsMTYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gbWljcm9uX3NwaW5hbmRfdGFibGVbXSA9IHsK
IAkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKIAkJCQkgICAgIG1p
Y3Jvbl84X2VjY19nZXRfc3RhdHVzKSwKIAkJICAgICBTUElOQU5EX1NFTEVDVF9UQVJHRVQobWlj
cm9uX3NlbGVjdF90YXJnZXQpKSwKKwkvKiBNNjhBIDFHYiAzLjNWICovCisJU1BJTkFORF9JTkZP
KCJNVDI5RjFHMDFBQUFERCIsCisJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JFQURJRF9NRVRI
T0RfT1BDT0RFX0RVTU1ZLCAweDEyKSwKKwkJICAgICBOQU5EX01FTU9SRygxLCAyMDQ4LCA2NCwg
NjQsIDEwMjQsIDIwLCAyLCAxLCAxKSwKKwkJICAgICBOQU5EX0VDQ1JFUSg0LCA1MTIpLAorCQkg
ICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmeDRfcmVhZF9jYWNoZV92YXJpYW50cywKKwkJ
CQkJICAgICAgJngxX3dyaXRlX2NhY2hlX3ZhcmlhbnRzLAorCQkJCQkgICAgICAmeDFfdXBkYXRl
X2NhY2hlX3ZhcmlhbnRzKSwKKwkJICAgICAwLAorCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbWlj
cm9uX202OGFfb29ibGF5b3V0LCBOVUxMKSksCiAJLyogTTY5QSAyR2IgMy4zViAqLwogCVNQSU5B
TkRfSU5GTygiTVQyOUYyRzAxQUFBRUQiLAogCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFE
SURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg5RiksCgpiYXNlLWNvbW1pdDogZWMxZTg0NGI5NDg2
MzAyYTQ4OGFiYzAzZWE5MThkYjYwNzA5NzY2ZQotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
