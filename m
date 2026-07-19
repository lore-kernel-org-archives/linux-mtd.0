Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3456CC4450A
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2026 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyHLGFRsyWHJOTF4Z2Mtq0SB/dCuu55bs9RZRJo1pg8=; b=SEdOP9CbdzUWg/
	KTUJ0SHWCeaP9H8t165ro/Rw7m2IjYuErkLRZzXxeCD9WOrGlqRhQ9TwbNoBz1gOGTJgZvylhjufF
	K0SPanLdyiiahE7vQ6nRWLPQ6Vns+4nCK7zu/gICJ6kMvazoC1sUvBxeDpQ/Y6BcD2hu6ZLic5D9h
	RhxxNNTtZibesjhHCtPzXrkwWMy5LFEsMBThrAP5Bve8f0jcSjKoJ1vjub16jZ0fWLnERTTNbnrc5
	oNNrB3VXJGlzC/jtWidV8F3ARZ4YST4eByOjEIwyGHStYwI6QmS9BCM04ZiYIe3NyooY2b7UrPgV+
	NkzgLOtHY6QP1H6GligQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlG1E-00000004fE2-11EJ;
	Sun, 19 Jul 2026 01:08:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlG1A-00000004fDK-1UxH
	for linux-mtd@lists.infradead.org;
	Sun, 19 Jul 2026 01:08:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8487088510aso9234444b3a.0
        for <linux-mtd@lists.infradead.org>; Sat, 18 Jul 2026 18:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784423311; x=1785028111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NuToQr39obqpD4VdspvFEgg8d1UCcxlVMRw6FO2YI44=;
        b=Fp9YulEhAzEooVrpfPcoCFlUqv0zthCB1RiLPE/NvskQeWrdi2Z0R2BDHROsDXWt+Q
         QyXy+Gi9WxaM8mfLZ6dzrGivE0uqvX9dhcgxjZX7FJcfGxZmYHrYarFGUbRetpwuUZ06
         wm77W/QkCcY/QpauedC9695LBzFW9Q+EFE+hzOC6wFMU/bUhbRpuo2Ci4DM0Q1qYU2UD
         7J686jwjGXWOGKODfPKmv7oHrtyCgby57Tz08ycJCSgmoS5cC7Uck+aUSWhhFMNlBktt
         HbAKkgbCQprsCJG9BT4RvmIl7Q6pAnrbCxJ5PV4aSYf66ZMJzeJQ+myjKHv6ATnQ+zYS
         SL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784423311; x=1785028111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NuToQr39obqpD4VdspvFEgg8d1UCcxlVMRw6FO2YI44=;
        b=LPRhbgMqKW8uxZXHnkr0ZAtk3DI1xT0yQMeKuJ2U4zlgcX4nlTImrw/DflkyNKESvO
         kj2qO6cU4xsSAtSKYV17Jy50QZynPA0WqAdSIEEhRVTA5kOn3mAcAd414II4PXKIAJSS
         kmtp8idBM79uT9y3vWmP+HQY5MeBGBF6P1H2UiMe23N59FT3mxOnaoi8m//senjvfCMo
         EjeUvfXIkAZ2Ghn3FRQgi6Gv/TdTRjzBtrS0O8zfAjR+Rj+LAZLDLqLJKqfMoqBCyJyj
         dSK2qL3//1M7EUnMPLybcxmK69qinRJ22x9G7gyStM3D4/e22EfYGHxd6qXw1teDdSnt
         Ymzg==
X-Forwarded-Encrypted: i=1; AHgh+RrYteVjLE1GXmT+uQ+F1R1/rhyU6eQzh8wKvR39pq00+vxDWOHsFbp5Mfxsf1Z0gUJaOjHiOqbkQnY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0CbLOAeEGCaYr9D4104tq5BJpZhXAvo9fQ4US3qnLBI4YJpRQ
	v1nKWiLSfM/34RFoEfnPUegb2ZYTOudD5x0m29zNZWmDTeGzloBShlmx
