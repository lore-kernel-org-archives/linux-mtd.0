Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7215EC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 05:31:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F392086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 05:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eHZAkbWj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="IqUYVyYC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F392086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CD4zbWr2DIIEZmUtiv1VcAn0EjcWz/iMI1LoyXYb348=; b=eHZ
	AkbWjA+wXFZ1P/fn6NcExDEvxc9UEPoU4YrJ0cInL6hUMIdsBJKRicoFB8udhf2+dVx9GYMc6DWKg
	xezA4OU0tm4sAd4W0Cq+/xrnLfsdJU0CNsn3mBaBHqOPJHARNvWLuZuyIdHwPQrydCi2Fe7BBv3zi
	wVPr7BxcgiKcj94I/ZmOBaBwMaLcSxZzQ5uYSmPdpuP5TSd26VunppWIYkMaaqInT99ALtRmNuJxt
	h9nNcAcl59VzD9pSVAhO3u3ayP5vdQQO4JSd2krp1BWZ/d4HVvHgfT1CM3LIAzsw0xFcAbSDkZaMZ
	qwkecc+rp1hVT8ltIGRYVJxe3LjafDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkMkP-0001Ad-Ls; Fri, 18 Jan 2019 05:31:17 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkMkM-00018y-3L
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 05:31:16 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0I5Uo9J016515;
 Fri, 18 Jan 2019 14:30:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0I5Uo9J016515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1547789451;
 bh=g0IEtR2LdGStw2ATPKCXJNsCFAJuQAUZId86SAXzF9Y=;
 h=From:To:Cc:Subject:Date:From;
 b=IqUYVyYCr2u20fWkbOsEFg9rWXO45lPD/7NZ5UyxX3zUB5d6Wr1rX3dhXZm9TsiaO
 8jLl2EttACDLk+qZkF46YSf9gXnrGhgsNovK6ieRKHlNOJajkP8yNKuiKI4rPdcBc5
 G1mLUyJkzyhTn5E+vKr/3+zDm6GRDR0NrN4wfaiAp5lNjIgp+yMl2ZKonhJDDT0Ram
 18s1YQ8TZfLJonk5R1JZEgaZbU+H08gDnbziyr2mISmqQPaguirWfrLIq6RV9XLFqz
 uBTI0uXOrY5eGLUZaOBHvs9r7g+IIMQx2jrm4GNxuS9YQrnVJK6xvLgUYXkJQalSHh
 K2BHRUocjcj9w==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: denali: get ->setup_data_interface() working
 again
Date: Fri, 18 Jan 2019 14:30:38 +0900
Message-Id: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_213114_371868_FF3CB00F 
X-CRM114-Status: UNSURE (   9.88  )
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
 "linux-stable # v4 . 20" <stable@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to
nand_controller_ops") missed to invert the if-conditonal for denali.
Since then, the Denali NAND driver cannnot invoke setup_data_interface.

Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
Cc: linux-stable <stable@vger.kernel.org> # v4.20
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index eebac35..6e8edc9 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1322,7 +1322,7 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	/* clk rate info is needed for setup_data_interface */
-	if (denali->clk_rate && denali->clk_x_rate)
+	if (!denali->clk_rate || !denali->clk_x_rate)
 		chip->options |= NAND_KEEP_TIMINGS;
 
 	chip->legacy.dummy_controller.ops = &denali_controller_ops;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
