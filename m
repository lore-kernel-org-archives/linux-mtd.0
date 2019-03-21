Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE51C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 21:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FE0218D4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 21:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PlRw08zQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9FE0218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hFTb1p7nzUPi92s7futwcxSp/IX4Kz9Q+qBM1uSEMwA=; b=PlRw08zQOjmO97
	unMd4cIsKxD5jV4bWW6klC/KHXSjTEkVaxBdWQwKfiEnQpvRItH70nUqLNmTNFBbKr3KmvcjKGfgZ
	eGNF+c8h4dn9Nw8Clg4dlpjAuAZNkJZ3nvTZUvkUZOJ9ffQlzRWU5yxLNTV6jmvdNBASSiZ+kBucn
	Pl1t8EtRtGamw0eTXGTPhasQw7YDW0oDzeyyi38DpqaDTb6nebB3QqQOWa5CRa3MdamEFVfumbjsq
	Sa/6wMefMfA2enSGve2SzXImif657Nel+vB+XrlCGoO1KTCmIA9rX0lm8LSQBg/szEcLmP5Psgyp9
	JkeE0Zi9cNAELaraMDBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7575-0004YE-Ed; Thu, 21 Mar 2019 21:20:35 +0000
Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h756w-0004QF-4t; Thu, 21 Mar 2019 21:20:27 +0000
Received: from localhost.localdomain (pD95EF74E.dip0.t-ipconnect.de
 [217.94.247.78])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 8DE10381860;
 Thu, 21 Mar 2019 21:19:07 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: boris.brezillon@collabora.com
Subject: [PATCH] mtd: rawnand: marvell: select target before setting up data
 interface
Date: Thu, 21 Mar 2019 22:20:10 +0100
Message-Id: <20190321212010.3995-1-daniel@zonque.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_142026_328323_0A1B40E0 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: haojian.zhuang@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com,
 stable@vger.kernel.org, robert.jarzmik@free.fr,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that the nand drivers are responsible for selecting the target
prior to hardware access, a call to marvell_nfc_select_target() is
necessary from marvell_nfc_setup_data_interface().

This is a regression introduced by commit b25251414f6e ("mtd:
rawnand: marvell: Stop implementing ->select_chip()").

Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 84283c6bb0ff..93abe5be8995 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2325,6 +2325,8 @@ static int marvell_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
 	struct marvell_nfc_timings nfc_tmg;
 	int read_delay;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
+
 	sdr = nand_get_sdr_timings(conf);
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
