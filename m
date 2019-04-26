Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A75C43219
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E09020679
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2kYgFmr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYJw+fEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E09020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKn09frZM+WG//vJXjRUlhgKNOGXK3NNUo0POCbtGhE=; b=D2kYgFmrU3BUlL
	FCOfYYK8381RGaZyOaePiwtUfn0R8e17l0l8WljnQUpkEnJQMMVQxS7gA3g/b2P0OCu6q6SJOF4x/
	mNThyxYrPuj2hAXIu0F9ffSfm6H/ZLXZe7tJZR3Et2j8kys/yCUWmpMZWYyxkklBCj4SHy2tuXcIW
	xkyCAc66ZiFMyhKwoMibmaW7b2bWKmL8VdeAX3Zx1yRlJ0/rptMEitAOMMHATM/18FfzrF2+/etQe
	piGpSMcBe/biJ4oT4HGXPWpQmZzlgBRVBiPmwBVMHfB3BDSe8WSr5b7yn24ZYR6Bv3F6z+e8BSXQA
	6N6D+3qCK7e7j9+W0qjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3vv-0003Z3-P5; Fri, 26 Apr 2019 16:42:43 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3vm-0003OG-Dy
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 16:42:35 +0000
Received: by mail-lj1-x242.google.com with SMTP id f23so3557847ljc.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzP0AR+ti/bqIxQypEOph2XNCqymISMdCKVOmHoTAW0=;
 b=mYJw+fEpKwfGv3W9+yz4OQZOogyQvXG4iChudvGNTNRdh94xryShu29kHDsNZzfeVV
 Zms7PPfIpkesYBp5DxHHdhVfm8KgKK+oM/cPOH+gb+hAwSjnlE0LIhftW1fqmtVI1QYb
 OujX/HNvH96Ir4xXi4UhqmEPy5oIhXf7/v3oOtOVVda+lIRtfAyEzbVc/2r80w+yend7
 ECUgfPKvtJx35ZcnGyQZzitt6BrdtlVJI4BjtIp6FigIchdJLisJJqZQVBMoXdcwXUzV
 LJlIrwuC+q9ryu8M3pBgMlSgdLCxQ8WuFsXks0lW/9zA3uwkKp5vrvn6pG/McsjlLSxe
 fzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzP0AR+ti/bqIxQypEOph2XNCqymISMdCKVOmHoTAW0=;
 b=o3vxZbbLR56NPwVDeNU3lKf8La9/szwRg9VgV2xJig1oTr6/9RxXqYkOey8SspLGo+
 E2wZklNaW/RV2VjF70ZhHF2dth4y1VmHD1JktoQzvvtKaB3jGp0m8H5ZylvbIfT+yRQj
 TGqOxSoDB1MyZsxmqpgAMJyb7F2LXQ5WIwJHzpsjlEfKYUXHjfo27DRQOXHtjtcW90pL
 dfTFNAGYtZ7/GrAzSHxmzN2uGiJvnviMT158DaQRHfNC9bboi0WXMx8xbtxRnoYeYaN/
 JH0mTrgR6o77tU3slUzPuGKitXeiJA/T/vr2ZWWJAGgsROmWqaRfn6Yjyt9nGga3tZtp
 U7lA==
X-Gm-Message-State: APjAAAXZtFZSJ3/qnolZpH900sv/J9tAsgxOTD1zZFMQ/4U7eVWTFswi
 o05ZJ1bVBPSjTUngbe5bE7k=
X-Google-Smtp-Source: APXvYqzs7CP5V5+FUsRKnlBS83N6ImFLqrYYzWE+m/MWQdzJUonXvYNwdAqr5NLnWOwcqxJ7X+YLDg==
X-Received: by 2002:a2e:9687:: with SMTP id q7mr2908573lji.113.1556296952878; 
 Fri, 26 Apr 2019 09:42:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id q11sm5637807lfc.51.2019.04.26.09.42.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:42:32 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH 1/5] mtd: onenand/samsung: Unify resource order for controller
 variants
