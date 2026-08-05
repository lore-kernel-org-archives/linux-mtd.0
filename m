Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE019C55ABA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2nTDnrZovJje5s9x6gQl4jnI6uF6wr/JKfEpT9RC3Eo=; b=2yyf2QmXveYYT5
	vBvOdKwbN0/GCOGaPs7scdi6fHlMkwSmHuN2zPH81I3Bs8YFcqKvBmOQxysrWYS8d90WUKjrWvdGN
	MESM1vzFQJ22zD18jgE4as9PuI4sz++WK2OYDHI7IMWVc3gsPQ9cLrb2SqdLj5faoUUv2t8OJ7MbC
	kz9MJ/7/v1+SHPyVFzbPDjjQ1oybdKWsV+oR6rrGHulVbgg/vM5zk2Ectc1iL6iq5Po01bfO5oefX
	2nPpfeDHpNPGSvfTNYTQdDQoX6657ueloFGrA0P3eS41b0al+6umi9XvY3VDqArnNyTR5dAV79fmr
	Pl3wpyFeAWO94ntZotjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfAJ-00000004Jph-2jOD;
	Wed, 05 Aug 2026 17:12:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfAH-00000004Jp7-1RRo
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 17:12:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1198434b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Aug 2026 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785949944; x=1786554744; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zV1YJBwBh7VFqsi0VhIfkuHjfukVLMdGCKVOgvti+e8=;
        b=bqcOmkE9DXz1b6SOLbVQSQQe15SW0g0GyNJboPmVqnYgHYOeV2+j7coak7h76ZIlcz
         /n96m37SG2p1RNpMbYDVuau7HMige+Ld4zHkVLmK5N/7npqAWj50dn6WdIMKQSUTShvh
         RZ/yH1zmfM+9pSqc1pJP/wJldtfO6YeChOZ1+VmPSTQ1oeh7Z70kaARlgHn56eoITgEp
         P66GbvemFjOIt9wXdO62mne+0XzYgreDyi0/1BRKobHSYfxz0aMaLxgtwTXg/faTGSKf
         +pAInbZc4mJolNe+C1Gd/9N98MWPUDXbJRQ4JdL6dPuOH9t6QMsbPqq2Tw0204rWeJ+R
         uIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785949944; x=1786554744;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zV1YJBwBh7VFqsi0VhIfkuHjfukVLMdGCKVOgvti+e8=;
        b=AkpLXRq16Jb11ykNpf+dNB7nzb2mdEfTLwqBx6eCpb8qGBEWqeOpuRp9Ue0qNiuceO
         ujtIPKjO5BOyDWsSR/hGi+PezWUjw5Mm6fWSHogf1zXg5L0ecYEuTyrTyGxr3pNJI80z
         vdRBlK2RVswdyy+sC/fiJ2XTY2d9PXuHE0Kd1LL3pIh/MGDv4cE8fsgbNttRYbMN8gCP
         kOURlXm1H5DTl4Gejs0xYg5y0aeGPWgWueu/5UbO4huHpb+HCvq0K+Q10Gde+p7WXMLL
         CXeEfDEFGDJAagsdpL0v/urVEUJSgE5TphO/jl23DCrxjeZJmXGeBw11Kai5vKz6KhP5
         k1rA==
X-Forwarded-Encrypted: i=1; AHgh+RrCE/33boy/ALNxEDPtCdJPvIMf536khg2XaNRUfhtb1N6Mo8Bu1pqbyDIOTY5Vwmlhc51Tt4Wzb2w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9LN6uanapFE+HPQuADCJzGxYzFiC07haUPGN07sZe9cZsGRRM
	wRzFXPdVq5IIRMIdBWhonYbMUpVUq5D6tM4HoeC7t9bj+RaWzoRhxkyP
