Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775EBC982E6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NDTJwvfUy7DYSjEMj7P7Q2OpTkOKlpyLfOC0hu23o4o=; b=YoQttXxfRzI9p7
	sTUBpRxBZrWJieLOY0gyyn/dGtgmcYZhGe5IO9w3VefylI7i8ODcSQv8Ynwr3U1EtS7x9NtaIItmG
	CRjv9ZiCThEvKAGnzoLBFRz4haHPQYaSewbBYEh+JwQaeODvVAielGrXIwRR8Qz4RhKifPgLregVe
	Nr8geDSkscaGE4WXBH/hWv2Kr37t0i63QnG5xjD2B9Bu0i1knJDoIDNYc3bo8PwC9zxSa4eSFgUDS
	TfT9eFWJeAhrw8Jp6Eyjjzin6x+3qRm3OS/5ut/gJ0ay/4y9QvNZXYVIVdSsafTQMYAfDwoxItRW0
	Q5U07+LHAd8ljE7onraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xkg-000000014or-2nrJ;
	Mon, 21 Sep 2026 06:43:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xkd-000000014nc-1tjL
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:43:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF2151A0DC0;
	Mon, 21 Sep 2026 06:43:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1C3D60339;
	Mon, 21 Sep 2026 06:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2860103290D2;
	Mon, 21 Sep 2026 08:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nq2N5CNQkEOykHaLoOBsM4AN5HE/XlIcHsQWDjLbxYs=;
	b=xJh5bLR+/WVPS3S1qEIL2gkW0PAlU/t8QXa62tUq6eIMK93YPMMfTPq9mKOnV54Qe+f7aN
	vGlvZ11GI5pEG1Zqd+ksA8Xft5QUyC/3ALBU3h/WV00b01RalQGIeBBMdg/b/YFw/LfPUh
	OzHNFM4da2BJpMUho17BqnMddxehN1ey80jSeQ2qm2jRlTQ4jujmrewymJjw0i6Y8kEtMx
	3u9GxPmgZmNvntUfGmgMPtPE1mKyue/1n8J+Km4qXzNrTu5oPeuu9CLJBLdd+KbpXgcvg/
	zHr1EiWvDyMz9lmPE4KSZs5vtOHvKrsov3FncvRrU8L0MSoMb33swhhXnNStRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Date: Mon, 21 Sep 2026 08:43:31 +0200
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNwRKCIBSF4VdpWHcbwCRp1Xs0LRAwb6PggGmN4
 7uHtqmly3MW3z+RaAPaSM67iQQ7YETv0sj2O6Jr5e4W0KRNOOWCCi5gRFd6Z6BVsbcBYofgfID
 HCLqxyj076EZQxmCfJGC5VVl+LHIhC5LMLtgKX2vveku7xtj78F7zA1veb0lSubE0MKCgWcmpz
 qQxrLqU3vcNuoP2LVlaA//xOd3q8+SrUmopisLQE/v353n+AFfaI5tMAQAA
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
X-CRM114-CacheID: sfid-20260920_234343_652930_B4B291DA 
X-CRM114-Status: UNSURE (   9.83  )
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
Changes in v3:
- The 33PW chips do not have ECC support. Now that this was properly
  explained in a comment, Sashiko raised that the commit logs were wrong
  because they were still mentioning the capability. Fix the commit
  logs.
- Link to v2: https://lore.kernel.org/r/20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com

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
