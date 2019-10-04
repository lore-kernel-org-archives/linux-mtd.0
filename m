Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E512C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD6520862
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kNbfnrTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD6520862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmoX0W/fof+Jg1fx/qZqYyLmoRm8c5QnrXPkut64hmo=; b=kNbfnrTlNEbA5P
	ZbtLQUteKA0Ypx4FOXzsgNZol9GFEagZIqkObBxJ8CcwUs3i1MCfblVzHKL7TgHa6mE1wX2vSgsmi
	zqVrFMrFRb3DWxtJSBCebZib+GOkbV8Zuvw8xJbDsFA4XGvrvB9o97rZx4rVYSnzVKp17Jkd+NPxT
	7UK4O7H1IF27yfnOfWWly8gIGVxyQHWYW0nZZQw9w/1mLEtQND0q2I6QAXeotsJFIfAx/1fJbe7wF
	O5VQ9xx5Kr/phEuR1B3OZ0tRzqVScb8vRRsA6dmcASdLzbo1pDlmjGr7dab5JRYZEMksjrqf7Au3Z
	MXJWUM+YV/CBTLAwQaqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGML8-0003aN-8I; Fri, 04 Oct 2019 12:05:42 +0000
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMHq-000847-Dg
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:02:21 +0000
Received: from player792.ha.ovh.net (unknown [10.109.160.226])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id CB8B513600D
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:02:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 5F7C8AA66000;
 Fri,  4 Oct 2019 12:02:00 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 09/16] mtd: spi-nor: aspeed: Introduce a field for the AHB
 physical address
Date: Fri,  4 Oct 2019 13:59:12 +0200
Message-Id: <20191004115919.20788-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3803008413523086259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050218_685071_92F9B952 
X-CRM114-Status: GOOD (  14.32  )
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

