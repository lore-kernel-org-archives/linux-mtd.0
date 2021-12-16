Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0791C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhS0zvTdtlJMbbXl/Ljsz5bN7Ln4pYGLDXuCaHTSaZA=; b=IyABIwxWIasw17
	6qXLwleFWJViL7w3gZmGfoPF6Ay3Qzi6TgN98ialXJtL294Ncs5ossXSuYHrTRjrgphxyf8qo490p
	CMpbo6FgIEqrZxTtka7tLKSAyKWURk8CTSDVquFyvHsPODjP0OLqKBLO7lUpto7tbAkmrKoi228sW
	ubimPMnsEtnY5tN3Tm8BK4nHrlNumPFo+83Fkow2CKt6XL4ojz8ecTBW05f5af7OkacatM1quRfy9
	kcDyGwCsEZG5xis51/+YWFDHP2/Iuiez9vSb0LAsfXv78FHDArYugP8K9vgrPJD3J7oyPg5vIWSYE
	EhtGB+BgPUf5cfXy0v4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmEC-0048Bl-8c; Thu, 16 Dec 2021 08:35:04 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmDh-00482q-NA
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 08:34:35 +0000
Received: by mail-lj1-x235.google.com with SMTP id 207so37315736ljf.10
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 00:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9xG9ybZ2bk07KpDBvmq82bns44VBsEgiEAlMx6te1s=;
 b=EL5H03Zai7OslD+sRoxg4Ca1bToBiabJY7e6fM9ZBF736bqRNHbC+11Arp8slesx7A
 DgtBdsiNDp1F523aavgsM+itrGr6/HkY2+ckzYnQMnbBCJbbsAkXTIVNG0x79jmD7T4k
 +yqKLCxFjwTsxnwC+Y+laQ+hO6+H9ODTHhu3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9xG9ybZ2bk07KpDBvmq82bns44VBsEgiEAlMx6te1s=;
 b=7ieuG8wufB0Ci+bwjlSyfnXShMvrMSW0k/acgJKK0HL4+5ZnGkiUuSLh+zyvFMYmgN
 hF5/Uaj9AiKW6RejCccq5lLqpmRMRlM9LWxCLlzJlov+BY9+e32vM/JrHbvVma5v567A
 B5tj9wu2lQbRj3ZLOq7fVA6K/awNMNT/lNZebA4b9pz5xBojfmMK9VXBTNvSO3BlIiuP
 CWyKq9QGJAzNeIbVX6no1EM12HOYd6TxKkOK9sU+gD3Lz0BwwmCXaqsl/urhnEkeRD25
 kgR+tuwVc0oBxNbbTSa1I75ZrmDbOHNi26SW49vz81RsvrgdY0ndZ84Lj6k+5MPcTUkm
 cmgw==
X-Gm-Message-State: AOAM533Oa/VJiO4EHuJQDZTBmMfLSgFK67SLWN2i33qWN6oSVkA4HINC
 XZa2UNO9wMzvIEIid2yFFEHsuA==
X-Google-Smtp-Source: ABdhPJw4VE/C2/MpPNkCdwWh5LOV3Q5TdtkU8i1fVdAAld1AH2ZrFUFYk0mb/wPEKjYx1AZbheRK0A==
X-Received: by 2002:a2e:920a:: with SMTP id k10mr14270298ljg.234.1639643672217; 
 Thu, 16 Dec 2021 00:34:32 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id c2sm985679ljf.50.2021.12.16.00.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:34:31 -0800 (PST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] mtd: track maximum number of bitflips for each read
 request
Date: Thu, 16 Dec 2021 09:34:15 +0100
Message-Id: <20211216083418.13512-3-kernel@kempniu.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216083418.13512-1-kernel@kempniu.pl>
References: <20211216083418.13512-1-kernel@kempniu.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_003433_778439_A4E7128E 
X-CRM114-Status: GOOD (  14.94  )
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

