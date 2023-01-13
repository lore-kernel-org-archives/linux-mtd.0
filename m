Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B7CC54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fzCtqy7Sk3q8ZCa4X55CBClWqOM2x9p2q0Ex4Ql/SrE=; b=0LmSlwRkcp/JWV
	DNV3B4xuDLbNzidar5NFAHNrtcW8ozrGqLXM6qD4HxPxbvd04blteBWcLTImO7KncLeKCPSD1AB88
	KVoh+kSmortO2NolW1+CJ8mplzvpEqhdPmqGYIGkbtumC059784EFxUZepob+VAW7DxKAxZXFbPIm
	cA24ZaaGMl+OyaRV7fMx6c8lAYvLhLkm0izKMTI+aCokXIGyrscJTamk6luUmUDM8ol9xnhOSmkD3
	aeRrzcMMyLrlzY/6XsvliFi9XTjdg1kzPXvwmSst8z59K7LveP2KFDTgccaj5CVMQG4jQqDXfSB8w
	MDklFAGYdtwsHbwUJiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPE8-0049Ow-Rd; Fri, 13 Jan 2023 18:56:32 +0000
Received: from smtp-out-04.comm2000.it ([212.97.32.67])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPE5-0049Ns-B0
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 18:56:31 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-04.comm2000.it (Postfix) with ESMTPSA id 314FABC42B6;
	Fri, 13 Jan 2023 19:46:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1673635560;
	bh=aB/w5pV/Tk7XK1s3B7iV8Oa7IYInFRwkUL7/tsqVzTc=;
	h=From:To:Cc:Subject:Date;
	b=vcOZp8ACh1Q+P8peFgEDmjQvAIOws0p87huER86PxBjE2C0W3pmBT1NUcAkuj2U2h
	 ogsw1T3Ws07LQboD1lDneq8KmM17gt8g98jhe8rfU/TQ3to8tQiVx4gFuRQ5hniKvg
	 PyZ+auXYrpEzojXtiVOKmyRGqLv841m3GuyK8gJc19Lv2rd5+XZsYaEI2iAYcb/X5v
	 8vp7msQnWAnHA8egMcCmfmKgf9LMwlBws6C+WrxrB07HQU1tR3yX988R+oyb+z52ni
	 bogK5Utuztv03/1YOpoWY8kRSKl6mD19xiduciuvWdSk5SO/oxsUymGrPO/6GwBTf4
	 0lh7IQdkWYDbw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] mtd: parsers: ofpart: add workaround for #size-cells 0
Date: Fri, 13 Jan 2023 19:45:56 +0100
Message-Id: <20230113184556.487405-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_105629_539448_74D7F2D1 
X-CRM114-Status: GOOD (  16.29  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a mechanism to handle the case in which partitions are present as
direct child of the nand controller node and #size-cells is set to <0>.

This could happen if the nand-controller node in the DTS is supposed to
have #size-cells set to 0, but for some historical reason/bug it was set
to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
as direct children of the nand-controller defaulting to #size-cells
being to 1.

This prevents a real boot failure on colibri-imx7 that happened during v6.1
development cycles.

Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Miquel, Marek: I do not expect this patch to be backported to stable, however
I would expect that we do not backport nand-controller dts cleanups neither.

v2:
 fixup size-cells only when partitions are direct children of the nand-controller
 completely revised commit message, comments and warning print
 use pr_warn instead of pr_warn_once
 added Reviewed-by Greg
 removed cc:stable@ and fixes tag, since the problematic commit was reverted
---
 drivers/mtd/parsers/ofpart_core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index 192190c42fc8..46559a9248e6 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -122,6 +122,26 @@ static int parse_fixed_partitions(struct mtd_info *master,
 
 		a_cells = of_n_addr_cells(pp);
 		s_cells = of_n_size_cells(pp);
+		if (!dedicated && s_cells == 0) {
+			/*
+			 * This is a hugly workaround to not create
+			 * regression on devices that are still creating
+			 * partitions as direct child of the nand controller.
+			 * This can happen in case the nand controller node has
+			 * #size-cells equal to 0 and the firmware (e.g.
+			 * U-Boot) just add the partitions there assuming
+			 * 32-bit addressing.
+			 *
+			 * If you get this warning your firmware and/or DTS
+			 * should be really fixed.
+			 *
+			 * This is working only for devices smaller than 4GiB.
+			 */
+			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
+				 master->name, pp,
+				 mtd_node);
+			s_cells = 1;
+		}
 		if (len / 4 != a_cells + s_cells) {
 			pr_debug("%s: ofpart partition %pOF (%pOF) error parsing reg property.\n",
 				 master->name, pp,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
