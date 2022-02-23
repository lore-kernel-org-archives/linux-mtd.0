Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA4BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5dZ79aS+WhZtS9rMidmGCSg9i842YUQENOJz4zyvds=; b=fchPYNqNJrASFW
	7FPhh+pQAGRdSgFA6E2LKsU+fwMRC5aa23DHpfiOAnV/83GDI+v+oOm4FvtGlsX0/nn7Kr+XQE5GV
	jjKYz0ZGS4AtqjeUU0LPNM7AR8S4fPMYoyC2cr/CvuID6jU/rsCRVbRw5iRiX6z9oL7HFsGyImNW7
	3OZKkkMirs7GrIP3POQb/VkW5eacMro+ZKCl/tn8wOF4GkVHPfVQw/xLcmcNGVrznnpiRTh5t0jRH
	gGEmYM8q4Ubo2xkHGptyJ9VthkSRoVNy4piO6WTPEoHSGjnpE1oqGUVvirfN0oRuPTE/EtCXts34k
	SfcWGK3J/Gn+TLaQYUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvhO-00FYZk-3Q; Wed, 23 Feb 2022 17:45:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvh1-00FYTf-78
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 17:44:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id i6so16029203pfc.9
 for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2022 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=It4RGSp99XFUqiUGEzXdClglbEaTDz0QTVwNHQyEiwQ=;
 b=Y2CbrD5i5hegSugvrCKPHNPj29y8yZMoMRlLD0Wa8YKfeyXV3iIA9/W/w4QhNQCnvb
 nRCsJYfZPlNwk/+TREo0CqyVtZDAIgVRKn3UvyW1YcLtnU8nKtkimcfr2ZI4fJOs7aC3
 hOcltgb26dFihXregXwTYOspYF2buy36P3VCq6mmcWMgXJRI7nqcCKzz9vTIxtWnMbxh
 83OyF+aOj9tIJ706ZuM4kOGuiEoMt41L4DFQAzo7cNJC2cRoDQPuoqB/twJlmojud1wO
 GnMzlmdHQ+DuZGRZr/udfxmNHO28HBEhTM9Mg9vVxTDyQfGBCEX4G03dTEPSSh0pi9+f
 HV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=It4RGSp99XFUqiUGEzXdClglbEaTDz0QTVwNHQyEiwQ=;
 b=mur0qJTOZmqPpO+0gg4NighsFYNfyX1TBHyIJuU53rwTv6YNHxAsIlXBNYpo19iF2i
 Aey5v734hHxt/8nvRlvZOICYS5o4bGpj69NeRSXXElygMWwjggqJKoxidCAER/47aMwJ
 IOWEf1npM1iex1og7moDzchHNWVAR/wuq1tsmycKo138HLm8K/14J1WK8OHlQ3xrW6Bn
 JLG9lJs2vzXhwtG72at54FO+h8Jhpbb1YTv4OqhS9bBfjYcYllgwnf4ZRpEcL//Q/Pxy
 tZii4N507e9Kg1feDgD5FevRA6XUy8+3LNaiYLl3wsocEADZvsHcgSngBlVhNCxv34nQ
 C7Rg==
X-Gm-Message-State: AOAM532CFsxYF1jCHICXowICBuKJmXlFJASj1EGqbQnnq+m1v4Z0OPSr
 jFc8eienAK9Hme3mjYpRbbU=
X-Google-Smtp-Source: ABdhPJw0SEQoMfxCDE2uBJBGJz4DQcbPvWLFTM/332KGvcRXUyWWAaCmjPtmpPPswO+vrYKctJjDPw==
X-Received: by 2002:a63:5945:0:b0:375:799a:281d with SMTP id
 j5-20020a635945000000b00375799a281dmr513413pgm.605.1645638283593; 
 Wed, 23 Feb 2022 09:44:43 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id g18sm127422pfc.108.2022.02.23.09.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 09:44:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, sashal@kernel.org,
 david regan <dregan@mail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND stable 4.9] mtd: rawnand: brcmnand: Fixed incorrect
 sub-page ECC status
Date: Wed, 23 Feb 2022 09:44:31 -0800
Message-Id: <20220223174431.1083-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223174431.1083-1-f.fainelli@gmail.com>
References: <20220223174431.1083-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_094447_294751_0D10365C 
X-CRM114-Status: GOOD (  17.32  )
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
index 40fdc9d267b9..1c8e95cf29d2 100644
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
