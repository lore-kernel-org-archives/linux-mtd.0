Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35471CD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BrsIf3/xABbgXRMNAV8dpy3hfX+N68N0TdPBCc4nsc=; b=vLbZzjb1YVRtq7
	BP/zJWDxlFfu/N/aXQfvlYCpFlQDZ6atwlRPkKsunjn2SL69uCwioUuxSaN4k8WVoouCCjQDAjOix
	YLuXSnCtjyv/XbnHykmg/6dGL0/4lcz0t9X6IXtIIqZqfZRn7YgxOHb9YneMoERgyJ944e5jFPI2y
	yFDhU/9S0fMSeV9N6Q7e+xODtf5hN3L0r3zv/oc8uaDSYuY6rO9nns3dLyoQEgSJ0I/CE2GS1xvk8
	VWd/+WDsmpqIUAjWMWyghIP4GRkbEbWaEMd+j8WmtY0yiIf3MtI3eDFvv5ktDg4EBi4Rob6iGVq5k
	33v9XdBz0oN8DzjPvyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDr-00000002FzX-1ZhA;
	Tue, 26 May 2026 14:57:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDn-00000002FrA-0WfG
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fuP7SURbB389DlOoupYcupsddC8ij3RtWG4f6zctuq0=; b=hC0vNjtOwpIo5uNLEVBlwREjyH
	+UjiPdsFzhObskxaijjMzp7HOcuj7a5qCP9M8SgC40X0ZGiQGBB2LdH/lTn4kFh5zO4Pk3MbO6pIL
	8eyhTSH1Buzj4cxDod8/iDo/Nz5fs/RDfKErpacAkHyzSQvqWFcyk3ubzAzqfEQslEJ+I7KQazOUe
	TQXM8N8Fp0y8TiIOCIMe6TA+e75Ev9NT984Na1kAlE5KF9ja5pfXdUHu6odF2/rMKQHtw40UnSS08
	E/ZxqLt5Ub6iFJ0kz3oEUCFhMf60caPVkY9eEZkWWRLWV7nxw/mmhl1GTmrVUH5tS0mp8ROh+097A
	HA8RXnwA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDi-0000000BasV-09IQ
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8AD9C79ABE;
	Tue, 26 May 2026 14:57:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B08D6011D;
	Tue, 26 May 2026 14:57:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 241FB108888A7;
	Tue, 26 May 2026 16:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fuP7SURbB389DlOoupYcupsddC8ij3RtWG4f6zctuq0=;
	b=0Z0C7Hfi6JgfxaIK0CjhwjNfLqzTasNtK0VbnCY/A2P4S+J9+ILG17i9Cd4TLZ4ImzsinF
	3gYiIR4zqDMS/uWIKe9clmKtCmq2SCfyRuqa626rapaVctHk0GpFd8ZHv4nCD3+H9jRDo5
	0CEPDLtlyW9U/kK20fVmbZEjmApoIjMeItE7R+G7inmINoEXPsTMhluHpihC0mzprHYfx/
	XGA3V376+bQKd1uGkPI1IemVpyUhMG6sqbkUT6vt19+UYxisaBz16WVOi5vcSh38lmRz6F
	kIZVfBYgSxet1IPt6i9F7gFGAJW/MofGswjn/P3OZtI9etivagUKCpuiXwqjzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:42 +0200
Subject: [PATCH v6 18/28] mtd: spi-nor: debugfs: Add locking support
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-18-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_155726_483322_CF760A5A 
X-CRM114-Status: GOOD (  20.35  )
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

The ioctl output may be counter intuitive in some cases. Asking for a
"locked status" over a region that is only partially locked will return
"unlocked" whereas in practice maybe the biggest part is actually
locked.

Knowing what is the real software locking state through debugfs would be
very convenient for development/debugging purposes, hence this proposal
for adding an extra block at the end of the file: a "locked sectors"
array which lists every section, if it is locked or not, showing both
the address ranges and the sizes in numbers of "lock sectors" (which on
small density devices is typically different than erase blocks).

