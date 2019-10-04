Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5A8C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:03:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D50215EA
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nK78LOJu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D50215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1Xa5/Hq6K8wwcTPtyFQ/9M+HNy+aupV/+07a+BDnJc=; b=nK78LOJuioLPKD
	R8Ej7Px2eh6ho6Rn0NhyLPaUkMcP1DImiwupEGPbY1Y0pvQafFcrzFlQe33bcb6YQUd/NZyX9TFNy
	S1s8+Jq03YVf1RfWywyHAvtZ7xXsRqN62YO++IZTgysntfW3EE2+K3AHY6kue40idz/tD/M/7z3Kd
	u42oNf1t2XgzDQoSwVTRKNpPXfJV8i+rS2/9Qq0J2DS7Llxn8KRKlILoRHtlUN33Co6Tlu6cViFBN
	amLpkxQ3TF9EI/xOlFgTM0TWZHY3o53x5y/WW5va05f4M+t0LlcypueHL9SWVioJ8SGzadnqZu6zi
	x1AEaLYkz6hSimT2+vdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMJO-00014u-Er; Fri, 04 Oct 2019 12:03:54 +0000
Received: from 6.mo68.mail-out.ovh.net ([46.105.63.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMHL-0007Zk-Jf
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:01:50 +0000
Received: from player792.ha.ovh.net (unknown [10.108.57.50])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 0E202145B5F
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:01:43 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 59679AA65F0C;
 Fri,  4 Oct 2019 12:01:28 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 07/16] mtd: spi-nor: aspeed: Add support for the 4B opcodes
Date: Fri,  4 Oct 2019 13:59:10 +0200
Message-Id: <20191004115919.20788-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3794001212520238003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050147_793020_88F8AC7D 
X-CRM114-Status: GOOD (  13.12  )
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

U3dpdGNoIHRoZSBkZWZhdWx0IGNvbnRyb2xsZXIgdmFsdWUgdG8gdXNlIHRoZSByZWFkIG1vZGUg
aW4gb3JkZXIgdG8KY3VzdG9taXplIHRoZSBjb21tYW5kIGFuZCB1c2UgU1BJTk9SX09QX1JFQURf
NEIgKDB4MTMpIHdoZW4gdGhlIGNoaXAKc3VwcG9ydHMgNEIgb3Bjb2Rlcy4KClNpZ25lZC1vZmYt
Ynk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9tdGQvc3Bp
LW5vci9hc3BlZWQtc21jLmMgfCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2FzcGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jCmluZGV4
IDFjMTgyMmExMzQwNy4uYWRkOTVhOWFjYTc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2FzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYwpA
QCAtODg4LDE0ICs4ODgsMjEgQEAgc3RhdGljIHUzMiBhc3BlZWRfc21jX2RlZmF1bHRfcmVhZChz
dHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwKQogCSAqLwogCXUzMiBjdGxfbWFzayA9IGNoaXAt
PmNvbnRyb2xsZXItPmluZm8gPT0gJnNwaV8yNDAwX2luZm8gPwogCQkgQ09OVFJPTF9JT19BRERS
RVNTXzRCIDogMDsKKwl1OCBjbWQgPSBjaGlwLT5ub3IuZmxhZ3MgJiBTTk9SX0ZfNEJfT1BDT0RF
UyA/IFNQSU5PUl9PUF9SRUFEXzRCIDoKKwkJU1BJTk9SX09QX1JFQUQ7CiAKKwkvKgorCSAqIFVz
ZSB0aGUgInJlYWQgY29tbWFuZCIgbW9kZSB0byBjdXN0b21pemUgdGhlIG9wY29kZS4gSW4KKwkg
KiBub3JtYWwgY29tbWFuZCBtb2RlLCB0aGUgdmFsdWUgaXMgbmVjZXNzYXJpbHkgUkVBRCAoMHgz
KSBvbgorCSAqIHRoZSBBU1QyNDAwLzI1MDAgU29Dcy4KKwkgKi8KIAlyZXR1cm4gKGNoaXAtPmN0
bF92YWxbc21jX3JlYWRdICYgY3RsX21hc2spIHwKIAkJKDB4MDAgPDwgMjgpIHwgLyogU2luZ2xl
IGJpdCAqLwogCQkoMHgwMCA8PCAyNCkgfCAvKiBDRSMgbWF4ICovCi0JCSgweDAzIDw8IDE2KSB8
IC8qIHVzZSBub3JtYWwgcmVhZHMgKi8KKwkJKGNtZCAgPDwgMTYpIHwgLyogdXNlIHJlYWQgbW9k
ZSB0byBzdXBwb3J0IDRCIG9wY29kZSAqLwogCQkoMHgwMCA8PCAgOCkgfCAvKiBIQ0xLLzE2ICov
CiAJCSgweDAwIDw8ICA2KSB8IC8qIG5vIGR1bW15IGN5Y2xlICovCi0JCSgweDAwKTsgICAgICAg
IC8qIG5vcm1hbCBtb2RlICovCisJCSgweDAxKTsgICAgICAgIC8qIHJlYWQgbW9kZSAqLwogfQog
CiBzdGF0aWMgaW50IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZChzdHJ1Y3QgYXNwZWVkX3NtY19j
aGlwICpjaGlwLAotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
