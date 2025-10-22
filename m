Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE91CCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j75YXzvv8aS7lLFEIgDcMRUNMWmElIdLkxavuJyAaO4=; b=xMowQXPPQbphHx
	s/LhS/+W8rfJwCsgriQQ4sqrS2UJJZvDpfpIwTIddJYfPCWaocCzT3mlnBdItjq34jocviGfyuoeW
	+JvBRyZWQKFeDW8WS+zPO7QkPOMivkOUVztkOuxR/PSSxcUcm0HgBoTayAn0DU4ks4CD/h3Er2Z+P
	hRGwy+XhfqlHsjRqurcrjD44U1SlPA/LTYkz/fNAadOHEqfCxgrGBgq/H8qtXAKm91YlAGA/nLdZd
	MdCFpwUgh3MKtLP9os41eTS5UxZ7JQs537DIYjFcAKqgPtgg+2TUe6+JiyqYv00xUdRjqTg0m9RgF
	P4d73BQvR2CNojMQKR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVlB-00000002PSS-48jG;
	Wed, 22 Oct 2025 10:08:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVl7-00000002POj-2eQQ
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:07:59 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6cdcc27fb8so641856a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761127677; x=1761732477; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhhPNj408J9IsKyB0ngF4mWpHs2Tqp+ApiMYzTxgWxQ=;
        b=QWp5uRA0IYmSp3NWugV2mH/wlcaJVszKoh5dO3ldx2U0yt/ub2WtJZvp1Gi92uJP+b
         1P5JESCqt7iQHL0orml0IeEmVclL132im5JyonLnZzOmw6qkx56NYygs5eCcnXXIze54
         ulrtF5nMxVT5YWjTI8mppWyoXlz8PI1F6o1TDIDGwKCtrI1sMbb8dMvH5BdqzAU4dVJl
         +ZxoEEZYtkDqSoMtNyKg7usooxSRlmE+2iHD8qaboCulAKJP/sUGZvPPzHCrE5MTujBn
         fV0DfmsD+7Mj3kIt1Z2IKgdMG0m/g65dawb8Sp9d9o2vsJJgszZCvL5UszvM6/29SM4M
         DlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127677; x=1761732477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhhPNj408J9IsKyB0ngF4mWpHs2Tqp+ApiMYzTxgWxQ=;
        b=tEdSwpHWW/gG2vw9gkw0Mq/9OA1xIOS2F1+MNOxPpZWrboL8Xx1T8qaeUGUOgLGKtJ
         vjDtHdyylTFqY9rYEclz/DbV36JOmrO56DOiFBckoBd9jrWsF/C5o1DcgvfzK4+CGm0M
         rQPu4AD1GHLyOfm3GlLWFsT6AuN4DgZP89MlXIm7mYfm5ilpmZaZwcCuzeoWIz2siqR4
         OHPt9/M6j/Y0PBN7viVsT/voYLwGih05QpUNZY6nCUvLWQVhigQqUT/q64OewzKEzA5m
         1A++UTIe5tS7klgdhKtLOgV9DKUc3y7qvZUAmOacVa/ZWeAQF3SKLWXNMGy7F5YDomtX
         pdew==
X-Gm-Message-State: AOJu0YzpVlfKVxpJXeGwIl8CW/Ow+82Ny9am4fPl3euWpWCMpUcxt9Vr
	rV49lyWuzz63EYzFVA4OuOJud9aSfZfyFZ406R6Gm1jXeNPWapIwWWGDtDk8/A==
X-Gm-Gg: ASbGncthcYWwnAVqFuiWHuYOXC/vR5HUdGk5D44WLTb7Ev9kq33uR0f+ehyOnmif96a
	rnjjVv4UEwzmXMCZOaTG9/ux3iJEi0SGWL4ptZp2TeGLiBLIivGcVdpJ69zqTpSLE3ArEHPlqil
	stcJu/r8I60HtY6dXlmWOqsxMOAv3qgSunpIb9JWKtJUTpImtuhlqe9sdLjRhdyjCfx/GUvFOEb
	xHy5upBoDjYo1O9Fc/Q0x8UjF5jN0+aMocgUj4fDMYuKqdOmrXkeAGsrd+RlY9JyYKjzF2HnLym
	cSbU4ZNN59t4MiQMY7g/hM3eknllnO5AjMMps1m7QWgltnuPodMRgS/l9q4K1ZR3WjGLw+J5qoC
	hpO/otHpzM9ZmSgILkMG5AvxAxfd7J3vNT6+HWqpom2n5MYJdLPy1blzBkBdiK2imMoqlWjTxUL
	CQUDRrIPbYB+HfepKpDeQRkSBBdc634UF0nJHBr7uvW2z87dxGitoOJJ9V5fcaoOj7qwIHCQujI
	zhbdqo=
