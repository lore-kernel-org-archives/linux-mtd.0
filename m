Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D2AC79FA0
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tb64dNoaeiA/kyiXv67Uz2NMEpOI2nbTZcCOFjBC90g=; b=0EpHDuubnuN+2I
	gnwD7cHxq5aIyEN8B9cofYVqm7HH5ij6nlxdilXYSjSUGGdux4fyfi4AGfw/LpK4kWGJ3/7lfIp6q
	lZ9C7VDjSJko5uz6m5xgHkW7eRjPdhgdiUJt007ITv/RpcALX7ei5A3LKoRlnAWGUm+TZ6oOIUYap
	Sxv6ljvFNepm1OvvN307sY6QW0OxDUK+EcXIChBTgXfDUp65474igwVk/0lL9quIVzWEjTBLD0fip
	Z0uHnvgsqVTg/eVjq7b/GP4ExMkFzFWOzppq4Uey/kDaLcfIcYMZ6ZkiK6rJ5aA6T7jsqSGVLvSud
	iaT3rHI/CXotIzyPCF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JU-00000004atJ-3hTn;
	Sun, 06 Sep 2026 03:13:00 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JG-00000004aiZ-1Whh;
	Sun, 06 Sep 2026 03:12:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcwGK3gdBzKHMMF;
	Sun,  6 Sep 2026 11:11:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 6DC5840561;
	Sun,  6 Sep 2026 11:12:35 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAsW2pxqmzytAw--.18069S4;
	Sun, 06 Sep 2026 11:12:35 +0800 (CST)
From: Zhou Minqiang <zhouminqiang2@huawei.com>
To: linux@armlinux.org.uk,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	maddy@linux.ibm.com,
	dwmw2@infradead.org,
	richard@nod.at
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	chengzhihao1@huawei.com,
	yangerkun@huawei.com,
	yi.zhang@huawei.com,
	Zhou Minqiang <zhouminqiang2@huawei.com>
Subject: [PATCH v4 0/8] jffs2: extend write verification to all write paths
Date: Sun,  6 Sep 2026 11:03:36 +0800
Message-ID: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnUAsW2pxqmzytAw--.18069S4
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4Uuw4UWFyfAF1Utr4kXrb_yoW7Wr43pF
	9YkwnIy34kKryxKrsxA3W8X3s3KFs7GF17Wr1UCw1UZF9Y9ryjga95KFyjva48ZrsaqF4j
	gr4FkF98KF18A3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02
	F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4I
	kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7Cj
	xVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4MmhDUUUU
X-CM-SenderInfo: 52kr3z5lqtxttqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_201246_761685_759E8DB1 
X-CRM114-Status: GOOD (  13.44  )
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

When JFFS2 writes data to flash, corruption can occur during the
write transfer (RAM failures, bus errors) or after commit to the
medium (bit flips). To distinguish whether the corruption happened
before or after the data reached the flash, commit a6bc432e296d
("[JFFS2] Add support for write-buffer verification.") introduced
CONFIG_JFFS2_FS_WBUF_VERIFY: reading the data back immediately
after a successful write and comparing it with the in-memory
source buffer provides the missing observation point for that
diagnosis.

However, the current implementation only performs read-back
verification on write-buffer flush paths. NOR flash devices write
directly through jffs2_flash_direct_write() and
jffs2_flash_direct_writev(), with no equivalent check. Data
corruption incidents have been observed on NOR-based devices in
production environments, yet there is no quick diagnostic tool to
isolate whether the corruption occurred during the write transfer
or after commit to the medium. A significant number of deployed
devices rely on JFFS2 on NOR flash, making this gap a practical
concern.

During the investigation of the NOR flash gap, code inspection also
revealed that when the write data length exceeds wbuf_pagesize in
jffs2_flash_writev(), the excess data bypasses the write buffer and
is written directly to flash via mtd_write(), with no verification.
Additionally, jffs2_wbuf_recover() does not clear c->wbuf_len on
recovery failure, which can lead to BUG_ON in jffs2_link_node_ref()
or deadlock in jffs2_flush_wbuf_pad() on a subsequent write.

This series closes these gaps with the following changes:

