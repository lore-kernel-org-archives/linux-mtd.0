Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9FC624DB
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suOrIzLl6oLBKcgy32RrBO8LYVo7zWJA5CWT3f1USrk=; b=QmmW8d5irAaFGk
	mvPTQvwZe64X7AuPi9FQd10B0/GNaLYG6IZiz3n8N2Eh2+6TF5RUQqhFsGq7XdxRz3fvMGQ86zCBW
	JuUWJAWHf+jC5kWKxsh/J+WdG61F1WUds0GPqSE3HDVwKOtoosM4AmLxtkbLwvYBrRXpSWXYYCGOz
	QQcA1fZjUpdaVALVPx1coHpeQQV2zQKmhEjN7xj/ofLpMSB4hUr54cGHRXby4kepT7Tg8dgVPV6tr
	xdSCfEalHHWbrJRYFk1H+wIXphSTDwqZ8zdJ831gis4dFTv7OA5iYEFEgt6P8FYO9GSz2H9Lp1KdA
	cE7wnHqhWemiwE0gX9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yv-0000000HC6W-1j6c;
	Thu, 03 Sep 2026 11:24:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yu-0000000HC4t-07YQ;
	Thu, 03 Sep 2026 11:24:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29626600D4;
	Thu,  3 Sep 2026 11:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD131F000E9;
	Thu,  3 Sep 2026 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434694;
	bh=rFhczqpnwb4IhUTkETL5+7R/pr9TNelX53Vo1wf/d7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hksb64BlCdoIKrxrQyUUcgGAjhmlnJLDgqmmCAjkd4iiQK71CSFRnOGthlo7hZegl
	 MTmHgLv3Umnrwfy6/CfpXyMHAtWQvjvuM2P8HdhZtayUPeWTYLcU0AEN+hsbJH/b84
	 iu3tveDJ2iYTw7XXGwRJJKy5NjFNKR9j1RRQalZW0jFL5eWne3a3PDlbAP96CLGx6V
	 hvgaFcbjhu46LlGdwOK1aC6qVG2nMtvDbPChIDBURXRX5i1TquZ7ZyHxzUl8tPz7n0
	 tKj3MSpYWqTnfaaa83Zwt9TfVE8vnlSGI2SeyQf/co06g3ignxw1ECKoT2OKzvLrVp
	 kfm03s2H6hYbw==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] mtd: rawnand: lpc32xx_mlc: Remove platform data support
Date: Thu,  3 Sep 2026 14:24:24 +0300
Message-ID: <20260903112425.1904748-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org>
References: <20260903112425.1904748-1-vz@kernel.org>
MIME-Version: 1.0
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

