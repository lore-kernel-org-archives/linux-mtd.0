Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7861C77B7A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Shg5e9so0DXANsId9+xzOg4a5l+woAHxEEJRPTdKUqQ=; b=QOWqIq82lzi4nI
	hXp3NN8kCA1L8T7T3LS2qhHSfDp1qYlfaGzDlMQSJ7NohPKz39xOU7xAu2QwUISuiG8Cu6+/tulDh
	E/YwLogyBsUPnhd0vmH2WzwrPEjq3SWgrn0xj4hThGh4aHGp5Q8TdfloCgcKZfvMV1ha1EUgiur54
	dTcFHRTO3WuUwWfkASnVHobnrRZg7/NpKrik0R53NwhJdr558jjvtJ9sGMWBu8I8hL40imbnvth5P
	7Dc+6YjtQoy7eH+kCCrw7YmEPOHQSikG5oodi4Q7/oBDarp5jfJIi+q0V2wWixn7XUXgwLn/8m3ID
	1WM1Z/vubkXljca0NkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5BdA-007rRN-0F;
	Fri, 02 Jun 2023 20:44:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5Bd6-007rQd-2Q
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 20:44:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so3341904e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2023 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685738649; x=1688330649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rd/H5LZeGNsQjBkz2Gf2rkXX/hq9GYqk6eLCuVnnQA=;
        b=nG5UYi/mikn09iRuvFsoU3axTq++gJa9uQGMbbBl2cIRTh/lJ7AIE+T6fD0V1LUUGs
         iptGj/HlY/R67KyYJDwgIL05PLU09MjakPB2FcgV2Rqd2tY9oQV9r+l801jNvsFtHKTO
         gQnYcSxjXMdT/5ePn4G84oS/lp5tX9+EkkqNiH2Me6D3chPGLBG6Ok0kl1YZbes5AvFZ
         J5xaDG/oE4ywJ4+8y+ZsEIgmntDX4SE4IMRDeGuEUu2zSpJXWQEJtyEUcVpoDcr+DVL7
         w302w73B2qsNeCVSj1ra+QuomHhxq+HjNT8eOVmcAujv9LHFPqDj3vdvRMcpoe/7BQ6r
         1kjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685738649; x=1688330649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rd/H5LZeGNsQjBkz2Gf2rkXX/hq9GYqk6eLCuVnnQA=;
        b=g4AJiGjQ2/Lly9JCdpfYyth6HxwQ6NO3dZvbzdiVWRi8LtikY8v2rQssTvYks8cB9i
         oc8CLKyR+dWQiqnvm3MrTw5reyTvaNKGtAJBNzkjxe6G4wrpp5Svw68bTVb5rhnUAhcf
         a52/sRvaOaL1RMgSaINPDr706TAUErwDtAWF5xGocLkt0tr78nWdmS1h+E8hofvbx/Ar
         b9RAUDrcYDZ57bDZLx9haBHWD3ZUuyzN2NfiH4bYyCALV/6IfX8E3z+0xJNZb+5PoiwZ
         dSYIvH6lA4BNHIR1aK2E/7Z1pwJb/QywIT1ac75IrsSTo8ktcpHFK8yGUKEhhNaGJRSQ
         AWfQ==
X-Gm-Message-State: AC+VfDyaYjATtvO3hu4nXVsgGz+fJWs+3oiofTSgoq18gnSwNih2V26o
	j1k236IECEHwnaWIjJzRqwZjdQ==
X-Google-Smtp-Source: ACHHUZ7xcEylBm0OQcCuvh7XXsAb0Db+nkjBoXlqxM3eXd731dBOMKRh0zdbidlqsrt7QJpZMQ7f3g==
X-Received: by 2002:a05:6512:98b:b0:4f5:a17f:4897 with SMTP id w11-20020a056512098b00b004f5a17f4897mr2403404lft.43.1685738648691;
        Fri, 02 Jun 2023 13:44:08 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id o2-20020a056512050200b004f122a378d4sm268473lfb.163.2023.06.02.13.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 13:44:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mtd: cfi_cmdset_0001: Byte swap OTP info
Date: Fri,  2 Jun 2023 22:43:59 +0200
Message-Id: <20230602204359.3493320-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_134412_828601_5D459EF8 
X-CRM114-Status: GOOD (  17.63  )
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

Currently the offset into the device when looking for OTP
bits can go outside of the address of the MTD NOR devices,
and if that memory isn't readable, bad things happen
on the IXP4xx (added prints that illustrate the problem before
the crash):

cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x00000100
ixp4xx_copy_from copy from 0x00000100 to 0xc880dd78
cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x12000000
ixp4xx_copy_from copy from 0x12000000 to 0xc880dd78
8<--- cut here ---
Unable to handle kernel paging request at virtual address db000000
[db000000] *pgd=00000000
(...)

This happens in this case because the IXP4xx is big endian and
the 32- and 16-bit fields in the struct cfi_intelext_otpinfo are not
properly byteswapped. Compare to how the code in read_pri_intelext()
byteswaps the fields in struct cfi_pri_intelext.

Adding a small byte swapping loop for the OTP in read_pri_intelext()
and the crash goes away.

The problem went unnoticed for many years until I enabled
CONFIG_MTD_OTP on the IXP4xx as well, triggering the bug.

Cc: Nicolas Pitre <npitre@baylibre.com>
Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Move the byte swapping to a small loop in read_pri_intelext()
  so all bytes are swapped as we reach cfi_intelext_otp_walk().
ChangeLog v1->v2:
- Drill deeper and discover a big endian compatibility issue.
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9cf..02aaf09d6f5c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -421,9 +421,25 @@ read_pri_intelext(struct map_info *map, __u16 adr)
 		extra_size = 0;
 
 		/* Protection Register info */
-		if (extp->NumProtectionFields)
+		if (extp->NumProtectionFields) {
+			struct cfi_intelext_otpinfo *otp =
+				(struct cfi_intelext_otpinfo *)&extp->extra[0];
+
 			extra_size += (extp->NumProtectionFields - 1) *
-				      sizeof(struct cfi_intelext_otpinfo);
+				sizeof(struct cfi_intelext_otpinfo);
+
+			if (extp_size >= sizeof(*extp) + extra_size) {
+				int i;
+
+				/* Do some byteswapping if necessary */
+				for (i = 0; i < extp->NumProtectionFields - 1; i++) {
+					otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
+					otp->FactGroups = le16_to_cpu(otp->FactGroups);
+					otp->UserGroups = le16_to_cpu(otp->UserGroups);
+					otp++;
+				}
+			}
+		}
 	}
 
 	if (extp->MinorVersion >= '1') {
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