- Patch 1: fix wbuf recovery failure exit paths to clear
		   c->wbuf_len, preventing BUG_ON and deadlock

- Patch 2: fix ref_totlen misuse in jffs2_wbuf_recover() failure path

- Patch 3: replace pre-allocated per-superblock wbuf_verify
		   buffer with on-demand allocation inside jffs2_verify_write()

- Patch 4: add byte-by-byte comparison after memcmp() mismatch
		   to pinpoint the exact mismatch offset

- Patch 5: add verification in jffs2_flash_writev() for the
		   mtd_write() path that bypasses the write buffer

- Patch 6: add verification calls in jffs2_flash_direct_write() and
		   jffs2_flash_direct_writev() for NOR flash devices

- Patch 7: rename CONFIG_JFFS2_FS_WBUF_VERIFY to
		   CONFIG_JFFS2_FS_WRITE_VERIFY and remove the Kconfig
		   dependency on CONFIG_JFFS2_FS_WRITEBUFFER

- Patch 8: add module parameter write_verify for runtime
		   enable/disable of write verification

This series extends the existing write verification mechanism to
cover all write paths. It remains off by default and does not
alter JFFS2's node CRC integrity checks.

Changes in v4:
- Change the OBSOLETE length in jffs2_wbuf_recover() secondary write
  failure path from retlen to end - start, and update the commit message
- Link to v3: https://lore.kernel.org/linux-mtd/20260901130549.1761342-1-zhouminqiang2@huawei.com/T/#t

Changes in v3:
- Add patch to fix incorrect ref_totlen usage in jffs2_wbuf_recover()
  secondary write failure path, which could corrupt free_size accounting
- Add __GFP_NOWARN to jffs2_verify_write() kmalloc to suppres
  high-order allocation splats on large-erasesize NAND
- Link to v2: https://lore.kernel.org/linux-mtd/20260829061658.306854-1-zhouminqiang2@huawei.com/T/#t

Changes in v2:
- Add patch to fix wbuf recovery failure exit paths not clearing
  c->wbuf_len, preventing BUG_ON and deadlock on subsequent writes
- Use kmalloc() instead of vmalloc() for verify buffer allocation
- Keep memcmp() on the hotpath and add byte-by-byte comparison
  only after a mismatch, rather than replacing memcmp() entirely
- In jffs2_flash_direct_write() and jffs2_flash_direct_writev(),
  call mtd_write() before jffs2_sum_add_kvec() to prevent
  retlen from being uninitialized if jffs2_sum_add_kvec() causes
  an early return
- Update defconfig files to rename CONFIG_JFFS2_FS_WBUF_VERIFY to
  CONFIG_JFFS2_FS_WRITE_VERIFY
- Link to v1: https://lore.kernel.org/linux-mtd/20260820105003.2525647-1-zhouminqiang2@huawei.com/T/#t

zhouminqiang (8):
  jffs2: wbuf: clear wbuf on recovery failure paths
  jffs2: wbuf: fix OBSOLETE under-coverage on recovery failure
  jffs2: replace per-superblock verify buffer with per-write buffer
  jffs2: write verify: add byte-by-byte comparison on mismatch
  jffs2: add write verification to direct page writes in flash_writev
  jffs2: add write verification to NOR direct write paths
  jffs2: rename CONFIG_JFFS2_FS_WBUF_VERIFY to
    CONFIG_JFFS2_FS_WRITE_VERIFY
  jffs2: add runtime toggle for write verification

 arch/arm/configs/keystone_defconfig     |   2 +-
 arch/arm/configs/lpc32xx_defconfig      |   2 +-
 arch/arm/configs/pxa3xx_defconfig       |   2 +-
 arch/arm/configs/pxa_defconfig          |   2 +-
 arch/powerpc/configs/44x/fsp2_defconfig |   2 +-
 fs/jffs2/Kconfig                        |  31 ++++-
 fs/jffs2/jffs2_fs_sb.h                  |   3 -
 fs/jffs2/os-linux.h                     |  11 ++
 fs/jffs2/wbuf.c                         |  93 +++------------
 fs/jffs2/writev.c                       | 144 +++++++++++++++++++++++-
 10 files changed, 199 insertions(+), 93 deletions(-)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
