Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7834C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 17:53:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB81B64FBD
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 17:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB81B64FBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mailfence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EVA7+RcSAkZtFOb12MYtRbsqQzaaaB6znsPGi/csyW4=; b=J4/cRryktiCwyIE69BalW00GY
	Z5Dme4prqj2TSzQ7oPwQdmWcgGPvlz0lv7wlJ0T5P9+NF18ae8ppT5U0fWLKixMd37pMDrogu005J
	kDv2Xix0R0y6wpxsd1X2OknAKsooMoIujRMcJt5uLNq4YLfC6Ka7uGlF2rJNnaf0PsI6S4luJa4CP
	akpzV4lIB8ezJHrmSN+jNdKYffGZRwmyEikp5Ki/MraMxYsvykqL/KALqQvW8Dy3TkOAsI5V3jH5D
	4cTAuuOVJGWYZZyUY43nQpHjcToBsBG98TwkP2gD7HeYV8P9ppYBUU8kszMBG6EgKfzKWH3QUXEDB
	myZAPB7FA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJgWw-005Cye-LQ; Tue, 09 Mar 2021 17:52:26 +0000
Received: from mail.kapsi.fi ([91.232.154.25])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJgWs-005CyB-Dj
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 17:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GQOVPudyPpdiWlFDjlgAquGYg7Q0o3D51DgHZAYE4OQ=; b=xsSUR/T3F1MHMG/sjDy2SRSDvM
 T55GlB9B0lZIqpZ4PhUwGNZPXfVEgwkWEpVJld7C6B2c1KzBoK55+m+abiAQbGlUTwVSUzgIML+IH
 3CKbB52MCwNqt+dL2w5qni4Rx11wXqJZ9J0SBmNXQEDPp8KfL6+YbZHdNec7DaOsLkbYc8EzM6o0h
 QQ63zaCJ9g2LPyxMCuMN7GI6QsYx6Ntk3yPleNqsYjy3Z6b7wyXwIeCygFpKVYHQeqmOFp9+5H46T
 sbaAg0phisT4LVfbqlmE+nYAI0HdzSwmNH2KQyuQGoXd7UbpKRjfe7jllMhsbsnXZxXOndoTDAxET
 /CTzIKbA==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <sandberg@mailfence.com>)
 id 1lJgWk-0007pT-9i; Tue, 09 Mar 2021 19:52:15 +0200
Received: by ubuntu (sSMTP sendmail emulation); Tue, 09 Mar 2021 19:52:11 +0200
From: Mauri Sandberg <sandberg@mailfence.com>
To: linux-mtd@lists.infradead.org
Cc: vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 Mauri Sandberg <sandberg@mailfence.com>
Subject: [PATCH v2] mtd: cfi_cmdset_0002: AMD chip 0x2201 - write words
Date: Tue,  9 Mar 2021 19:48:59 +0200
Message-Id: <20210309174859.362060-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223170052.963927-1-sandberg@mailfence.com>
References: <20210223170052.963927-1-sandberg@mailfence.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_175222_583946_C3CF4F1F 
X-CRM114-Status: GOOD (  10.95  )
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

Buffer writes do not work with AMD chip 0x2201. The chip in question
is a AMD/Spansion/Cypress Semiconductor S29GL256N and datasheet [1]
talks about writing buffers being possible. While waiting for a neater
solution resort to writing word-sized chunks only.

Without the patch kernel logs will be flooded with entries like below:

jffs2_scan_eraseblock(): End of filesystem marker found at 0x0
jffs2_build_filesystem(): unlocking the mtd device...
done.
jffs2_build_filesystem(): erasing all blocks after the end marker...
MTD do_write_buffer_wait(): software timeout, address:0x01ec000a.
jffs2: Write clean marker to block at 0x01920000 failed: -5
MTD do_write_buffer_wait(): software timeout, address:0x01e2000a.
jffs2: Write clean marker to block at 0x01880000 failed: -5
MTD do_write_buffer_wait(): software timeout, address:0x01e0000a.
jffs2: Write clean marker to block at 0x01860000 failed: -5
MTD do_write_buffer_wait(): software timeout, address:0x01dc000a.
jffs2: Write clean marker to block at 0x01820000 failed: -5
MTD do_write_buffer_wait(): software timeout, address:0x01da000a.
jffs2: Write clean marker to block at 0x01800000 failed: -5
...

Tested on a Buffalo wzr-hp-g300nh running kernel 5.10.16.

[1] https://www.cypress.com/file/219941/download
or  https://datasheetspdf.com/pdf-file/565708/SPANSION/S29GL256N/1

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a1f3e1031c3d..28b6f3583f8a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -272,6 +272,10 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+
+	if ((cfi->mfr == CFI_MFR_AMD) && (cfi->id == 0x2201))
+		return;
+
 	if (cfi->cfiq->BufWriteTimeoutTyp) {
 		pr_debug("Using buffer write method\n");
 		mtd->_write = cfi_amdstd_write_buffers;

base-commit: 5de15b610f785f0e188fefb707f0b19de156968a
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
