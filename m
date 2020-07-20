Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F31C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:28:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C38207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c36lSmly";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rSbfbGON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C38207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbfrIlxuslFolDVUOi+0JjbbTMctLnGmmsCUphxiJi0=; b=c36lSmlySFOPFyXSmEzIw2az6
	R3S6JETnOHw+AIiNTjseCNYp0qZxaIGa85l0bqNSFey7Xxr5GdYk83lm9XmRly10Qn59K5BG+Llo0
	frIxlthpnpcHMhOG6hzdYZSZ8HVK1bpXfxnXMBXwWpiQOknrMUJJT5gnfTiUOs1SmQoJwNaBH6EOX
	7dlir3X/DJRQx2QqGa0ggIq4D1H8bjU6Gb9mFlTvuUPTOwtTvFk6O0bNKgHmHkeoi1VDYlwpxFTKj
	4ThdiBjFuG0OmPm1PnI5an8g/bIDQrZkzNv8GnxrLoRTsu8C+WDHzwoLssuK6KWf/SG3yJWDXmi/y
	ZGjqkftyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPS-0006MB-M4; Mon, 20 Jul 2020 04:28:14 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPO-0006KT-7F
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219291; x=1626755291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gO9niSwxi/QKNJcD3KZTWAm9gZSdNnnYjdD4I1SXr1s=;
 b=rSbfbGONCTpBsrUWjM72I0YxuHDeKtrfLHKd/9AnZbz3OrgOGApdI7hA
 7gY3AAZ2bnFR3KAfjCEZGKGTacoaPOpJxsuBez3ZY9OSWz6CiBUcJGUQt
 WljDDy97LyUvZZigtS2NNcWl+xvRqn8j/rLaDsIPSKY2VTIFrKnXlt33h
 U5p41/ZKoVY1lFzD1cJpu6naBqFnKBS9z4ZCHQxuwAhV5YWKPC56mPKZK
 nmu/zMtO06ydhf4+oKMCYVjaKwS/O95LHoWc8AnIV2a/ZkDJQHf46r01f
 xDVQbWPBRHHyP5S1i+QXTOWxmyUcdDZJ2rb62L3EBM8+1I+FhOBHoBZmI A==;
IronPort-SDR: GzxKZ0g/NPVzHPGxoiWKNbX3MT/L63QKGcf+Am46JQNI5K8qHFKlz0s8DFtXb6Z+pQnO9amTWi
 yBDd74I1rPKeMeZvNHR79+FIQLvZtE/QQ4aLuhuVfQKyxa09hMfJY/IRcREJjnTVPog7BJVk4w
 A9zFq4kn5OI91c9xQ4N3V6Z/Gy2UeQ7OOE7CijIM/zcQaRoEmhng1/eltsAgiNTUjcGKuiX2N5
 PXwQDbMZxmjcvXKQ2649ybDGmVJHcgwLoaQZ0MhwOddByCIwt0XtvrFlvW5LVdtdOxLVrPsXgj
 p5Q=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="83812055"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:28:09 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:31 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 2/6] mtd: rawnand: atmel: Drop redundant nand_read_page_op()
Date: Mon, 20 Jul 2020 07:27:55 +0300
Message-ID: <20200720042759.1482341-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002810_462201_F8D8501B 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

The legacy page read path in atmel_hsmc_nand_pmecc_read_pg() issues
a nand_read_page_op() that's already issued by
atmel_nand_pmecc_read_pg(). Let's get rid of the unneeded one.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e85652512daa..f738c4bfbd77 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -983,12 +983,9 @@ static int atmel_hsmc_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 	 * connected to a native SoC R/B pin. If that's not the case, fallback
 	 * to the non-optimized one.
 	 */
-	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB) {
-		nand_read_page_op(chip, page, 0, NULL, 0);
-
+	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB)
 		return atmel_nand_pmecc_read_pg(chip, buf, oob_required, page,
 						raw);
-	}
 
 	nc->op.cmds[nc->op.ncmds++] = NAND_CMD_READ0;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