Date: Fri, 26 Apr 2019 18:42:20 +0200
Message-Id: <20190426164224.11327-2-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_094234_488522_990F90C5 
X-CRM114-Status: GOOD (  16.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4KCkJlZm9yZSB0aGlzIHBh
dGNoLCB0aGUgb3JkZXIgb2YgbWVtb3J5IHJlc291cmNlcyByZXF1ZXN0ZWQgYnkgdGhlIGRyaXZl
cgp3YXMgY29udHJvbGxlciBiYXNlIGFzIGZpcnN0IGFuZCBPbmVOQU5EIGNoaXAgYmFzZSBhcyBz
ZWNvbmQgZm9yClMzQzY0eHgvUzVQQzEwMCB2YXJpYW50IGFuZCB0aGUgb3Bwb3NpdGUgZm9yIFM1
UEMxMTAvUzVQVjIxMCB2YXJpYW50LgoKVG8gbWFrZSB0aGlzIG1vcmUgY29uc2lzdGVudCwgdGhp
cyBwYXRjaCBzd2FwcyB0aGUgb3JkZXIgb2YgcmVzb3VyY2VzCmZvciB0aGUgbGF0dGVyIGFuZCB1
cGRhdGVzIHBsYXRmb3JtIGNvZGUgYWNjb3JkaW5nbHkuIEFzIGEgbmljZSBzaWRlCmVmZmVjdCB0
aGVyZSBpcyBhIHNsaWdodCByZWR1Y3Rpb24gaW4gbGluZSBjb3VudCBvZiBwcm9iZSBmdW5jdGlv
bi4KClNpZ25lZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+ClNp
Z25lZC1vZmYtYnk6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jIHwgNDggKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3Nh
bXN1bmcuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nLmMKaW5kZXggZTY0ZDBm
ZGY3ZWI1Li5hNDI1ZjE5YTM4NzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFu
ZC9zYW1zdW5nLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmcuYwpAQCAt
MTI2LDE0ICsxMjYsMTMgQEAgc3RydWN0IHMzY19vbmVuYW5kIHsKIAlzdHJ1Y3QgbXRkX2luZm8J
Km10ZDsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCSpwZGV2OwogCWVudW0gc29jX3R5cGUJdHlw
ZTsKLQl2b2lkIF9faW9tZW0JKmJhc2U7Ci0Jdm9pZCBfX2lvbWVtCSphaGJfYWRkcjsKKwl2b2lk
IF9faW9tZW0JKmN0cmxfYmFzZTsKKwl2b2lkIF9faW9tZW0JKmNoaXBfYmFzZTsKIAlpbnQJCWJv
b3RyYW1fY29tbWFuZDsKIAl2b2lkCQkqcGFnZV9idWY7CiAJdm9pZAkJKm9vYl9idWY7CiAJdW5z
aWduZWQgaW50CSgqbWVtX2FkZHIpKGludCBmYmEsIGludCBmcGEsIGludCBmc2EpOwogCXVuc2ln
bmVkIGludAkoKmNtZF9tYXApKHVuc2lnbmVkIGludCB0eXBlLCB1bnNpZ25lZCBpbnQgdmFsKTsK
LQl2b2lkIF9faW9tZW0JKmRtYV9hZGRyOwogCXVuc2lnbmVkIGxvbmcJcGh5c19iYXNlOwogCXN0
cnVjdCBjb21wbGV0aW9uCWNvbXBsZXRlOwogfTsKQEAgLTE0NywyMiArMTQ2LDIyIEBAIHN0YXRp
YyBzdHJ1Y3QgczNjX29uZW5hbmQgKm9uZW5hbmQ7CiAKIHN0YXRpYyBpbmxpbmUgaW50IHMzY19y
ZWFkX3JlZyhpbnQgb2Zmc2V0KQogewotCXJldHVybiByZWFkbChvbmVuYW5kLT5iYXNlICsgb2Zm
c2V0KTsKKwlyZXR1cm4gcmVhZGwob25lbmFuZC0+Y3RybF9iYXNlICsgb2Zmc2V0KTsKIH0KIAog
c3RhdGljIGlubGluZSB2b2lkIHMzY193cml0ZV9yZWcoaW50IHZhbHVlLCBpbnQgb2Zmc2V0KQog
ewotCXdyaXRlbCh2YWx1ZSwgb25lbmFuZC0+YmFzZSArIG9mZnNldCk7CisJd3JpdGVsKHZhbHVl
LCBvbmVuYW5kLT5jdHJsX2Jhc2UgKyBvZmZzZXQpOwogfQogCiBzdGF0aWMgaW5saW5lIGludCBz
M2NfcmVhZF9jbWQodW5zaWduZWQgaW50IGNtZCkKIHsKLQlyZXR1cm4gcmVhZGwob25lbmFuZC0+
YWhiX2FkZHIgKyBjbWQpOworCXJldHVybiByZWFkbChvbmVuYW5kLT5jaGlwX2Jhc2UgKyBjbWQp
OwogfQogCiBzdGF0aWMgaW5saW5lIHZvaWQgczNjX3dyaXRlX2NtZChpbnQgdmFsdWUsIHVuc2ln
bmVkIGludCBjbWQpCiB7Ci0Jd3JpdGVsKHZhbHVlLCBvbmVuYW5kLT5haGJfYWRkciArIGNtZCk7
CisJd3JpdGVsKHZhbHVlLCBvbmVuYW5kLT5jaGlwX2Jhc2UgKyBjbWQpOwogfQogCiAjaWZkZWYg
U0FNU1VOR19ERUJVRwpAQCAtNTE5LDcgKzUxOCw3IEBAIHN0YXRpYyBpbnQgKCpzNXBjMTEwX2Rt
YV9vcHMpKGRtYV9hZGRyX3QgZHN0LCBkbWFfYWRkcl90IHNyYywgc2l6ZV90IGNvdW50LCBpbnQK
IAogc3RhdGljIGludCBzNXBjMTEwX2RtYV9wb2xsKGRtYV9hZGRyX3QgZHN0LCBkbWFfYWRkcl90
IHNyYywgc2l6ZV90IGNvdW50LCBpbnQgZGlyZWN0aW9uKQogewotCXZvaWQgX19pb21lbSAqYmFz
ZSA9IG9uZW5hbmQtPmRtYV9hZGRyOworCXZvaWQgX19pb21lbSAqYmFzZSA9IG9uZW5hbmQtPmN0
cmxfYmFzZTsKIAlpbnQgc3RhdHVzOwogCXVuc2lnbmVkIGxvbmcgdGltZW91dDsKIApAQCAtNTYz
LDcgKzU2Miw3IEBAIHN0YXRpYyBpbnQgczVwYzExMF9kbWFfcG9sbChkbWFfYWRkcl90IGRzdCwg
ZG1hX2FkZHJfdCBzcmMsIHNpemVfdCBjb3VudCwgaW50IGRpCiAKIHN0YXRpYyBpcnFyZXR1cm5f
dCBzNXBjMTEwX29uZW5hbmRfaXJxKGludCBpcnEsIHZvaWQgKmRhdGEpCiB7Ci0Jdm9pZCBfX2lv
bWVtICpiYXNlID0gb25lbmFuZC0+ZG1hX2FkZHI7CisJdm9pZCBfX2lvbWVtICpiYXNlID0gb25l
bmFuZC0+Y3RybF9iYXNlOwogCWludCBzdGF0dXMsIGNtZCA9IDA7CiAKIAlzdGF0dXMgPSByZWFk
bChiYXNlICsgUzVQQzExMF9JTlRDX0RNQV9TVEFUVVMpOwpAQCAtNTg1LDcgKzU4NCw3IEBAIHN0
YXRpYyBpcnFyZXR1cm5fdCBzNXBjMTEwX29uZW5hbmRfaXJxKGludCBpcnEsIHZvaWQgKmRhdGEp
CiAKIHN0YXRpYyBpbnQgczVwYzExMF9kbWFfaXJxKGRtYV9hZGRyX3QgZHN0LCBkbWFfYWRkcl90
IHNyYywgc2l6ZV90IGNvdW50LCBpbnQgZGlyZWN0aW9uKQogewotCXZvaWQgX19pb21lbSAqYmFz
ZSA9IG9uZW5hbmQtPmRtYV9hZGRyOworCXZvaWQgX19pb21lbSAqYmFzZSA9IG9uZW5hbmQtPmN0
cmxfYmFzZTsKIAlpbnQgc3RhdHVzOwogCiAJc3RhdHVzID0gcmVhZGwoYmFzZSArIFM1UEMxMTBf
SU5UQ19ETUFfTUFTSyk7CkBAIC02MzQsNyArNjMzLDcgQEAgc3RhdGljIGludCBzNXBjMTEwX3Jl
YWRfYnVmZmVycmFtKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgYXJlYSwKIAl9CiAKIAlpZiAo
b2Zmc2V0ICYgMyB8fCAoc2l6ZV90KSBidWYgJiAzIHx8Ci0JCSFvbmVuYW5kLT5kbWFfYWRkciB8
fCBjb3VudCAhPSBtdGQtPndyaXRlc2l6ZSkKKwkJIW9uZW5hbmQtPmN0cmxfYmFzZSB8fCBjb3Vu
dCAhPSBtdGQtPndyaXRlc2l6ZSkKIAkJZ290byBub3JtYWw7CiAKIAkvKiBIYW5kbGUgdm1hbGxv
YyBhZGRyZXNzICovCkBAIC04NjQsMjMgKzg2MywyMiBAQCBzdGF0aWMgaW50IHMzY19vbmVuYW5k
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJczNjX29uZW5hbmRfc2V0dXAo
bXRkKTsKIAogCXIgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0s
IDApOwotCW9uZW5hbmQtPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwg
cik7Ci0JaWYgKElTX0VSUihvbmVuYW5kLT5iYXNlKSkKLQkJcmV0dXJuIFBUUl9FUlIob25lbmFu
ZC0+YmFzZSk7Ci0KKwlvbmVuYW5kLT5jdHJsX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2Uo
JnBkZXYtPmRldiwgcik7CisJaWYgKElTX0VSUihvbmVuYW5kLT5jdHJsX2Jhc2UpKQorCQlyZXR1
cm4gUFRSX0VSUihvbmVuYW5kLT5jdHJsX2Jhc2UpOworCisJciA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMSk7CisJb25lbmFuZC0+Y2hpcF9iYXNlID0gZGV2
bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHIpOworCWlmIChJU19FUlIob25lbmFuZC0+
Y2hpcF9iYXNlKSkKKwkJcmV0dXJuIFBUUl9FUlIob25lbmFuZC0+Y2hpcF9iYXNlKTsKIAlvbmVu
YW5kLT5waHlzX2Jhc2UgPSByLT5zdGFydDsKIAotCS8qIFNldCBvbmVuYW5kX2NoaXAgYWxzbyAq
LwotCXRoaXMtPmJhc2UgPSBvbmVuYW5kLT5iYXNlOwotCiAJLyogVXNlIHJ1bnRpbWUgYmFkYmxv
Y2sgY2hlY2sgKi8KIAl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfU0tJUF9VTkxPQ0tfQ0hFQ0s7
CiAKIAlpZiAob25lbmFuZC0+dHlwZSAhPSBUWVBFX1M1UEMxMTApIHsKLQkJciA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMSk7Ci0JCW9uZW5hbmQtPmFoYl9h
ZGRyID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHIpOwotCQlpZiAoSVNfRVJS
KG9uZW5hbmQtPmFoYl9hZGRyKSkKLQkJCXJldHVybiBQVFJfRVJSKG9uZW5hbmQtPmFoYl9hZGRy
KTsKKwkJLyogU2V0IG9uZW5hbmRfY2hpcCBhbHNvICovCisJCXRoaXMtPmJhc2UgPSBvbmVuYW5k
LT5jdHJsX2Jhc2U7CiAKIAkJLyogQWxsb2NhdGUgNEtpQiBCdWZmZXJSQU0gKi8KIAkJb25lbmFu
ZC0+cGFnZV9idWYgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgU1pfNEssCkBAIC04OTgsMTAg
Kzg5Niw4IEBAIHN0YXRpYyBpbnQgczNjX29uZW5hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAkJdGhpcy0+c3VicGFnZXNpemUgPSBtdGQtPndyaXRlc2l6ZTsKIAogCX0g
ZWxzZSB7IC8qIFM1UEMxMTAgKi8KLQkJciA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJ
T1JFU09VUkNFX01FTSwgMSk7Ci0JCW9uZW5hbmQtPmRtYV9hZGRyID0gZGV2bV9pb3JlbWFwX3Jl
c291cmNlKCZwZGV2LT5kZXYsIHIpOwotCQlpZiAoSVNfRVJSKG9uZW5hbmQtPmRtYV9hZGRyKSkK
LQkJCXJldHVybiBQVFJfRVJSKG9uZW5hbmQtPmRtYV9hZGRyKTsKKwkJLyogU2V0IG9uZW5hbmRf
Y2hpcCBhbHNvICovCisJCXRoaXMtPmJhc2UgPSBvbmVuYW5kLT5jaGlwX2Jhc2U7CiAKIAkJczVw
YzExMF9kbWFfb3BzID0gczVwYzExMF9kbWFfcG9sbDsKIAkJLyogSW50ZXJydXB0IHN1cHBvcnQg
Ki8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
