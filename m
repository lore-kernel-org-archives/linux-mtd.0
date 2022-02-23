Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23E8C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 17:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EW6qcEue7XPKa/WyF0rMv56jByqhkeGRv72XFVulTtA=; b=nFv1JQ8773lr8E
	yXzSB9QfB+9dea5DQY14LHEez+Jj9oHaoZUsfNHihaVs51m2ZiNoTtIeXSXJDGNOdfpfJW1LuQ6re
	LLRH28px4O5EfI/qP3fTvt/onGu1XEh7J+M6pqIyV+cJtSCj7D6c2EsWi9LXFZoXTCKaDBUPg3IU2
	jnhwONu2hs6bToa3Mwqm8vPmMd7npNnoQ7fEtFTz/3yjvyWz50vcCVj4LumOg3OXd3a6grD7TkLsF
	V+gOpZqg1QE3P/n8aNNB+HriJr7i16zqQdXhVD5In4aao0yvd0yjQuR1FJ4pesx64ahiaBdZzaLCt
	Vv07w4PcpCpW42j6im0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvh0-00FYUV-NR; Wed, 23 Feb 2022 17:44:46 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvgx-00FYR0-Cw
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 17:44:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id v4so3414700pjh.2
 for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2022 09:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfVO0n5bxGhQlU0yKBog2OCZbfoJHnMeC+GhXjg5mv4=;
 b=FB50oQpMVTkvBsoC0KbxLE+VZpLrQTlWwFsy7EK9J9qAReHSUwWc6dczvqjrhoXiWW
 hRNu28Fraan9kItEcBg/5xGB6GQMTjssUgAERodNsNe0Fc/JSRSxRlxh8oidw7118F9A
 wz5l+ieHkRQ1Qi7tJoBgVGsUJ3pfayiCr4kPXHyiCh8CzaSR2wkpDlC4G6pze8nfFjY3
 dzt44Pezz2s5tYfy1LgTQmBTYUf9chzIq0x58I2RnqWrkwY6maeZDCvdS3WRdkfuFyeW
 DKXgPhGGph+LUKqLlCJzoHRSfpxKF2I4U8oCJARAbamrTt6bgKhRI0J+xK/DDKUlcZwQ
 aGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RfVO0n5bxGhQlU0yKBog2OCZbfoJHnMeC+GhXjg5mv4=;
 b=EnUZH6pmtWo9UI2F5kfjNBXVY1fKok9Aj/5k0D+TMVF2HB7me/GaLt1wTkIRWTEHLR
 vlB6SJrhC3CXq0oh14zH7vzc22ZmyQG9xsb+0WyQekMIJLnyufw6dWaIyHTWljEgbJ0p
 7++NLO+Kh+9MD/jcdVAnceVkcSh16sAK3Gcpj+7PgRenDM7yy2tWueAP2a0VvgDseSdI
 pvh4TJYPB4KstvKyOxlZbk+4/E5uv06MWTXg18vG9akotwKSskiDdlsY3NzGtHNs1NUH
 nZIr8N/JfCrCwu8O70KlBvK8ooxHyzH4FkPKGiSEjtcE07NASaXinAXrnG5W61DGsg0l
 PCvA==
X-Gm-Message-State: AOAM533tAwYgrarbM/5uMad9TXXoS/wiCYsEv6mQvOtKoEZU/DDd/vMZ
 HSKzK4U/U9NT7jODhBfr88M=
X-Google-Smtp-Source: ABdhPJw2uax1PBCZviYrUXWX3Z3VY8N34gBZnt0PjeFXJifAOgXxCBirlhQDkTPeK64MbaURo4wz8g==
X-Received: by 2002:a17:90a:7788:b0:1bc:6d1:a095 with SMTP id
 v8-20020a17090a778800b001bc06d1a095mr477839pjk.122.1645638277652; 
 Wed, 23 Feb 2022 09:44:37 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id g18sm127422pfc.108.2022.02.23.09.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 09:44:36 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, sashal@kernel.org,
 david regan <dregan@mail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org (open list:BROADCOM STB NAND FLASH DRIVER),
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND stable 4.19] mtd: rawnand: brcmnand: Fixed incorrect
 sub-page ECC status
Date: Wed, 23 Feb 2022 09:44:29 -0800
Message-Id: <20220223174431.1083-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_094443_463952_B357AAF4 
X-CRM114-Status: GOOD (  17.03  )
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
