Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD51C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:05:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5339520756
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0imu5UF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IN2GdLWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5339520756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7gqfxwWFncjckuN5XoQgzwF8SDJ1cjvvoNX58J2U9c0=; b=W0i
	mu5UFzYZ74Bz3JHZ/JMyi/nHV9COhZTTkCQmULumFcNP70KZh7542BTA0BabHm42lCvtzf3q1QcGj
	nUJnccZMxuHipxu+8wdtT9pGKzA3eSaHp8jxujOlVSfD6X2Yrhs9McipairMSfSBbV2ahlkzXzLCo
	q9DBYsVxn6zu/tLR6EX/J87UPAsIQvFztwWE+MrZK3XRcDH5jXh6tzP1RivnSfK/r/tvypOfL8Jp1
	f2kSW+Q36XHaH3Tl+iRqsZm6Nc0vljKXh/vJmUBkxItjRsW/BMpG/B7l0o2SM0AdeRq/m8LHF2DrM
	1DWBlk9G7Q5v0QjtLWWY8jzENUp7Afw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaz7l-0000gp-PR; Tue, 19 May 2020 10:05:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaz7i-0000VJ-Ce
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:05:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id m185so2795829wme.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZDJEthhWgY5wAb8g4sO5kbhswhHVWOPQX9uJ2zkl5tU=;
 b=IN2GdLWuNUNLyyNTO3iaOpDYw5MKV1g3T1zBA8FqWfkLDL2e5D+hWE0vRzPzAzIT4g
 C7G/mNUBoetozevkStq0VqG7bg0HqpihDLSHd048ut/IqjkKh45u1JoDGX3yQ0drsCoF
 4qzBPZpexi311B3RwsNNQ55mti8t+p4rlSp4i3H9xFqRJ5s9lvEmPBq2EETCrcIKrcPw
 VOc+Z0mGn2jsFUH4WWbrcfzbAfWLJ71jmm7ljNTfV/Twr00rLi/vynryPEFTJd0UhU5Z
 sRnGKvAIWMSEfTRG2KEH7z/yyAhQKiytIE4PMiNoWFn1izpQYkrhFGtMcDSXTbJZcwX0
 Fm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZDJEthhWgY5wAb8g4sO5kbhswhHVWOPQX9uJ2zkl5tU=;
 b=RgU/Rt76F4IRkL4+B/GJFAdfMhmtzc2lgvlTiL/+KaG/2J6Ptffb9WDY7QS6Nv+qHY
 g5eRG52Gm/BzkOvcLgNOiPbAYXtAbtNNJiM0GtrL3zjXEv2ZYiyCCmWTjJB81MhIdIbA
 MRC/sZ8KELw8CL0X7IboiQZCoBKdNv8vSeCcPXxmFo77I/j+GmDYkPy5AjYvu1oqVgbZ
 QdwZ2YBgMFZnNuPK+kZIwB3lPhLpeIrApRxjf8XcwmODgd9O8/V2KU88Y5qqXsr6M07m
 uy/xpyEeyTRKVc3fH/A2Vi5ZX5edaBTn0kus6Xd//OoIW9TfUYAC0XWYuKb6Wsx4jsif
 tRjQ==
X-Gm-Message-State: AOAM533syfCIa7SXsvjUaR38VOu4DDac9fNxtzINpx1Ug68vZpqhxAea
 wfJu+k9To2LC/lXDeU3+faI=
X-Google-Smtp-Source: ABdhPJyTQM4/8f04kiQtCEUDxu72rmNzbKQRKo70umDUp4K1L0E0CogjFDWchr6GuEbTQid3KWXHrw==
X-Received: by 2002:a1c:7305:: with SMTP id d5mr4716773wmb.85.1589882720420;
 Tue, 19 May 2020 03:05:20 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id b18sm19968008wrn.82.2020.05.19.03.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:05:19 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v5 0/5] Micron SLC NAND filling block
Date: Tue, 19 May 2020 12:05:02 +0200
Message-Id: <20200519100507.19323-1-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_030522_454069_DC961942 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: huobean@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bean Huo <beanhuo@micron.com>

Hi,
On planar 2D Micron NAND devices when a block erase command is issued,
occasionally even though a block erase operation completes and returns a pass
status, the flash block may not be completely erased. Subsequent operations to
this block on very rare cases can result in subtle failures or corruption. These
extremely rare cases should nevertheless be considered. This patchset is to
address this potential issue.

After submission of patch V1 [1] and V2 [2], we stopped its update since we get
stuck in the solution on how to avoid the power-loss issue in case power-cut
hits the block filling. In the v1 and v2, to avoid this issue, we always damaged
page0, page1, this's based on the hypothesis that NAND FS is UBIFS. This
FS-specifical code is unacceptable in the MTD layer. Also, it cannot cover all
NAND based file system. Based on the current discussion, seems that re-write all
first 15 page from page0 is a satisfactory solution.

Meanwhile, I borrowed one idea from Miquel Raynal patchset [3], in which keeps
a recode of programmed pages, base on it, for most of the cases, we don't need
to read every page to see if current erasing block is a partially programmed
block.

Changelog:
v4 - v5:
    1. Add Miquel Raynal Authorship and SoB in 4/5 and 5/5 (Miquel Raynal)
    2. Change  commit message in 5/5. (Steve deRosier)
    3. Delete unused variable max_bitflips in 4/5

v3 - v4:
    1. In the patch 4/5, change to directly use ecc.strength to judge the page
       is a empty page or not, rather than max_bitflips < mtd->bitflip_threshold
    2. In the patch 5/5, for the powerloss case, from the next time boot up,
       lots of page will be programmed from >page15 address, if still using
       first_p as GENMASK() bitmask starting position, writtenp will be always 0

v2 - v3:
    1. Rebase patch to the latest MTD git tree
    2. Add a record that keeps tracking the programmed pages in the first 16
       pages
    3. Change from program odd pages, damage page 0 and page 1, to program all
       first 15 pages
    4. Address issues which exist in the V2.

v1 - v2:
    1. Rebased V1 to latest Linux kernel.
    2. Add erase preparation function pointer in nand_manufacturer_ops.

[1] https://www.spinics.net/lists/linux-mtd/msg04112.html
[2] https://www.spinics.net/lists/linux-mtd/msg04450.html
[3] https://www.spinics.net/lists/linux-mtd/msg13083.html

Bean Huo (3):
  mtd: rawnand: group all NAND specific ops into new nand_chip_ops
  mtd: rawnand: Add {pre,post}_erase hooks in nand_chip_ops
  mtd: rawnand: Introduce a new function nand_check_is_erased_page()
Miquel Raynal (2)
  mtd: rawnand: Add write_oob hook in nand_chip_ops
  mtd: rawnand: micron: Micron SLC NAND filling block

 drivers/mtd/nand/raw/internals.h     |   3 +-
 drivers/mtd/nand/raw/nand_base.c     |  87 ++++++++++++++++++----
 drivers/mtd/nand/raw/nand_hynix.c    |   2 +-
 drivers/mtd/nand/raw/nand_macronix.c |  10 +--
 drivers/mtd/nand/raw/nand_micron.c   | 104 ++++++++++++++++++++++++++-
 include/linux/mtd/rawnand.h          |  40 +++++++----
 6 files changed, 211 insertions(+), 35 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
