Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAD0FF60F7
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cmY/97acqJHejxscy9K1j2b0UkyzowfInlFsQr2By0o=; b=JZc9WsOuaf9Z0k
	UTL9hfSn8a62ohJqf82ru88GKsaUMd/ix4HeZTSYXIegHLdPWlh/36ThoZz5Edv9T9+ia2PETyW0m
	0B00ND5K0MUcC2ZlGXzldz3eVtsIo4Qkj8+WlC5p8Ff+bG+jb4KPTSN0M/VDIg3VmyeoqAB9TXI/c
	r5qRG+pSnKujhwQg8PvMBYmCjPGCbOk1/dKfbPMVvx94sRzxH3sFVuhsYaUtrlBjFOTx17Jg+KQ2k
	8perguAWf63C5/W8adhcLMmwpUklUQ+w0GluDzfil8p9GTWNpvxVZg7o5SKbLqBehXTI8WkfVRWaz
	NVVstt3ItL4VF3MVBCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VkG-0000000CiaG-346a;
	Tue, 31 Mar 2026 09:50:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VkE-0000000CiZc-1hwS
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 09:50:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8296dabef74so5198435b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 31 Mar 2026 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774950645; x=1775555445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GU/F2QI9q8EVNVojnX0CtcCJf9ZvbWREtW+2yWmBDUg=;
        b=DmROnmk3j5LnH3GHIjIxFmVnnwfaXH1QVOnWPdW9q5f/bUDqeDqzEy04btDQYVAM+9
         IN14yMlaLet+tbg2n+ctCBSrQD5bolnSi02qO/gKJz7pC8JlOEfIQNF9DwrdmLHCshix
         Z5g/DPnG07fURNaPe/tOSFLcCY8J2vAhlN6ffug9USewkHYkoxQWtEOMATkex5YgORgU
         ptvlfq4BYtp5nIkSxtmievBUxcS5oD+N3/RxjPa8zz7fRI0OKje4zJHZtAOFiAab2aMp
         acDUrNBE5/FEfdqM0qWZeFQ5/OT9zSbOmGu7+t5C0AdTw3Ii3o9eUk95tfC+GOOb5NFn
         q1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950645; x=1775555445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU/F2QI9q8EVNVojnX0CtcCJf9ZvbWREtW+2yWmBDUg=;
        b=B2hC11M2R2Lm6oEaMU+VOhdSwA2Km5x9Y19FJTQDs8U3yI686dGWBfcucBRQEDrVNG
         xQ/z//UXdGh2DWvPfYs4eQn2uk1dIGksNG0xVbqNvHwfSpcqAl5aEwBmTH492mq8cmmJ
         9uB1P0ErY0Coea9gZBrEJDIIK2BtgWYvM9EGdcj79NJwT6emwqNB7Sn+hK1AelvT41SJ
         hHKrrthu5cjjRD9wJDAF5cB+R/R2Gk/kwZAnihWb/7jMUhML6mifXrIyKQAdJhAjFNEz
         z91mkZro7QoNyKmy9zDjkWS9phVo4//z1Qyk0Ovdmoab8op/vYlWDWgl5pbZFYktq2uc
         fhHw==
X-Forwarded-Encrypted: i=1; AJvYcCWgpzA7w8/bO8Srf9ICauqk9ckb/75lVs7ZKtALFsriGyq5UFSDpzqtrnz9cQPATAXHGbVL8nc9p9Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbl23GB/iM3re84PMoZaZkL9/bxLV49IEiKagOZeQvq+rTJJ4T
	54f+qOISJTvUo4qMAdZ2HTeHQWn5soVVep3ioQiuIH7USNCfCoG72eBC
