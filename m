Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F723C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 03:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qbpxnop2Boa441cKLD2JcY0yRYz2ENZIi3U1hHNV+wU=; b=r4va1s3ph3mrc2
	+3oTUqPJ5flCc++78v+FyQ7WS0b81SS5UXM3Wf9cnIJcoFCusgiHh2yGzoj5IU5PvpAq64Yr7TNYR
	rv43LQlG0/NXDch7QUS3s4iuWJjcG1RFFFDgTsq5YUt3NaZu+7VwdCWYiwzc0swaUcZXFzALWCfRg
	a3HrDTkuVa4Rb3vtTqXbLIAtfV91cCMlkLREbR4iVN7I2jclUUt/pG7mjqQrH3u/o5hh6gxYxEkTD
	vn+eZ+webHxoh7uvxZI7GARIV8maASiiZYY+N2SSnMRlLiPnWl/AZxkMZAzvr5F2xcE9Can7dJNmh
	OjVEF4y4xD9hZ2M7RU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMLjT-007qBV-2N; Tue, 22 Feb 2022 03:20:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMLjI-007q9H-H8
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 03:20:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id c3so4793783plh.9
 for <linux-mtd@lists.infradead.org>; Mon, 21 Feb 2022 19:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bo6oFnHJAbU/j6h7MDnhNKM3GTAQUQeHdOFA1uJIsUk=;
 b=EDq4SB+mfddJkNzCL9/fiSz1vybCDTColQrt8/RVk3xtwZMlybZx64fyOoDEmqXskF
 44JDspyyREMNADEBbTQ19OHSGxh79/dNXb6l+Ebujg1nt2ZSwZwtnQClQRgWOaQ2IfeG
 0R1lU4alHMG9J6VKJy4dFW4440rYTyHsKh5Yj4vnKcmOt2gYIYyjIjgrYkrZMUfjZPVG
 0evu6LGLPMc9yVvyVpMSmDrhx+7jR0BXTW/asbgpZen2sXuEZo+moIhA8TzG1Wqeqg+H
 UcZ/ZAkZbFKK1JgaenBlQiUop97ggn912xs6QBiGKMseO621NBwuV8KEsbT/EpakB5Bh
 Z72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bo6oFnHJAbU/j6h7MDnhNKM3GTAQUQeHdOFA1uJIsUk=;
 b=bzO+H7XqFsws6mAbdWWM/u4FAUbaDq5wlbUHsJNtYaC/ol2Y2W8Ji/q+7DBCIxcIYF
 SyIA7HbxtZsW9i7UGYAhfTt6B2x9BkiDJxo9NLgRLBKSMCkMm7W5iiWpxPeXskMVNB0i
 tgIKM7MoZMQ2CaENVDmrWRaF2ViZBt6hQ4KIbjXv1Wq9TMOXBNBcXSMsEvFsZ36XrsA7
 Yg9iFDSHIJEgLWGlCS/x70uA2kqNQ39LAwTjbkt6MBwefmFVhxj7RXfkWsg4njWLZhnG
 oVInvE1W13pV3vVJ++Twr431eN4lvaDE+8JKnbzFFL60KCfN31oOaVawVjNmyJd8bIew
 x5gQ==
X-Gm-Message-State: AOAM530SbjLnnsxJGK80ua1DmUh2Ql13CZJL1TbSLjse7uTGVJ3FnwVS
 2x/gALQFnOAv6mIl39vejcZKkmKlY7M=
X-Google-Smtp-Source: ABdhPJy4i4RlzYqweyTHlpPwJmd11zenAaP8eiZmT+eCs5JW/E2Jzh7enjEMTMuPMemNWopbUEZoPw==
X-Received: by 2002:a17:90b:388d:b0:1b9:950c:f08b with SMTP id
 mu13-20020a17090b388d00b001b9950cf08bmr2019553pjb.49.1645500041868; 
 Mon, 21 Feb 2022 19:20:41 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id x12sm19068111pgp.25.2022.02.21.19.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 19:20:41 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: david regan <dregan@mail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH stable 4.14] mtd: rawnand: brcmnand: Fixed incorrect sub-page
 ECC status
Date: Mon, 21 Feb 2022 19:20:23 -0800
Message-Id: <20220222032024.10220-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222032024.10220-1-f.fainelli@gmail.com>
References: <20220222032024.10220-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_192044_634852_0B7D6572 
X-CRM114-Status: GOOD (  17.20  )
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
[florian: make patch apply to 4.14, file was renamed]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index c65724d0c725..0138c0c6a4b9 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
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