X-Gm-Gg: AR+sD10PTwSmKWpwCzHgMHR7xJgLDmTY2cxi1MVNp0eQEVhKWVGBv59wXXPFyOzAdZq
	PMyA77LPtMMsZXt34ubkOHR3rVZyTAa4PrCMH69DTtQ3FhQqjxJlFl83BcwTifa56Femm41k99E
	bFm+cL1U0Wd9XyufSlfeO3x3j3M3jIVzbzTHf4SiKki2RJPVqd8rjqvyk12CTsXYpVJ5delfsGl
	g6yAHY4455hW6Pwh4uu01mWBR0FKqPX9ya02sVe0aWP9orlgT3YKbjCw8vTjuBAR1uTwqE4Eu2M
	89xmxrWpwmXsz3Yhg2PgNHl2sIuHMR6iPNDRSLsq7L3PoC5lPafXEAj/dXFzz1O8beb3yWRBreG
	r9T9/VPVs/aWGchxTeguPo96WfDY0xVMpjta5Lit/Wz1mVDuLwB4Rnb4a677nn9R1y48N/YTZve
	x9KXLNiv8c5RtVOIxghExg/Qrt4fwMdlyc+SmA3fkgHF33zi+1zKHg5Ik=
X-Received: by 2002:a05:6a00:450b:b0:848:76af:db37 with SMTP id d2e1a72fcca58-84f2e0147e9mr9509161b3a.7.1785949943906;
        Wed, 05 Aug 2026 10:12:23 -0700 (PDT)
Received: from SC-GAME.lan ([104.28.243.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2e06a6sm1222932b3a.15.2026.08.05.10.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:12:22 -0700 (PDT)
From: Chen Minqiang <ptpt52@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH] mtd: spi-nor: allow force unlocking via DT property
Date: Thu,  6 Aug 2026 01:12:14 +0800
Message-Id: <20260805171214.2934-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_101225_382360_27C9E374 
X-CRM114-Status: GOOD (  13.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some SPI NOR flash chips (such as generic or unlisted chips used in vendor
devices like Tenda AX12L Pro) have Block Protection (BP) bits set in the
Status Register by bootloaders or factory settings, locking flash blocks.

Because vendors frequently switch between various generic SPI NOR flash
chips ("Flash Lottery"), it is impractical to upstream explicit chip ID
flags (SNOR_F_HAS_LOCK) for every possible generic chip variant.

This patch introduces support for the "linux,force-sr-unlock" Device Tree
property:
1. In spi_nor_init(), trigger spi_nor_try_unlock_all() if "linux,force-sr-unlock"
   is present in the flash DT node, even when CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE
   is active and the chip is non-volatile.
2. In spi_nor_try_unlock_all(), bypass the SNOR_F_HAS_LOCK flag check when
   "linux,force-sr-unlock" is specified, ensure locking_ops are initialized,
   and invoke Linux kernel's native spi_nor_unlock() mechanism.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 drivers/mtd/spi-nor/swp.c  | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..ef0bdc1254bb 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3332,7 +3332,8 @@ static int spi_nor_init(struct spi_nor *nor)
 	spi_nor_cache_sr_lock_bits(nor, NULL);
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
 	    (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
-	     nor->flags & SNOR_F_SWP_IS_VOLATILE)) {
+	     nor->flags & SNOR_F_SWP_IS_VOLATILE) ||
+	    of_property_read_bool(spi_nor_get_flash_node(nor), "linux,force-sr-unlock")) {
 		spi_nor_try_unlock_all(nor);
 	}
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 235070b215d1..a190d10c1630 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -628,11 +628,16 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, u64 len)
  */
 void spi_nor_try_unlock_all(struct spi_nor *nor)
 {
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	bool force_unlock = of_property_read_bool(np, "linux,force-sr-unlock");
 	int ret;
 
-	if (!(nor->flags & SNOR_F_HAS_LOCK))
+	if (!(nor->flags & SNOR_F_HAS_LOCK) && !force_unlock)
 		return;
 
+	if (!nor->params->locking_ops)
+		spi_nor_init_default_locking_ops(nor);
+
 	dev_dbg(nor->dev, "Unprotecting entire flash array\n");
 
 	ret = spi_nor_unlock(&nor->mtd, 0, nor->params->size);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
