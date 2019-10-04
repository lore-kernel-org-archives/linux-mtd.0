Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3875BC47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:03:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06ACA20862
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LfragzEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06ACA20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ksSwkDH4JqMilzd2nO68edG/omPk7RkNY9NlLIIaho=; b=LfragzEr4GAlIR
	ahSmsnea65VYawijvOKJB7fyqPL+goTy5xcgPPlDp4n/M9H8CqamtNO/OfbY2mJDwGB8X2S4brWsw
	xzqEUZs+5/RDGJPINL39X7Xw+5Dbq8Uur6KbYFZ23QMJ14bAm0dolSoOFFLHmPEK0yRKTUN75dIgC
	G/vrR35RBJsSqb89x+q2XLKTbEviQ0+wXH0nythwq6qkbs3LDb/C/ozcto8iV2aZLXzgqSTHBOD3c
	RXwR5zYSdd/U3DHdFnMBXb+H6wxoF9HKvd3v1br7Mu8+IXp+ABZrWpo7Ex/AnxV9pmxbZHRZzz5bx
	osZB32FZNL+xVT7nyxjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMIa-0000Je-CS; Fri, 04 Oct 2019 12:03:04 +0000
Received: from 9.mo6.mail-out.ovh.net ([87.98.171.146])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMGm-000716-Ek
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:01:15 +0000
Received: from player792.ha.ovh.net (unknown [10.108.42.168])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0D0F01E41D5
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:01:08 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id EBFDBAA65C67;
 Fri,  4 Oct 2019 12:00:51 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 05/16] mtd: spi-nor: aspeed: Limit the maximum SPI frequency
Date: Fri,  4 Oct 2019 13:59:08 +0200
Message-Id: <20191004115919.20788-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3784149587467340723
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050112_702486_58BE33E4 
X-CRM114-Status: GOOD (  16.40  )
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

