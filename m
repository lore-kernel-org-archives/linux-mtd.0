Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C10CE8D6D
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq1CKw9TVeibsA3sCDqxOGpUENE1IkzPVOviE6GAFlk=; b=yK99TU53RK7aG0
	SMDo0rBYHyt7aM0+HegLv00mVx+lcTlAI9nwsm5pu5zYpW1NXdTgkbqWC2aGWoV4cyjFq+7dHyp4N
	Pw8UI3iakVDR4O25izy7uvqCAWcL52sP0NIxT3JunfjI7yHCiixn9AAGdnYYEpvcwMVy2E8wtkM7o
	B56NlFoTfBlSNMTLEu+IupERoq6283mJxJrCvGpOcE2Mbb5a+MUX7+8fuS/7fXk9sQTspmEhmNguu
	Wn2sDlHE2yZ6w5WHhk+n1yeh5+ITR50pNSmlHCAZ/7c8ISS0Lvngh8ix8pBD2sARmCXggn6mnuKYK
	8MTFzcbMe6dmShSzh16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzn-0000000Ctc9-1gEn;
	Fri, 14 Nov 2025 17:54:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzk-0000000CtWy-0XY4
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Nov 2025 17:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=gCuaCGaCHIkyu7W9o4eBvTZmz3GLQFDeWRN5y/7noeM=; b=FrFihXguWG+MT+JQfMCqeSh2JP
	5bkAIIlki9hf9RUkIuBzkPeWr9cfE1dhCpsUxVpGN8pizEGJPbQg53Hs0E5UAOmQqJupCR5rHZtj5
	DD8CJhUxxOvZbTnASUiHSBe2RoU3Lle1ijUpUl9npfk08aW48InZXLySKykjjcZx+HDYYtZvvZDmE
	U8Ec3Dol9usx4spFmlPQNEGxkVcXcZrk9RJL8QOgRaShCOv8mAZUTYIkBUk8mHGHFh+jOdibDyIJI
	6Uu01CvOFeJvd8CL5iyrVnGkirfc4N1l92uL4zahHUYsilrKvNZyCyi1DkHvnCz79YCjhA6gBStJL
	OZMizR+w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzg-00000009i2p-0FgE
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B3281A1AAE;
	Fri, 14 Nov 2025 17:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AEB06060E;
	Fri, 14 Nov 2025 17:53:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA1E810371A38;
	Fri, 14 Nov 2025 18:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6+ctLl4ejJ6iLdC9ze9jcXv5X1NqNi39fmF+JRNBHi4=;
	b=EvEeCHoALy2grJy56u4DP9ospqIyk44S4QaUPODoeizjQVZTZvMo0HS2ggQRXrqMkCYD7T
	UYJ172Wfiw0LOCjULTLuIVdzN9gGoZ7p8j3uyH5AGTav5d+WVb9exzAOkfz5JT2wgR1kVI
	Givn9CyupDt850jlj6w6gdFDkdxaHz25wN4XwbCKm40NA05NmbHOMOO/RdfKgFAeQNInNf
	Yj8OEC8JehtzkgiIlR9TCiXLuBU4HbzYT9gH1LlOeFccdLVnNkZMkVv0cVTcZElDiyX2PF
	21atY2wGGWeO2IqFdwIgwxEwL9KDySA8ekAKiEzt0lhP49HjVupX4EQ7fCCgDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:16 +0100
Subject: [PATCH 15/19] mtd: spi-nor: debugfs: Add locking support
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-15-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_175356_163917_FF710981 
X-CRM114-Status: GOOD (  17.39  )
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
for adding two extra blocks at the end of the file:
- A "software locked sectors" array which lists every section, if it is
locked or not, showing both the address ranges and the sizes in numbers
of blocks.
- Some kind of mapping of the locked sectors, which pictures the entire
flash. It may be verbose, so perhaps we'll drop it in the end. I found
it very useful to really get a clearer mental model of what was
locked/unlocked, but the array just before is already a good source of
information.

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

software locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03ffffff | unlocked | 1024

64kiB-sectors locking map (x: locked, .: unlocked)
|.....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
 ...........................|

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Here are below more examples of output with various situations. The full
output of the "params" content has been manually removed to show just
the two added blocks.

