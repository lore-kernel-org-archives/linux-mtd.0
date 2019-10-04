Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51DCC47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88A020862
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5CKRxgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A88A020862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJQ2/lU5FDM26LUWVdr3cXSfQzMNjJFSp3mEZMczY4g=; b=i5CKRxgiIjhUXD
	Cw+xyKycHQHlTet7HgrAAe0CTKWUR4AmiztW54EGjiJdVCnMGCGiwNmzR6lvDXNyVC+IIrsSHXsLb
	LwendUD2OvlNJYjxQCGRUn7BFHd0N9yWBi3xtSrzRCkiaNkoyYJHYMmU1dVEdV54RgXan0WIYj0oC
	Ny/vu6Xkm9EZd2nz8MSRQmerzJNB3pYzEHLeXoMdithtxWIoMKDo+VDfAmJ62GdUV09B7jr292JVw
	dulEAw4ZhM83uQhMVd3VSADPZGEdB9RKJLJn8571iDyZnxRVKL3KSnV/9vTAvRg39Jx+aaH95H/F0
	nqx9tlbeYEWhr5t5Muzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMGt-00078a-Om; Fri, 04 Oct 2019 12:01:19 +0000
Received: from 15.mo4.mail-out.ovh.net ([91.121.62.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMFz-0006GL-Ts
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:00:25 +0000
Received: from player792.ha.ovh.net (unknown [10.109.160.93])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id DD4E32069F6
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:00:19 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 7A24FAA65865;
 Fri,  4 Oct 2019 12:00:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 02/16] mtd: spi-nor: aspeed: Add support for SPI dual IO read
 mode
Date: Fri,  4 Oct 2019 13:59:05 +0200
Message-Id: <20191004115919.20788-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3770357314044005299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050024_140481_8AD9EA0F 
X-CRM114-Status: GOOD (  15.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW1wbGVtZW50cyBzdXBwb3J0IGZvciB0aGUgZHVhbCBJTyByZWFkIG1vZGUgb24gYXNwZWVkIFNN
Qy9GTUMKY29udHJvbGxlcnMgd2hpY2ggdXNlcyBib3RoIE1JU08gYW5kIE1PU0kgbGluZXMgZm9y
IGRhdGEgZHVyaW5nIGEgcmVhZAp0byBkb3VibGUgdGhlIHJlYWQgYmFuZHdpZHRoLgoKQmFzZWQg
b24gd29yayBmcm9tIFJvYmVydCBMaXBwZXJ0IDxyb2JsaXBAZ21haWwuY29tPgoKU2lnbmVkLW9m
Zi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBkcml2ZXJzL210ZC9z
cGktbm9yL2FzcGVlZC1zbWMuYyB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2FzcGVlZC1zbWMuYwppbmRleCAxNDhiYmM5MzRlZmMuLmM3NzVlMDYxMjYxMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMKKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9hc3BlZWQtc21jLmMKQEAgLTM2OSwxOCArMzY5LDQ5IEBAIHN0YXRpYyB2b2lk
IGFzcGVlZF9zbWNfc2VuZF9jbWRfYWRkcihzdHJ1Y3Qgc3BpX25vciAqbm9yLCB1OCBjbWQsIHUz
MiBhZGRyKQogCX0KIH0KIAorc3RhdGljIGludCBhc3BlZWRfc21jX2dldF9pb19tb2RlKHN0cnVj
dCBhc3BlZWRfc21jX2NoaXAgKmNoaXApCit7CisJc3dpdGNoIChjaGlwLT5ub3IucmVhZF9wcm90
bykgeworCWNhc2UgU05PUl9QUk9UT18xXzFfMToKKwkJcmV0dXJuIDA7CisJY2FzZSBTTk9SX1BS
T1RPXzFfMV8yOgorCQlyZXR1cm4gQ09OVFJPTF9JT19EVUFMX0RBVEE7CisJY2FzZSBTTk9SX1BS
T1RPXzFfMl8yOgorCQlyZXR1cm4gQ09OVFJPTF9JT19EVUFMX0FERFJfREFUQTsKKwlkZWZhdWx0
OgorCQlkZXZfZXJyKGNoaXAtPm5vci5kZXYsICJ1bnN1cHBvcnRlZCBTUEkgcmVhZCBtb2RlXG4i
KTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorfQorCitzdGF0aWMgdm9pZCBhc3BlZWRfc21jX3Nl
dF9pb19tb2RlKHN0cnVjdCBhc3BlZWRfc21jX2NoaXAgKmNoaXAsIHUzMiBpb19tb2RlKQorewor
CXUzMiBjdGw7CisKKwlpZiAoaW9fbW9kZSA+IDApIHsKKwkJY3RsID0gcmVhZGwoY2hpcC0+Y3Rs
KSAmIH5DT05UUk9MX0lPX01PREVfTUFTSzsKKwkJY3RsIHw9IGlvX21vZGU7CisJCXdyaXRlbChj
dGwsIGNoaXAtPmN0bCk7CisJfQorfQorCiBzdGF0aWMgc3NpemVfdCBhc3BlZWRfc21jX3JlYWRf
dXNlcihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3QgZnJvbSwKIAkJCQkgICAgc2l6ZV90IGxl
biwgdV9jaGFyICpyZWFkX2J1ZikKIHsKIAlzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwID0g
bm9yLT5wcml2OwogCWludCBpOwogCXU4IGR1bW15ID0gMHhGRjsKKwlpbnQgaW9fbW9kZSA9IGFz
cGVlZF9zbWNfZ2V0X2lvX21vZGUoY2hpcCk7CiAKIAlhc3BlZWRfc21jX3N0YXJ0X3VzZXIobm9y
KTsKIAlhc3BlZWRfc21jX3NlbmRfY21kX2FkZHIobm9yLCBub3ItPnJlYWRfb3Bjb2RlLCBmcm9t
KTsKIAlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+bm9yLnJlYWRfZHVtbXkgLyA4OyBpKyspCiAJCWFz
cGVlZF9zbWNfd3JpdGVfdG9fYWhiKGNoaXAtPmFoYl9iYXNlLCAmZHVtbXksIHNpemVvZihkdW1t
eSkpOwogCisJLyogU2V0IElPIG1vZGUgb25seSBmb3IgZGF0YSAqLworCWlmIChpb19tb2RlID09
IENPTlRST0xfSU9fRFVBTF9EQVRBKQorCQlhc3BlZWRfc21jX3NldF9pb19tb2RlKGNoaXAsIGlv
X21vZGUpOworCiAJYXNwZWVkX3NtY19yZWFkX2Zyb21fYWhiKHJlYWRfYnVmLCBjaGlwLT5haGJf
YmFzZSwgbGVuKTsKIAlhc3BlZWRfc21jX3N0b3BfdXNlcihub3IpOwogCXJldHVybiBsZW47CkBA
IC03MzEsNiArNzYyLDcgQEAgc3RhdGljIGludCBhc3BlZWRfc21jX2NoaXBfc2V0dXBfZmluaXNo
KHN0cnVjdCBhc3BlZWRfc21jX2NoaXAgKmNoaXApCiB7CiAJc3RydWN0IGFzcGVlZF9zbWNfY29u
dHJvbGxlciAqY29udHJvbGxlciA9IGNoaXAtPmNvbnRyb2xsZXI7CiAJY29uc3Qgc3RydWN0IGFz
cGVlZF9zbWNfaW5mbyAqaW5mbyA9IGNvbnRyb2xsZXItPmluZm87CisJaW50IGlvX21vZGU7CiAJ
dTMyIGNtZDsKIAogCWlmIChjaGlwLT5ub3IuYWRkcl93aWR0aCA9PSA0ICYmIGluZm8tPnNldF80
YikKQEAgLTc1MywyMiArNzg1LDIxIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NtY19jaGlwX3NldHVw
X2ZpbmlzaChzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwKQogCSAqIFRPRE86IEFkanVzdCBj
bG9ja3MgaWYgZmFzdCByZWFkIGlzIHN1cHBvcnRlZCBhbmQgaW50ZXJwcmV0CiAJICogU1BJLU5P
UiBmbGFncyB0byBhZGp1c3QgY29udHJvbGxlciBzZXR0aW5ncy4KIAkgKi8KLQlpZiAoY2hpcC0+
bm9yLnJlYWRfcHJvdG8gPT0gU05PUl9QUk9UT18xXzFfMSkgewotCQlpZiAoY2hpcC0+bm9yLnJl
YWRfZHVtbXkgPT0gMCkKLQkJCWNtZCA9IENPTlRST0xfQ09NTUFORF9NT0RFX05PUk1BTDsKLQkJ
ZWxzZQotCQkJY21kID0gQ09OVFJPTF9DT01NQU5EX01PREVfRlJFQUQ7Ci0JfSBlbHNlIHsKLQkJ
ZGV2X2VycihjaGlwLT5ub3IuZGV2LCAidW5zdXBwb3J0ZWQgU1BJIHJlYWQgbW9kZVxuIik7Ci0J
CXJldHVybiAtRUlOVkFMOwotCX0KKwlpb19tb2RlID0gYXNwZWVkX3NtY19nZXRfaW9fbW9kZShj
aGlwKTsKKwlpZiAoaW9fbW9kZSA8IDApCisJCXJldHVybiBpb19tb2RlOwogCi0JY2hpcC0+Y3Rs
X3ZhbFtzbWNfcmVhZF0gfD0gY21kIHwKKwlpZiAoY2hpcC0+bm9yLnJlYWRfZHVtbXkgPT0gMCkK
KwkJY21kID0gQ09OVFJPTF9DT01NQU5EX01PREVfTk9STUFMOworCWVsc2UKKwkJY21kID0gQ09O
VFJPTF9DT01NQU5EX01PREVfRlJFQUQ7CisKKwljaGlwLT5jdGxfdmFsW3NtY19yZWFkXSB8PSBj
bWQgfCBpb19tb2RlIHwKIAkJY2hpcC0+bm9yLnJlYWRfb3Bjb2RlIDw8IENPTlRST0xfQ09NTUFO
RF9TSElGVCB8CiAJCUNPTlRST0xfSU9fRFVNTVlfU0VUKGNoaXAtPm5vci5yZWFkX2R1bW15IC8g
OCk7CiAKLQlkZXZfZGJnKGNvbnRyb2xsZXItPmRldiwgImJhc2UgY29udHJvbCByZWdpc3Rlcjog
JTA4eFxuIiwKLQkJY2hpcC0+Y3RsX3ZhbFtzbWNfcmVhZF0pOworCWRldl9pbmZvKGNvbnRyb2xs
ZXItPmRldiwgInJlYWQgY29udHJvbCByZWdpc3RlcjogJTA4eFxuIiwKKwkJIGNoaXAtPmN0bF92
YWxbc21jX3JlYWRdKTsKIAlyZXR1cm4gMDsKIH0KIApAQCAtNzc4LDYgKzgwOSw3IEBAIHN0YXRp
YyBpbnQgYXNwZWVkX3NtY19zZXR1cF9mbGFzaChzdHJ1Y3QgYXNwZWVkX3NtY19jb250cm9sbGVy
ICpjb250cm9sbGVyLAogCWNvbnN0IHN0cnVjdCBzcGlfbm9yX2h3Y2FwcyBod2NhcHMgPSB7CiAJ
CS5tYXNrID0gU05PUl9IV0NBUFNfUkVBRCB8CiAJCQlTTk9SX0hXQ0FQU19SRUFEX0ZBU1QgfAor
CQkJU05PUl9IV0NBUFNfUkVBRF8xXzFfMiB8CiAJCQlTTk9SX0hXQ0FQU19QUCwKIAl9OwogCWNv
bnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gKmluZm8gPSBjb250cm9sbGVyLT5pbmZvOwotLSAK
Mi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
