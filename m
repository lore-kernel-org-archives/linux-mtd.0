Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FBEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 11:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104F960F35
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 11:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 104F960F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L2zvY0SI3FUR/vXNZc56TCMaRDqjwj1PRWltiIlq/eE=; b=byBtxb/Xu3l6Pl
	0asOtWCVqnuMeLTVWkFQnZ/uYNKpanPdY7sxtYBZuN7CgnUBEoeDmq9O6eh6FbIldJ5RAUFFuAeRy
	Yw3xTWei15aOuQUoX3+0AoWZ0svqh8JiwBWiaiVf9lLxyyn+/7RBYPMwIoaCR4UkMnOFnA+8cAmd0
	mVtTDjslGJ5TWM3SS0kjVRlfsZ2d3BFSTBxU1qVZiaJD7QCDOWYZ/dVctRjoQ4gzzkzzw+DN7IlL6
	1Qr3fysgOKpAiTDLtxNlYjk1MHHOPNwtRZQ4uQtas+vD3Yz8jyWGukKC5gQpji3glCEbd5rSXykWc
	Ua/W9/4fxffTE6JZJdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZtrv-009Dji-6d; Mon, 11 Oct 2021 11:53:23 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZtrq-009DgN-OP
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 11:53:20 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 11810C2CD3;
 Mon, 11 Oct 2021 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633953192; bh=pbRkeukv21LDSj8H7Ux10RpLsbQPs7ZZl4KidK4wSvg=;
 h=From:To:Cc:Subject:Date;
 b=OsjGAR6dpz8i7hOsD+TCN++BHttqyMSMRGpetl+m5Weqs6Wqn70EZ3cO8gd5Yp9pT
 1cCcBdZjibK0cS2ojAn7wGn9xyq+e/y4hqZh2cjhAPXE9Rr/XyiDEHW3gk4hfZKpiT
 t0VqIM2g7uOG0nnh3sCiKA7rxlSBQcxIZE3hT8Tq1wZPmNcqq68N561gTBPuooWiLw
 e1W9d1Yj2Bgfik4hvL3ohZD8F0yMX7n4YkodE67VRzkNFPyxQ/ArQhScyr8hiOau/Z
 xL6mwM5/cpiiwppgq8lbyYoZ/nVZOMm9I96HYezpkY8D9q2huZow7KUkCsZIeN3s9f
 n3tQ8NKs1zZ9w==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mtd: core: protect access to mtd devices while in suspend
Date: Mon, 11 Oct 2021 13:52:50 +0200
Message-Id: <20211011115253.38497-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_045319_144226_07609366 
X-CRM114-Status: GOOD (  10.25  )
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

Follow-up on discussion in https://lkml.org/lkml/2021/10/4/41

Changes since from rfc v1/v2:
 - added access protection for all device access hooks in mtd_info.
 - added Suggested-by to [1/3] patch.
 - removed refereces to commit ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
   from commit msg as commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") is 
   to be blamed.
 - tested on a kernel with LOCKDEP enabled.

@Miquel: I havn't covered every ioctl, to me it looks like they havn't
direct device access.

One (small) issue still present. gpmi_nand.c uses the rwsem before it's
initialized. Seems cumbersome to have every mtd/nand driver to call
init_waitqueue_head() and init_rwsem(). Could we somehow move the call
to mtd_set_dev_defaults() before nand_create_bbt()?

