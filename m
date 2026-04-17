Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90486F8E4B4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 07:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlDt+hWs6a5VWhvmiCOv/nEgNVF/7UgOF+orvSstxBE=; b=dP/OznaVIQKqTd
	1QYpC1bRU+2Ka11VfEtlFUdWANiYI82tH0ulGYgtkAFsNwJNDZKPxFyOMXn2wUdKtBYefCduo5AVk
	9bQKF8/HnX5RoAGMLwiuuTYZqtLeb2HlKaTbIqoB9aSQ/MRwTPjYed+HSBmiSUzgSC2trJqfhRyJz
	vYudsh8f/Rwg0Ww3nOIVqLVuTvqOH+k3w+Gq9upqk9lc4AU9CPvFx7CByvCkynQbpmheIZSakV1Aq
	ktmxrM0/Z8nRDfuiledpzPNAjAKUr/jxm76PEaBbYHyqq8uTpRZxfxcxHkiGD8kBO9AFWVq+WSP8z
	5CwrvhPZ9U/g8vX+g2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdTB-00000003a3T-1NkX;
	Fri, 17 Apr 2026 07:18:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdT8-00000003a33-0ul4
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 07:18:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so428231a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Apr 2026 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776410305; x=1777015105; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhZKwkDddkG02lE9ffrMMhNbwk/eqif/cLCr1QKCry8=;
        b=pphbt2acs6oRjrAS/tRIFPV0Y08QRLEe7WMl5aypPcSfCSSUacMh1vegAqHaLJsPlB
         Qt5bAC7f+fNDBSHQU83+mQP1TG2Bg0u8AVrh7/KBparjKxhJTE4RcT37JQjDn+tlUdEe
         /1s3qdZfHWgeay4z5S6tPrBc+nYO3bhjmbbgV1UPvNeuq5KNm+MNSOas8gAbiN0Kg5Xx
         AEcg8MTOrjVk9fnI6NuEjHtcN3gG3w4feFdgtdlu0mW4cL4fukjT7W+4BvlUBU1mFeWB
         kUO61R0GZkRoQpXKZ8vHyxszuOrwREm5wcT4/2LDOXRxBQi7jis0i7n04uk4eZyo/6rJ
         MoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410305; x=1777015105;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhZKwkDddkG02lE9ffrMMhNbwk/eqif/cLCr1QKCry8=;
        b=MwNiNGUfQV8DW8qozIwTrhtwC3q4Jp2EF4PRGLvKgwCAYsTP1AXmOOlTrfGDn11tyB
         DHMvrXXxRWqCd4uxGiCjlOo5V0Gbaj1klV51h7h8a/66sje8duAcUeJOPvieLVGmAX3h
         l/qkzQbusI9DdAFMFzy5mi1tRPNrM0+1OG4pfkoQTrX+Yx+LCQ7eVMuTd7ncSVskz2AE
         UdwN+x64lycNcYw449xustKyVgcC4csdJtcP+Ed0OD7PcVdEND241UR8FuXmAUQtn+GK
         2WNRneqqMUMK3oepSar1G/1UN9cWIraCqQ7a/Z5jYqri5KnY50nGe2QhkUlGu3mlx/ib
         XxtA==
X-Gm-Message-State: AOJu0YybDLXK2apNUWfi1HRTWYKMS637gBaUkz45I+pVe99sBuei7Pda
	qMeslmThrPZQk2GMFDOq46Jdw7cEfr3zd4tYDtTPtZgSauv+ZuPD6vDV
X-Gm-Gg: AeBDiet2bqXJsa/hznko8vfhAalKdry3EY+zdgxcFA+wj3jZojR1cJLhawBDgQkVMRQ
	fL21b9W2xC39UiEQQlGbz4cS9ADNR+/XVBMJ2a80IX/jKAE/Hm0YrWUb/PYiS/1VrYTy6A8ulqD
	TkO54yRj9pRSnlumHMyZ+JjBZ327Zh7GxrfWP6DIuAKjLDjlmau5tpKa/baRANR/4+Mz22FQS8g
	Rfzkh7nSzMz87Hp8el2yxU5e2iWAq+iOwoL2uyRCMXIyScKCDbJ7djQ48dPZqFEA7IZPK/4o5Jx
	yfTDz3yJckBKQakt17OoCbH4q/JLDa2r0w8Hw9+3foHkNX71T8JnUmHdROQ5I/Lo4H+TKh1hUlI
	4FXBbVuuIeBc2PiY4WyhJlt5sBQSZNSK+ia/JBHEmYUtd5FA+fJCwj8Iu//HyCk36s0MU6g0Xa7
	02jhyth5nQTVIXi4Z0008v+A48ityvp9rO1v6T45FYBLj8SnfCoZJHOiQZoDNgUz/Nl43cvssPV
	/i25/QVRtBTjtCpFbESSRETrmEGbw==
