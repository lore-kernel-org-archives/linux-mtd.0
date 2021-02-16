Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC58C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 00:39:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE68064DF0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 00:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE68064DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcrQQ7enzYlluosZCIvwJ4bls+6XczsJ0A3lCiLmBA4=; b=f0JO2K0mFf9WR58QndzyTfPfTt
	t6WxFyWxqVmfTrv5cn8qNpqhyyRN6A0gQl9A+PIgRQdiciStOp8vVKU7qD6B+dBzDk5fLxrU1sPxD
	YIXk4DyMPeXEy8YqehZvedl1nzjBkxzIM2VXtfK58UYVwwsJ1f6kkzPoqV2JbQV/nQ+7TsSTu11c2
	EjNLL3AdAm3F92weRJ+vRmyczZ+NvLS6ryCkneP77R0rMeCbHjSKCA1EHn8AeSLUA6kkLaQcqzjs3
	EX0i3lE0/xEjnAYYNnej9/lvXYw4SXEXSM5YhufojCCmF4qCLJ8njpy6Blcx4NLd5+GG1eA/YHVsQ
	VMCbYzoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBoNn-0002Dw-7j; Tue, 16 Feb 2021 00:38:27 +0000
Received: from mo-csw1114.securemx.jp ([210.130.202.156]
 helo=mo-csw.securemx.jp)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBoNi-0002D9-3X
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 00:38:23 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 11G0c839023879;
 Tue, 16 Feb 2021 09:38:08 +0900
X-Iguazu-Qid: 2wGqn5DuWvVM6sYQCW
X-Iguazu-QSIG: v=2; s=0; t=1613435888; q=2wGqn5DuWvVM6sYQCW;
 m=jnHDndSUrFfAQglWXjmb49JJo8sxPyZ3Gev6yI5lHw8=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1110) id 11G0c5PV015544;
 Tue, 16 Feb 2021 09:38:06 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 11G0c5oW005610;
 Tue, 16 Feb 2021 09:38:05 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 11G0c59I026414;
 Tue, 16 Feb 2021 09:38:05 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v1] mtd: nand: Fix BBT update issue
Date: Tue, 16 Feb 2021 09:37:55 +0900
X-TSB-HOP: ON
Message-Id: <b04b128eaca91961597fa9586c7ccaa3934aaa03.1612501067.git.ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613435875-6846-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
References: <1613435875-6846-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_193822_550841_C3F58EA9 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixed issue of manages BBT (Bad Block Table).
It didn't mark correctly when a specific block was bad block.

This issue occurs when the bad block mark (3-bit chunk) is 
crosses over 32 bit (e.g. Block10, Block21...) unit.

Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
---
 drivers/mtd/nand/bbt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index 044adf913854..979c47e61381 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -112,18 +112,20 @@ int nanddev_bbt_set_block_status(struct nand_device *nand, unsigned int entry,
 			     ((entry * bits_per_block) / BITS_PER_LONG);
 	unsigned int offs = (entry * bits_per_block) % BITS_PER_LONG;
 	unsigned long val = status & GENMASK(bits_per_block - 1, 0);
+	unsigned long shift = ((bits_per_block + offs <= BITS_PER_LONG) ?
+					(offs + bits_per_block - 1) : (BITS_PER_LONG - 1));
 
 	if (entry >= nanddev_neraseblocks(nand))
 		return -ERANGE;
 
-	pos[0] &= ~GENMASK(offs + bits_per_block - 1, offs);
+	pos[0] &= ~GENMASK(shift, offs);
 	pos[0] |= val << offs;
 
 	if (bits_per_block + offs > BITS_PER_LONG) {
 		unsigned int rbits = bits_per_block + offs - BITS_PER_LONG;
 
 		pos[1] &= ~GENMASK(rbits - 1, 0);
-		pos[1] |= val >> rbits;
+		pos[1] |= (val >> (BITS_PER_LONG - offs));
 	}
 
 	return 0;
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