X-Gm-Gg: ATEYQzwHavKpxc7rYZySYQXdcB/SiRGUXN90fhxacu0wosHmbX0qxhp0WOxmMme57+J
	fyDimmN+Sd4Sgq6A2tdLdYHb9j5+mczlrjIaHRR6Nd3R494+iAaO02WTb1Wheg5S0XpEvQcFLTM
	4a6kL8oovjsJFEAyFVvCecqj00Qb4iPW9MWQsysUKG2pcgljeMs+J103tmAHo6zbGpc5W8KRA2W
	VHC/NL1zHNzMs4DCb3L8irJX6OR8rzt/QHe8j+D+tgQSIg+L3Z7IWpjee9V46YIuci3FkaEI/Wa
	0c8I1YD+B+o8Ip1Fd6aS9fgVlHDNrV7CYPVFNgb1qjmN5wdfHEiJjNh/ije4J8ivB9XEyTRD5ri
	98IqXVvbLsBqf7BL3sIJ7oTikP4qjzfBL+/NPI/VqEZelWxEB/66h5r18cstO9DElyBGVBrbz/d
	mC2TKY3JIbBomhKoAR1gaQQyAlSkGL3N6wK1RA0Ezd4w==
X-Received: by 2002:a05:6a00:4c9c:b0:82a:7f6b:3fa1 with SMTP id d2e1a72fcca58-82c95ed4602mr15144187b3a.33.1774950645507;
        Tue, 31 Mar 2026 02:50:45 -0700 (PDT)
Received: from f7eceb44c2db ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc6e9sm11279771b3a.46.2026.03.31.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:50:44 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: hd@os-cillation.de,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v5] mtd: spi-nor: Fix SST AAI write mode opcode handling
Date: Tue, 31 Mar 2026 09:50:26 +0000
Message-ID: <20260331095026.38-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_025046_453710_C5C91805 
X-CRM114-Status: GOOD (  18.29  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

When the SPI controller lacks direct mapping support, the fallback path
in spi_nor_spimem_write_data() uses nor->write_proto based operation
template. However, this template uses the standard page program opcode
set during probe, not the AAI opcode required for SST flash.

Additionally, controllers that do support direct mapping will also use
the wrong opcode since the dirmap template is created at probe time
with the standard page program opcode.

Fix this by:
1. Checking the nodirmap flag in spi_nor_spimem_write_data() to ensure
   the code falls through to spi_nor_spimem_exec_op() path which builds
   the operation at runtime with the correct program_opcode.
2. Setting nodirmap=true for SST AAI devices in sst_nor_late_init() to
   disable dirmap and force the runtime opcode path.

This only affects SST devices with SST_WRITE flag. Other SST devices
that use standard page program can still benefit from dirmap.

Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
Changes since v4:
- Disable dirmap for SST AAI devices in sst_nor_late_init() to fix
  the case when controller supports direct mapping (Pratyush)
- Updated commit message and subject to reflect the broader fix

Note: Patch 1/2 from v4 series is already in spi-nor/next.

I don't have hardware to test the new sst.c change. Hendrik, could you
please verify this on your SST25VF032B setup?

 drivers/mtd/spi-nor/core.c |  2 +-
 drivers/mtd/spi-nor/sst.c  | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e6c1fda61f57..2e4b167cab57 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	if (nor->dirmap.wdesc) {
+	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
 		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
 					      op.data.nbytes, op.data.buf.out);
 	} else {
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index db02c14ba16f..cd2f04830a6b 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -267,8 +267,16 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 static int sst_nor_late_init(struct spi_nor *nor)
 {
-	if (nor->info->mfr_flags & SST_WRITE)
+	if (nor->info->mfr_flags & SST_WRITE) {
 		nor->mtd._write = sst_nor_write;
+		/*
+		 * AAI mode requires dynamic opcode changes (BP vs AAI_WP).
+		 * Disable dirmap to ensure spi_nor_spimem_exec_op() uses
+		 * the runtime opcode instead of the dirmap template.
+		 */
+		if (nor->dirmap.wdesc)
+			nor->dirmap.wdesc->nodirmap = true;
+	}
 
 	return 0;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
