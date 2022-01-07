Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514AFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMgelFg7f7tC1DkhXUDyGL7icMUl8fqfJhS0qfHVdrQ=; b=Q64fE5NuvuFQLh
	MFKnyXxocAhjmTUEV1FC+6CsKmZEsPopZ5JN+0MNMvORaf9wa3kdKFqMmgBUP+/WIL6BR1KrNTMBp
	0wZ3FT1YAHFvXyIp88fzgEMvX2jflooOQHkmPBvYiIfD9Mdahwrl0c+iNqwfRmH8by335Ru0cnKRO
	FYuz8bUxnksY5fJYB1gmr9BJ627pmrW10pUgHhQ3Kizo56GfQ4h2nITDDvKe8X6f/SDlxpzyuSwju
	PcRke0ITna75Q0N+zILYJcfGDBfOylg2KWpAqUzIn/XVvrLFUoDDrORWp2mlxEm79QH+nVW4T8RyA
	dLBbGSchqHH9hexdASPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5cx3-001eJh-PR; Fri, 07 Jan 2022 00:17:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ctb-001dBR-II
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:16 +0000
Received: by mail-pg1-x52c.google.com with SMTP id y9so3965309pgr.11
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SNHpzA6FkPy7IZMV8KM77XcancB04AysWoNYDyPct0=;
 b=JP9sJd36LaI6tlWTPYV3ZZDcnPvpmIW8ju10dauCV4wFKrx+oYVjK1Vg3n703qn0EZ
 MdBllUijLJzXq3CEBDLTaMZTa5WV7C3rkl+Q5UYal4JZiajT/M9woR2rjAx23HQFuuqv
 ADcbGpP4IJIc8ZScXm2GU90D8lTnsC376ceOZgBJ5jLI5NZaqzuSoGpw1z1fj4r8/XuV
 iIwbJVnOpR1S7VvCgwu3t8ZP6+JiFUrXxxDWeM5hPnVWx6qaUf4lhSswo1gz09HiT16v
 IGVU+JFNgxj532d/kpLxXQUU7b8MYG6HlweKRzkuL1fB5FfrPhHiG3pv0+DzQYUU+3rK
 2p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6SNHpzA6FkPy7IZMV8KM77XcancB04AysWoNYDyPct0=;
 b=oCIfTdNypj79y9kxoXBBjmbPBuRPM0+BPjGpXOac3amklJpxOjkxIcjJ/RnOF7rR+Y
 Mob/oCi+YlvQM+8iwvXTpQQaWcdH1iLKRHErlhUr8nzHgqy5OcOqNJkRbl2jGegLFSN+
 QKSRPA/8co+aMTF/ea/mybxPG82cOAVUkTdfCgP5Z/8koC5E9/3cvxZILQ/K9Y3rfZd+
 /o9qNIA4IVldJHJe8MxKQKji14oKZGeW2xA/mjCT/flwJPN7llHYKb2pL4mudp+Fub6d
 Q8+o1YBtbRJSMPkxzFoxqUqJTZSb6BKTM39YhdXGnUrAZS5TEwetraHp43VDxO3s1t6w
 CKfg==
X-Gm-Message-State: AOAM533yUTUtJfNXKyPy1IcVRYp19AYvioy0UBErFX+4XNtNCRLyt7yc
 Izecg5fgu8VrQW+U9BKf+g/6czGjQaE=
X-Google-Smtp-Source: ABdhPJxFvTDquVB7tDgTiBL/lsdMzOHLV9K5SLroi1l0ri57BVl98cr4OCpu5EGippZkIDsDh6Dbbg==
X-Received: by 2002:a65:498e:: with SMTP id r14mr54303628pgs.47.1641514454766; 
 Thu, 06 Jan 2022 16:14:14 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:14 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v2 8/9] mtd: rawnand: brcmnand: BCMA controller uses command
 shift of 0
Date: Thu,  6 Jan 2022 16:13:27 -0800
Message-Id: <20220107001328.2233896-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107001328.2233896-1-f.fainelli@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161415_623029_8FC0E6EF 
X-CRM114-Status: GOOD (  13.00  )
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

For some odd and unexplained reason the BCMA NAND controller, albeit
revision 3.4 uses a command shift of 0 instead of 24 as it should be,
quirk that.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index eab19df152f3..4759303ece7c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -916,6 +916,12 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 
 static inline int brcmnand_cmd_shift(struct brcmnand_controller *ctrl)
 {
+	/* Kludge for the BCMA-based NAND controller which does not actually
+	 * shift the command
+	 */
+	if (ctrl->nand_version == 0x0304 && brcmnand_non_mmio_ops(ctrl))
+		return 0;
+
 	if (ctrl->nand_version < 0x0602)
 		return 24;
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
