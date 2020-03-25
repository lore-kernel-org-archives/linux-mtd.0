Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6264BC18E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C6720714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PxRnCcIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C6720714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=K66whKlfGBtp+xErF/eqK48YJqpENiLuZUjEDY8bf2E=; b=PxR
	nCcIYcEaEE4m2+Wso9IlISPVkEHm0xMR3YLTJZIp0slo8JT+oty+pRZTfWShDdgUYwCkpq0Nv2/aF
	pFgKHjYfsISL3ZROys1fkovP5E8xSXsgzAMdyQokZLFHtc6mfguJZnQVc2nU0HVcLO3WS+HMdk1PP
	4Yg9AmsEaUBy8IlDzHR6B1diaMjxmqUL9m1VBrFhJBVneEy1PCD+hdrHjTNRoU0YeOWHSJ1ckrs9n
	d/Uk+jO8sCC78roHTTlWukkKicL++Yp7pKyvD3hq9p/otKyGbRz2OavQhwn2fTzXEHiDVvEqoEO+r
	Joiv5RfDqZhC303tr3qLJqZSlNP1BhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1pH-0008Ud-E8; Wed, 25 Mar 2020 08:55:51 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1p1-0008G5-9W
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 08:55:37 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436284|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0720342-0.000775372-0.92719;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16370; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.H50xpyL_1585126516; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H50xpyL_1585126516)
 by smtp.aliyun-inc.com(10.147.42.241);
 Wed, 25 Mar 2020 16:55:25 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 00/11] pstore: mtd: support crash log to block and mtd
 device
Date: Wed, 25 Mar 2020 16:54:55 +0800
Message-Id: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015535_604283_5D332BAE 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Why do we need to log to block (mtd) device?
1. Most embedded intelligent equipment have no persistent ram, which
   increases costs. We perfer to cheaper solutions, like block devices.
2. Do not any equipment have battery, which means that it lost all data
   on general ram if power failure. Pstore has little to do for these
   equipments.

Why do we need mtdpstore instead of mtdoops?
1. repetitive jobs between pstore and mtdoops
   Both of pstore and mtdoops do the same jobs that store panic/oops log.
2. do what a driver should do
   To me, a driver should provide methods instead of policies. What MTD
   should do is to provide read/write/erase operations, geting rid of codes
   about chunk management, kmsg dumper and configuration.
3. enhanced feature
   Not only store log, but also show it as files.
   Not only log, but also trigger time and trigger count.
   Not only panic/oops log, but also log recorder for pmsg, console and
   ftrace in the future.

Before upstream submission, pstore/blk is tested on arch ARM and x84_64,
block device and mtd device, built as modules and in kernel. Here are the
details:

	https://github.com/gmpy/articles/blob/master/pstore/Test-Pstore-Block.md

[PATCH v3]:
1. patch 1~10: a lot of improvements according to Kees Cook <keescook@chromium.org>
               including rename module, typo, reorder, rewrite document, bugs
			   and so on.
2. patch 11: rename funtions of pstore/blk and update document.
[PATCH v2]:
1. fix syntax error in documents. Thank Randy Dunlap <rdunlap@infradead.org>
2. replace pr_* with dev_* for mtdpstore.
   Thank Vignesh Raghavendra <vigneshr@ti.com>
3. improve mtdpstore. Thank Miquel Raynal <mraynal@kernel.org>
[PATCH v1]:
1. fix errors and warnings reported by kbuild test robot.

WeiXiong Liao (11):
  pstore/zone: a common layer to manage storage as zones
  pstore/blk: new support logger for block devices
  pstore/blk: respect for driver to pick pstore front-ends
  pstore/blk: pstore/zone: support pmsg recorder
  pstore/blk: blkoops: support console recorder
  pstore/blk: blkoops: support ftrace recorder
  Documentation: create document for pstore/blk
  pstore/zone: skip broken zone for MTD device
  pstore/blk: a way to get user configure about pstore front-ends.
  pstore/zone: pstore/blk: support non-block devices
  mtd: new support oops logger based on pstore/blk

 Documentation/admin-guide/pstore-block.rst |  237 +++++
 MAINTAINERS                                |    1 +
 drivers/mtd/Kconfig                        |   10 +
 drivers/mtd/Makefile                       |    1 +
 drivers/mtd/mtdpstore.c                    |  564 +++++++++++
 fs/pstore/Kconfig                          |  107 ++
 fs/pstore/Makefile                         |    4 +
 fs/pstore/platform.c                       |    3 +-
 fs/pstore/pstore_blk.c                     |  480 +++++++++
 fs/pstore/pstore_zone.c                    | 1511 ++++++++++++++++++++++++++++
 include/linux/pstore.h                     |    1 +
 include/linux/pstore_blk.h                 |   77 ++
 include/linux/pstore_zone.h                |   60 ++
 13 files changed, 3055 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/pstore-block.rst
 create mode 100644 drivers/mtd/mtdpstore.c
 create mode 100644 fs/pstore/pstore_blk.c
 create mode 100644 fs/pstore/pstore_zone.c
 create mode 100644 include/linux/pstore_blk.h
 create mode 100644 include/linux/pstore_zone.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
