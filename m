Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F64C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 09:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB77D21721
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 09:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XhYKLdvh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="BoFeItFZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB77D21721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vfGNJAjEtSswSLz/xX8qHJ2SFGoqhGxT+YHLxTRj8Oo=; b=XhY
	KLdvhFet+HVG+zU4WXMs3MDqw8S3I57QzDoFKYTqiXY9B0TFsemhnDp0P+lnlj49aK5+akVXGUgMx
	bx1UJwTeVSWUUMBv9nSOj2GNHp0SPryd9i84R+qtwkfo9XbqvM+vcJZfjBoX4bi4yHRUIhLqfuIr+
	6vBHN1zO5IYTpSP1ILFTBkwgeTPop2R+2AHNnH3fwRLO8xj8ge8TSl++fIVsGiP1iDLhmE1bLB51l
	fTPsxHRXCsLyOLz/GP0rsQOrMRcWZZvTQ+1/3V63EVnfEkzroKHne3GA/gxBaP2iHWt58Cqu/ouyG
	Nv4x9fDXADkc7SGtv0HrIgd/vUqayeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grgRq-00042O-G8; Thu, 07 Feb 2019 09:58:22 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgRm-00041W-7W
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 09:58:20 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x179vwEV007618;
 Thu, 7 Feb 2019 18:57:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x179vwEV007618
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549533479;
 bh=iw6uQDkF1w+n1nuxwJnEKZ11rxlAfTizSmtetXPuvzE=;
 h=From:To:Cc:Subject:Date:From;
 b=BoFeItFZaWOYa+ARb66rUQVHzlgBVIkJe69Q1SVtImEfpDPJKKDp2BNu0jEo3Gpq/
 qwch6dfKYrzbw2ZTWMPeQQAFdNpFot13waP4cMHsFz/pueGID3mok/VTMEVGnLgLIb
 IvqF9dYqylY0V4tWjEb6xwzWQFYOl+GxH5kc2FjUHGBfrnJDnTIkxYWrA4TTALbOt3
 FOhPLiY2cOs7L4xK3t7d6xh7e2eUVjCRqEWxLWi7H/XtYWbMXHS4N/1ODxdNAXR47M
 MqlnAc2rwWJo9tsG0M3kai+8Dhv+iXlGalKcHiXG9PiS1IADQs7T+gYrrrkt5ZvtGQ
 z1r2zVPOVCvxw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once again
 after nand_detect
Date: Thu,  7 Feb 2019 18:57:56 +0900
Message-Id: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_015818_617703_1427F1C3 
X-CRM114-Status: GOOD (  10.24  )
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

nand_scan_ident() calls onfi_fill_data_interface() at its entry
to set up the initial timing parameters.

The timing parameters are needed not only for ->setup_data_interface(),
but also for giving the correct delay to NAND_OP_WAIT_RDY, for example.

If the driver sets the NAND_KEEP_TIMINGS flag, or does not support
->setup_data_interface() hook, those parameters will never updated.

Before nand_detect(), we never know whether the chip is ONFi or not.
So, onfi_fill_data_interface() has to assume the worst case, i.e.
non-ONFi.

After nand_detect(), if the chip turns out to be ONFi-compliant,
we can optimize tPROG_max, tBERS_max, etc.

Call onfi_fill_data_interface() once again.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9b3d7ff..35e543c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5040,6 +5040,9 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 
 	nand_deselect_target(chip);
 
+	/* If the chip turns out ONFi, we can optimize timing parameters. */
+	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+
 	/* Check for a chip array */
 	for (i = 1; i < maxchips; i++) {
 		u8 id[2];
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
