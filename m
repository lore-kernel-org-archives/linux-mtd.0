Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D091C33CAF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 01:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF16206D7
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 01:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ERvYO4YQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF16206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DiE33I/XO/WLaJXBbggTW4mbCGA8FPfCK8R//dFkjwo=; b=ERv
	YO4YQLXGyOzxeqY5+rVjxjdjU4bvU6mzHSt64W87TbgSZZm3/Tb0nTzCD720mH01kSEUKT/8RB2p0
	lD/jhDgKghPSBJ644n3CoBbSU2voXf3IQkLACT91piZC8fQjn+OoyWH8YXOWdTsZ/LTQZz/ylPbQX
	kdyZo9LxyLcT+8q2ze4WuRZpu5h4IGDEoBtfk+e4r7gex2goRivzCC7/YsnmkVysZgkBJkxmk2021
	wZgXvaSnKcYH9zAWZ89U8Pi6uM6rZ/UAn2tpc0rFerOKg2HUwfp+mu325k967qyOMlixirFEOpWba
	sZD0A6A9Pquk2CvYT7CzbEv64F0WIHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itLUE-0001iG-Ut; Mon, 20 Jan 2020 01:04:14 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itLU9-0001ew-W9
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 01:04:12 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06713192|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.253924-0.0783178-0.667759;
 DS=CONTINUE|ham_system_inform|0.0651482-0.00102876-0.933823;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03307; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Gf.OYKf_1579482234; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.Gf.OYKf_1579482234)
 by smtp.aliyun-inc.com(10.147.42.16); Mon, 20 Jan 2020 09:03:59 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v1 00/11] pstore: support crash log to block and mtd device
Date: Mon, 20 Jan 2020 09:03:42 +0800
Message-Id: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_170410_222961_3EB5EEEB 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
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

[PATCH v1]:
1. fix errors and warnings reported by kbuild test robot.

WeiXiong Liao (11):
  pstore/blk: new support logger for block devices
  blkoops: add blkoops, a warpper for pstore/blk
  pstore/blk: support pmsg recorder
  pstore/blk: blkoops: support console recorder
  pstore/blk: blkoops: support ftrace recorder
  Documentation: pstore/blk: blkoops: create document for pstore_blk
  pstore/blk: skip broken zone for mtd device
  blkoops: respect for device to pick recorders
  pstore/blk: blkoops: support special removing jobs for dmesg.
  blkoops: add interface for dirver to get information of blkoops
  mtd: new support oops logger based on pstore/blk

 Documentation/admin-guide/pstore-block.rst |  297 ++++++
 MAINTAINERS                                |    3 +-
 drivers/mtd/Kconfig                        |   10 +
 drivers/mtd/Makefile                       |    1 +
 drivers/mtd/mtdpstore.c                    |  530 +++++++++++
 fs/pstore/Kconfig                          |  109 +++
 fs/pstore/Makefile                         |    5 +
 fs/pstore/blkoops.c                        |  490 ++++++++++
 fs/pstore/blkzone.c                        | 1344 ++++++++++++++++++++++++++++
 include/linux/blkoops.h                    |   94 ++
 include/linux/pstore_blk.h                 |   91 ++
 11 files changed, 2973 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/pstore-block.rst
 create mode 100644 drivers/mtd/mtdpstore.c
 create mode 100644 fs/pstore/blkoops.c
 create mode 100644 fs/pstore/blkzone.c
 create mode 100644 include/linux/blkoops.h
 create mode 100644 include/linux/pstore_blk.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
