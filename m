Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50922C44524
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2026 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUdMI9SlpWzOQwLQrCvmziU3HvRQAxRfDab98W7Wtc8=; b=0dfPLoK21BkJ+d
	5Rr1/NuiU3VxDsuCY+f6ApofJtH/ffufXAwAL2jaTU40kXEGfxR31kqagN1OTwud1snl+lRH+wHU5
	aHU78SUbKU1iblaoTf1LTbjzou86i1hBkyLv+fRdqGnKXQFtZjo8HRL+/DbIXs5BTwok/B60OWDr5
	fDC2GUe0eVzbL5ikxZZaMp1KoaKV6cqeJNfqFFF92v5A9JnGLarzCAfErSy/qCVO5EMBQg6/Mqfg6
	ili43h+GiF5SrSu1TeFERc/vxk0LPtDOqiInW7KrtHuZ+DhGAVc/8nPqQ3uuOWnfzTmhKjDi532VW
	kInHxgMM+xPy9wI2jgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlG1G-00000004fF3-3zSN;
	Sun, 19 Jul 2026 01:08:38 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlG1E-00000004fE4-2QIW
	for linux-mtd@lists.infradead.org;
	Sun, 19 Jul 2026 01:08:37 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so3342898a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 18 Jul 2026 18:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784423316; x=1785028116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5qdSIBDIbeiuMoqbVIlnag+bM7io+xc2WQjdX5cfZY=;
        b=NkK8FUvX2eGxySzIUW6Ifdai9Wix13CZwgKestzZ+vttM4l9eLR3IRrDzV3Pk3xPwQ
         H1Vg/lY30B3mBpNPJaj0iUBGk17ygXQDpLxuGgRrdVqp5vI2Dww16zZFBzic2qei12zw
         XNiM3I5eYFXFjGdmxe8sSF9KK4JUypQPSGaVm/vMmusWaI+n+0HuapU9/8t9kQwhae9i
         LYxhJJfuzkPC0H1+rDIlQm84LxnU8frNqVEFnqkmtZo9eANfcmX9Ni+cDwQJILtoPSAd
         OV0BfNbIB6BmUCo9jBuSZGwa1RlrDFTFZgp+vZ3yZrXIVtb8yB42rnSf0GdmOL5unZ3F
         jldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784423316; x=1785028116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5qdSIBDIbeiuMoqbVIlnag+bM7io+xc2WQjdX5cfZY=;
        b=FDV7vtCD8EyfjBADs0advkUco4F8/n8S7fVguJpBX3vjLYNfiIkYx7namyFVy1Kcs/
         vm4fwOtkFXgJBud3TcATOnvQQwtNt7awdnTkOldCdUZ5uOQ9YBjzKcJxd2cBWUNEXMbK
         M+O3FPvm/zQ58FcJBpbakQsqvtv/aAhcoJ6uIbvQ+F6WyQqgG2WDePpTOp500tiu9iQf
         /auF7CQ9dlGLtJFLhCey+zBrVU5te6mkDEx0bW6JhlMd6x1msiYLFb+DncIggh5gLlhw
         PTDOuXZneqUPC13OmNMObBbPxtTrqn2VW4hKdw9j3wwM9pzkAxA5aFt0k58os8z6In4d
         dizw==
X-Forwarded-Encrypted: i=1; AHgh+Rqjg+L1bS7MC11F4LTvSWtsw9RaKKNOFVAvib5hOX1T/z4KeBFHadX+vQ/KgJ2ygv5ZTU1aAwi2PUg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3NnX0mJgl2unRbsIZcDBxhrckGMNMmXvQ0LxJmV2zY8irNfcr
	Fa8p4wjGgcPQ9D8Z7hcxd8mqs+LDWJecvaSFPCrpzXlneSCPp8ENo3HZ
X-Gm-Gg: AfdE7cl6iXQ8+SHeORMUFo09aXiifGwrR5gqXfIUeL7ykb0asqIdIgg6/cmcpeg68xm
	oL0g1oP23JgdjDsN6ff25WzEVlGhZKo+sftcHnuek7boBiKu6oIJ639QAbuWuILBIquTDcL058n
	9BoWUEMujX+oM9zWfBzMUCLKmNe87hmJScXHY9Q2K14UyLNZdftgPc+utvO1mtSq/G773Oge1Be
	E8iTXXDtwikximvYo14Y9bj2DZD3N2iH3p1fbbGQQlFBX+RWzX3LOTRZXBHIEhF0baOg3k21Iwh
	PSalGQG/2RXvGRRr6aNOox+KxPIskAmpqPOS0G2fnPL0CGljDYDYzLvGPnhubfOrKOUSFnq2QyK
	UL7wqA0lcdlcm+UMJON8FmGQrRu28T3NzayAXPts2ZWP5FnzBn3ayFaNuCS/SUMZu7wPBkFilM4
	CkAml9GgHPytXBOZKa9DnfBS5M8bMWCAIkrx/uoZQtdHiYjWm2jFa9lW4ttED4Bt5/U+c=
X-Received: by 2002:a05:6a00:451b:b0:848:7459:5f62 with SMTP id d2e1a72fcca58-84c2945a902mr8415573b3a.44.1784423315683;
        Sat, 18 Jul 2026 18:08:35 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9af73sm3446544b3a.53.2026.07.18.18.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:08:35 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: spi-nor: sfdp: check the length of the SCCR map
Date: Sun, 19 Jul 2026 10:08:20 +0900
Message-ID: <20260719010820.1924739-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719010820.1924739-1-sammiee5311@gmail.com>
References: <20260719010820.1924739-1-sammiee5311@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_180836_924339_2A86DD24 
X-CRM114-Status: GOOD (  14.90  )
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

spi_nor_parse_sccr() sizes its bounce buffer from the length the flash
reports in the SFDP parameter header, then reads DWORD22 out of it:

    len = sccr_header->length * sizeof(*dwords);
    dwords = kmalloc(len, GFP_KERNEL);
    ...
    if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
                  dwords[SFDP_DWORD(22)]))

Nothing checks that the table actually has 22 DWORDs.  The length is a
u8 the flash supplies, so a device advertising the SCCR map with a
shorter length makes the read run past the allocation: with a length of
one the buffer is four bytes and dwords[SFDP_DWORD(22)] reads
eighty-four bytes beyond it.  A length of zero is worse, as kmalloc()
then returns ZERO_SIZE_PTR rather than an error and the read of
dwords[SFDP_DWORD(1)] dereferences it.

Reject a table shorter than the highest DWORD the parser reads, the way
spi_nor_parse_4bait() already does with SFDP_4BAIT_DWORD_MAX.  Failing
an optional parameter table is not fatal: spi_nor_parse_sfdp() warns and
carries on with the data gathered so far.

spi_nor_parse_sccr_mc() does not need the same check.  It derives the
number of dice from the length it allocated with, so its highest index
stays inside the buffer, and a length below two leaves its loop empty.

Fixes: 7ab8b810757a ("mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index d3d85b5d1b4a..6c9db103a29a 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1266,6 +1266,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 }
 
 #define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE		BIT(31)
+#define SFDP_SCCR_DWORD_MAX				22
 
 /**
  * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
@@ -1284,6 +1285,9 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	size_t len;
 	int ret;
 
+	if (sccr_header->length < SFDP_SCCR_DWORD_MAX)
+		return -EINVAL;
+
 	len = sccr_header->length * sizeof(*dwords);
 	dwords = kmalloc(len, GFP_KERNEL);
 	if (!dwords)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