bXRkX3JlYWRfb29iKCkgY2FsbGVycyBhcmUgY3VycmVudGx5IG9ibGl2aW91cyB0byB0aGUgZGV0
YWlscyBvZiBFQ0MKZXJyb3JzIGRldGVjdGVkIGR1cmluZyB0aGUgcmVhZCBvcGVyYXRpb24gLSB0
aGV5IG9ubHkgbGVhcm4gKHRocm91Z2ggdGhlCnJldHVybiB2YWx1ZSkgd2hldGhlciBhbnkgY29y
cmVjdGVkIGJpdGZsaXBzIG9yIHVuY29ycmVjdGFibGUgZXJyb3JzCm9jY3VycmVkLiAgTW9yZSBk
ZXRhaWxlZCBFQ0MgaW5mb3JtYXRpb24gY2FuIGJlIHVzZWZ1bCB0byB1c2VyLXNwYWNlCmFwcGxp
Y2F0aW9ucyBmb3IgbWFraW5nIGJldHRlci1pbmZvcm1lZCBjaG9pY2VzIGFib3V0IG1vdmluZyBk
YXRhCmFyb3VuZC4KCkV4dGVuZCBzdHJ1Y3QgbXRkX29vYl9vcHMgd2l0aCBhIHBvaW50ZXIgdG8g
YSBuZXdseS1pbnRyb2R1Y2VkIHN0cnVjdAptdGRfcmVxX3N0YXRzIGFuZCBzZXQgaXRzICdtYXhf
Yml0ZmxpcHMnIGZpZWxkIHRvIHRoZSBtYXhpbXVtIG51bWJlciBvZgpiaXRmbGlwcyBmb3VuZCBp
biBhIHNpbmdsZSBFQ0Mgc3RlcCBkdXJpbmcgdGhlIHJlYWQgb3BlcmF0aW9uIHBlcmZvcm1lZApi
eSBtdGRfcmVhZF9vb2IoKS4gVGhpcyBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgdWx0aW1hdGVseSBw
YXNzaW5nIHRoYXQKdmFsdWUgYmFjayB0byB1c2VyIHNwYWNlLgoKU3VnZ2VzdGVkLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5
OiBNaWNoYcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4KLS0tCiBkcml2ZXJzL210ZC9t
dGRjb3JlLmMgICB8IDUgKysrKysKIGluY2x1ZGUvbGludXgvbXRkL210ZC5oIHwgNSArKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmluZGV4IDcwZjQ5MmRjZTE1OC4u
OTQyM2FmNmRiMzg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jCkBAIC0xNTc1LDYgKzE1NzUsOSBAQCBpbnQgbXRkX3JlYWRfb29i
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwgc3RydWN0IG10ZF9vb2Jfb3BzICpv
cHMpCiAJaWYgKCFtYXN0ZXItPl9yZWFkX29vYiAmJiAoIW1hc3Rlci0+X3JlYWQgfHwgb3BzLT5v
b2JidWYpKQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAKKwlpZiAob3BzLT5zdGF0cykKKwkJbWVt
c2V0KG9wcy0+c3RhdHMsIDAsIHNpemVvZigqb3BzLT5zdGF0cykpOworCiAJaWYgKG10ZC0+Zmxh
Z3MgJiBNVERfU0xDX09OX01MQ19FTVVMQVRJT04pCiAJCXJldF9jb2RlID0gbXRkX2lvX2VtdWxh
dGVkX3NsYyhtdGQsIGZyb20sIHRydWUsIG9wcyk7CiAJZWxzZQpAQCAtMTU5Miw2ICsxNTk1LDgg
QEAgaW50IG10ZF9yZWFkX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHN0
cnVjdCBtdGRfb29iX29wcyAqb3BzKQogCQlyZXR1cm4gcmV0X2NvZGU7CiAJaWYgKG10ZC0+ZWNj
X3N0cmVuZ3RoID09IDApCiAJCXJldHVybiAwOwkvKiBkZXZpY2UgbGFja3MgZWNjICovCisJaWYg
KG9wcy0+c3RhdHMpCisJCW9wcy0+c3RhdHMtPm1heF9iaXRmbGlwcyA9IHJldF9jb2RlOwogCXJl
dHVybiByZXRfY29kZSA+PSBtdGQtPmJpdGZsaXBfdGhyZXNob2xkID8gLUVVQ0xFQU4gOiAwOwog
fQogRVhQT1JUX1NZTUJPTF9HUEwobXRkX3JlYWRfb29iKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvbXRkL210ZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKaW5kZXggMWZmYTkzMzEy
MWY2Li5mOTc2YWFiY2IzNzggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCisr
KyBiL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCkBAIC00MCw2ICs0MCwxMCBAQCBzdHJ1Y3QgbXRk
X2VyYXNlX3JlZ2lvbl9pbmZvIHsKIAl1bnNpZ25lZCBsb25nICpsb2NrbWFwOwkJLyogSWYga2Vl
cGluZyBiaXRtYXAgb2YgbG9ja3MgKi8KIH07CiAKK3N0cnVjdCBtdGRfcmVxX3N0YXRzIHsKKwl1
bnNpZ25lZCBpbnQgbWF4X2JpdGZsaXBzOworfTsKKwogLyoqCiAgKiBzdHJ1Y3QgbXRkX29vYl9v
cHMgLSBvb2Igb3BlcmF0aW9uIG9wZXJhbmRzCiAgKiBAbW9kZToJb3BlcmF0aW9uIG1vZGUKQEAg
LTcwLDYgKzc0LDcgQEAgc3RydWN0IG10ZF9vb2Jfb3BzIHsKIAl1aW50MzJfdAlvb2JvZmZzOwog
CXVpbnQ4X3QJCSpkYXRidWY7CiAJdWludDhfdAkJKm9vYmJ1ZjsKKwlzdHJ1Y3QgbXRkX3JlcV9z
dGF0cyAqc3RhdHM7CiB9OwogCiAvKioKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
