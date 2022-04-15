Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C868C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 03:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wN9R8UDB8+hgeHXmq8J3nx/DJDa4lJ1Npi2LvFIhKDE=; b=O3rUCB5dWrt7cR
	cw2drP78bzb7USQ338BpEJBHmM8T8jjRBL2WjBlwNFCXzYBCZs0SgimYkrlFavM6kKbTh6Xd3GpKh
	mvjiEc21EcC533Cf/x0xpJps3Rzyti/rm+Ixyv2ysG7HAsqzQnEq7Y8z1Noh8PKrWC1WF2QRBTcWV
	iEI316oiCdQfG+io0V+cAJ0i0Ofl6PpPruYvrFPRQF+yp8y0iINNjUEW6+mUi8w8HhuBukCzYH5Fe
	WjTD0SbiRM53G67R1p817gle6GM/BpJkmgVSDiinVG1wTmNdqW0NjxgS51Tr8h7m5fvAVrGlA83n5
	us0Pp1u7FW0Ze1/rdT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfCx8-008Gxa-FB; Fri, 15 Apr 2022 03:48:58 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfCx5-008Gvx-J7
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 03:48:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 32so6409198pgl.4
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+p+/01zxqSUmc6ocw4hobbam8/tbNCsFI0sQ5YC4a1o=;
 b=iWMuBihF5xt8NwSbSJXQmQRmR9K/JYLnLbu2vvdWN3LXf38vGqAVI1VYyKb9s7MqzZ
 QyG/PA5W5hEvs/llIv5J41xLaBXmcHIqaL3bQDVkMD2HD+CpLnzAktei/Bxpea8EImyM
 d8kJdgoklat8d3r7qD/a9Ph0ubol5pDCcJ/+v0FBfIBISAdANwNjN47uxMc9pBevjKt1
 +rp8LsVnGBNn0lvHuhz6Z8AroKSh2kG2i4sOSD9jRRYKTng4umA0x5Ls42fv7cXPA40b
 IdPukn6F+CCn54oub7WMeZX4O7ZgeHFzJ6znw1mEgppBXhr7LvTxPhLRyMteOCvYO5O0
 iUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+p+/01zxqSUmc6ocw4hobbam8/tbNCsFI0sQ5YC4a1o=;
 b=ASAHtHOuezA5OSBXpSHPnipGJb5LoZE0Lah/bQ7UiFrTdp0y27EyeGtN++pFkGWCCT
 IxHAH07T3R5gnkIO/Clsp3VNi8ycKUScKsZeX2veH8z+BvWn+IS1GYoKG6EEzpzHMnKg
 e7sHevXTfU1FQORDvueExm1VXoj5QK5jYDfKciVUTxdft+1blAJuCk83K6hwr37BefTn
 Im6FJ5Op77EzvY41LbeA8LVHidpHC6yLAc4FQ1QsfwtuDXY4DNL3/Sw9f8SiubGn3moY
 OyMQD4ET4cvHZAZWg0Vkd34AQE7eSr4DwL3zDfn788I+mAedUPupllVSym3uy5llzcHO
 qrAg==
X-Gm-Message-State: AOAM531DTmRY7PLcFHs00QAimRW3urhyPxJTtRyLwKrFXB7z4k8SPBXI
 6UbjtqL0PZ+PJv10VLkkRyaA11Jb4yzfQCBX
X-Google-Smtp-Source: ABdhPJzRKVr+iqMWY04fDUROmbi+6Z/oGSyXSoFDPVg9D5IfLxx3cb07ttDzZgyB2gXXiKJwwraEog==
X-Received: by 2002:a65:568b:0:b0:378:86b8:9426 with SMTP id
 v11-20020a65568b000000b0037886b89426mr4811328pgs.70.1649994533848; 
 Thu, 14 Apr 2022 20:48:53 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm7426380pjb.25.2022.04.14.20.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 20:48:53 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/3] mtd: spinand: add support for detection with param page
Date: Fri, 15 Apr 2022 11:48:41 +0800
Message-Id: <20220415034844.1024538-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_204855_664836_7A9A8E7E 
X-CRM114-Status: GOOD (  10.58  )
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

This patchset adds support for spi-nand detection using parameter page.
This helps dealing with future JEDEC ID conflicts introduced by crazy
vendors. Also, the added ability to auto-detect chip capacity can help
reducing number of entries in our spi-nand id table.

Change since v1: extract common functions from raw nand

Chuanhong Guo (3):
  mtd: nand: extract some onfi functions to nandcore
  mtd: spinand: add support for detection with param page
  mtd: spinand: probe Winbond W25N01GV/W using param page

 drivers/mtd/nand/Makefile         |   2 +-
 drivers/mtd/nand/onfi.c           | 115 ++++++++++++++++
 drivers/mtd/nand/raw/internals.h  |   1 -
 drivers/mtd/nand/raw/nand_base.c  |  18 ---
 drivers/mtd/nand/raw/nand_jedec.c |   4 +-
 drivers/mtd/nand/raw/nand_onfi.c  |  70 +---------
 drivers/mtd/nand/spi/Makefile     |   2 +-
 drivers/mtd/nand/spi/core.c       |  23 ++--
 drivers/mtd/nand/spi/onfi.c       | 219 ++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/winbond.c    |  25 ++--
 include/linux/mtd/onfi.h          |   8 ++
 include/linux/mtd/spinand.h       |  53 ++++++++
 12 files changed, 431 insertions(+), 109 deletions(-)
 create mode 100644 drivers/mtd/nand/onfi.c
 create mode 100644 drivers/mtd/nand/spi/onfi.c

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
