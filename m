Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70789C5DF8A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ND68vJz4ZC2Bz98mo6mjyqvjj3RG6T2XPNa3flokwb8=; b=KiftjT+10c9ojY
	XvmE7tj6m3SSL+f2Vh4jHrn5FfLyUAxzq3f6la6jouC/ZfkN7OaRsp/+XAjl54nfqV7mu7k2q8Jjm
	orDusgqRghvJBzIpeFVM4PiwQHi6iIqGCaGdzMC5Vak9O76nAhSFcZPaJOxJPq6jlM+Rnnn/8uTTo
	z6FEGNwRPQl1NRA0PM4yUGyKGRUCA3RHCJeKwMowRNkAqOnrwAt4On05a4LGm0IsqgrCWXWo61P4+
	CEF6KOzT8wE0kj72cEYYsHbHSP+JhObF434Zv2JFnUr8tWkJUv5ALH16uI+QxTOgoBU92xM/cZ3KS
	jD9wKnh8XpKqLx5ZqNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0SL-0000000BOaz-0esj;
	Thu, 20 Aug 2026 10:57:09 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0SI-0000000BOY7-3Hw7
	for linux-mtd@lists.infradead.org;
	Thu, 20 Aug 2026 10:57:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xsvBPHM9Phkp22E5ouyU3mr8Yzj5fMI5tGo8rhe5V5Y=;
	b=DEYeTK0hgoY78K/E4TV0+ygXFxkcArkZghR58Xf2H8upX/XcA/eUTU6kJPUnyMYPP1Mkt9f8e
	pmb/cGnl8d0S/tRJpojttttiK2725aps0gMKiw6Okk74Uun6nVhnth/CZl4TL9hdqnPGQqp2DBj
	jOHZFfmbNNnjDAdZDKUm48w=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hQg9W3DQ8z1T4Fq;
	Thu, 20 Aug 2026 18:46:55 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 50F604057D;
	Thu, 20 Aug 2026 18:56:57 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 20 Aug
 2026 18:56:56 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/6] jffs2: extend write verification to all write paths
Date: Thu, 20 Aug 2026 18:49:56 +0800
Message-ID: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035707_153652_94A3B068 
X-CRM114-Status: GOOD (  12.53  )
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

When JFFS2 writes data to flash, it first calculates a node CRC, and
the NAND controller calculates ECC as the data is programmed. If
corruption occurs between these two points, the possible causes are
RAM failures or bus transfer errors before the data reaches the flash,
or bit flips on the flash medium itself. To distinguish whether the
corruption happened during the write transfer or after commit to the
medium, commit a6bc432e296d ("[JFFS2] Add support for write-buffer
verification") introduced CONFIG_JFFS2_FS_WBUF_VERIFY: reading the
data back immediately after a successful write and comparing it with
the in-memory source buffer provides the missing observation point
for that diagnosis.

However, the current implementation only performs read-back verification
on write-buffer flush paths. Two scenarios remain uncovered:

  1. When the write data length exceeds wbuf_pagesize, the excess data
  bypasses the write buffer and is written directly to flash via
  mtd_write() in jffs2_flash_writev(), with no verification.
  2. NOR Flash and other non-writebuffered devices write directly through
  jffs2_flash_direct_write() and jffs2_flash_direct_writev(), with no
  equivalent check.

In both cases, if MTD reports a successful write but the readable medium
differs from JFFS2's source buffer, a later node CRC failure cannot
distinguish transport/program-time corruption from post-commit media
damage, defeating the original diagnostic intent.

This series covers both scenarios with the following changes.

Replace the pre-allocated per-superblock wbuf_verify buffer with
on-demand allocation inside jffs2_verify_write(). This allows
concurrent verification calls to proceed independently without
contending for a shared buffer. Additionally, memcmp() is replaced
with a byte-by-byte comparison that pinpoints the exact mismatch
offset, rather than merely reporting equal or not-equal.

Add verification calls in jffs2_flash_writev() for direct page
writes, and in jffs2_flash_direct_write() and
jffs2_flash_direct_writev() for NOR and other non-writebuffered
devices.

Since verification now covers all write paths rather than only the
write-buffer path, rename CONFIG_JFFS2_FS_WBUF_VERIFY to
CONFIG_JFFS2_FS_WRITE_VERIFY and remove the Kconfig dependency on
CONFIG_JFFS2_FS_WRITEBUFFER.

Add a module parameter write_verify (default off, 0644) to allow
dynamic enable/disable of write verification at runtime, so kernels
can carry the diagnostic facility without read-back overhead until
fault isolation is required. The parameter can be accessed through:

    /sys/module/jffs2/parameters/write_verify

This remains an optional diagnostic aid; node CRCs continue to provide
JFFS2's normal on-media integrity check.

zhouminqiang (6):
  jffs2: replace per-superblock verify buffer with per-write buffer
  jffs2: write verify: replace memcmp with byte-by-byte comparison
  jffs2: add write verification to direct page writes in flash_writev
  jffs2: add write verification to NOR direct write paths
  jffs2: rename CONFIG_JFFS2_FS_WBUF_VERIFY to
    CONFIG_JFFS2_FS_WRITE_VERIFY
  jffs2: add runtime toggle for write verification

 fs/jffs2/Kconfig       |  31 +++++++--
 fs/jffs2/jffs2_fs_sb.h |   3 -
 fs/jffs2/os-linux.h    |  11 ++++
 fs/jffs2/wbuf.c        |  86 +++---------------------
 fs/jffs2/writev.c      | 145 ++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 188 insertions(+), 88 deletions(-)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
