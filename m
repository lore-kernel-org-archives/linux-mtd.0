Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C850BC55178
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C922087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e058MGqQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+8pnqnq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C922087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3+yCaZTZdk3xMg/nFPBHQebYkG25HJUnclYqj5Mvsdw=; b=e058MGqQZ9CPy2iN60CN7ttIO
	g0gDKbMSYkVy5fwBNcU76udlZWN31FxijhArji1zD/MRhbm+u2S1S2fwWIReoS0Ezg1FgM8P+EXLp
	FgT6EkLM2rKBTl3XF4ara9+eKG7F4H54SJpxY+ttYhpPvJt9XBoftoTGTkqJXjizwflUBaqVRrTDZ
	CRPcGRsf+xcB9EhbkrPMoaSLCMct1GbPjUv95GyVReziu99ZRdZJJOBXHwvbwwBu/KQMDRDuQWt1m
	493df1lP4e3DPHudFKbHezfGn3jlfpIp7qAShCKs2yMfV9fBPCMbZcaRjIqr+jT5XxTOtYkb+DrWo
	iH6mFzuLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Rb-0003OO-E2; Fri, 06 Nov 2020 21:38:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q6-0002d4-KR
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id w24so138469wmi.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ADB+AAqc36iIolfkYxxVJScxpF6foqJc0x2xHW3DbKM=;
 b=s+8pnqnqeZzO/YvzdMf3SHPtNAs0DYXQIadajMOMBygCqYgl4arX9fKT8xfh9F6FWA
 krlAql03lX1koQn7sL8jA9C0sl0pC+e17S6IIxL7nbfSrHk8Ql62MdPsXSHY0dM5O+et
 fBgi6TmKbskI7PiXbHEJg3W5bCpOwddDKnhlF/SbBX57ZKGgfcvsydtRLXQ592qShBDD
 sz2VAWxxZjlEUVZvR43ToUMC4aBtYGVf6a25J6PjEitmVoNGfcGLnoialDb8y7hlC+YC
 dpiHl9Pjk5OMw+OMprTyJC2oRxOxXoc99gaNlgBtGV17qTMOSVpGAK8wcgafgdHTpDqz
 wG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ADB+AAqc36iIolfkYxxVJScxpF6foqJc0x2xHW3DbKM=;
 b=VRD42GORdyFMW8t1CVvdzYUQ8IXnPxkSE4adZODpe+i3tX0hR+/13j5/NflWbtlYOg
 BgayKX7HgZ5VU3Pe+qb9pvR5w2Y8PXkPLs8AAQrAPaG3yIefXF5Yh2N/VAmC2IpzHzLM
 BMRRD+1H5GWOjFKoaQv7wchIS7Bm9m8qOlmShBjP6r11+c7Z3SW/cqaMB1w0UZfR8sF+
 GWsx8rRwAEsFUXlfUx7hdDtDYcVTV1DOqBBhn/ilK5/mnUWP8gOtoLY3kQ+p5GwV/I19
 hEwrNRCQ5toB2eDmlZphEyacqkyi5wQwv5l8GkR+DI/pOApGg3xvKkTmRKpAijwy+lij
 A0BQ==
X-Gm-Message-State: AOAM532gbnkpEjrTanyAChLx4/TfsWrSXw6w6Q8KwqLoeaxwNvRWeQzV
 AXdjDnvRqqoDtwq3AQdcZuQ1JQ==
X-Google-Smtp-Source: ABdhPJyXxy+XFbtuHwNmCXcpCg9A7LNzjcKMCK9aCbkY8YKlmWfwuKnp+W8UeDGaazEHaL9t1uplvw==
X-Received: by 2002:a1c:8087:: with SMTP id b129mr1617789wmd.10.1604698637166; 
 Fri, 06 Nov 2020 13:37:17 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 13/23] mtd: nand: raw: brcmnand: brcmnand: Demote
 non-conformant kernel-doc headers
Date: Fri,  6 Nov 2020 21:36:45 +0000
Message-Id: <20201106213655.1838861-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163718_763046_80AC6BDC 
X-CRM114-Status: GOOD (  13.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'host' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'addr' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'buf' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'len' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'cmd' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'host' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'desc' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'addr' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'buf' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'len' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'dma_cmd' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'begin' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'end' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'next_desc' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'host' not described in 'brcmnand_dma_run'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'desc' not described in 'brcmnand_dma_run'

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 2da39ab892869..659eaa6f0980c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1846,7 +1846,7 @@ static void brcmnand_write_buf(struct nand_chip *chip, const uint8_t *buf,
 	}
 }
 
-/**
+/*
  *  Kick EDU engine
  */
 static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
@@ -1937,7 +1937,7 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	return ret;
 }
 
-/**
+/*
  * Construct a FLASH_DMA descriptor as part of a linked list. You must know the
  * following ahead of time:
  *  - Is this descriptor the beginning or end of a linked list?
@@ -1970,7 +1970,7 @@ static int brcmnand_fill_dma_desc(struct brcmnand_host *host,
 	return 0;
 }
 
-/**
+/*
  * Kick the FLASH_DMA engine, with a given DMA descriptor
  */
 static void brcmnand_dma_run(struct brcmnand_host *host, dma_addr_t desc)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
