Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CD6C47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C079F215EA
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfu9aQzY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C079F215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Cw4m8O05G7mlkwKUMsckJwmxxdre7dBk9S5akD4zRY=; b=rfu9aQzYAzBmdf
	ms9mnyDHPS51TQplxnaKYrTS9aRRqMq4uf2w2gxrO7r48XTRqHqcorcPe2vdR2rqEB6olKVV0hnge
	5CMZHvH9txOyvHbwdwYNFf1xkbw7kJUBcw6/xu6Q6GDvJyO7Uf5B+nOqf+QXmzTQf6GUaw2uvveQF
	IHSAczzKJyxyWykiia2aycYcrF/FUoqVC5mqUzMhZUQcGeg2/kTd98m2RQUJUPVwapElKlQVIpfT+
	ZjEdfSuo3no/ItMKVqhWdhoqJflzMmNlUAjwAfcDDJfHMIkoQ0Y+NKP70MnO3yc7KcUKDtEi+R+61
	+qMlfhS3iSmC437ReIXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMHR-0007in-Jx; Fri, 04 Oct 2019 12:01:53 +0000
Received: from 5.mo178.mail-out.ovh.net ([46.105.51.53])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMGG-0006Vh-54
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:00:42 +0000
Received: from player792.ha.ovh.net (unknown [10.108.35.197])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 9FF447B0DA
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:00:36 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id DC61FAA65A3C;
 Fri,  4 Oct 2019 12:00:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 03/16] mtd: spi-nor: aspeed: Link controller with the ahb clock
Date: Fri,  4 Oct 2019 13:59:06 +0200
Message-Id: <20191004115919.20788-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3775142389410204595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050040_359757_6FB3AE93 
X-CRM114-Status: GOOD (  13.89  )
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

V2Ugd2lsbCBuZWVkIHRoZSBBSEIgZnJlcXVlbmN5IHRvIHNldCB0aGUgSENMSyBzZXR0aW5ncyBp
biB0aGUgU01DCmNvbnRyb2xsZXIgdG8gcGVyZm9ybSB0aGUgcmVhZCB0cmFpbmluZy4KClNpZ25l
ZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9t
dGQvc3BpLW5vci9hc3BlZWQtc21jLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVk
LXNtYy5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMKaW5kZXggYzc3NWUwNjEy
NjEzLi5mYWNkOGZjMTZjYTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVk
LXNtYy5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jCkBAIC02LDYgKzYs
NyBAQAogICovCiAKICNpbmNsdWRlIDxsaW51eC9idWcuaD4KKyNpbmNsdWRlIDxsaW51eC9jbGsu
aD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9pby5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgpAQCAtMTA5LDYgKzExMCw4IEBAIHN0cnVjdCBhc3BlZWRf
c21jX2NvbnRyb2xsZXIgewogCXZvaWQgX19pb21lbSAqYWhiX2Jhc2U7CQkJLyogcGVyLWNoaXAg
d2luZG93cyByZXNvdXJjZSAqLwogCXUzMiBhaGJfd2luZG93X3NpemU7CQkJLyogZnVsbCBtYXBw
aW5nIHdpbmRvdyBzaXplICovCiAKKwl1bnNpZ25lZCBsb25nCWNsa19mcmVxdWVuY3k7CisKIAlz
dHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwc1swXTsJLyogcG9pbnRlcnMgdG8gYXR0YWNoZWQg
Y2hpcHMgKi8KIH07CiAKQEAgLTkwOSw2ICs5MTIsNyBAQCBzdGF0aWMgaW50IGFzcGVlZF9zbWNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgYXNwZWVkX3NtY19j
b250cm9sbGVyICpjb250cm9sbGVyOwogCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNo
OwogCWNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gKmluZm87CisJc3RydWN0IGNsayAqY2xr
OwogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCWludCByZXQ7CiAKQEAgLTk0MCw2ICs5NDQsMTIg
QEAgc3RhdGljIGludCBhc3BlZWRfc21jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAKIAljb250cm9sbGVyLT5haGJfd2luZG93X3NpemUgPSByZXNvdXJjZV9zaXplKHJlcyk7
CiAKKwljbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgTlVMTCk7CisJaWYgKElTX0VSUihj
bGspKQorCQlyZXR1cm4gUFRSX0VSUihjbGspOworCWNvbnRyb2xsZXItPmNsa19mcmVxdWVuY3kg
PSBjbGtfZ2V0X3JhdGUoY2xrKTsKKwlkZXZtX2Nsa19wdXQoJnBkZXYtPmRldiwgY2xrKTsKKwog
CXJldCA9IGFzcGVlZF9zbWNfc2V0dXBfZmxhc2goY29udHJvbGxlciwgbnAsIHJlcyk7CiAJaWYg
KHJldCkKIAkJZGV2X2VycihkZXYsICJBc3BlZWQgU01DIHByb2JlIGZhaWxlZCAlZFxuIiwgcmV0
KTsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