T24gdGhlIEFTVDI2MDAsIHdlIHdpbGwgdXNlIHRoaXMgZmllbGQgdG8gY29tcHV0ZSB0aGUgYWRk
cmVzcyBvZiB0aGUKY2hpcCBBSEIgd2luZG93IGZyb20gdGhlIFNlZ21lbnQgUmVnaXN0ZXIgdmFs
dWUuIEl0IGFsc28gcmVtb3ZlcyB0aGUKbmVlZCBvZiBhc3BlZWRfc21jX2FoYl9iYXNlX3BoeSgp
IGhlbHBlci4KClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+
ClJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgotLS0KIGRyaXZl
cnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jIHwgMTggKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
YXNwZWVkLXNtYy5jCmluZGV4IGFkZDk1YTlhY2E3Ni4uYzVhMGM4ZDk0MzcxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL2FzcGVlZC1zbWMuYwpAQCAtMTIxLDcgKzEyMSw4IEBAIHN0cnVjdCBhc3BlZWRfc21jX2Nv
bnRyb2xsZXIgewogCXN0cnVjdCBtdXRleCBtdXRleDsJCQkvKiBjb250cm9sbGVyIGFjY2VzcyBt
dXRleCAqLwogCWNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gKmluZm87CS8qIHR5cGUgaW5m
byBvZiBjb250cm9sbGVyICovCiAJdm9pZCBfX2lvbWVtICpyZWdzOwkJCS8qIGNvbnRyb2xsZXIg
cmVnaXN0ZXJzICovCi0Jdm9pZCBfX2lvbWVtICphaGJfYmFzZTsJCQkvKiBwZXItY2hpcCB3aW5k
b3dzIHJlc291cmNlICovCisJdm9pZCBfX2lvbWVtICphaGJfYmFzZTsJCQkvKiBwZXItY2hpcCB3
aW5kb3cgcmVzb3VyY2UgKi8KKwl1MzIgYWhiX2Jhc2VfcGh5OwkJCS8qIHBoeXMgYWRkciBvZiBB
SEIgd2luZG93ICAqLwogCXUzMiBhaGJfd2luZG93X3NpemU7CQkJLyogZnVsbCBtYXBwaW5nIHdp
bmRvdyBzaXplICovCiAKIAl1bnNpZ25lZCBsb25nCWNsa19mcmVxdWVuY3k7CkBAIC01MzMsMjEg
KzUzNCwxMyBAQCBzdGF0aWMgdm9pZCBfX2lvbWVtICphc3BlZWRfc21jX2NoaXBfYmFzZShzdHJ1
Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwLAogCXJldHVybiBjb250cm9sbGVyLT5haGJfYmFzZSAr
IG9mZnNldDsKIH0KIAotc3RhdGljIHUzMiBhc3BlZWRfc21jX2FoYl9iYXNlX3BoeShzdHJ1Y3Qg
YXNwZWVkX3NtY19jb250cm9sbGVyICpjb250cm9sbGVyKQotewotCXUzMiBzZWcwX3ZhbCA9IHJl
YWRsKFNFR01FTlRfQUREUl9SRUcoY29udHJvbGxlciwgMCkpOwotCi0JcmV0dXJuIFNFR01FTlRf
QUREUl9TVEFSVChzZWcwX3ZhbCk7Ci19Ci0KIHN0YXRpYyB1MzIgY2hpcF9zZXRfc2VnbWVudChz
dHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwLCB1MzIgY3MsIHUzMiBzdGFydCwKIAkJCSAgICB1
MzIgc2l6ZSkKIHsKIAlzdHJ1Y3QgYXNwZWVkX3NtY19jb250cm9sbGVyICpjb250cm9sbGVyID0g
Y2hpcC0+Y29udHJvbGxlcjsKIAl2b2lkIF9faW9tZW0gKnNlZ19yZWc7Ci0JdTMyIHNlZ19vbGR2
YWwsIHNlZ19uZXd2YWwsIGFoYl9iYXNlX3BoeSwgZW5kOwotCi0JYWhiX2Jhc2VfcGh5ID0gYXNw
ZWVkX3NtY19haGJfYmFzZV9waHkoY29udHJvbGxlcik7CisJdTMyIHNlZ19vbGR2YWwsIHNlZ19u
ZXd2YWwsIGVuZDsKKwl1MzIgYWhiX2Jhc2VfcGh5ID0gY29udHJvbGxlci0+YWhiX2Jhc2VfcGh5
OwogCiAJc2VnX3JlZyA9IFNFR01FTlRfQUREUl9SRUcoY29udHJvbGxlciwgY3MpOwogCXNlZ19v
bGR2YWwgPSByZWFkbChzZWdfcmVnKTsKQEAgLTYzNiw3ICs2MjksNyBAQCBzdGF0aWMgdTMyIGFz
cGVlZF9zbWNfY2hpcF9zZXRfc2VnbWVudChzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwKQog
CQkJIGNoaXAtPmNzLCBzaXplID4+IDIwKTsKIAl9CiAKLQlhaGJfYmFzZV9waHkgPSBhc3BlZWRf
c21jX2FoYl9iYXNlX3BoeShjb250cm9sbGVyKTsKKwlhaGJfYmFzZV9waHkgPSBjb250cm9sbGVy
LT5haGJfYmFzZV9waHk7CiAKIAkvKgogCSAqIEFzIGEgc3RhcnQgYWRkcmVzcyBmb3IgdGhlIGN1
cnJlbnQgc2VnbWVudCwgdXNlIHRoZSBkZWZhdWx0CkBAIC0xMTU4LDYgKzExNTEsNyBAQCBzdGF0
aWMgaW50IGFzcGVlZF9zbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJ
cmV0dXJuIFBUUl9FUlIoY29udHJvbGxlci0+cmVncyk7CiAKIAlyZXMgPSBwbGF0Zm9ybV9nZXRf
cmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDEpOworCWNvbnRyb2xsZXItPmFoYl9iYXNl
X3BoeSA9IHJlcy0+c3RhcnQ7CiAJY29udHJvbGxlci0+YWhiX2Jhc2UgPSBkZXZtX2lvcmVtYXBf
cmVzb3VyY2UoZGV2LCByZXMpOwogCWlmIChJU19FUlIoY29udHJvbGxlci0+YWhiX2Jhc2UpKQog
CQlyZXR1cm4gUFRSX0VSUihjb250cm9sbGVyLT5haGJfYmFzZSk7Ci0tIAoyLjIxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