$ flash_lock -l /dev/mtd0 0x3f00000 16
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
software locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03efffff | unlocked | 1008
 03f00000-03ffffff |   locked | 16

64kiB-sectors locking map (x: locked, .: unlocked)
|.....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
 ...........xxxxxxxxxxxxxxxx|
$ flash_lock -u /dev/mtd0 0x3f00000 8
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
software locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03f7ffff | unlocked | 1016
 03f80000-03ffffff |   locked | 8

64kiB-sectors locking map (x: locked, .: unlocked)
|.....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
 ...................xxxxxxxx|
$ flash_lock -u /dev/mtd0
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
software locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03ffffff | unlocked | 1024

64kiB-sectors locking map (x: locked, .: unlocked)
|.....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
 ...........................|
$ flash_lock -l /dev/mtd0
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
software locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03ffffff |   locked | 1024

64kiB-sectors locking map (x: locked, .: unlocked)
|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 xxxxxxxxxxxxxxxxxxxxxxxxxxx|
$ flash_lock -u /dev/mtd0 0x20000 1022
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
software locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022

64kiB-sectors locking map (x: locked, .: unlocked)
|xx...................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
 ...........................|
---
 drivers/mtd/spi-nor/core.h    |  4 ++++
 drivers/mtd/spi-nor/debugfs.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/swp.c     | 11 +++++++----
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 516ab19dc7b86a5c6ba8729d2ba18904b922df23..8a95592994f749a62b2cc70ab85f54d36681e760 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -700,6 +700,10 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
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
index d0191eb9f87956418dfd964fc1f16b21e3345049..d2af4c189aad68bab78c1c68688b5865eebef9b9 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -77,12 +77,16 @@ static void spi_nor_print_flags(struct seq_file *s, unsigned long flags,
 static int spi_nor_params_show(struct seq_file *s, void *data)
 {
 	struct spi_nor *nor = s->private;
+	unsigned int min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
 	const struct flash_info *info = nor->info;
+	loff_t lock_start, lock_length;
 	char buf[16], *str;
 	unsigned int i;
+	u8 sr[2] = {};
+	int ret;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
@@ -159,6 +163,47 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 			   region[i].overlaid ? "yes" : "no");
 	}
 
+	seq_puts(s, "\nsoftware locked sectors\n");
+	seq_puts(s, " region (in hex)   | status   | #blocks\n");
+	seq_puts(s, " ------------------+----------+--------\n");
+
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	sr[0] = nor->bouncebuf[0];
+
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+	}
+
+	sr[1] = nor->bouncebuf[1];
+
+	spi_nor_get_locked_range_sr(nor, sr, &lock_start, &lock_length);
+	if (!lock_length || lock_length == params->size) {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
+			   lock_length ? "  locked" : "unlocked", params->size / min_prot_len);
+	} else if (!lock_start) {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
+			   "  locked", lock_length / min_prot_len);
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->size - 1,
+			   "unlocked", (params->size - lock_length) / min_prot_len);
+	} else {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
+			   "unlocked", lock_start / min_prot_len);
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->size - 1,
+			   "  locked", lock_length / min_prot_len);
+	}
+
+	seq_printf(s, "\n%dkiB-sectors locking map (x: locked, .: unlocked)\n",
+		   min_prot_len / 1024);
+	seq_puts(s, "|");
+	for (i = 0; i < params->size; i += min_prot_len)
+		seq_printf(s, spi_nor_is_locked_sr(nor, i, min_prot_len, sr) ? "x" : ".");
+	seq_puts(s, "|\n");
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index f5ec05d6f2680113332f47e0efbcb4d88f0d3e3c..0e685aa3a4fdc3100b5259659a3083c14a2cf127 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -32,7 +32,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 		return SR_TB_BIT5;
 }
 
-static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
+u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
 	/*
@@ -53,8 +53,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 		return sector_size;
 }
 
-static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
-					u64 *len)
+void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
+				 u64 *len)
 {
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
@@ -112,7 +112,7 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
+bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
@@ -374,6 +374,9 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
  * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
  *               This feeback may be misleading because users may get an "unlocked"
  *               status even though a subpart of the region is effectively locked.
+ *
+ * If in doubt during development, check-out the debugfs output which tries to
+ * be more user friendly.
  */
 static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
 	.lock = spi_nor_sr_lock,

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
