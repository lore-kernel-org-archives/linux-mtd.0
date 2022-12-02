Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742CBC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IDIzcR63zB2V7yBwVntf0+P1TA8tnivrP8ky21aNUY0=; b=Z+ComE5jBpg3oD
	Ncghw/2MMi6jUSrSalAd+v+S+gjLhrtzO0MqIPmNrdh0YMfEPXQm81I+gxUfpHsanjFr76rKto0NU
	EolEpuBYTSx00Cg4koMH/+jcrL1mV8GTiB5pIvn3fYo2HYxu2rtrWp/AQ+00CXobH4AZ2BT6uj0H4
	4glFCA0yKw8ki5/nLMbMzSTeGOjEMHMjAzML+VetMdZpZJPHuewKtetMZfoQIsMyLBdlWz1K3BVD/
	JNYXFcI8OOccaiJ9+cL6gDSEk/wZXEZZ3Yuz5wEQF9mN5+ENKtItLqnCCLNtBV6kWbWCbeEbp/Hq0
	1HZfDH86La1lRNHBkV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p10Ky-00E7Dj-2l; Fri, 02 Dec 2022 07:19:56 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p10Km-00E76n-Vl; Fri, 02 Dec 2022 07:19:47 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id 07047825DE0;
	Fri,  2 Dec 2022 08:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1669965568;
	bh=LSHnCcahHVzqYgtzt/K/qrr5ftQL6iCGOHe3Sqd3nR0=;
	h=From:To:Cc:Subject:Date;
	b=OxRCz0XuoBOqMQi6+yGGhr8siDQgBbd+v/Tn7QnOndp/GqYZxSIDlHL9skA8oDdYW
	 /7SlrIYdL+lRbHcQK6PzCbPGmoP3WYLtMmrKIaBpqqnPDge9472aKFnFDGpjr9LwK/
	 d5Hq/BI+NyRj33kNilwSKwDKLbisBIGp9JXgYM2N6sSW2TQbTZkyAPZymM7bgQpV9A
	 8RqJk0C2/PbHBWdU2Mr0cZDFBuILShBfe7USRAYwH51FbJgS+T/14AvMI2Xo0TkMZc
	 9ZGfdcutymA/XtjoiddXZuer4wAJNj3m+6FH70MMWJDCxd0NP1HVoBS26KEHyqq0ZK
	 SCXAWFlVPVpRA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Date: Fri,  2 Dec 2022 08:19:00 +0100
Message-Id: <20221202071900.1143950-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_231945_230339_66012C0A 
X-CRM114-Status: GOOD (  13.61  )
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

Add a fallback mechanism to handle the case in which #size-cells is set
to <0>. According to the DT binding the nand controller node should have
set it to 0 and this is not compatible with the legacy way of
specifying partitions directly as child nodes of the nand-controller node.

This fixes a boot failure on colibri-imx7 and potentially other boards.

Cc: stable@vger.kernel.org
Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/mtd/parsers/ofpart_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index 192190c42fc8..aa3b7fa61e50 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -122,6 +122,17 @@ static int parse_fixed_partitions(struct mtd_info *master,
 
 		a_cells = of_n_addr_cells(pp);
 		s_cells = of_n_size_cells(pp);
+		if (s_cells == 0) {
+			/*
+			 * Use #size-cells = <1> for backward compatibility
+			 * in case #size-cells is set to <0> and firmware adds
+			 * OF partitions without setting it.
+			 */
+			pr_warn_once("%s: ofpart partition %pOF (%pOF) #size-cells is <0>, using <1> for backward compatibility.\n",
+				     master->name, pp,
+				     mtd_node);
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
