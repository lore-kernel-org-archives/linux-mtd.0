Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7594DC79FBF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgB3zChdKXstH2OcjOCoapRLPp04JypocXGra8zhkRw=; b=Ou2Yw4eFkMrmB/
	s2192+VUU8kySnQ7Sa7IwJRRc4gi6Ry5EoZWuXhNsDDrFrU804rkD7/fzMj5uqhirKCtaJLVCsg2T
	zeMHKR5EBMF6lo3L5F0t2jNNRa3h3I/O9Z9V/6110BEeLQGItK4XXgByOP1KdBCGeRXxk5LS5MCpo
	fXX+HMy4u6BPE/o5TVYoJ7n3rzGzFCW4i0yG1kz8iDa336xgXtE1salk3ouuDcjQdYq+o5sdO6fSX
	taTm/heH6iD9Zu1GTWP7HHVy3dWj+PGXxL2knS1VO3syFC4DAvDH41OLXaLZM73Q99R787QqWvvCN
	xj6JXiDh5hmAQE6swsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hvG-0000000EzPi-2eyy;
	Thu, 10 Sep 2026 16:46:50 +0000
Received: from b224-1.smtp-out.eu-central-1.amazonses.com ([69.169.224.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hvE-0000000EzOr-0h97
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 16:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hi6pntjfnmhxrdkbpi4sl3ndfqswqs3i; d=sagnik.me; t=1789058804;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=iQkPZUSu5QWYmK5BMUGn5RN8QWahDFyWb9DjqGJqkn8=;
	b=lrUuQlMSprZa8++GPrUUKsWC/KdxSgPI3IRa9P7I7oMuTctxj1PUTpJK6G3rw/MZ
	aEEGcCgKJaIh9runijL6DNxDB+PYAuH2I+sLAf5E8WgZm3vicSeXIznx9wRJ7wDbWzh
	i8zuYQVKk2oOPJ23Df9rG9avMFme4O1LIJG2inYtPDQWvMdWNjuQvMTjG8y58ZVtqku
	TIFAHNXvwF3Nn7dCFTZbRWF4I+WLK4DeIeTinLJ7rv15Oq2pEdSeSI4SeEqZ6YHiUbU
	aclpS0zPykpy1Dr0szkEww7oweAFUO1oClq3mAG2eeHflIoG2yx9P+YjJRhzWVAJAys
	9VhJSAIOPw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=sokbgaaqhfgd6qjht2wmdajpuuanpimv; d=amazonses.com; t=1789058804;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=iQkPZUSu5QWYmK5BMUGn5RN8QWahDFyWb9DjqGJqkn8=;
	b=Zu4Uyclab4nZH8g2mEzsd0iwpPqr9GCSBuRDjZW63nKziiJwylM1Y0Tfb5KidoNN
	4u1yZfp1Bh1CqKFN5vePKdHSFdSsC5GQJ7ngQt8KtevNLM022LewrTQHkbxfBZ328kX
	/BJ0x+uEi7GPluKySk+zdTMJAkqD7aCR0fTscRPw=
From: Sagnik Sasmal <sagnik@sagnik.me>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
	mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spinand: Do not update the QE bit on devices without one
Date: Thu, 10 Sep 2026 16:46:44 +0000
Message-ID: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <878q59s2iv.fsf@bootlin.com>
References: <878q59s2iv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.eu-central-1.PI0qW2sOnv0WHLkqY53RTxXQVzstwFEIoB04n7YZrig=:AmazonSES
X-SES-Outgoing: 2026.09.10-69.169.224.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_094648_396910_9178801C 
X-CRM114-Status: GOOD (  14.09  )
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

Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") moved quad-enable setup into
spinand_configure_chip(). The new code only determines whether quad
mode is needed when SPINAND_HAS_QE_BIT is set, but calls
spinand_init_quad_enable() unconditionally. This clears configuration
register bit 0 on devices without a QE bit.

That bit is not universally a QE bit. On the Winbond W25N02KV it is
H-DIS, which disables the active-low HOLD function. Clearing H-DIS
enables HOLD during single and dual I/O operations. If IO3 is not kept
high, the flash can pause a command and ignore clock and data.

H-DIS is not restored by the FFh reset command, allowing the incorrect
state to survive an SoC warm reboot while the flash remains powered.

Before the refactoring, spinand_init_quad_enable() returned without
touching the configuration register on devices without
SPINAND_HAS_QE_BIT. Restore that behavior by only calling the helper
when the flag is set.

The regression was reproduced on a JioRouter JIDU6401 with an MT7986
SoC and a W25N02KV. With Linux 6.18.44, sysupgrade failed and the
following warm reboot hung in BL2. With this change applied, both
sysupgrade and warm reboot completed successfully.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Assisted-by: LLM
Signed-off-by: Sagnik Sasmal <sagnik@sagnik.me>
---
I really appreciate the prompt review and your suggestion for a cleaner
approach. Thank you.

Changes in v2:
- Call spinand_init_quad_enable() only inside the
  SPINAND_HAS_QE_BIT condition, as suggested by Miquel.
- Retested on a JioRouter JIDU6401; sysupgrade and the following warm
  reboot completed successfully.

 drivers/mtd/nand/spi/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 43bbe2629..e59581d35 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1813,11 +1813,11 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
 			quad_enable = true;
-	}
 
-	ret = spinand_init_quad_enable(spinand, quad_enable);
-	if (ret)
-		return ret;
+		ret = spinand_init_quad_enable(spinand, quad_enable);
+		if (ret)
+			return ret;
+	}
 
 	if (spinand->configure_chip) {
 		ret = spinand->configure_chip(spinand, SSDR);
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
