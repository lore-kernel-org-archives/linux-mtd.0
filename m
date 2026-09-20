Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF2EC982E1
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mz8+HvR93GyZwv4vqb62hMndJuosgGdhgR7jssrHyO8=; b=XUPGL7/nwt/TtE
	YN5Q/MX76scw7pYJ75dyAYbbmyrUl5e0tY5/yY00U/6Bxi+mO2Oj7rPhwx4VvkBuA5PXP3hSQVl6Z
	qjas/pWEznj2YJhVYZcgpvrwBlx8Ut1ByUWRauujGmelqgIl2kn/jw0N6gXVJpnYY5Fg63C6ZvcpR
	XCfLbsr1qadt0OKCjDvOJU2J45PTXmm69eVRvmiZrUTm2Vep65Rmzde2SqNVooJhaUjZhr4gxoIRO
	tq+PNfgmrr4UcSIpCAUYAdg+U4Zx4yJhomQTiQUNAIYF+fW/TiQLj0GdHFXBXd+RHsUNMWpmhNnIu
	LdnQSwyaEVI/pE77Jusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I5j-0000000HX9s-0cnI;
	Sun, 20 Sep 2026 14:00:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I5g-0000000HX9M-1qte
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:00:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 050954E405BB;
	Sun, 20 Sep 2026 14:00:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B642C6033F;
	Sun, 20 Sep 2026 14:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8581C103286A4;
	Sun, 20 Sep 2026 16:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Ub5pYOQhzCNVrg9D9Bp6x2yHYSO8UuaD7loIAlMzECc=;
	b=ayd7A2DqIbopnLFZGBjcRvpvLl9TzLmWUCaCI0ID68lZMV4ZWsGvWcjBvkrHVXMIyiw2q8
	POlYtuKwqu/uS4yDgn4QORuY87+GLDSyXnW3r5PKLlI+A2+x8Yl1bGR+6pVRjt0mB5qsll
	3ZXPdxiraBDN/qx4f4Q9Uy8Kh7Va2ER3185JZX/XN51Oaqakl7I1pJhaM0uzsLB7XZ9tMe
	6SLxGznr8YDei8tsKLLR2TN9MxFhfj3OkV3L0JVRrkr31md1OGaGxOnzd0y32QTeN5Jlei
	/cCD2+obH4eRv6z2b7oWEd1C7FdTwi/1mrqj3PcbwTNudR8S6U/oKsOZ08EP0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Date: Sun, 20 Sep 2026 16:00:09 +0200
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNQQ7CIBRF0a00jP0GqCXFkfswHVBA+00LBLDVN
 N27WFfg8L7BOytJNqJN5FytJNoZE3pXgh8qogfl7hbQlCacckEFF7Cg670zMKmUbYQUEJyP8Fh
 Aj1a5Z4CwgDIGc3kC1lhVN6e2EbIl5TNEe8PX7l270gOm7ON752f2XX+SpPJPaWZAQbOeU11LY
 9jt0nufR3RH7SfSbdv2AVj1wDfsAAAA
X-Change-ID: 20260626-winbond-master-spi-nor-jw-cleanup-pw-addition-15ea35485698
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_070024_631426_CE89CC67 
X-CRM114-Status: UNSURE (   8.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Compared to the previous ones, this series is super straightforward
since it leverages all the core changes that have already been done for
the JV/RV families. Like the former JV/RV series, it first cleans up the
table for JW chips. As I have access to a lot of devices, I made test
runs with almost all of them. This way I could extract the SFDP data,
the capabilities of the chips, proof that they passed all the tests,
etc. I then add support for the PW parts, also showing a full test run
in each case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Fix comment pointed out by Michael.
- Resend the series, hopefully all patches will go through this time.
- Link to v1: https://lore.kernel.org/r/20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com

---
Miquel Raynal (25):
      mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the chips
      mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the chips
      mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
      mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capability
      mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
      mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
      mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
      mtd: spi-nor: winbond: Add support for W25Q33PW-M
      mtd: spi-nor: winbond: Add support for W25Q64PW-M
      mtd: spi-nor: winbond: Add support for W25Q12PW-M
      mtd: spi-nor: winbond: Add support for W25Q25PW-M

 drivers/mtd/spi-nor/winbond.c | 91 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 77 insertions(+), 14 deletions(-)
---
base-commit: 21373f9588a0df4fd2ad7bbd120b04fccfaf0677
change-id: 20260626-winbond-master-spi-nor-jw-cleanup-pw-addition-15ea35485698

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
