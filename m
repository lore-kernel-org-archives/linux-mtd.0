Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61320C624D7
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VpBmDOGLZswftCXaz9RhnaVCyjefrH4uHYOtIcJaUI=; b=RfUFODHF4JM7Ti
	Hy2VRqxtZyGtavx6rKmlJ3tKqve2p3kMsRCGyuTQ7EToE9ZZZdY766x6N4zZvT/vLG+ERr4xkr9sA
	TSj0r1mKrwTLC1dPRQ0UdK8BGiLX++6H6qIG15p9qjjKHQ32ecsxsQTqwKioRUj6Zuhs1pN4/X4Vj
	+Sm8jUeWm85PPGgGKIps9pLYmyIQInTXhlc22HXQsRTGv1FPkQlxoijrYiDyOXOIRoIcDi8BCiq30
	2suMC9G/X92S73kuc0NmMJK7AjrCOxYJtRgsw5kbJNBQrANtniNT+wfhdyF2TxuxDpj5SCbMGZR7T
	btTbONSSfT3XcJzFx2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Ys-0000000HC45-0plT;
	Thu, 03 Sep 2026 11:24:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yr-0000000HC38-1WB2;
	Thu, 03 Sep 2026 11:24:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C80424192E;
	Thu,  3 Sep 2026 11:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C001F000E9;
	Thu,  3 Sep 2026 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434692;
	bh=kPBwsnJctpCGo+Gv5aaUHeSE9XwloUJj+xf/DjxcQs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e5UXzvW7R7eEeXeftP6MoE9NDW/GmS2pyb4lsGGp8y9SyrjXqASeetiJpubN3ZBad
	 B7TYibV3V/v46ob7XzfdXxP06v9ZoP7RYK6RDobkDtH7GBt194j5kt2SH2irjHQqRz
	 KKZF/V7Qub1X87fW+5v4WAPWdMgIRtE8ASqE4xsRHSiK18rUAHdmGj7tYNVwzYskV/
	 1pYdbh/zgdiunNU07b3ZmqVwVceArrw+f+YNidUrM8rgrvCqvQvjS7sflayjohjHtK
	 5/RbH/phI6oCDszTQW3x+AMk/irIiabZW7s0wFmQc7nZ2VwYoTtukT9dVo7ziL4ptS
	 DHx1AquViRdlQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] mtd: rawnand: lpc32xx_slc: Remove platform data support