X-Google-Smtp-Source: AGHT+IF0dKQMctLSkd4qXSEnXRqPwvQ5TWac1/EzJdBKxCT0QRGMk7vNb6lFW2DDOrk55+uovWre8Q==
X-Received: by 2002:a17:902:f70b:b0:283:c950:a76f with SMTP id d9443c01a7336-290cc2f91d2mr263984515ad.43.1761127676820;
        Wed, 22 Oct 2025 03:07:56 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdd10sm133774585ad.83.2025.10.22.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:07:56 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 22 Oct 2025 19:07:22 +0900
Subject: [PATCH 3/3] mtd: spi-nor: spansion: SMPT fixups for S25FS-S
MIME-Version: 1.0
Message-Id: <20251022-s25fs-s-smpt-fixup-v1-3-ce26d4084b2d@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761127659; l=3010;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=fLuO8IxKB26gg7ELkbxj90c+H+nFUPtNyWO7nnhkCfo=;
 b=bltMHTs5AspF5ecMV3QBvbvqMd8jNFEudmeFnUVLAxuuGrO/QAtbtyiK/3a7pP7nayGZtn3hr
 LMils1Ud7PUCyjP7O8WjupIXPM6w+lk8FcqePY079/f5M5jDtDdf6Fc
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030757_708112_15B6A52D 
X-CRM114-Status: GOOD (  17.53  )
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

S25FS-S family supports SMPT that helps to detect sector layout settings
in configuration registers, but some of parameters in the table are
wrong or undetermined so the fixups below are required.

Read Any Register op is used to read configuration registers that
related to sector map. The op requires 8 cycles latency by default.
Implement smpt_read_dummy() to set correct dummy cycles.

Map ID is structured by combination of CR3NV[3], CR1NV[2], and CR3NV[1].
However, in S25FS512S, CR3NV[1] is RFU and always 0, while map IDs
defined in the table assume it is always 1. Implement smpt_map_id() to
fix map ID for S25FS512S. Other densities in S25FS-S family (256Mb and
128Mb) don't need this fix as CR3NV[1] in those chips is configurable
and map IDs are correctly defined in SMPT.

Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index a0296c871634678be509cb30d26e18debff3066d..89e85eba2c31a4d74dcbfeffdeff7139b6e0f6b1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -785,8 +785,42 @@ s25fs_s_nor_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+static void s25fs_s_nor_smpt_read_dummy(const struct spi_nor *nor,
+					u8 *read_dummy)
+{
+	/*
+	 * The configuration detection dwords in S25FS-S SMPT has 65h as
+	 * command instruction and 'variable' as configuration detection command
+	 * latency. Set 8 dummy cycles as it is factory default for 65h (read
+	 * any register) op.
+	 */
+	*read_dummy = 8;
+}
+
+static void s25fs_s_nor_smpt_map_id_dummy(const struct spi_nor *nor, u8 *map_id)
+{
+	/*
+	 * The S25FS512S chip datasheet rev.O Table 71 on page 153
+	 * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
+	 * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
+	 * device configuration, however according to section 7.5.5.1
+	 * Configuration Register 3 Non-volatile (CR3NV) page 61, the
+	 * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
+	 * 0 on newly manufactured devices, which means 64kiB sectors.
+	 * Since the device does not support 64kiB uniform sectors in
+	 * any configuration, parsing SMPT table cannot find a valid
+	 * sector map entry and fails. Fix this up by setting SMPT
+	 * configuration index bit 0, which is populated exactly by
+	 * the CR3NV bit 1 being 1.
+	 */
+	if (nor->params->size == SZ_64M)
+		*map_id |= BIT(0);
+}
+
 static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
+	.smpt_read_dummy = s25fs_s_nor_smpt_read_dummy,
+	.smpt_map_id = s25fs_s_nor_smpt_map_id_dummy,
 };
 
 static const struct flash_info spansion_nor_parts[] = {

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