U2luY2UgTlhQIExQQzMyeHggU29DIHN1cHBvcnQgaW4gdGhlIExpbnV4IGtlcm5lbCBzdHJpY3Rs
eSBkZXBlbmRzIG9uCmRldmljZSB0cmVlIHN1cHBvcnQsIHRoZSB1bnVzZWQgcGxhdGZvcm0gZGF0
YSBzdXBwb3J0IGNhbiBiZSByZW1vdmVkCmZyb20gdGhlIE5BTkQgTUxDIGRyaXZlci4KClNpZ25l
ZC1vZmYtYnk6IFZsYWRpbWlyIFphcG9sc2tpeSA8dnpAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9scGMzMnh4X21sYy5jIHwgMjEgKystLS0tLS0tLS0tLS0tLS0tLS0tCiBp
bmNsdWRlL2xpbnV4L210ZC9scGMzMnh4X21sYy5oICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L210ZC9scGMzMnh4X21sYy5oCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9tbGMuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2xwYzMyeHhfbWxjLmMKaW5kZXggOGY2YTg5ZDliYTgzLi44NDM2MDE1ZWRjYjQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfbWxjLmMKKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbHBjMzJ4eF9tbGMuYwpAQCAtMjYsNyArMjYsNiBAQAogI2luY2x1ZGUgPGxp
bnV4L2ludGVycnVwdC5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGludXgv
Z3Bpby9jb25zdW1lci5oPgotI2luY2x1ZGUgPGxpbnV4L210ZC9scGMzMnh4X21sYy5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2lvLmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNsdWRlIDxsaW51
eC9kbWEtbWFwcGluZy5oPgpAQCAtMTc0LDcgKzE3Myw2IEBAIHN0YXRpYyBzdHJ1Y3QgbmFuZF9i
YnRfZGVzY3IgbHBjMzJ4eF9uYW5kX2JidF9taXJyb3IgPSB7CiBzdHJ1Y3QgbHBjMzJ4eF9uYW5k
X2hvc3QgewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UJKnBkZXY7CiAJc3RydWN0IG5hbmRfY2hp
cAluYW5kX2NoaXA7Ci0Jc3RydWN0IGxwYzMyeHhfbWxjX3BsYXRmb3JtX2RhdGEgKnBkYXRhOwog
CXN0cnVjdCBjbGsJCSpjbGs7CiAJc3RydWN0IGdwaW9fZGVzYwkqd3BfZ3BpbzsKIAl2b2lkIF9f
aW9tZW0JCSppb19iYXNlOwpAQCAtNTgwLDI0ICs1NzgsMTEgQEAgc3RhdGljIHZvaWQgbHBjMzJ4
eF9lY2NfZW5hYmxlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBtb2RlKQogc3RhdGljIGlu
dCBscGMzMnh4X2RtYV9zZXR1cChzdHJ1Y3QgbHBjMzJ4eF9uYW5kX2hvc3QgKmhvc3QpCiB7CiAJ
c3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZCgmaG9zdC0+bmFuZF9jaGlwKTsKLQlk
bWFfY2FwX21hc2tfdCBtYXNrOwogCiAJaG9zdC0+ZG1hX2NoYW4gPSBkbWFfcmVxdWVzdF9jaGFu
KG10ZC0+ZGV2LnBhcmVudCwgInJ4LXR4Iik7CiAJaWYgKElTX0VSUihob3N0LT5kbWFfY2hhbikp
IHsKLQkJLyogZmFsbGJhY2sgdG8gcmVxdWVzdCB1c2luZyBwbGF0Zm9ybSBkYXRhICovCi0JCWlm
ICghaG9zdC0+cGRhdGEgfHwgIWhvc3QtPnBkYXRhLT5kbWFfZmlsdGVyKSB7Ci0JCQlkZXZfZXJy
KG10ZC0+ZGV2LnBhcmVudCwgIm5vIERNQSBwbGF0Zm9ybSBkYXRhXG4iKTsKLQkJCXJldHVybiAt
RU5PRU5UOwotCQl9Ci0KLQkJZG1hX2NhcF96ZXJvKG1hc2spOwotCQlkbWFfY2FwX3NldChETUFf
U0xBVkUsIG1hc2spOwotCQlob3N0LT5kbWFfY2hhbiA9IGRtYV9yZXF1ZXN0X2NoYW5uZWwobWFz
aywgaG9zdC0+cGRhdGEtPmRtYV9maWx0ZXIsICJuYW5kLW1sYyIpOwotCi0JCWlmICghaG9zdC0+
ZG1hX2NoYW4pIHsKLQkJCWRldl9lcnIobXRkLT5kZXYucGFyZW50LCAiRmFpbGVkIHRvIHJlcXVl
c3QgRE1BIGNoYW5uZWxcbiIpOwotCQkJcmV0dXJuIC1FQlVTWTsKLQkJfQorCQlkZXZfZXJyKG10
ZC0+ZGV2LnBhcmVudCwgIkZhaWxlZCB0byByZXF1ZXN0IERNQSBjaGFubmVsXG4iKTsKKwkJcmV0
dXJuIFBUUl9FUlIoaG9zdC0+ZG1hX2NoYW4pOwogCX0KIAogCS8qCkBAIC03MzYsOCArNzIxLDYg
QEAgc3RhdGljIGludCBscGMzMnh4X25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAogCWdwaW9kX3NldF9jb25zdW1lcl9uYW1lKGhvc3QtPndwX2dwaW8sICJOQU5EIFdQ
Iik7CiAKLQlob3N0LT5wZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7Ci0KIAkv
KiBsaW5rIHRoZSBwcml2YXRlIGRhdGEgc3RydWN0dXJlcyAqLwogCW5hbmRfc2V0X2NvbnRyb2xs
ZXJfZGF0YShuYW5kX2NoaXAsIGhvc3QpOwogCW5hbmRfc2V0X2ZsYXNoX25vZGUobmFuZF9jaGlw
LCBwZGV2LT5kZXYub2Zfbm9kZSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9scGMz
Mnh4X21sYy5oIGIvaW5jbHVkZS9saW51eC9tdGQvbHBjMzJ4eF9tbGMuaApkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMzVlOTcxYmUwOTUwLi4wMDAwMDAwMDAwMDAKLS0tIGEvaW5jbHVk
ZS9saW51eC9tdGQvbHBjMzJ4eF9tbGMuaAorKysgL2Rldi9udWxsCkBAIC0xLDE3ICswLDAgQEAK
LS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KLS8qCi0gKiBQbGF0
Zm9ybSBkYXRhIGZvciBMUEMzMnh4IFNvQyBNTEMgTkFORCBjb250cm9sbGVyCi0gKgotICogQ29w
eXJpZ2h0IMKpIDIwMTIgUm9sYW5kIFN0aWdnZQotICovCi0KLSNpZm5kZWYgX19MSU5VWF9NVERf
TFBDMzJYWF9NTENfSAotI2RlZmluZSBfX0xJTlVYX01URF9MUEMzMlhYX01MQ19ICi0KLSNpbmNs
dWRlIDxsaW51eC9kbWFlbmdpbmUuaD4KLQotc3RydWN0IGxwYzMyeHhfbWxjX3BsYXRmb3JtX2Rh
dGEgewotCWRtYV9maWx0ZXJfZm4gZG1hX2ZpbHRlcjsKLX07Ci0KLSNlbmRpZiAgLyogX19MSU5V
WF9NVERfTFBDMzJYWF9NTENfSCAqLwotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
