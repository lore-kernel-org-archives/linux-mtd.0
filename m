Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74948CA5FFC
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2026 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+LVlZrVddeFl/v9oRRPPUU3mYxCzmvWpyXyOGdJUtZs=; b=yCSpPgZuJnIlwO
	qtGtQjJ0H44QmWL+2tLGpFry5aolpDegHrP6ppXJInJcmmUP7mWVAep+T5toYbW5d8nX/uIMgoY6E
	GWtsFZlS56QYFsU3BDmtdFQtu5BHUyFtFdHEBordxLuWH8LuZyR6Ef8z8+cYhfC44pDU/gGKxkCz7
	BTd6SmC0pHQct3QIS3/uQFHinm8CbYn411YdB93xNBDul6tqpy/V9bR4uUxGSU67E5u6SylhTE59Y
	xNdDvrSPWMQbrLJ+FRa6o4Jrcd5L0ietXtejTZXx0Xk+ilBVf8ziCQZDTSuZ36LQgVarVSOGTDFqn
	V/zMXSoVkVWkeId+zrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERMb-00000002VRs-1ZHw;
	Wed, 07 Oct 2026 13:07:17 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERMY-00000002VRM-1EO0
	for linux-mtd@lists.infradead.org;
	Wed, 07 Oct 2026 13:07:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791378431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LMhoaReM34vJuMXEhKtWyidDdftLcQ1XkCiaDmwQDJ8=;
	b=qZiEc9IEoSSz1MPxUQ6xFlrK1327jrR8r66aipxlT2Qc7lYgDsggzlP2m5atv8Gzs2OUTt
	rPXlvzMcQVHOO+zUsUhfKyvFewEql9UKgpnU6vKSfmCcjWKCFdOILmBRcG7tiULKtETEvw
	/1qTsyufaUcM4I3o3lGrHD2Tx8R5BQ6ZKUiOS3ejQ/4QRp7qPKY0NqIvVgwcemlnnLpS78
	/zaECJ/W2Vj1jInBpAHxLjhN4BN7nXg5PjOdIXtaY7Ckn5cMLFxN1rQzLAkrAQTjCjkUi6
	qtU5UUcLSnfRSnmT/tuiVGoWCwOAdrf3AgcwP6TriW9lYH5JePK134FcMvR4gg==
Date: Wed, 07 Oct 2026 15:06:57 +0200
Subject: [PATCH v2] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
MIME-Version: 1.0
Message-Id: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ7CIBBFr2JmLQZIq6kr72G6oDBYNAEyQxtN0
 7tL6wVcvp+X9xdgpIAM18MChHPgkGIFfTyAHU18oAiuMmipz0rKi+AcoolO2BSLIDRO8JRzooJ
 1c8br1svBNy3UQib04b3X7/2PeRqeaMuW3IwxcEn02e9ntXn/Pc1KKNEo5Y21snFdd3tVi1I8O
 YR+Xdcvoi26KtkAAAA=
X-Change-ID: 20261007-spinand-cont-read-supported-cdaf25f0bf45
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6579;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rxyaTlMsmoBUpJBGBYifzMJju/WwGYV7TyL34xQh9iI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuY83dJydyTsl2PD+94w+xm/2VGaYRdZpZ81ofmibr+x
 55Kqa3tKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmAhTByNDO1NcNbPx19VeG0I+
 9j7TfZKg2/z12jXBKjULqayYS47HGRnObj3y4ePXzHlllm+WJx3Tr3/K2hy9TsK02nLV0wueBUu
 5AQ==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_060714_498937_5290D36C 
