Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268F1C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAC3420828
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F2Y0HwX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAC3420828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6dY/3nXV/SACO9D/t/5iXzSOFek1jhNEuWd3HtTftvE=; b=F2Y0HwX8Gep4cs
	xS5+6/y/hqPSO3+ansWASP/fb0R/RN22mtNet2gLG4vTtIIAA3sM8QzmMyDFMVEnZcNAz5LB3U5YX
	wdKDWfHV2Qh3d260ansFtiAFrqluMKvbiEciuoqfrxAm1O4u/3s+4o5FDgA00JbA0rJrFAmMpX8Be
	jkhHyicn6AV/iFCePvki619if4/Vweoy8PQiOvjuoWifYg74+8BERpzbIIxKQcU7DOsVf/RkdHueH
	kB/t5dN3MrtY0TxXEYqe2zMlhASJ1aI2dFgmXfxixRUyNDV+j4MmrSg6qNtY8DPi+ruZEQIU7j8pR
	7e8rp+ZboDW7KzYKuahg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAwYX-0005u1-UG; Mon, 01 Apr 2019 13:00:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAwYU-0005o2-E0
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 13:00:51 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hAwYR-0000Hv-6U; Mon, 01 Apr 2019 15:00:47 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hAwYQ-0005AL-F4; Mon, 01 Apr 2019 15:00:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Do not skip hash checking in data nodes
Date: Mon,  1 Apr 2019 15:00:44 +0200
Message-Id: <20190401130044.19811-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_060050_649787_E21A1642 
X-CRM114-Status: GOOD (  14.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UBIFS bails out early from try_read_node() when it doesn't have to check
the CRC. Still the node hash has to be checked, otherwise wrong data
could be sneaked into the FS. Fix this by not bailing out early and
always checking the node hash.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/tnc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 25572ffea163..ebf8c26f5b22 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -479,14 +479,13 @@ static int try_read_node(const struct ubifs_info *c, void *buf, int type,
 	if (node_len != len)
 		return 0;
 
-	if (type == UBIFS_DATA_NODE && c->no_chk_data_crc && !c->mounting &&
-	    !c->remounting_rw)
-		return 1;
-
-	crc = crc32(UBIFS_CRC32_INIT, buf + 8, node_len - 8);
-	node_crc = le32_to_cpu(ch->crc);
-	if (crc != node_crc)
-		return 0;
+	if (type != UBIFS_DATA_NODE || !c->no_chk_data_crc || c->mounting ||
+	    c->remounting_rw) {
+		crc = crc32(UBIFS_CRC32_INIT, buf + 8, node_len - 8);
+		node_crc = le32_to_cpu(ch->crc);
+		if (crc != node_crc)
+			return 0;
+	}
 
 	err = ubifs_node_check_hash(c, buf, zbr->hash);
 	if (err) {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
