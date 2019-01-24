Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C7C282C5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 04:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835B621872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 04:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ieMm0maF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="IOu+DuXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835B621872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=92Gj8Gvhq010pNlQbRih/cpqji5N+2ABlhAtJN4bj4g=; b=ieMm0maFRnoGNibWhQaKCjt0PT
	sIh8XIfBYsvD7vltMpozLV2PtFy+eirZulNqXldKcT/9xFizUsin6GI83kAcD/6I2xMjDXqs8EOmh
	6+ThwNWjpDB0xkUOyHw7prsuEkphFReGUaq5NPRQBS/NSJU9K6/K7+yttbI9IEukyvknH3hxTkCv4
	cllMllvw6DbshRnIQ/fXCxBCJ938MnLJx48RFXcueaucuwIs0U9fpg3qbeuzZFHqm7hlT2SOjLR0K
	03xqdnYleYQDuK/tIl5vNY0tc7WabI9aBQK8s2WQFddBm8YsOWRtTHo50dWKW7skbwsy+dZg4wR44
	RVrAJQEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmWV0-0001iM-L3; Thu, 24 Jan 2019 04:20:18 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmWUj-0000Ji-6d
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 04:20:03 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0O4JI05030691;
 Thu, 24 Jan 2019 13:19:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0O4JI05030691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548303560;
 bh=w3624K2641LQxTT4qz9JU+SrCJSBx2DTYxNESgK5qvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOu+DuXZ2M2YrlQcxPyvRQYhAn8T4J4dWoP0+4yAu8y8ttp2KoUKXj5lfJp74IWFW
 3yEcP8YQKDdpDyznxIITlXi3uZiHzt/Icz5Iet5AkvXCByywdh1ycKPUFL2P+rKbMV
 UfJy8vPon/fKFKJKMHmHFvuWHV9JrmZISzkFEEXIVjP9gTl8bicPNDtSCkJzVPcJH3
 MZbbgkVGqr/emiRZqxM2YhkZLCtvBtWWRjG/ITRFKJmmZ4t4c23mMVZ6HeydSTjUYW
 /f+NQHW/2IyoPsZquqHrLVjCbhx0F+tMg6CWf5Svga1be/S6Vqw65fC7jqherSa8RE
 cnAOFjvcfUyWQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: rawnand: denali: remove unneeded denali_reset_irq()
 call
Date: Thu, 24 Jan 2019 13:19:06 +0900
Message-Id: <1548303547-21156-2-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_202001_708037_FB1782F4 
X-CRM114-Status: UNSURE (   9.32  )
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

This code was added by commit 26d266e10e5e ("mtd: nand: denali: fix
raw and oob accessors for syndrome page layout"), but I do not see
sensible reason.

The IRQ flags are correctly reset by denali_cmd_ctrl(), so this code
is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 21320b1..6775644 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -751,9 +751,6 @@ static int denali_read_oob(struct nand_chip *chip, int page)
 static int denali_write_oob(struct nand_chip *chip, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-
-	denali_reset_irq(denali);
 
 	denali_oob_xfer(mtd, chip, page, 1);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
