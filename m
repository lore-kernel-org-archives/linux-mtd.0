Return-Path: <SRS0=65ud=5U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97515C2BA16
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Apr 2020 13:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68654206E9
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Apr 2020 13:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfX9m257";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpvEqVHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68654206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LUe/IoHK6anFbz486zFTp4R4gK4LB/gFX1u/+qtEy7s=; b=kfX9m257I8tkbQ
	6Ylmpg9gev2TxZ15NHVECRayQiaOvBL3xd6Bqb6DfqAjeI9KrKlN5qymnNsOVf1omuLNB7JmFWMiN
	CfiuPUzHAmDoZ56RUxYjzfZd7uwWvasisBDyh6G8SXqBOj027gasadtgn4ajJ2vUkekFtwRksfLXd
	pB8pieOUXqktb3LjeW0T16EZqdpTcfa2CfoaE/1YfHh6RBU4EW2nzFYLQz79bVKNzwV+9WcZbPg89
	7g/edHD+xN4sKKhiriilyFX27VCame+yE3C6vLtqhz1z3WOSc4h2ScdZJdi2iwoiLSOIHNtBuXk6y
	8eH81z+QosKpd9nqfq+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKiQq-0007go-7M; Sat, 04 Apr 2020 13:01:52 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKiQl-0007g2-1E
 for linux-mtd@lists.infradead.org; Sat, 04 Apr 2020 13:01:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id w3so3939209plz.5
 for <linux-mtd@lists.infradead.org>; Sat, 04 Apr 2020 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbmGGp28iLBGx2kdu0b3vnWpbi+iqdsV4klADyRej2U=;
 b=lpvEqVHbWsSI/vC2WOlhE5B7pZ591FruvYm+Oo4rRXNnPNDDJGl7teLltiQT5nn7A9
 utndRD33FUc866UH7L4t/z1o3kbnnGYnk+AI2YxgQj7KZTpP9BAtHiD+J+yLf1GDowAL
 9olyw1DeYPBjXWFJ08IPBU9/GGpL1lXJwJE6lioc1H7pFrdEzgK8WJxE2++ab4qj5yFt
 JYjw56zlSnHnbd3WW3BwFp5YWxcXb4whiJv8gFGGwoRiZUaH5uX/az0Naw4sBwNgWIcr
 hu2PH9mBENUleRxtkEjmaE66/XnOOheSx0c9DC1oqqSN0vgAf5zc34uGBd4wDniEngmZ
 F4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbmGGp28iLBGx2kdu0b3vnWpbi+iqdsV4klADyRej2U=;
 b=hyxFWwDxVmJKjfJmh9lNhNh/xM2hNqoG2jBHJZy/uJ3JLemkdDZ0IFHRcRRd4XlpdO
 lsJxx5auGKZI72XjT4/LrYqWxGeJd2rs0/sIQviXOoCXi7sjKTrjQJzlziSx30CvMMBI
 NlJyxe5inM33MtNnU8h534dHbuANBGDUQOYQKhQK5C6rljtRtgzwIXFekBc5Fbzg7yqk
 ug576sgBZN5fMAx0kGc3R1PMRbGLopcBclEEdKpml0hbX7waxi8XjeyFTwcyfuhcI3Vu
 9ya3W8AjbqmnAqSOypNuNkdXPp10uiP3JuY/6mLD6fAsWR6iakXF7h6Sl6tQ5bSCmR4D
 I9eA==
X-Gm-Message-State: AGi0PuYPW8NmJBr3Ptfh3g41hO7rKUH+lgoA9ZGXkJznRFuwPZVlDVm4
 A2ERVF4GhWYIAEPh6+RJwCEaK2aoRXU=
X-Google-Smtp-Source: APiQypJBHHjo3d1FCB1Q3yDGSYQrsi6rcyZpuKwsY/nCpSkBxVSk5JCT19Ua2PZ59lsTY8tBA19OLA==
X-Received: by 2002:a17:90b:4c0e:: with SMTP id
 na14mr15870273pjb.73.1586005304747; 
 Sat, 04 Apr 2020 06:01:44 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:951:6837:3b06:87cd:9fe1:1cd2])
 by smtp.gmail.com with ESMTPSA id b133sm7824814pfb.180.2020.04.04.05.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 06:01:44 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Revert "mtd: spi-nor: Add 4B_OPCODES flag to w25q256"
Date: Sat,  4 Apr 2020 20:58:40 +0800
Message-Id: <20200404125845.1381080-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_060147_101244_E822BEA3 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Robert Marko <robimarko@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This reverts commit 10050a02f7d508fa88f70fcfceefbacd13488ca7.

Winbond W25Q256FV and W25Q256JV both uses 0xef4019 as JEDEC ID,
but only the latter has proper 4B_OPCODES support.
W25Q256FV has all 4B read instructions but it lacks a 4B page program
instruction, causing the entire flash to be read-only.
Disable 4B_OPCODES for W25Q256 completely.
Users can use broken-flash-reset as a temporary workaround.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
"line over 80 characters" warning produced by checkpatch.pl isn't
fixed because I think a revert commit should bring a file back to
what it was before.
I don't have a w25q256jv available and can't compare SFDP table
to create a fix similar to mx25l25635 one.

 drivers/mtd/spi-nor/winbond.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 17deabad57e1..9673ec7fa003 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -52,9 +52,7 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_4B_OPCODES) },
+	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
