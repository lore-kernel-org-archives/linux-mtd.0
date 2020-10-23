Return-Path: <SRS0=Iiny=D6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E636C55179
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2020 16:34:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107DD22254
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2020 16:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2SVuFr4s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACHRRoOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107DD22254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wVfN5Dr+ZvFCdscayO9Z385qD4oiTLBDzf9Hmw64VEI=; b=2SVuFr4sH8h3X1rrLH6Orvk0P
	e3Hh5avKNWZn4aiYr1A90yDrQpbraVbnPFJJrMiU1c7Oe9a4ogvcwxjPh6P/qIHIiX0RDH5uz95rj
	a6v5K1XIIKwfpqK5BZO1qFAuWVc87+/bKWhX0i4RfD+S3J4LOnS+QN/1ISC+8stzvv6VF/md9OWNe
	k8L2qxXMmkeJ12y9O89nOqBcelTvqzlN4NGQpX0OC9nxRN84UnONfNxVnt4BMIfuhafo1DmEAGFOF
	pWkwfscp1TMYM0ZWsQXSvNcLd4RhSVOfWGfL7OGWgBdYhBnjoVrFZheCGms6HVmphimYzPg0fYXb5
	2Y4PwbXxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kW00n-0000u7-87; Fri, 23 Oct 2020 16:33:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW00i-0000pa-MH
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2020 16:33:50 +0000
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AA81223EA;
 Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603470827;
 bh=BKM7L17mY/AVYbaBekF/DbVRgqrXGbkET0zZgx6V5Lc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ACHRRoOojGyvIszgvI+ucpIl9hmgrFdRnffyViygY61ouLCIkklOJ08lfUqrZ2tOT
 y5s2W0xLg1TfwofyHpkDMud4m8qoY30JIXaftKaYcb9CRabNgler2YqVz5XmoXg6Cy
 CpBxMVEW56BXk5h3ESAzWtBF18hSNmLcSBhzbUCA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kW00f-002Aw5-D2; Fri, 23 Oct 2020 18:33:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 17/56] mtd: rawnand: fix a kernel-doc markup
Date: Fri, 23 Oct 2020 18:33:04 +0200
Message-Id: <9ed47a57d12c40e73a9b01612ee119d39baa6236.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_123348_822274_ACBBA35A 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some identifiers have different names between their prototypes
and the kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/mtd/nand/raw/nand_bbt.c | 2 +-
 include/linux/mtd/rawnand.h     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 344a24fd2ca8..dced32a126d9 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1087,7 +1087,7 @@ static int nand_update_bbt(struct nand_chip *this, loff_t offs)
 }
 
 /**
- * mark_bbt_regions - [GENERIC] mark the bad block table regions
+ * mark_bbt_region - [GENERIC] mark the bad block table regions
  * @this: the NAND device
  * @td: bad block table descriptor
  *
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index aac07940de09..ace1ce70f5e4 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1286,7 +1286,8 @@ static inline bool nand_is_slc(struct nand_chip *chip)
 }
 
 /**
- * Check if the opcode's address should be sent only on the lower 8 bits
+ * nand_opcode_8bits - Check if the opcode's address should be sent only on the
+ *	lower 8 bits
  * @command: opcode to check
  */
 static inline int nand_opcode_8bits(unsigned int command)
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
