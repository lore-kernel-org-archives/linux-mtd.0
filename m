Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6EAC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 03:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EW6qcEue7XPKa/WyF0rMv56jByqhkeGRv72XFVulTtA=; b=VPrkbot4S/16mV
	YGaY50LPhsl9gpu/bRT4RyYu0e91rJ04UNDWVW4MVb2qE5WBWRyovCuyq27jFxUdRqcn/xOP1zc6J
	mCKSbzMENpOGQfGvO5d4CDDPliELKVaBn7/fZ/QDFMn4hmAfrpzuQJ2oXE+99/V64Ms2Bx8ev5j1z
	BBguW7/gPDYEAlgN8JKfToFkwTDk/vMTAjHZ0ct7hvcqXMh5c2Qt8Y1hLY5vONsglvJjTreDuklUv
	tKjnrFaeLX7iNBtKDycZxCvxbbSvuqheg9TzClIeO/exvVJlQW6ZG16jTzQJsX63CT066FX+y+5FI
	nL+qJe/x/WHlwD7VMgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMLjI-007q9I-2N; Tue, 22 Feb 2022 03:20:44 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMLjF-007q8B-IV
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 03:20:43 +0000
Received: by mail-pg1-x529.google.com with SMTP id c1so1134715pgk.11
 for <linux-mtd@lists.infradead.org>; Mon, 21 Feb 2022 19:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfVO0n5bxGhQlU0yKBog2OCZbfoJHnMeC+GhXjg5mv4=;
 b=SH76wCmHAE4xRc5mXtEW+6VYb3V3K1zqQ494/IhTi3jJbNKEvFqAOjhvl6zaS6dexo
 YLbyDtZIEwGpnaCrvizwyDLA4Rqf7zWTg01HzLXJGqQrKWW+kHr6lpukA2KmqfhVy4jN
 OFlLQFJt/I2Iut7OUqHd3dKuTddkZnVACvBzjAb5wRtyom/Fvk9vxEF3qmO8cHvuI0Xf
 YoFv0LjI33Jfa9X8pOM7qA8uPoiA5QoNCgPrahllfKIwN8iZMEJXInPCqAqWiN+9Meq8
 9sk+GQHUJ8zCOUAbQYSxEGOm4RG3kNlkQU7SrRi+BCekHUGX+QTb96Q1aNS82CnkDFfv
 N8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfVO0n5bxGhQlU0yKBog2OCZbfoJHnMeC+GhXjg5mv4=;
 b=1ORfPZTLTN9NPDngP6YM/hGagvEKCEz94vb9v0J796DkR0JjI81preEKCZgCEhdwwW
 HIteM46kh0YgQQqO8Qo5LC7xnJujLOVHBHtRxD/6Q2+0WuL/NSi54/3RZY3I2J6nDb3E
 EV1ADa9nyR2VsOoHoDevMIUYcr1PRCFX9xoW/xlh+omad1+TOgvcXUnqwbeGY7WVH8iZ
 +wFkbgmPD7D+AvzSQ6bOJDjTypFKa96HKwYeEA6llg2fus4yg00K8CvDekrMEon662M/
 mwsenQPQy7kAekFShhAoWp5ApYyVgG4sA2z86W2QmzpxzeF7Yr8CGWGnk2fjRmXoyqza
 6FRQ==
X-Gm-Message-State: AOAM531G+OlEHetPacqPe6q9/ubJsBJyO+LSor9u2ZJ9xPAI+0cQ4vVE
 N5RnOqQW2iNqVdmRBOPb+LbRhBUtnFg=
X-Google-Smtp-Source: ABdhPJxvczvkokFGOaiFlyoYc3FwWVNkDJOfBNWtbgSpyWXBFuLXVkcpbqBoy7Etht8H+XybHJqfQA==
X-Received: by 2002:a05:6a00:1795:b0:4e1:6e1f:5aed with SMTP id
 s21-20020a056a00179500b004e16e1f5aedmr22837139pfg.70.1645500039340; 
 Mon, 21 Feb 2022 19:20:39 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id x12sm19068111pgp.25.2022.02.21.19.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 19:20:38 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: david regan <dregan@mail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH stable 4.19] mtd: rawnand: brcmnand: Fixed incorrect sub-page
 ECC status
Date: Mon, 21 Feb 2022 19:20:22 -0800
Message-Id: <20220222032024.10220-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_192041_634660_4164EE98 
X-CRM114-Status: GOOD (  16.92  )
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

From: david regan <dregan@mail.com>

commit 36415a7964711822e63695ea67fede63979054d9 upstream

The brcmnand driver contains a bug in which if a page (example 2k byte)
is read from the parallel/ONFI NAND and within that page a subpage (512
byte) has correctable errors which is followed by a subpage with
uncorrectable errors, the page read will return the wrong status of
correctable (as opposed to the actual status of uncorrectable.)

The bug is in function brcmnand_read_by_pio where there is a check for
uncorrectable bits which will be preempted if a previous status for
correctable bits is detected.

The fix is to stop checking for bad bits only if we already have a bad
bits status.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: david regan <dregan@mail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/trinity-478e0c09-9134-40e8-8f8c-31c371225eda-1643237024774@3c-app-mailcom-lxa02
[florian: make patch apply to 4.19]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 774ffa9e23f3..2b02f558b5e1 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1637,7 +1637,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 					mtd->oobsize / trans,
 					host->hwcfg.sector_size_1k);
 
-		if (!ret) {
+		if (ret != -EBADMSG) {
 			*err_addr = brcmnand_read_reg(ctrl,
 					BRCMNAND_UNCORR_ADDR) |
 				((u64)(brcmnand_read_reg(ctrl,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
