Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39570C28CBC
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 11:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F159B214D8
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 11:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erPTRXOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F159B214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nHikjzXapMWLuJNaOuSUQfWMKTYRFmh79BxEwdkxG8I=; b=erP
	TRXOsfKlScBTrV4HLrYR7Sx4HdXnXtGxUS70s6PYMTVP2jnI0ctKp/sD3TwcnrocDnlisd7PNJyNd
	3gJLIsDYlLcGJk4wyKJnNJHNVpiedndsiOKyaujdL2N6Fy/zmLKOCGkrHJy+mbtyGFQrjweDLZ9e+
	vTYcjeLvkmGrB70KgXnKHQ6UL67J+27wQDZeD4zpl7b+OK/xekfXc5ciBORHaF5H7R1r9OIE6/b58
	uQf73ukfVt8Pq5yUOPGipdzExECWBT+kQX5IqPisI2kqv1NlZaBpQrYnE1uF0n2wC3gDP7Pj7qBtz
	h2Y5xYtqRALegoS9icMNviCahNPXTkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXNRo-0007Cv-V9; Sat, 09 May 2020 11:15:13 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXNRO-0005ha-QZ
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 11:14:49 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436625|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0365396-0.00253994-0.96092;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03297; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.HVopGr-_1589022874; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.HVopGr-_1589022874)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sat, 09 May 2020 19:14:39 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v5 00/12] pstore: mtd: support crash log to block and mtd
 device
Date: Sat,  9 May 2020 19:14:02 +0800
Message-Id: <1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_041447_015441_4AECCD33 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a series to support crash log to block and mtd device,
base on v4 of Kees Cook's.

Changes since v4:
	patch 1: adapt pstore to kmsg_dump_reason_str().
	patch 2: fix bugs that decompress failed and rmmod failed.
			 use atomic_xchg() on psz_flush_dirty_zone() in case of reload.
	patch 3: fix build error
	patch 5: flush pmsg zone if it's dirty.
	patch 6: use delayed work to cache more data and reduce calling
			 dirty-flusher times
	patch 12: change dev_err() to pr_err() when initialize because it get
			  no pointer to mtd at that time.

v4: https://lore.kernel.org/lkml/20200508064004.57898-1-keescook@chromium.org/
v3: https://lore.kernel.org/lkml/1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com/
v2: https://lore.kernel.org/lkml/1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com/
v1: https://lore.kernel.org/lkml/1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com/

Kees Cook (1):
  printk: pstore: Introduce kmsg_dump_reason_str()

WeiXiong Liao (11):
  pstore/zone: Introduce common layer to manage storage zones
  pstore/blk: Introduce backend for block devices
  pstore/blk: Provide way to choose pstore frontend support
  pstore/blk: Add support for pmsg frontend
  pstore/blk: Add console frontend support
  pstore/blk: Add ftrace frontend support
  Documentation: Add details for pstore/blk
  pstore/zone: Provide way to skip "broken" zone for MTD devices
  pstore/blk: Provide way to query pstore configuration
  pstore/blk: Support non-block storage devices
  mtd: Support kmsg dumper based on pstore/blk

 Documentation/admin-guide/pstore-blk.rst |  243 +++++
 MAINTAINERS                              |    1 +
 drivers/mtd/Kconfig                      |   10 +
 drivers/mtd/Makefile                     |    1 +
 drivers/mtd/mtdpstore.c                  |  563 +++++++++++
 fs/pstore/Kconfig                        |  109 +++
 fs/pstore/Makefile                       |    6 +
 fs/pstore/blk.c                          |  481 ++++++++++
 fs/pstore/platform.c                     |   22 +-
 fs/pstore/zone.c                         | 1508 ++++++++++++++++++++++++++++++
 include/linux/kmsg_dump.h                |    7 +
 include/linux/pstore_blk.h               |   77 ++
 include/linux/pstore_zone.h              |   60 ++
 kernel/printk/printk.c                   |   21 +
 14 files changed, 3088 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/admin-guide/pstore-blk.rst
 create mode 100644 drivers/mtd/mtdpstore.c
 create mode 100644 fs/pstore/blk.c
 create mode 100644 fs/pstore/zone.c
 create mode 100644 include/linux/pstore_blk.h
 create mode 100644 include/linux/pstore_zone.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