Here is an example of output, what is after the "sector map" is new.

$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef a0 20 00 00 00
size		64.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP

opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-03ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Here are below more examples of output with various situations. The full
output of the "params" content has been manually removed to only show
what has been added and how it behaves.

$ flash_lock -l /dev/mtd0 0x3f00000 16
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03efffff | unlocked | 1008
 03f00000-03ffffff |   locked | 16
$
$ flash_lock -u /dev/mtd0 0x3f00000 8
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03f7ffff | unlocked | 1016
 03f80000-03ffffff |   locked | 8
$
$ flash_lock -u /dev/mtd0
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
$
$ flash_lock -l /dev/mtd0
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
$
$ flash_lock -u /dev/mtd0 0x20000 1022
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
---
 drivers/mtd/spi-nor/core.h    |  8 ++++++++
 drivers/mtd/spi-nor/debugfs.c | 28 ++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/swp.c     | 13 +++++++++----
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index cd355e94b97e..ce46771ecdc8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -287,6 +287,9 @@ struct spi_nor_erase_map {
  *		false otherwise. This feedback may be misleading because users
  *		may get an "unlocked" status even though a subpart of the region
  *		is effectively locked.
+ *
+ * If in doubt during development, check-out the debugfs output which tries to
+ * be more user friendly.
  */
 struct spi_nor_locking_ops {
 	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);
@@ -678,6 +681,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_bfpt *bfpt);
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
+bool spi_nor_has_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
@@ -712,6 +716,10 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
 	return !nor->info->size;
 }
 
+u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor);
+void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs, u64 *len);
+bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr);
+
 #ifdef CONFIG_DEBUG_FS
 void spi_nor_debugfs_register(struct spi_nor *nor);
 void spi_nor_debugfs_shutdown(void);
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index d0191eb9f879..82df8ad4176c 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/debugfs.h>
+#include <linux/math64.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
@@ -77,11 +78,14 @@ static void spi_nor_print_flags(struct seq_file *s, unsigned long flags,
 static int spi_nor_params_show(struct seq_file *s, void *data)
 {
 	struct spi_nor *nor = s->private;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
 	const struct flash_info *info = nor->info;
 	char buf[16], *str;
+	loff_t lock_start;
+	u64 lock_length;
 	unsigned int i;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
@@ -159,6 +163,30 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 			   region[i].overlaid ? "yes" : "no");
 	}
 
+	if (!spi_nor_has_default_locking_ops(nor))
+		return 0;
+
+	seq_puts(s, "\nlocked sectors\n");
+	seq_puts(s, " region (in hex)   | status   | #sectors\n");
+	seq_puts(s, " ------------------+----------+---------\n");
+
+	spi_nor_get_locked_range_sr(nor, nor->dfs_sr_cache, &lock_start, &lock_length);
+	if (!lock_length || lock_length == params->size) {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
+			   lock_length ? "  locked" : "unlocked",
+			   div_u64(params->size, min_prot_len));
+	} else if (!lock_start) {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
+			   "  locked", div_u64(lock_length, min_prot_len));
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->size - 1,
+			   "unlocked", div_u64(params->size - lock_length, min_prot_len));
+	} else {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
+			   "unlocked", div_u64(lock_start, min_prot_len));
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->size - 1,
+			   "  locked", div_u64(lock_length, min_prot_len));
+	}
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index cd37fec08c0e..2411d8f1012d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -34,7 +34,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 		return 0;
 }
 
-static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
+u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
 	/*
@@ -55,8 +55,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 		return sector_size;
 }
 
-static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
-					u64 *len)
+void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
+				 u64 *len)
 {
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
@@ -114,7 +114,7 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
+bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
@@ -416,6 +416,11 @@ void spi_nor_init_default_locking_ops(struct spi_nor *nor)
 	nor->params->locking_ops = &spi_nor_sr_locking_ops;
 }
 
+bool spi_nor_has_default_locking_ops(struct spi_nor *nor)
+{
+	return nor->params->locking_ops == &spi_nor_sr_locking_ops;
+}
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, u64 len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
