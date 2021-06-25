Return-Path: <SRS0=mYMn=LT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A58EC2B9F4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 12:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1283961923
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 12:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1283961923
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KU/fvwvmXxh9e227pWdJWc8SYYAppgAQFpF2kra3mRk=; b=pgxgRidafl1ReE
	GJUd//2ufIy0/R5P+wubpVjsMFVniiSXOOT8pMLHUuvGI9GKu3mc3bW7hg8/DPe9rah+Ipb8UrhI3
	Ooyzfip6tQSUxzyCQ40f7epIMDqtHMWLdX8JbPq3MglsvvXfYhjWWtcWS2ItieSLYZmRm3OdrhYVs
	t2bRTQ7yENPbJNdpRn7Cz3FC2zwcs/QWXwbx69VXUyHdLbiHxRnBWAdX5ali/sv0T9ExshqqfoJMU
	awkmHw4q2UiiH+zUIBvQmA2ROZHKXDwuQx+757zoNcyMzYPLvHOjEc7fUwfeU+rjyf4Yuv+/WuFho
	ihjCr0wVgZYm7OFAPAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl6L-001UTL-LF; Fri, 25 Jun 2021 12:38:29 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl6H-001UQ4-Pn
 for linux-mtd@lists.infradead.org; Fri, 25 Jun 2021 12:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1624624701; x=1627216701;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5rNdhdXpJ/OcCBy+pGDMiUzxnKn/i2JIsqtlVIR5JxU=;
 b=Je3xqMWYA/RnsU70jBeehli98zJNfC2+CBbqFtvIfm6m8Apo+g18hyS1UyhsyOL/
 bM5tat8REkQX2r/rtk7Qsg7BxbJm2KQzXncGTdp2P6gJmqcle8nCcTsEWlJufnPx
 ZS3KNf/Sjk3CaZPFT6Dso94DSaUIyiLwNf4w3dhFfvs=;
X-AuditID: c39127d2-a9fbd70000001c5e-d3-60d5ce3dcc57
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 84.70.07262.D3EC5D06;
 Fri, 25 Jun 2021 14:38:21 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021062514382171-1041864 ;
 Fri, 25 Jun 2021 14:38:21 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dan Brown <dan_brown@ieee.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: nand_bbt: Skip bad blocks when searching for
 the BBT in NAND
Date: Fri, 25 Jun 2021 14:38:21 +0200
Message-Id: <20210625123821.207458-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 25.06.2021 14:38:21,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.06.2021 14:38:21
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWyRoCBS9f23NUEgysPDCxOnznFZHGkbzOz
 xcSVk5ktHl71t1g1dSeLxadr3YwWl3fNYbPY3bSM3eLh7KuMFofb97FaTN75htHi7/ZNLBb/
 z35gd+D1mLem2mPH3SWMHjtn3WX3mN0xk9Xj6YSDTB6bV2h5bFrVyeaxeUm9x815hR79fw08
 jt/YzuTxeZNcAE8Ul01Kak5mWWqRvl0CV8baC4vZC+bKVrSuOc3YwLhTvIuRg0NCwETiZJ9Q
 FyMXh5DANkaJEw8usUA41xklNhy/xdrFyMnBJmAksWBaIxOILSIQItH//gxYEbPAUWaJ8zcP
 gCWEBaIljmybCNbAIqAqsaxtM5jNK2ArsWDRPmYQW0JAXmLmpe/sEHFBiZMzn4ANkhC4wihx
 5fgHRogiIYnTi8+CNTALaEssW/iaeQIj3ywkPbOQpBYwMq1iFMrNTM5OLcrM1ivIqCxJTdZL
 Sd3ECIyIwxPVL+1g7JvjcYiRiYPxEKMEB7OSCO+jlksJQrwpiZVVqUX58UWlOanFhxilOViU
 xHk38JaECQmkJ5akZqemFqQWwWSZODilGhjXrdA0CyniX1nspi49y/F9D3fgz6I5dvnSwaFN
 z2zVuqemT3+aJXBjRkHMzLZv+6w5Au9vjDz16uub1SdvZElNemabJ7KkYL7SRNm0RX8UyibH
 Pd3usGXv4oKs0PWui4zY/r9acfRlKJOJh4oly+FPEXZ/JzOZ+Seustp+Z0b9G6sX0pFdk34p
 sRRnJBpqMRcVJwIA+Z241HYCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053826_025992_90BB028F 
X-CRM114-Status: GOOD (  22.20  )
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

The blocks containing the bad block table can become bad as well. So
make sure to skip any blocks that are marked bad when searching for the
bad block table.

Otherwise in very rare cases where two BBT blocks wear out it might
happen that an obsolete BBT is used instead of a newer available
version.

This only applies to drivers which make use of a bad block marker in flash.
Other drivers won't be able to identify bad BBT blocks and thus can't skip
these.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---

Hi,

this is the second approach of this patch. The first one [1] unfortunately lead
to boot failures on i.MX 27 boards [2] since the i.MX 27 driver uses the bad
block marker position for the bad block table marker which lead to falsely
identifying all BBT blocks as bad.

This new patch now skips the check for bad BBT blocks if the BBT marker
position in OOB overlaps with the bad block marker position or if a driver
can't use bad block markers in flash at all (NAND_BBT_NO_OOB_BBM or
NAND_NO_BBM_QUIRK are set). This hopefully makes sure we don't break drivers
which cannot check for bad BBT blocks due to the limitations mentioned before.

I was only able to test this patch on a phyCORE-i.MX 6 and a phyCARD-i.MX 27.
Therfore would really appreciate more people testing this to make sure I have
not missed another use case where the bad block marker position in OOB is used
in a different way than for the BBM.

Regards,
Stefan

[1] https://lore.kernel.org/linux-mtd/20210325102337.481172-1-s.riedmueller@phytec.de/
[2] https://lore.kernel.org/linux-mtd/CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com/

 drivers/mtd/nand/raw/nand_bbt.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index dced32a126d9..2a30714350ee 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -447,6 +447,36 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
 	return 0;
 }
 
+/* Check if a potential BBT block is marked as bad */
+static int bbt_block_checkbad(struct nand_chip *this,
+				      struct nand_bbt_descr *td,
+				      loff_t offs, uint8_t *buf)
+{
+	struct nand_bbt_descr *bd = this->badblock_pattern;
+
+	/*
+	 * No need to check for a bad BBT block if the BBM area overlaps with
+	 * the bad block table marker area in OOB since writing a BBM here
+	 * invalidates the bad block table marker anyway.
+	 */
+	if (!(td->options & NAND_BBT_NO_OOB) &&
+	    td->offs >= bd->offs && td->offs < bd->offs + bd->len)
+		return 0;
+
+	/*
+	 * There is no point in checking for a bad block marker if writing
+	 * such marker is not supported
+	 */
+	if (this->bbt_options & NAND_BBT_NO_OOB_BBM ||
+	    this->options & NAND_NO_BBM_QUIRK)
+		return 0;
+
+	if (scan_block_fast(this, bd, offs, buf) > 0)
+		return 1;
+
+	return 0;
+}
+
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
  * @this: NAND chip object
@@ -560,6 +590,10 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 			int actblock = startblock + dir * block;
 			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
+			/* Check if block is marked bad */
+			if (bbt_block_checkbad(this, td, offs, buf))
+				continue;
+
 			/* Read first page */
 			scan_read(this, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
