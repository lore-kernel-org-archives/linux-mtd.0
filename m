Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9762C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECA020756
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VMofIIK8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vgb110JP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECA020756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+w062jW3mKj9U3FuhhgxjkGHtfnTMh1b5mCMI0qB/Ik=; b=VMo
	fIIK8QG0oUheLfClGhl7RWcNOxdE5Xgr9HfbwFSZR8MATYfOpf7fXF8ioFtGIpNrJMXNf7t3Kzba5
	0B6xTWy6PgPN1w55s6ctj1AOkDSLZLyWO54sxkcZGrCrGikAwgLA3P2v/J3+h8Wp6lWWaqXbZxFrS
	Vbs7KQh7v8W8z5xvHVR7/eCKDXVid3P/GooEBtT/Y6BrnNIRzS8BfOK3dR26ke1NuyYCVR3vtpINg
	daoc0ubXLd1nJRzLovyFWuyWZ/cTQV7gFTpBfIEPbm6ZXo1s0qktbErt21okpBf09xjbgUgYVfDmQ
	xELnk8N37HBn3oEvBEbdgbL5DLUQiKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagJI-0001AL-6h; Mon, 18 May 2020 14:00:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagJE-0000kC-4p
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 14:00:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id f13so9390834wmc.5
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vq51n84RcgHv+d8wqLYGOsdzlKQOGpPL5C5pKYyl18E=;
 b=Vgb110JPtOOtPYB2ns99Lh8QR7EaypmU/StfaF7Fs7LrDKz5zEPOzGEAO0yS8WtUrz
 eYOXSKM6zeCARBcoE9Hd4blN3SQG6KUBIjheyVjFPdO35HlFBV7Uw5ZQ2IwJ+V32kGRa
 7N2MAJtvp8b9sB41BjCuffu9Al3BJoKumbkm8tt3X6+3NDOfK9UBhyDyp1a+ftia9Xvk
 FLhLxALwNCFZfjYRl8gXIgfC2AZ5+RFxZdZc+Z23bsmoERexHV2GbpALGSBsIF59KaWk
 uVlQs8DbtdKUI5JScCOOTIzhyN02dfBpl1GyoEom8YR0wKT5TxntsvibOLR+n02atD9s
 srWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vq51n84RcgHv+d8wqLYGOsdzlKQOGpPL5C5pKYyl18E=;
 b=ViNkwHni1CQEJlTlkxM1MZB3yZkAaEfOHzfmgVkxpe59RJDTfKRLbznBVxnCgbrATG
 3QKYp7Hd1gIIjJnzElU9ghangOruUPg8iWcY630DbxMc5EO26OgEYKD0kEcpZABT0eoE
 p2Qy1Ti1vYZH4+bNUtb6NL8IyBuhakCMT9gf1wJr/KRlWGUZmVxmCmEImoJnb/R4KTHK
 8agRM29z2oqyAh8woOd0lqLbjPEC1UZZiihRREAdsbAGyJO+WMpkXTNeOHZtu/6SWlWq
 SEOe7pclCCwFSdZfv1qmlGgtPgHPYeEdEpGsgj+iBtILwsBIgVj2Xom9f1nzB78qfriy
 uIww==
X-Gm-Message-State: AOAM531dObpbyLTHImDEo97Gwic1EiLCWPvd8lHIE4Wp9biba+N38462
 f4Ha8DzQRuRRiKJkJ4Pc5Oo=
X-Google-Smtp-Source: ABdhPJzKKzuOZ953BF0u4QVx3G927Bzn2sz1T21uKit3CoAGs+d3hNub8IdCnSzu8tpDYL4lalNNnA==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr19640599wmc.88.1589810396564; 
 Mon, 18 May 2020 06:59:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:598:b884:8d4:84ab:c471:b6eb:fcab])
 by smtp.gmail.com with ESMTPSA id
 81sm18114519wme.16.2020.05.18.06.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 06:59:55 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v4 0/5] Micron SLC NAND filling block
Date: Mon, 18 May 2020 15:59:38 +0200
Message-Id: <20200518135943.11749-1-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_070000_187993_C883ADA6 
X-CRM114-Status: GOOD (  11.71  )
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

on some legacy planar 2D Micron NAND devices when a block erase command is
issued, occasionally even though a block erase operation completes and returns
a pass status, the flash block may not be completely erased. Subsequent
operations to this block on very rare cases can result in subtle failures or
corruption. These extremely rare cases should nevertheless be considered. This
patchset is to address this potential issue.

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

v3 - v4:
    1. In the patch 4/5, change to directly use ecc.strength to judge the page
       is a empty page or not, rather than max_bitflips < mtd->bitflip_threshold
    2. In the patch 5/5, for the powerloss case, from the next time boot up,
       lots of page will be programmed from >page15 address, if still using
       first_p as GENMASK() bitmask starting position, writtenp will be always 0,
       fix it by changing its bitmask starting at bit position 0.

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


Bean Huo (5):
  mtd: rawnand: group all NAND specific ops into new nand_chip_ops
  mtd: rawnand: Add {pre,post}_erase hooks in nand_chip_ops
  mtd: rawnand: Add write_oob hook in nand_chip_ops
  mtd: rawnand: Introduce a new function nand_check_is_erased_page()
  mtd: rawnand: micron: Micron SLC NAND filling block

 drivers/mtd/nand/raw/internals.h     |   3 +-
 drivers/mtd/nand/raw/nand_base.c     |  88 +++++++++++++++++++----
 drivers/mtd/nand/raw/nand_hynix.c    |   2 +-
 drivers/mtd/nand/raw/nand_macronix.c |  10 +--
 drivers/mtd/nand/raw/nand_micron.c   | 104 ++++++++++++++++++++++++++-
 include/linux/mtd/rawnand.h          |  40 +++++++----
 6 files changed, 212 insertions(+), 35 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