X-Gm-Gg: AfdE7clRxNQ1UAYL4HkWjBkYpuiRrOOWPc5J8iQEdEm8hy0hrx/Tkqt74d5fSv+F7Xb
	qhyV7xkS0CUm9x4pFvc8MDc5Q+Iv23cvr+JtfYiy08VG6x225sGMaB6e5aFU4R1l4jrIVgFptjm
	iDV3k4yjDiR2MymHOgIVflLmum70uVxFawoMSqnx6QKgmoSWTwbgBMMlz4PGHMHyyrUaEyGn+MT
	gZMu5tYeTlNVFsEzfHHYUJ87d4/nXmzY929bvfSdYRaAD+hUg/dCLendrYzPRDj62m9kQDBHlAu
	RRml8eOeKBZVlAiltWaAchWDM8z9+QJ88fXI5aQnsHwbEHxRI8eVayEoSWj2WcsnNb0mIAZzfvV
	d19aUV1VV7/5Ifrr4l28WEMs2e1mfTJkuDSuviaEtO3kcvZB3o9I+TW77nf3XuAJ8Su9kiwme3c
	NC/BW2kauHyXD6D0tor0uZ2jfI18YqQF5QY99hLvznsOUAdjaCCNAeDMqlE3m0+ciNywU=
X-Received: by 2002:a05:6a00:f8d:b0:847:94bb:30e2 with SMTP id d2e1a72fcca58-84c294d4bd3mr8627469b3a.41.1784423311283;
        Sat, 18 Jul 2026 18:08:31 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9af73sm3446544b3a.53.2026.07.18.18.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:08:30 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
Date: Sun, 19 Jul 2026 10:08:19 +0900
Message-ID: <20260719010820.1924739-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719010820.1924739-1-sammiee5311@gmail.com>
References: <20260719010820.1924739-1-sammiee5311@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_180832_395471_FB57A7E1 
X-CRM114-Status: GOOD (  15.36  )
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

spi_nor_parse_profile1() sizes its bounce buffer from the length the
flash reports in the SFDP parameter header, then indexes that buffer at
fixed offsets:

    len = profile1_header->length * sizeof(*dwords);
    dwords = kmalloc(len, GFP_KERNEL);
    ...
    dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[SFDP_DWORD(5)]);

The parser reads up to DWORD5, but never checks that the table is that
long.  The length is a u8 the flash supplies, so a device advertising
the table with a shorter length makes the read run past the allocation:
with a length of one the buffer is four bytes and dwords[SFDP_DWORD(5)]
reads sixteen bytes beyond it.  A length of zero is worse, as kmalloc()
then returns ZERO_SIZE_PTR rather than an error and the first access
dereferences it.

The bytes read out of bounds are not just discarded either, they end up
as the dummy cycle count programmed for 8D-8D-8D fast reads.

SFDP tables that do not match what the flash actually implements are
common enough that this file already carries fixup hooks for them, and
malformed SFDP has caused memory-safety bugs here before.  See
commit f0f0cfdc3a02 ("mtd: spi-nor: Fix shift-out-of-bounds in
spi_nor_set_erase_type").

Reject a table shorter than the highest DWORD the parser reads, the way
spi_nor_parse_4bait() already does with SFDP_4BAIT_DWORD_MAX.  Failing
an optional parameter table is not fatal: spi_nor_parse_sfdp() warns and
carries on with the data gathered so far.

Fixes: fb27f198971a ("mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 4600983cb579..d3d85b5d1b4a 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1175,6 +1175,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 #define PROFILE1_DWORD5_DUMMY_166MHZ		GENMASK(31, 27)
 #define PROFILE1_DWORD5_DUMMY_133MHZ		GENMASK(21, 17)
 #define PROFILE1_DWORD5_DUMMY_100MHZ		GENMASK(11, 7)
+#define SFDP_PROFILE1_DWORD_MAX			5
 
 /**
  * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
@@ -1192,6 +1193,9 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	int ret;
 	u8 dummy, opcode;
 
+	if (profile1_header->length < SFDP_PROFILE1_DWORD_MAX)
+		return -EINVAL;
+
 	len = profile1_header->length * sizeof(*dwords);
 	dwords = kmalloc(len, GFP_KERNEL);
 	if (!dwords)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
