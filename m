Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC3CAC592
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Sep 2025 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MMUdhoCaLc1U7qMEhWSS20OYEcSr0ASC36tdLgoBRbg=; b=T8O
	a0SI1dpRFrj5SSAfzVfj22Q/jZ3jGNLWjhymyxxLOqBtZ3BD8eFIvr6JzqdJBdY6cDtrC5k/o7fMA
	XYgmxoqY8zig+w92BflFjYsu3Z/O4SR2bjG0h0aSV+cKpZjOsaJAT8hgcrtwQozPY2Ynry2m6xJOr
	8kxVJRM6rXiJ3U8Hwa8Co6BJUs12CYG7OUMSjk13kOORNtPCfRgTCqdhxi6QQr07J+gHgCuJkaT5Y
	FB+NJhKcVOUGdkLNlPW0Jin7mI/gNVqTMnFkl9orNtXs105N9LFxaSsmS9YiM3MI2NZ8RA1GbXaCa
	6mhEfbKUgJs1weoqTjzXq/R2A3enc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfev-00000003k3V-3imT;
	Fri, 19 Sep 2025 18:16:37 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfeu-00000003k2m-0Ia5
	for linux-mtd@lists.infradead.org;
	Fri, 19 Sep 2025 18:16:37 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-62a3d0ff34aso3139209a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2025 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758305794; x=1758910594; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5mgMxXZc6JsWSisIXu5YKjlUPOflnR0WNH38+RWcea4=;
        b=Mvo6MT7rksHAoWYb4QmCfsGdlTi3IsFGMYuBikdC0b9scjiqNcKoTmTaTEtg2CzPkg
         NVi4bc+hSP7piR3iqDx7CZ8W+rOl9QR+E7jS6l563kw11G1YOyXdwjwD4d8i5SA7dPcX
         5Fay6bP68rAl5AdRZg1rpshvLQSqQ2c8Q4XE0vI2IEjU/YSESldMD3r7QamO3+4HTkXl
         sCkaIxap4msbxmDe41Xg03RXlmgu2WlmGlDF8xFRtSWFmVXNGCFcSMCpRbthQQN4/vfu
         SkjTWOTqy6GTD8l6QPeD5cKxuy3GpoBPJN/iYKFmfGrBljUULQi1RkbAPjP0Uv5Ml8XT
         g35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758305794; x=1758910594;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mgMxXZc6JsWSisIXu5YKjlUPOflnR0WNH38+RWcea4=;
        b=XfOFKwwUCDBD33tnQHe4sgx1k+iHWEgWPGKgZfV/0my5yNDWAl0l1//EWylECwSBaq
         hEWwnAv6MHjVFHl2qIjq9CFVnc+BKl+hsuLCmUV8XF8VMhUXXjub9ynMlfNXTwkQwbLF
         7UfNi76xmE4KIOlxYAnMvZvpyfhFPSCsFXC4VEarH7NXlxO7JBAsn3cbK2mznFhjroTb
         P0ySE1c0Vg0wJQtjqF/tSx7SyGPxEo0+iUjZ37dnpsMNGYBkRNlnPcnoW5NJ7c0/P4HA
         eXa1wt6vOIMzt18gCzhC7YBBTI9IfOyeVqXNUcINuzlkyqlEW20lG4d4B2C9XNZJ6cp8
         LV+g==
X-Forwarded-Encrypted: i=1; AJvYcCWx6RDju/DYpPaNZPZtr6HvRD12UXG0G+sXEPKn23yVU6ioqH3gzrOEl03051ps9pl3w04hNr15xM8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyUivm+pL20VS8rwyZS2TLfCQsDaszDDX+ZhwjVJqt0KJ74AVG
	QN7vPLwN3FXk+jtOWNPVkJJVOiYuwsE3E7Aa6sH3Uueeidnil822nbpsGEIvmOSBw2Q9VpvkDoq
	89+M5pTp/qg==
X-Google-Smtp-Source: AGHT+IFBF9Kq0n5zsV/eYossWIuj1G3yQkDPq2/13B/MTXPtyGtmb7OfIX4VaMq0zKbRqqvGUOTUkbhU52En
X-Received: from edbfi21.prod.google.com ([2002:a05:6402:5515:b0:62f:8b99:d116])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4586:b0:626:1fce:d2f2
 with SMTP id 4fb4d7f45d1cf-62fc0917f14mr3475109a12.16.1758305793785; Fri, 19
 Sep 2025 11:16:33 -0700 (PDT)
Date: Fri, 19 Sep 2025 18:15:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919181547.2172319-1-czapiga@google.com>
Subject: [PATCH v2] mtd: spi-nor: core: Check read CR support
From: Jakub Czapiga <czapiga@google.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Adamczyk <konrada@google.com>, 
	Adeel Arshad <adeel.arshad@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Kornel Duleba <korneld@google.com>, Jakub Czapiga <czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_111636_115524_5C28D172 
X-CRM114-Status: GOOD (  12.10  )
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

Some SPI controllers like Intel's one on the PCI bus do not support
opcode 35h. This opcode is used to read the Configuration Register on
SPI-NOR chips that have 16-bit Status Register configured regardless
of the controller support for it. Adding a check call in the setup step
allows disabling use of the 35h opcode and falling back to the manual
Status Registers management.

Before:
openat(AT_FDCWD, "/dev/mtd0", O_RDWR)   = 4
ioctl(4, MIXER_WRITE(6) or MEMUNLOCK, {start=0, length=0x2000000}) = -1
EOPNOTSUPP

After:
openat(AT_FDCWD, "/dev/mtd0", O_RDWR)   = 4
ioctl(4, MIXER_WRITE(6) or MEMUNLOCK, {start=0, length=0x2000000}) = 0
ioctl(4, MIXER_WRITE(5) or MEMLOCK, {start=0x1800000, length=0x800000}) = 0

Suggested-by: Adeel Arshad <adeel.arshad@intel.com>
Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
Changes since v1:
- Use spi_nor_spimem_setup_op instead of spi_nor_read_cr to test opcode
- Check only for spi-mem devices
- Move check from spi_nor_setup to spi_nor_spimem_adjust_hwcaps

 drivers/mtd/spi-nor/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..0c43fcca3d0a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2318,6 +2318,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 					    &params->page_programs[ppidx]))
 			*hwcaps &= ~BIT(cap);
 	}
+
+	/* Some SPI controllers might not support CR read opcode. */
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		struct spi_mem_op op = SPI_NOR_RDCR_OP(nor->bouncebuf);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		if (spi_nor_spimem_check_op(nor, &op))
+			nor->flags |= SNOR_F_NO_READ_CR;
+	}
 }
 
 /**
-- 
2.51.0.534.gc79095c0ca-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
