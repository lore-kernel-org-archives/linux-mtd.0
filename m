Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABF7C47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5FD21D81
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipwLIPcN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5FD21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fQp7V7of0WD9xW2cXwARJcaX5ef0guCftcJkR8nWkg=; b=ipwLIPcN8voQFH
	Ev6f1a1w79h5M6NmWB+n/vAc26VvWMwMAg+Bx2mc422CzeGgUIVC74KB1cfkk1AYoN3Z2W1RUFsC5
	o2lPy8g7bHKcDiA7eSglDqq1Li94vkggfoYbEj9V/TURsZLWrmnamUOigs5sqxoDJyKz0R7koXPoM
	otcWuyaC4ByPG5heWkZLl2nudTq9NEKQEUH5zneUNIusBL6rcEuAjs0uqmv6Fjd8W1XSIXLotJ9Xg
	LJM/y/4q4uOdme8WmurAioi7+SRNuHSfYtsTCcdcwd+Y4ZR78XAsuY6nbuG5gv0FiUKuDWSkas/jR
	Oh6nNQCRN4whN6jGbIIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMKF-0001q6-1X; Fri, 04 Oct 2019 12:04:47 +0000
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMHb-0007oy-1s
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:02:04 +0000
Received: from player792.ha.ovh.net (unknown [10.109.160.226])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 6980B11BAE5
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:02:00 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id E4DA3AA65F70;
 Fri,  4 Oct 2019 12:01:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 08/16] mtd: spi-nor: Add support for w25q512jv
Date: Fri,  4 Oct 2019 13:59:11 +0200
Message-Id: <20191004115919.20788-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3798786288221916083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050203_276168_4820AB71 
X-CRM114-Status: GOOD (  11.12  )
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

RFVBTCBhbmQgUVVBRCBhcmUgc3VwcG9ydGVkIDoKCiAgaHR0cHM6Ly93d3cud2luYm9uZC5jb20v
cmVzb3VyY2UtZmlsZXMvVzI1UTUxMkpWJTIwU1BJJTIwUmV2QiUyMDA2MjUyMDE5JTIwS01TLnBk
ZgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KUmV2aWV3
ZWQtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Ci0tLQogZHJpdmVycy9tdGQv
c3BpLW5vci9zcGktbm9yLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMKaW5kZXggYjExNjU2NzNjZDkzLi5lOGJlYjY3MWVmODggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCisrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jCkBAIC0yNDgyLDYgKzI0ODIsOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsKIAl7ICJ3MjVxMjU2IiwgSU5GTygweGVm
NDAxOSwgMCwgNjQgKiAxMDI0LCA1MTIsIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQ
SV9OT1JfUVVBRF9SRUFEKSB9LAogCXsgIncyNXEyNTZqdm0iLCBJTkZPKDB4ZWY3MDE5LCAwLCA2
NCAqIDEwMjQsIDUxMiwKIAkJCSAgICAgU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJ
X05PUl9RVUFEX1JFQUQpIH0sCisJeyAidzI1cTUxMmp2IiwgSU5GTygweGVmNDAyMCwgMCwgNjQg
KiAxMDI0LCAxMDI0LAorCQkJICAgIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9O
T1JfUVVBRF9SRUFEIHwKKwkJCSAgICBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIp
IH0sCiAJeyAidzI1bTUxMmp2IiwgSU5GTygweGVmNzExOSwgMCwgNjQgKiAxMDI0LCAxMDI0LAog
CQkJU0VDVF80SyB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgU1BJX05PUl9EVUFMX1JFQUQpIH0sCiAK
LS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