---
nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
nand: Toshiba NAND 512MiB 3,3V 8-bit
nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 128
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at kernel/locking/rwsem.c:1240 down_read+0x160/0x184
DEBUG_RWSEMS_WARN_ON(sem->magic != sem): count = 0x0, magic = 0x0, owner = 0x0, curr 0xc40b0000, list not empty 
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc3-00002-g7eab985fa8cd-dirty #163 
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[<c010fa90>] (unwind_backtrace) from [<c010b8fc>] (show_stack+0x10/0x14)
[<c010b8fc>] (show_stack) from [<c0b34998>] (dump_stack_lvl+0x58/0x70)
[<c0b34998>] (dump_stack_lvl) from [<c0123884>] (__warn+0xd4/0x154) 
[<c0123884>] (__warn) from [<c0b2e9ac>] (warn_slowpath_fmt+0x94/0xbc)
[<c0b2e9ac>] (warn_slowpath_fmt) from [<c0b428c8>] (down_read+0x160/0x184)
[<c0b428c8>] (down_read) from [<c06df42c>] (mtd_read_oob+0xc8/0x284)
[<c06df42c>] (mtd_read_oob) from [<c06f28cc>] (scan_block_fast+0x78/0xf4) 
[<c06f28cc>] (scan_block_fast) from [<c06f3c14>] (search_bbt+0x268/0x304) 
[<c06f3c14>] (search_bbt) from [<c06f3ef0>] (nand_create_bbt+0x240/0x6dc) 
[<c06f3ef0>] (nand_create_bbt) from [<c06fa758>] (gpmi_nand_probe+0x568/0x6d0)
[<c06fa758>] (gpmi_nand_probe) from [<c068731c>] (platform_probe+0x58/0xb8)
[<c068731c>] (platform_probe) from [<c0684a48>] (really_probe.part.0+0x9c/0x32c)
[<c0684a48>] (really_probe.part.0) from [<c0684d78>] (__driver_probe_device+0xa0/0x138) 
[<c0684d78>] (__driver_probe_device) from [<c0684e40>] (driver_probe_device+0x30/0x10c) 
[<c0684e40>] (driver_probe_device) from [<c0685510>] (__driver_attach+0xb4/0x174) 
[<c0685510>] (__driver_attach) from [<c0682b84>] (bus_for_each_dev+0x78/0xb8) 
[<c0682b84>] (bus_for_each_dev) from [<c0683ea4>] (bus_add_driver+0xf0/0x1d8) 
[<c0683ea4>] (bus_add_driver) from [<c0686270>] (driver_register+0x88/0x118)
[<c0686270>] (driver_register) from [<c0102108>] (do_one_initcall+0x74/0x378) 
[<c0102108>] (do_one_initcall) from [<c1001304>] (kernel_init_freeable+0x2a4/0x348) 
[<c1001304>] (kernel_init_freeable) from [<c0b3bc34>] (kernel_init+0x10/0x124)
[<c0b3bc34>] (kernel_init) from [<c010011c>] (ret_from_fork+0x14/0x38)
Exception stack(0xc40a7fb0 to 0xc40a7ff8) 
7fa0: ???????? ???????? ???????? ???????? 
7fc0: ???????? ???????? ???????? ???????? ???????? ???????? ???????? ???????? 
7fe0: ???????? ???????? ???????? ???????? ???????? ???????? 
irq event stamp: 110936 
hardirqs lastenabled at (110935): [<c0100b04>] __irq_svc+0x64/0x80
hardirqs last disabled at (110936): [<c0100af0>] __irq_svc+0x50/0x80
softirqs lastenabled at (110906): [<c093818c>] netlink_insert+0x60/0x8a4
softirqs last disabled at (110904): [<c08ac6d4>] release_sock+0x18/0x98 
---[ end trace c70a1a8da23b619d ]---
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
---

Sean Nyekjaer (3):
  mtd: core: protect access to MTD devices while in suspend
  mtd: rawnand: remove suspended check
  mtd: mtdconcat: add suspend lock handling

 drivers/mtd/mtdconcat.c          |  11 ++-
 drivers/mtd/mtdcore.c            | 133 +++++++++++++++++++++++++++----
 drivers/mtd/nand/raw/nand_base.c |  52 +++---------
 include/linux/mtd/mtd.h          | 109 +++++++++++++++++++++----
 include/linux/mtd/rawnand.h      |   5 +-
 5 files changed, 234 insertions(+), 76 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