Date: Thu,  3 Sep 2026 14:24:23 +0300
Message-ID: <20260903112425.1904748-2-vz@kernel.org>
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
YSBzdXBwb3J0IGNhbiBiZSByZW1vdmVkCmZyb20gdGhlIE5BTkQgU0xDIGRyaXZlci4KClNpZ25l
ZC1vZmYtYnk6IFZsYWRpbWlyIFphcG9sc2tpeSA8dnpAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jIHwgMjEgKystLS0tLS0tLS0tLS0tLS0tLS0tCiBp
bmNsdWRlL2xpbnV4L210ZC9scGMzMnh4X3NsYy5oICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L210ZC9scGMzMnh4X3NsYy5oCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2xwYzMyeHhfc2xjLmMKaW5kZXggMTBjODA4MDIwN2Y0Li5iNGQ5MGFmYTkyNjcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMKKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYwpAQCAtMjUsNyArMjUsNiBAQAogI2luY2x1ZGUgPGxp
bnV4L2RtYWVuZ2luZS5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNs
dWRlIDxsaW51eC9vZi5oPgotI2luY2x1ZGUgPGxpbnV4L210ZC9scGMzMnh4X3NsYy5oPgogCiAj
ZGVmaW5lIExQQzMyWFhfTU9ETkFNRQkJImxwYzMyeHgtbmFuZCIKIApAQCAtMjEzLDcgKzIxMiw2
IEBAIHN0cnVjdCBscGMzMnh4X25hbmRfY2ZnX3NsYyB7CiAKIHN0cnVjdCBscGMzMnh4X25hbmRf
aG9zdCB7CiAJc3RydWN0IG5hbmRfY2hpcAluYW5kX2NoaXA7Ci0Jc3RydWN0IGxwYzMyeHhfc2xj
X3BsYXRmb3JtX2RhdGEgKnBkYXRhOwogCXN0cnVjdCBjbGsJCSpjbGs7CiAJc3RydWN0IGdwaW9f
ZGVzYwkqd3BfZ3BpbzsKIAl2b2lkIF9faW9tZW0JCSppb19iYXNlOwpAQCAtNzI3LDI0ICs3MjUs
MTEgQEAgc3RhdGljIGludCBscGMzMnh4X25hbmRfd3JpdGVfcGFnZV9yYXdfc3luZHJvbWUoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgbHBjMzJ4eF9uYW5kX2RtYV9zZXR1cChz
dHJ1Y3QgbHBjMzJ4eF9uYW5kX2hvc3QgKmhvc3QpCiB7CiAJc3RydWN0IG10ZF9pbmZvICptdGQg
PSBuYW5kX3RvX210ZCgmaG9zdC0+bmFuZF9jaGlwKTsKLQlkbWFfY2FwX21hc2tfdCBtYXNrOwog
CiAJaG9zdC0+ZG1hX2NoYW4gPSBkbWFfcmVxdWVzdF9jaGFuKG10ZC0+ZGV2LnBhcmVudCwgInJ4
LXR4Iik7CiAJaWYgKElTX0VSUihob3N0LT5kbWFfY2hhbikpIHsKLQkJLyogZmFsbGJhY2sgdG8g
cmVxdWVzdCB1c2luZyBwbGF0Zm9ybSBkYXRhICovCi0JCWlmICghaG9zdC0+cGRhdGEgfHwgIWhv
c3QtPnBkYXRhLT5kbWFfZmlsdGVyKSB7Ci0JCQlkZXZfZXJyKG10ZC0+ZGV2LnBhcmVudCwgIm5v
IERNQSBwbGF0Zm9ybSBkYXRhXG4iKTsKLQkJCXJldHVybiAtRU5PRU5UOwotCQl9Ci0KLQkJZG1h
X2NhcF96ZXJvKG1hc2spOwotCQlkbWFfY2FwX3NldChETUFfU0xBVkUsIG1hc2spOwotCQlob3N0
LT5kbWFfY2hhbiA9IGRtYV9yZXF1ZXN0X2NoYW5uZWwobWFzaywgaG9zdC0+cGRhdGEtPmRtYV9m
aWx0ZXIsICJuYW5kLXNsYyIpOwotCi0JCWlmICghaG9zdC0+ZG1hX2NoYW4pIHsKLQkJCWRldl9l
cnIobXRkLT5kZXYucGFyZW50LCAiRmFpbGVkIHRvIHJlcXVlc3QgRE1BIGNoYW5uZWxcbiIpOwot
CQkJcmV0dXJuIC1FQlVTWTsKLQkJfQorCQlkZXZfZXJyKG10ZC0+ZGV2LnBhcmVudCwgIkZhaWxl
ZCB0byByZXF1ZXN0IERNQSBjaGFubmVsXG4iKTsKKwkJcmV0dXJuIFBUUl9FUlIoaG9zdC0+ZG1h
X2NoYW4pOwogCX0KIAogCXJldHVybiAwOwpAQCAtODczLDggKzg1OCw2IEBAIHN0YXRpYyBpbnQg
bHBjMzJ4eF9uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlncGlv
ZF9zZXRfY29uc3VtZXJfbmFtZShob3N0LT53cF9ncGlvLCAiTkFORCBXUCIpOwogCi0JaG9zdC0+
cGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKCZwZGV2LT5kZXYpOwotCiAJY2hpcCA9ICZob3N0LT5u
YW5kX2NoaXA7CiAJbXRkID0gbmFuZF90b19tdGQoY2hpcCk7CiAJbmFuZF9zZXRfY29udHJvbGxl
cl9kYXRhKGNoaXAsIGhvc3QpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbHBjMzJ4
eF9zbGMuaCBiL2luY2x1ZGUvbGludXgvbXRkL2xwYzMyeHhfc2xjLmgKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IGEwNDRiODA2NTY2Yi4uMDAwMDAwMDAwMDAwCi0tLSBhL2luY2x1ZGUv
bGludXgvbXRkL2xwYzMyeHhfc2xjLmgKKysrIC9kZXYvbnVsbApAQCAtMSwxNyArMCwwIEBACi0v
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCi0vKgotICogUGxhdGZv
cm0gZGF0YSBmb3IgTFBDMzJ4eCBTb0MgU0xDIE5BTkQgY29udHJvbGxlcgotICoKLSAqIENvcHly
aWdodCDCqSAyMDEyIFJvbGFuZCBTdGlnZ2UKLSAqLwotCi0jaWZuZGVmIF9fTElOVVhfTVREX0xQ
QzMyWFhfU0xDX0gKLSNkZWZpbmUgX19MSU5VWF9NVERfTFBDMzJYWF9TTENfSAotCi0jaW5jbHVk
ZSA8bGludXgvZG1hZW5naW5lLmg+Ci0KLXN0cnVjdCBscGMzMnh4X3NsY19wbGF0Zm9ybV9kYXRh
IHsKLQlkbWFfZmlsdGVyX2ZuIGRtYV9maWx0ZXI7Ci19OwotCi0jZW5kaWYgIC8qIF9fTElOVVhf
TVREX0xQQzMyWFhfU0xDX0ggKi8KLS0gCjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
