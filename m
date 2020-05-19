Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9175DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F980206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmUHz5QD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvrwjTjF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F980206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RxSbfp+wJiQ5Fu7c265x1/cwr3fcALtf/XdllKsJmQY=; b=ZmU
	Hz5QDA2fq9wi7fh2y0kBJ4RRd1+h+2zFdcZrrnahDQXr3PI05Q0M2WeiLGJO9gbN9kPONZUGBdRs0
	guvBOjw3CYFFOAveaic2eIUCxK6gzrqPbsPmRKDM7SdKQU1F14Bd/HNto3bKv3UWIS4pOrZQuPbgu
	yf98JFU410a6fbQQ9Zj54JakElXZUcj53751LpRvxNQhje7BhsvYaoWjq/E2tgcREAN35ZIlOFFy6
	5gYYUFmABS7VbcQF0RTKxntuER6t8ApIX6L5oY2TTJ1Br1BA5RrZ3SqrDNp0YwR/ChgbjfJwMxKv1
	UjuG+NlCvHB0OvOPNQqZgvfVXkUQ4jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jazK3-0000ob-1X; Tue, 19 May 2020 10:18:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jazJo-0000Oq-O8
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:17:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id l18so15242570wrn.6
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qnbBjKj/NVa4wsBr3rCK+T4/dJSnYWUMxL1sU5PiC/g=;
 b=EvrwjTjF/BGHMVobO0tpRUf2ZpEKg6hGmQ/IcgX2d79GnmVZUDTaIYGDukheGrbvWB
 TrtS85wHC+rZljtk8Cnayaw56mKcjhG8YGAk4SouMV6XYvCZbPb4LrhPwlOYUWzq7uPx
 tLZlJQ4NamzPDzISx6zguesGy9PvmMPyQt2HugANL9XzNAqPomfO5oR84y58yRkmRTI1
 yScF8/VuthFByM/LiO6Kl4hi+JVaJpDdsb9C0iLke7K9+XY7afOMD5czUyb3grSMOzPj
 xbvR8fHJsiZ+RlvBG5jJZ+vDpRaYqm3X1fLuvixT66K9SVBE7mLe+BjOCcgm6Y1rDAna
 lf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qnbBjKj/NVa4wsBr3rCK+T4/dJSnYWUMxL1sU5PiC/g=;
 b=Tjb7fMaUq8c7mKyZxKLLBZboQAOoXjYZ0xYhaBwteStrrLIVU2Ssdh0ZWS2lHfv5Pm
 aHEfTShTzs3jMUZZQyXQFmbpYL1XwJmHC5LfEDOuJ7QEt6AWxrVxaY3wnSg2nERj4D8o
 p8O5GPY4Oe6ujiAvvo/yb1HMjhRLUGav5Sv9QA6F7/Z5/odaImta9VS3C5tLF4XU/niJ
 Xoq70uXrrV/J5li5rk65QT6XmRLL7LTsxp0CuypP1ONzRi38jqwKNGxO7RrUpNgkorP/
 0DCcnD5LOkRv3YEk5DrOtbfG0x2ueUow64VqoD7oOVFAlL3N/AgDgoIqUwN5WR/+ckL4
 z0Vw==
X-Gm-Message-State: AOAM5330j9s6X6yPoVEz/diy8NeiWL6KONQOd+h1vhdhw2v6LblPFOMQ
 bYulF4XfkX8gT6ZIsepuNec=
X-Google-Smtp-Source: ABdhPJxMEXN1zUwvOOirYrC1fsioxeXESihxh3pcn4zzW1WZ1djtfL8WeqgS1tKvaDuhQ+vwmCS8gg==
X-Received: by 2002:adf:f344:: with SMTP id e4mr24906434wrp.395.1589883466663; 
 Tue, 19 May 2020 03:17:46 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id w15sm3062488wmi.35.2020.05.19.03.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:17:46 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [RESET PATCH v5 0/5] Micron SLC NAND filling block
Date: Tue, 19 May 2020 12:17:29 +0200
Message-Id: <20200519101734.19927-1-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_031752_788518_4F883538 
X-CRM114-Status: GOOD (  12.26  )
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

Resent this patset since there is typo in the cover-letter.

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

hangelog:
v4 - v5:
    1. Add Miquel Raynal Authorship and SoB in 4/5 and 5/5 (Miquel Raynal)
    2. Change  commit message in 5/5. (Steve deRosier)
    3. delete unused variable max_bitflips in 4/5

v3 - v4:
    1. In the patch 4/5, change to directly use ecc.strength to judge the page
       is a empty page or not, rather than max_bitflips < mtd->bitflip_threshold
    2. In the patch 5/5, for the powerloss case, from the next time boot up,
       lots of page will be programmed from >page15 address, if still using
       first_p as GENMASK() bitmask starting position, writtenp will be always 0.
       fix it by changing its bitmask starting at bit position 0.
v2 - v3:
    1. Rebase patch to the latest MTD git tree
    2. Add a record that keeps tracking the programmed pages in the first 16 pages
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
Miquel Raynal (2):
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
