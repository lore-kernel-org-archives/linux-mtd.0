Return-Path: <SRS0=zYDc=2E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDA6C43603
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2019 21:10:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02E420866
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2019 21:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wp8qlStb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqR3BInj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02E420866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=o5LrPeOYEoyTomSXUh2ss0+PM0qsV9iDa0Cbmz81BLI=; b=Wp8
	qlStbPgYdkg/2eSnUp5zVintptvIaY1nYTfAdUs2zenz9k+GtT6REjO4vpe0BdpRNMfyRKLQyTalH
	gQyvHgXGUe/QiM93sSZwu32MaT1qbMRytvqsuBfAWfNnm07hrB3L1PSeJDy8x3H4+mGmUJDN8JxuB
	5cot8yxIUnVz4HBuXNTphG1L5Xp8vH0BxPBwVxuWtZFttXW55Wdg7gdpBuZqZyjat3aP+iCXlsvYu
	lCyFrvlD0w4qbtNpqoIcJZg3U7a6JQjr7yBMs5ibvA2QihTYdHfBH1Zcgku/yACqSntSqRFNH9x+Y
	/0sv/m1kf7WOSVbHe9b9T6xsyUtwqpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igEfZ-0001ld-V3; Sat, 14 Dec 2019 21:09:45 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igEfT-0001kk-9c
 for linux-mtd@lists.infradead.org; Sat, 14 Dec 2019 21:09:43 +0000
Received: by mail-lj1-x244.google.com with SMTP id d20so2516115ljc.12
 for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2019 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EQQEq9PTrEL9uBad7QGCPNruaz6IPJiTv99Hu/EpDwA=;
 b=TqR3BInjw/IqJswekxIeRtPW85atl7eHttemwFLOjsc1p6M6IvmN0ZUcclC5MQEjgl
 TcsvPd/dAWMwZPm3JvPw0PjGhyXhqAbyCxR1wjqmg1/8JMgornWJy0V/hdfScF1TWb5N
 1GUKLV4nbTE4px2Bioz3F/gllrAV1Wl2A+3/Ykb1QfBzJL7SOmFfA0avWUZRjYsE52Qr
 isltovE2z9xHXaxNFtmoBWxXdnqm3V3N5vhjf7R/fsB8U69ajWtB0PpiQO0LeUuFpmmK
 pmyJ+W/ybPqYIjAyQ8ZqcxZH47k1tmk1PEfO+gCV9qGj48VPIufxdl9dic4jkAp30hQd
 AWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EQQEq9PTrEL9uBad7QGCPNruaz6IPJiTv99Hu/EpDwA=;
 b=hAZVjv9W9/2qfmomGSQdpbPUw0SzEEc5A4yNT/1a7AqM7eC/+G1Hkj1Vy1SkcsSPaa
 MlDKAottgwCqTsPWV5MnKxMO+SoDC5fuKKQhfSsQ8smquNtfMo30P5RIX6m4qA3wuoyE
 BQcYfXQ5w/wVecQWWM4KB8L2FsaMaWQxODboCd200ZDnemR8mCdvEGv8+rpmORoyqXZT
 Z7Nv2XU4YCk8Nlgi0LyaqrjjEjsjKtc60gjui5tsPyzPrxoMU8bdj9Ia6VvG42DTKdfK
 jHwJMA0KlaanKxiwEjyFxra6NEGqUn3CEzwvtR2iV0/3rDIQcRUa5uvvOZ5J/HIVYp62
 +edg==
X-Gm-Message-State: APjAAAUzAyMhJ+J/ae7+knWnNf+TYNqpToEHt/KBisol+ybXY7rdRx65
 j2PtN8Ica9A+Dv4sy3ognPw=
X-Google-Smtp-Source: APXvYqx1W6X0Gtp+sZynYaCyuFsLfu5ht4rhMlovrmvhkUwUUyQl+pOQjTJA3L9dl/7wSGb33qqyIg==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr13794036ljg.108.1576357775077; 
 Sat, 14 Dec 2019 13:09:35 -0800 (PST)
Received: from ul001888.synapse.com (18-129-132-95.pool.ukrtel.net.
 [95.132.129.18])
 by smtp.gmail.com with ESMTPSA id t81sm6236909lff.25.2019.12.14.13.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2019 13:09:34 -0800 (PST)
From: Vasyl Gomonovych <gomonovych@gmail.com>
To: piotrs@cadence.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH] git commit --signoff -m "mtd: cadence: Fix cast to pointer
 from integer of different size warning
Date: Sat, 14 Dec 2019 22:09:45 +0100
Message-Id: <20191214210946.29922-1-gomonovych@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_130939_335665_3C35D8C0 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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
Cc: Vasyl Gomonovych <gomonovych@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use a cast to uintptr_t and next to a pointer
In the final assignment the same casting in place
memory_pointer = (uintptr_t)mem_ptr;
Fix warning: cast to pointer from integer of different size

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
---
This commit fixes a minor issue with a warning
Not sure if we will have problem here in case of
dma_addr_t which can be 64-bit wide on 32-bit arch

---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 3a36285a8d8a..960c3a0be69c 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1280,8 +1280,8 @@ cadence_nand_cdma_transfer(struct cdns_nand_ctrl *cdns_ctrl, u8 chip_nr,
 	}
 
 	cadence_nand_cdma_desc_prepare(cdns_ctrl, chip_nr, page,
-				       (void *)dma_buf, (void *)dma_ctrl_dat,
-				       ctype);
+				       (void *)(uintptr_t)dma_buf,
+				       (void *)(uintptr_t)dma_ctrl_dat, ctype);
 
 	status = cadence_nand_cdma_send_and_wait(cdns_ctrl, thread_nr);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
