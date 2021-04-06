Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD42C433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 01:48:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77EBB61382
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 01:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77EBB61382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXjTqIEgMhZZMHoU/iypchAlDw7H/VmXFAQqmpTY0ww=; b=BQye+iqF0Fy/+T2Gap3wczB2ES
	LZi3EcIfqTfPxvQbvgi5gEImeT9sn0SQlhmlsUPIqb41UueaySIxYF0T1wbnZaKF+4yi1xVUN1l4O
	cy3YGCP0H4tlh2vdVmfpQMNpC7QYNGtKdW4yhf3HaJdPp++CEOgirPIqMNq9cwfrB6eI3kPPU1dVL
	bV7SjTh9cNCdt8DmVr1Wc+bNtB7SaHNExlDzxoXpykVRgPiBTeRiJwGe/8aipnv0qKVwPpEBp7h3D
	kgQBpnofBg0oOGoqeYqB1UhHfzZaH3TzkywRpcrd0wPDWJEMj4s5MAS/1S1iowcUZ7Tg6TNctBsVU
	6sYlpSzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTaoR-001Bsy-Ej; Tue, 06 Apr 2021 01:47:28 +0000
Received: from mo-csw1114.securemx.jp ([210.130.202.156]
 helo=mo-csw.securemx.jp)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTaoM-001BsQ-IC
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 01:47:24 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 1361lEZu007326;
 Tue, 6 Apr 2021 10:47:15 +0900
X-Iguazu-Qid: 2wGrVoOlx8DnQbNBFY
X-Iguazu-QSIG: v=2; s=0; t=1617673634; q=2wGrVoOlx8DnQbNBFY;
 m=cxnfJ9M8PQa+u2t3Lsdd5XtJDQNRyDNPmrSjk1uyn14=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1110) id 1361lCF1023749
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 6 Apr 2021 10:47:13 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id B48231000A4;
 Tue,  6 Apr 2021 10:47:12 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 1361lC8k012997;
 Tue, 6 Apr 2021 10:47:12 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Fix corner case in bad block table handling.
Date: Tue,  6 Apr 2021 10:47:08 +0900
X-TSB-HOP: ON
Message-Id: <774a92693f311e7de01e5935e720a179fb1b2468.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
References: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_024723_281362_8D47CF4B 
X-CRM114-Status: GOOD (  13.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: "Doyle, Patrick" <pdoyle@irobot.com>

In the unlikely event that both blocks 10 and 11 are marked as bad (on a
32 bit machine), then the process of marking block 10 as bad stomps on
cached entry for block 11.  There are (of course) other examples.

Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/bbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index 044adf913854..64af6898131d 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -123,7 +123,7 @@ int nanddev_bbt_set_block_status(struct nand_device *nand, unsigned int entry,
 		unsigned int rbits = bits_per_block + offs - BITS_PER_LONG;
 
 		pos[1] &= ~GENMASK(rbits - 1, 0);
-		pos[1] |= val >> rbits;
+		pos[1] |= val >> (bits_per_block - rbits);
 	}
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