VGhlIHJlYWQgdHJhaW5pbmcgYWxnb3JpdGhtIGNhbiBjaG9vc2UgYSAxMDBNSHogU1BJIGZyZXF1
ZW5jeSB3aGljaAptaWdodCBiZSBhIGJpdCB0b28gaGlnaCBmb3IgZHVhbCBvdXRwdXQgSU8gb24g
c29tZSBjaGlwcywgZm9yIHRoZQpXMjVRMjU2IG9uIHBhbG1ldHRvIGZvciBpbnN0YW5jZS4gVGhl
IE1YNjZMMUc0NUcgb24gd2l0aGVyc3Bvb24gc2hvdWxkCmJlIGZpbmUgdGhvdWdoLiBBbHNvLCB0
aGUgc2Vjb25kIGNoaXAgb2YgdGhlIEZNQyBjb250cm9sbGVyIGRvZXMgbm90CmdldCBhbnkgb3B0
aW1pemUgc2V0dGluZ3MgZm9yIHJlYWRzLiBPbmx5IHRoZSBmaXJzdCBpcyBjb25maWd1cmVkIGJ5
ClUtQm9vdC4KClRvIGZpeCB0aGVzZSB0d28gaXNzdWVzLCB3ZSBpbnRyb2R1Y2UgYSAic3BpLW1h
eC1mcmVxdWVuY3kiIHByb3BlcnR5CmluIHRoZSBkZXZpY2UgdHJlZSB3aGljaCB3aWxsIGJlIHVz
ZWQgdG8gY2FwIHRoZSByZWFkIHRyYWluaW5nCmFsZ29yaXRobS4gSXQgaXMgbm93IGNvbnNpZGVy
ZWQgc2FmZSB0byBydW4gdGhlIHJlYWQgdHJhaW5pbmcgb24gdGhlCkZNQyBjb250cm9sbGVyIGNo
aXBzIGFzIHdlbGwuCgpCeSBkZWZhdWx0LCB0aGUgZnJlcXVlbmN5IHNldHRpbmcgaXMgNTBNSHou
CgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgpSZXZpZXdl
ZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KLS0tCiBkcml2ZXJzL210ZC9z
cGktbm9yL2FzcGVlZC1zbWMuYyB8IDE3ICsrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNt
Yy5jCmluZGV4IDE1NWM0MDdjMmJkZi4uMWMxODIyYTEzNDA3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2FzcGVl
ZC1zbWMuYwpAQCAtNTgsNiArNTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zbWNf
aW5mbyBmbWNfMjQwMF9pbmZvID0gewogCS5jdGwwID0gMHgxMCwKIAkudGltaW5nID0gMHg5NCwK
IAkuc2V0XzRiID0gYXNwZWVkX3NtY19jaGlwX3NldF80YiwKKwkub3B0aW1pemVfcmVhZCA9IGFz
cGVlZF9zbWNfb3B0aW1pemVfcmVhZCwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVk
X3NtY19pbmZvIHNwaV8yNDAwX2luZm8gPSB7CkBAIC03OSw2ICs4MCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYXNwZWVkX3NtY19pbmZvIGZtY18yNTAwX2luZm8gPSB7CiAJLmN0bDAgPSAweDEw
LAogCS50aW1pbmcgPSAweDk0LAogCS5zZXRfNGIgPSBhc3BlZWRfc21jX2NoaXBfc2V0XzRiLAor
CS5vcHRpbWl6ZV9yZWFkID0gYXNwZWVkX3NtY19vcHRpbWl6ZV9yZWFkLAogfTsKIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gc3BpXzI1MDBfaW5mbyA9IHsKQEAgLTExMCw2
ICsxMTIsNyBAQCBzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwIHsKIAl1MzIgY3RsX3ZhbFtzbWNfbWF4
XTsJCQkvKiBjb250cm9sIHNldHRpbmdzICovCiAJZW51bSBhc3BlZWRfc21jX2ZsYXNoX3R5cGUg
dHlwZTsJLyogd2hhdCB0eXBlIG9mIGZsYXNoICovCiAJc3RydWN0IHNwaV9ub3Igbm9yOworCXUz
MiBjbGtfcmF0ZTsKIH07CiAKIHN0cnVjdCBhc3BlZWRfc21jX2NvbnRyb2xsZXIgewpAQCAtMTI2
LDYgKzEyOSw4IEBAIHN0cnVjdCBhc3BlZWRfc21jX2NvbnRyb2xsZXIgewogCXN0cnVjdCBhc3Bl
ZWRfc21jX2NoaXAgKmNoaXBzWzBdOwkvKiBwb2ludGVycyB0byBhdHRhY2hlZCBjaGlwcyAqLwog
fTsKIAorI2RlZmluZSBBU1BFRURfU1BJX0RFRkFVTFRfRlJFUQkJNTAwMDAwMDAKKwogLyoKICAq
IFNQSSBGbGFzaCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyIChBU1QyNTAwIFNQSSkKICAqICAgICBv
cgpAQCAtMTAwMiwxMSArMTAwNyw4IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NtY19jaGlwX3NldHVw
X2ZpbmlzaChzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwKQogCWRldl9pbmZvKGNvbnRyb2xs
ZXItPmRldiwgInJlYWQgY29udHJvbCByZWdpc3RlcjogJTA4eFxuIiwKIAkJIGNoaXAtPmN0bF92
YWxbc21jX3JlYWRdKTsKIAotCS8qCi0JICogVE9ETzogZ2V0IG1heCBmcmVxIGZyb20gY2hpcAot
CSAqLwogCWlmIChvcHRpbWl6ZV9yZWFkICYmIGluZm8tPm9wdGltaXplX3JlYWQpCi0JCWluZm8t
Pm9wdGltaXplX3JlYWQoY2hpcCwgMTA0MDAwMDAwKTsKKwkJaW5mby0+b3B0aW1pemVfcmVhZChj
aGlwLCBjaGlwLT5jbGtfcmF0ZSk7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTEwNjAsNiArMTA2Miwx
MyBAQCBzdGF0aWMgaW50IGFzcGVlZF9zbWNfc2V0dXBfZmxhc2goc3RydWN0IGFzcGVlZF9zbWNf
Y29udHJvbGxlciAqY29udHJvbGxlciwKIAkJCWJyZWFrOwogCQl9CiAKKwkJaWYgKG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKGNoaWxkLCAic3BpLW1heC1mcmVxdWVuY3kiLAorCQkJCQkgJmNoaXAtPmNs
a19yYXRlKSkgeworCQkJY2hpcC0+Y2xrX3JhdGUgPSBBU1BFRURfU1BJX0RFRkFVTFRfRlJFUTsK
KwkJfQorCQlkZXZfaW5mbyhkZXYsICJVc2luZyAlZCBNSHogU1BJIGZyZXF1ZW5jeVxuIiwKKwkJ
CSBjaGlwLT5jbGtfcmF0ZSAvIDEwMDAwMDApOworCiAJCWNoaXAtPmNvbnRyb2xsZXIgPSBjb250
cm9sbGVyOwogCQljaGlwLT5jdGwgPSBjb250cm9sbGVyLT5yZWdzICsgaW5mby0+Y3RsMCArIGNz
ICogNDsKIAkJY2hpcC0+Y3MgPSBjczsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
