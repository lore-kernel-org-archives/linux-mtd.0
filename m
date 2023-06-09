Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCC3C7EE2E
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JFMhUAJGBmzTIHXIAXqEHCJ930RxR8hu2JyeuMdnijM=; b=zuWQ0eNQgVrW5e
	f4ctNYgz+msjjg0Lg/CFS/2Zil7ci+/Jl6BXMJaIlK/ohB15zDvdpHQdQSiDVE/JcJ2Y0g+jINkSI
	Sbu99tOqgAYeG+yRSq403Hqq+PXoI8svSmfPCsi1FAM7sPyEeH7pkfE9UqxWYZXJ39RqZ9VC/xrRs
	UuF8yFAZZlfYoynsgFrI3INdrQgCJUbgmU1HgmQadHAeQKv2X0vAVhF9bf09vHR9DpYex5ZHc1XzY
	5QTRUdSPuHmTRF+jGaaIWWXIjIyY7EY64R79C5f8oxs6RI3iKEx7a5ZJCPt6hgtpJGmzxENSuWLU9
	65X56j+RK5NpUvpQlLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dKz-00DJ91-1X;
	Fri, 09 Jun 2023 14:43:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dKv-00DJ70-0F
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 14:43:34 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686321808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DUIz3aLVLXA7yYm5NV5lusG5/sWM+yqqjnapeENpyF0=;
	b=HmO5VCWuCarFn5s7LixcHF4e9f24+YpPsFGKajM95Xr85+Cbi+qLw4zPu2mhZ476g5IBze
	2g1MUvYUKREUMrbcYIVCg5b106RhD5M4WCeGIOGrmR6L0OktgK+Mg3HL5YYU/vpsr49hMU
	MRrE/tvrU7C7dMvraBVJN/59Xj81a4WsOCMrXdkQRiH28Ba8l5EfY2F6NDBCxOXJIvd1e7
	B4C2Hj+rN4XqlGmycu7BAe+B9+9ZnRVKtx38R+BI3BFJx6gMMgTmConHGTtMVVTf71bwEa
	DvjxbxMK3RvVC1ELc89KQ/YLoj5f5tRi3mLOfQC55S5iU2I1DpPNrCKdWSzgUQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09617FF808;
	Fri,  9 Jun 2023 14:43:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: spi-nor: Support for another sst flash
Date: Fri,  9 Jun 2023 16:43:22 +0200
Message-Id: <20230609144324.850617-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_074333_240112_6BFA09B5 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gVHVkb3IsCgpIZXJlIGFyZSBhIGNvdXBsZSBvZiBwYXRjaGVzIGFkZGluZyBzdXBwb3J0
IGZvciB0aGUgc3N0MjZ2ZjAzMmIgc3BpLW5vciwKbm90aGluZyBzcGVjaWZpYyBoZXJlLiBJIGhv
cGUgSSByYW4gYWxsIHRoZSByZXF1aXJlZCB0ZXN0cyBjb3JyZWN0bHksCm90aGVyd2lzZSBsZXQg
bWUga25vdy4KCkNoZWVycywKTWlxdcOobAoKTWlxdWVsIFJheW5hbCAoMik6CiAgZHQtYmluZGlu
Z3M6IG10ZDogc3BpLW5vcjogRG9jdW1lbnQgc3N0MjZ2ZjB4eGIgZmxhc2ggc2VyaWVzCiAgbXRk
OiBzcGktbm9yOiBBZGQgc3VwcG9ydCBmb3Igc3N0MjZ2ZjAzMmIgZmxhc2gKCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCB8IDIgKy0KIGRy
aXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
NCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
