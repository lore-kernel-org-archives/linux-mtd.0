Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815BDCC6B19
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n2mYbO+sO5FkCYBwdyCuWl42bGkg+x8MbKBQaiy4Y/k=; b=IIT32nEJPXf04z
	7+ep1R8S0qnVVnGZyL0aHT6U6qdAONR0ar1f8eW67Su4R6mPK3k3p2JQvCEnBeODt7htFLRcPResv
	KHj1NkwDZAmGe8Iy9mwmnqOYUsNt5ob2I6ZlhotubdTw2ReA5l8Yfpx2M6TMtu8UO2hghnNfSFAzS
	+nVNNf24mXSw1Wsi8oicGuUeO+ItVlZg6o/sJXtrpYIMGq4Bk0HqE93KN+fqMMvJYMuCoQB9b2ChF
	0bGbz1fH9bokyB2UWLwYC1LAblVmCSmhH1Fh6xdeUu+D8lWu/fVv54RkictWhD9wwvexwdM2biIMb
	YLbG4IhubiHQ2MT1l7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsk6-0000000EeA7-0Ko3;
	Wed, 14 Oct 2026 06:45:38 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsk1-0000000Ee95-2Vhm
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:45:36 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791960330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=48PfRxCxgrZU10tU+DMIGvvPW0vMUppNeigFgicL7iM=;
	b=wtrs7JhyEHLw7EpZtLSBYss1dXQ4YnYJvzIvxUFae/PBUOA5K+9tx/JlYlVYUPtfGiuhwt
	dPlH5bFx9fCOVV/ZWYpfh/YQFrDHEz8gruu3D+SPHwuvyzJ5IeBAYrK/DWm45BhWU+8p/6
	xzVMIArOsK14Ul+cXfHxNggUO0oriDwIh7E4eGMjJBa6Jn7UctJUIJoCcTQB72AVqNbDrr
	6s5nyQYwZR17LoxpjyJbSlH9C28GGyAEsDJp7IMvoTpsI/XHmiZuIwH1XDz9nNI5mx7Azs
	L97m9vhaynpNXzh764VNu/Y83oYvB8KE5al00/ZCrmOFi5O68P2rqT4QFevYEg==
Date: Wed, 14 Oct 2026 08:45:26 +0200
Subject: [PATCH v3] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
MIME-Version: 1.0
Message-Id: <20261014-spinand-cont-read-supported-v3-1-e9b8b34d303d@kontron.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNTQ7CIBgFr9KwFgP0x7Yr72FcUPiwaAIEKNE0v
 btQV+50OS+TeSsK4DUENFYr8pB00NZkqA8VEjM3N8BaZkaMsI4ScsLBacONxMKaiD1wicPinPU
 R8ia5Yq0ik2palAvOg9LPvX65fjgs0x1ELMlizDpE61/7faLF++0pUUxxQ6niQpBGDsP5kS1vz
 VECKleJ/RFjJSa6mhPV96znX7Ft2962iTkuJgEAAA==
X-Change-ID: 20261007-spinand-cont-read-supported-cdaf25f0bf45
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6442;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rULxuMEogZxXyWuVm/+bboEhvYZBfRrGHNDLZTE3K1c=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeu8KqeuNs+a/+3yurktCzI2Wrv3tW9WunA6I/xyo7xm8
 Z1lgUs7SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJmL7meG/w9U73xlZj/mWvvx6
 IZgzLCAm0vpBrrzVuqmJ+5fZe6RvZmTYWdGs3RL/61i3QanasomnDnbsVlFVZfJfm8p00Mel/BU
 fAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_234534_806620_7CFC3F9E 
X-CRM114-Status: GOOD (  20.59  )
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
---
Changes in v3:
- Rename has_cont_read_variants to needs_cont_read_op (thanks Miquel)
- Link to v2: https://patch.msgid.link/20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de

Changes in v2:
- Take the decision in spinand_cont_read_init() once the bus interface
  is known, instead of using a single veto flag shared between SSDR and
  ODTR. v1 wrongly disabled continuous reads e.g. for a W25N01JW on an
  octal DTR capable controller (reported by Sashiko).
- Drop the no-op cont_read_possible = false assignments.
- Link to v1: https://patch.msgid.link/20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de
---
 drivers/mtd/nand/spi/core.c | 23 +++++++++++++----------
 include/linux/mtd/spinand.h |  4 ++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 95353777d7f74..7f819367c0a3e 100644
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
+		    (!spinand->needs_cont_read_op ||
+		     spinand->op_templates->cont_read_cache))
 			spinand->cont_read_possible = true;
 	}
 }
@@ -1653,6 +1660,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
 		spinand->set_randomizer = table[i].set_randomizer;
+		spinand->needs_cont_read_op = !!info->op_variants.cont_read_cache;
 
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
index 5f4c00ae72a72..f363d8c32586b 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -772,6 +772,9 @@ struct spinand_mem_ops {
  *		suitable to use or not in general with this chip/configuration.
  *		A per-transfer check must of course be done to ensure it is
  *		actually relevant to enable this feature.
+ * @needs_cont_read_op: The chip needs dedicated continuous read from cache
+ *			operations, which must then be available for the bus
+ *			interface in use
  * @set_cont_read: Enable/disable the continuous read feature
  * @priv: manufacturer private data
  * @fact_otp: SPI NAND factory OTP info.
@@ -810,6 +813,7 @@ struct spinand_device {
 	int (*configure_chip)(struct spinand_device *spinand,
 			      enum spinand_bus_interface iface);
 	bool cont_read_possible;
+	bool needs_cont_read_op;
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
