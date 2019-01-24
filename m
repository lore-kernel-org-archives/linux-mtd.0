Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD56DC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 06:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A823421872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 06:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZ7bhKar";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="S1qOoj3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A823421872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ldik1RmVBMyJEHo/aeZBmYPIO6EqnPGLOZwdQ8IBSQ4=; b=gZ7
	bhKarbw5hhxhaJZJw/qYZqVBC9/vYePzFqs8Ga2/WizPg9hk/DusFS4331If/qRcu/6OAY2cME8KT
	6ag4vOHPbmrDCMa3oFzBEJz2AI5efoZ+UJVLJiQ4wXkrXTRiHhWxmNcvkYzbdvl3V8x/xQKzQbs+x
	OTlKk0AvifBfso/6uRRG+8J9gaFZMaB8byn+uXl2LMxK6V3lvrsnFcUp/xvzF3hvDgrBpXAo5qwaH
	eNHdQyFp6x1Adcy6RVXTy76pVkh8PsV/0MlmuxQoakO1dJsQPIrtLTEpLrlMMUAKtr7DOT7WH6j9S
	cpWO75SZBlg7e/p4nV2dOtIBUXrEMmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmYWG-0003P0-WE; Thu, 24 Jan 2019 06:29:45 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmYWC-0003OU-QA
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 06:29:42 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x0O6TKaX018654;
 Thu, 24 Jan 2019 15:29:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x0O6TKaX018654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548311362;
 bh=6vOJEvoHPKepsdMtkw/i+dJMGPvqRMfQMpRi1AK3Oc8=;
 h=From:To:Cc:Subject:Date:From;
 b=S1qOoj3yWeAlPgUaxMV+zMMewXqTAXQnGA0T6ZbiqkeGdfXoAbcTsSE6FyWgyXU7c
 eS+Pke4RLZl8DHfemiEDRUWYTxd9JfcZjfaZAmQ9WAxTv0Vg5s8LViWfw07UaJYYBI
 A/eZi7kUoF362qayilqHSQttj/17hO8KljlXQ3wrjMAJC+URU7maIFozA3LJD2+Zzh
 fn+/65vf61fSRxCEb7/vRQvj38SEnm9zNMF0GUuXwv19W+kiOtJl8NEPEK6qipBU2t
 4fOhDrkIxohEXKJfMN+t03AVO2uMHSW/bmiprILP/X+zwdjfQgN2uNk0JJuk+KEVCp
 FtfX1sckA/ocQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: denali: remove unused dma_addr field from
 denali_nand_info
Date: Thu, 24 Jan 2019 15:28:57 +0900
Message-Id: <1548311337-16851-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_222941_181212_7BC1E8EE 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a leftover of commit 997cde2a2220 ("mtd: nand: denali: skip
driver internal bounce buffer when possible").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index 25c0060..c8c2620 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -304,7 +304,6 @@ struct denali_nand_info {
 	u32 irq_status;			/* interrupts that have happened */
 	int irq;
 	void *buf;			/* for syndrome layout conversion */
-	dma_addr_t dma_addr;
 	int dma_avail;			/* can support DMA? */
 	int devs_per_cs;		/* devices connected in parallel */
 	int oob_skip_bytes;		/* number of bytes reserved for BBM */
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