X-Received: by 2002:a17:90b:3903:b0:35f:b86f:6ae6 with SMTP id 98e67ed59e1d1-3614049332cmr1922742a91.22.1776410304949;
        Fri, 17 Apr 2026 00:18:24 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141975515sm979122a91.15.2026.04.17.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:18:24 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: takahiro.kuwano@infineon.com
Date: Fri, 17 Apr 2026 16:17:15 +0900
Subject: [PATCH v2] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
MIME-Version: 1.0
Message-Id: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
X-B4-Tracking: v=1; b=H4sIAHre4WkC/x2MwQqAIBAFfyX23IJu2aFfiQ6Wz9pLhUIE4b8nH
 Wdg5qWMpMg0Ni8l3Jr1PCpI29C6+2MDa6hMYmQwvR04KBjJZ3DUh9E570RsDIuh2lwJVf+/aS7
 lA7gi53hfAAAA
X-Change-ID: 20260416-die-erase-fix-e35a5221fdb0
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776410300; l=2965;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=/6gzxVb9k3gCr76tL2LHtdUfksZ/2sUJRHx5ao+kSHc=;
 b=oUNE+8CHJQ6zZPc8jLaCnF8rIhrfH2QX0dzSlR+05T1U8iLWVDTNK0BvOL/21NcRFdLVILhUt
 1yJdvfVI3pWCGqJMhLBuJMDHKS94XqqCpdJKc67cY828VgmpIw4bXmh
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_001826_290901_EFD9B6B9 
X-CRM114-Status: GOOD (  13.75  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

NO_OP_CHIP_ERASE flag is no longer used.
Remove definition and references of the flag in core and debugfs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v2:
- Collect R-b from Tudor
- Just drop NO_OP_CHIP_ERASE and leave the rest of bit assignment as is
- Copy to <linux-kernel@vger.kernel.org>
---
 drivers/mtd/spi-nor/core.c    | 3 +--
 drivers/mtd/spi-nor/core.h    | 6 ++++--
 drivers/mtd/spi-nor/debugfs.c | 7 ++-----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e6c1fda61f57..278b3fd0996e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1787,8 +1787,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return ret;
 
 	/* chip (die) erase? */
-	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) ||
-	    multi_die_erase) {
+	if (len == mtd->size || multi_die_erase) {
 		ret = spi_nor_erase_dice(nor, addr, len, die_size);
 		if (ret)
 			goto erase_err;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e838c40a2589..fd9475ca4530 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -121,10 +121,12 @@
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DATA)
 
-/* Keep these in sync with the list in debugfs.c */
+/*
+ * This could contain holes, if adding a new flag use the first free spot.
+ * Keep the flags in sync with the list in debugfs.c
+ */
 enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(0),
-	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
 	SNOR_F_BROKEN_RESET	= BIT(2),
 	SNOR_F_4B_OPCODES	= BIT(3),
 	SNOR_F_HAS_4BAIT	= BIT(4),
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..7505cbab75d6 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -12,7 +12,6 @@
 #define SNOR_F_NAME(name) [ilog2(SNOR_F_##name)] = #name
 static const char *const snor_f_names[] = {
 	SNOR_F_NAME(HAS_SR_TB),
-	SNOR_F_NAME(NO_OP_CHIP_ERASE),
 	SNOR_F_NAME(BROKEN_RESET),
 	SNOR_F_NAME(4B_OPCODES),
 	SNOR_F_NAME(HAS_4BAIT),
@@ -136,10 +135,8 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 		}
 	}
 
-	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
-		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
-	}
+	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
+	seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");

---
base-commit: ed7f4ffeda2d93a97bdfd11f5c9b2d3fe9c3e837
change-id: 20260416-die-erase-fix-e35a5221fdb0

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
