Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A3FC07E9D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 02:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N5fE2XEK9xBZEkAz1PfiZ4j4cejRuQ5RqiV91t9oWuA=; b=iX44aYRGxKW8Wo
	cqhf0T3CcZP2hXD9mRRI4xTSAwNZ+p2yjxD15lDw2efwvz6o6PdOdYX8JwBC7qF0MTGc9HuHPHxZj
	hF/SuF7F2lcmku9s7Upko3FDHffNZoNUyzblnzy45na58jMVS4lRlQbp87IJ0PtMHnElm6MAcLgDQ
	gWtnJwlgCGKAGhda4qtqMzZbyUJ42yjHKXNG12l6NveSEIovsJDlFDmvSO5UUerhzL/JX9aqeY9OX
	ezaBbSNqGwRWx8sVVVVyob2DuCFSyuRdsdmItAu/Vl8kW2w0K66TG/hYawkLRrE2ZyZRdfPxFZeUc
	kjltDZ/YOabART9+wl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0dh-007y86-Ao; Tue, 27 Sep 2022 02:48:05 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0db-007y5N-Bd
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 02:48:01 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 743802C0274;
	Tue, 27 Sep 2022 02:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1664246866;
	bh=rKulz42nZwV2iWZGSRczYGFQgXLRYskFDwJgUbHm7gs=;
	h=From:To:Cc:Subject:Date:From;
	b=r8zHnsA2Xef4GkU1VR1rpxWSgUTc2hhSKGvRCZgKV9pVmPkcjgaMC+gapmCqFnMHM
	 jvL55jbqxJQNrnIhIUD+Q0KPn5K8DgsEflEbzT4vSOImVYWozOoDZsbXJlXpjan5xB
	 x2jw1xuO6cMJMk/ywph09Lwg6LEM+Rf3UyptxvMC/7VNhY+mwH8wcC6Wap1i63Cw6K
	 0eJ3X01lfHULrHh4wisrSfTbx3zDHIvtjCGORpDXO5BAp6+pDSki0Vqd8TjHQwwTNr
	 cad5tlb4r5Cyg0oS1T/y6ijjQTJoK4y5OQAMOkbkuCLkZcCCkNmQYReOTjeem/lH30
	 cRvzJ3Uah9RvA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B633264520000>; Tue, 27 Sep 2022 15:47:46 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 48B9D13EDD7;
	Tue, 27 Sep 2022 15:47:46 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 44CE62A00A4; Tue, 27 Sep 2022 15:47:46 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org
Cc: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] mtd: rawnand: marvell: Use correct logic for nand-keep-config
Date: Tue, 27 Sep 2022 15:47:28 +1300
Message-Id: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=UoQdyN4B c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=xOM3xZuef0cA:10 a=JPI76n4z2mF8gNG91igA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_194759_918039_12046EFA 
X-CRM114-Status: GOOD (  14.59  )
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

From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>

Originally the absence of the marvell,nand-keep-config property caused
the setup_data_interface function to be provided. However when
setup_data_interface was moved into nand_controller_ops the logic was
unintentionally inverted. Update the logic so that only if the
marvell,nand-keep-config property is present the bootloader NAND config
kept.

Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    I think this is a bug that's been lurking for 4 years or so. I'm not
    sure that's particularly long in the life of an embedded device but it
    does make me wonder if there have been other bug reports about it.
    
    We noticed this because we had a bootloader that used maxed out NAND
    timings which made the time it took the kernel to do anything on the
    file system longer than we expected.

 drivers/mtd/nand/raw/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 2455a581fd70..b248c5f657d5 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2672,7 +2672,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	chip->controller = &nfc->controller;
 	nand_set_flash_node(chip, np);
 
-	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
+	if (of_property_read_bool(np, "marvell,nand-keep-config"))
 		chip->options |= NAND_KEEP_TIMINGS;
 
 	mtd = nand_to_mtd(chip);
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