X-CRM114-Status: GOOD (  22.66  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

spinand_match_and_init() tries to disable continuous reads by clearing
cont_read_possible when the fastest continuous read variant is slower
than the fastest read from cache variant, or when no SSDR/ODTR continuous
read variant is supported by the controller. However, at that point
cont_read_possible has not been set yet, and spinand_cont_read_init(),
which runs later during spinand_init(), unconditionally sets it to true
for any chip implementing ->set_cont_read().

As a result, continuous reads end up being used while
op_templates->cont_read_cache is NULL. spinand_create_dirmap() then does
not provide a secondary template and spinand_read_from_cache_op() falls
back to the regular read from cache operation while the chip is in
continuous read mode. On Winbond chips, which do not expect the column
address in this mode, this misaligns the data returned.

The SSDR and ODTR variants are evaluated independently and the bus
interface is only selected later on, so the decision cannot be taken in
spinand_match_and_init(). For example, a quad-only W25N01JW attached to
an octal DTR capable controller has no ODTR continuous read variant, but
ends up using SSDR, where continuous reads work fine.

Instead of clearing cont_read_possible, leave the continuous read
template of the affected bus interface empty and remember whether the
chip relies on dedicated continuous read operations. In
spinand_cont_read_init(), which runs once the bus interface is known,
only enable continuous reads for such chips if a continuous read
template is available for the bus interface in use.

Fixes: 6eb7c193e751 ("mtd: spinand: Use secondary ops for continuous reads")
Assisted-by: LLM
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
I was using an LLM to check sync patches for U-Boot and the LLM reported
a bug in the upstream kernel code. To me it looks like this is indeed a
bug and the fix also looks correct to me, but I would like to mention, that
this is purely LLM-generated and theoretical. I didn't verify the bug and
the fix on actual hardware.

@Miquel: Do you have a hardware setup that would be affected by this? Do
you think there is a better fix?
---
Changes in v2:
- Take the decision in spinand_cont_read_init() once the bus interface
  is known, instead of using a single veto flag shared between SSDR and
  ODTR. v1 wrongly disabled continuous reads e.g. for a W25N01JW on an
  octal DTR capable controller (reported by Sashiko).
- Drop the no-op cont_read_possible = false assignments.
- Link to v1: https://patch.msgid.link/20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/spi/core.c | 23 +++++++++++++----------
 include/linux/mtd/spinand.h |  4 ++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 95353777d7f7..11278820675c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -993,9 +993,16 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 		 */
 		spinand_cont_read_enable(spinand, false);
 
+		/*
+		 * Chips needing dedicated continuous read operations can only
+		 * use continuous reads if such an operation was selected for
+		 * the bus interface in use.
+		 */
 		if ((engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
 		     engine_type == NAND_ECC_ENGINE_TYPE_NONE) &&
-		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion))
+		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion) &&
+		    (!spinand->has_cont_read_variants ||
+		     spinand->op_templates->cont_read_cache))
 			spinand->cont_read_possible = true;
 	}
 }
@@ -1653,6 +1660,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
 		spinand->set_randomizer = table[i].set_randomizer;
+		spinand->has_cont_read_variants = !!info->op_variants.cont_read_cache;
 
 		/* I/O variants selection with single-spi SDR commands */
 
@@ -1700,12 +1708,10 @@ int spinand_match_and_init(struct spinand_device *spinand,
 				    (read_op->addr.dtr && !op->addr.dtr) ||
 				    read_op->data.buswidth > op->data.buswidth ||
 				    (read_op->data.dtr && !op->data.dtr))
-					spinand->cont_read_possible = false;
-				else
-					spinand->ssdr_op_templates.cont_read_cache = op;
-			} else {
-				spinand->cont_read_possible = false;
+					op = NULL;
 			}
+
+			spinand->ssdr_op_templates.cont_read_cache = op;
 		}
 
 		/* I/O variants selection with octo-spi DDR commands (optional) */
@@ -1733,10 +1739,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		if (info->op_variants.cont_read_cache) {
 			op = spinand_select_op_variant(spinand, ODTR,
 						       info->op_variants.cont_read_cache);
-			if (op)
-				spinand->odtr_op_templates.cont_read_cache = op;
-			else
-				spinand->cont_read_possible = false;
+			spinand->odtr_op_templates.cont_read_cache = op;
 		}
 
 		return 0;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..83f1036fe9bc 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -772,6 +772,9 @@ struct spinand_mem_ops {
  *		suitable to use or not in general with this chip/configuration.
  *		A per-transfer check must of course be done to ensure it is
  *		actually relevant to enable this feature.
+ * @has_cont_read_variants: The chip needs dedicated continuous read from
+ *			    cache operations, which must then be available for
+ *			    the bus interface in use
  * @set_cont_read: Enable/disable the continuous read feature
  * @priv: manufacturer private data
  * @fact_otp: SPI NAND factory OTP info.
@@ -810,6 +813,7 @@ struct spinand_device {
 	int (*configure_chip)(struct spinand_device *spinand,
 			      enum spinand_bus_interface iface);
 	bool cont_read_possible;
+	bool has_cont_read_variants;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
 	int (*set_randomizer)(struct spinand_device *spinand,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261007-spinand-cont-read-supported-cdaf25f0bf45

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
