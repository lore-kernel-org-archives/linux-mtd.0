Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713B606A6A1
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bae5T7GI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v4Jfiv6p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Tw7e6zkTsMI8lOlH3PylPEZnqpADFbZE6yoSm0fDu+M=; b=bae5T7GI4dUGiP92uEIzurxl2X
	yxzhs2NtBQHO5P8CCVxZg9cioAW5fBBWbRpOn11evGa5h7G7TzlY8NZvcOP+PgVbbTMh4xjQcpX36
	UemMfbLi1mC7pEhROWdFtSFbEbUNKj0DlVmlTimWM6YSU/+htUo3JKc6PytLsdoK9OFO9nLegj6ow
	V+totzJE1uyuX6RsMF/tpr0Hd6wNljDw6qDHJm9x2ddtfdbW6pvyzJcYNLdZiUnMrwpKrk1Mer7tB
	/X6QQnUbm1y3YAzjeuHc1RV+Xjr7uxyu7ToeHGtC5yqFqA82TaNdDxplkyv27bJ7boPWO2uyZtvqM
	sPoRcPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmlS-000000063EU-2ZY5;
	Tue, 24 Nov 2026 09:24:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmlO-000000063Bw-45Ko
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 09:24:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 437B71A17AD;
	Tue, 24 Nov 2026 09:24:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11349601E1;
	Tue, 24 Nov 2026 09:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 319AA11E68C80;
	Tue, 24 Nov 2026 10:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795512270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ErlUnItM2bJrYKuLZXeyKH1pw6LrTqwX7tmnsb6bczY=;
	b=v4Jfiv6pkXQse3y32vlDDxQyWbunmg1FQl8vlrEw+mLYE2psH4Sq1L2VrlkX/72U+vDXMC
	xPyovGstdwL7PHREEa/KoH6rQREJJ66r2Z2z3Zp2Pp8B10eL5+0tOTN6sEevLHI7X4uckZ
	3V6bLdfZAXWIaYPX3p1vrPZMIVCwQD67kTdl8fBFG2xEl06vMJRIgqgVLYRvXgqn/tFH4p
	usK9ww7gBZyx98DEYPsFJVwb/RGifb8/6q9ixuJSdvjQzyV5/MXDBu9WsL6VVLEBWdZ299
	j7dam/FQebX+aRBan+5inuXw8G8qiAVYU8TBc0G1j1OSX4Hu8W+5LzkiMExTfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] mtd: rawnand: cadence: Fix incorrect variable
 dereference
Date: Tue, 24 Nov 2026 10:24:21 +0100
Message-Id: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0Jm7ZgWLQZX3sOw6M8Ak0jbtIgaw
 t2tnMDle1/yvhUyJaYM12qFRAtnDr5AfajAjtoPhOwKQy3qRkrZYqSUAz5jnhPpif2ASb+89g5
 7flPG3lxOxqm2cdJCqcRE+1Ai967wyHkO6bMfLvJn/28vEgUK26rmLI1Swt5MCPOD/dGGCbpt2
 76Rk9fQ0AAAAA==
X-Change-ID: 20261119-perso-upstreaming-rawnand-fixes-fb73bd596d1c
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_012435_164141_A6135C86 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Small series fixing a report dating from September on the Cadence
controller. The last patch uses a newer API for one of the DMA helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Add a patch resizing the bounce buffer before the BBT scan, which
  fixes a potential heap buffer overflow reported by Sashiko.
- Convert the buffer mapping in cadence_nand_slave_dma_transfer()
  to dmaengine_get_dma_device() so both ends of the transfer are mapped
  against the same device, again as suggested by Sashiko.
- Link to v1: https://lore.kernel.org/r/20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com

---
Miquel Raynal (3):
      mtd: rawnand: cadence: Fix DMA device dereference when DMA is disabled
      mtd: rawnand: cadence: Resize the bounce buffer before the BBT scan
      mtd: rawnand: cadence: Switch to dmaengine_get_dma_device()

 drivers/mtd/nand/raw/cadence-nand-controller.c | 62 ++++++++++++++------------
 1 file changed, 34 insertions(+), 28 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261119-perso-upstreaming-rawnand-fixes-fb73bd596d1c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
