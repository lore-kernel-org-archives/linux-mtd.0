Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79744CA9EC1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GF4Tc3bNa5J9Lixh2A8fZjPF5sCJ9nJ8kyw9EzNpR4=; b=uqq+6UpHYWWKkk
	l9zRirhBS9XfIbMRh6SMMpw73CkKG4H9X7O0FDP+69Pvl0YXJrbLLrLpUETWluHGpS6MPLB/7aLSK
	8hfempY6+jvaoCU0OQsvLiHn+acfm7GkYeEc/nvLxMhgazWhwFCFAXm2rOCTnf0Wx9mzFatyT70pz
	iJhedx8HHTimH9ZoOtL5j2PBEiJbQFwXTWe8VSlks9E/EiDi2M5hM6DNlbekQXKOxMwI27d9E+ST3
	sng/B01EPNYgxKOB+oJC1Iq4hwyQ8c08jLw2iIe/hzXnVnVslnG7GmBf3Hqp1xOjo6Im0Ssqr+l2j
	A79e2xaEDDj4t9V4w1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFale-00000008K7t-0ZqD;
	Sat, 10 Oct 2026 17:21:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFalZ-00000008K6N-0JKB
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 17:21:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4956869750eso5306825e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652907; x=1792257707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keoG8XwVgpA6EDDGDJlk3W6Or07o/787lmm8XZwarFg=;
        b=gMVTSmN4fSWictWs5uHgfwuW53fWIMXBejkZ9oz8gXPaeJ6a0BTqsRsVtm7vGQcGpU
         mh3W1MPftv83k2AC4Oa4jODI84+UKuneienMn2qzYpEVmPN3t3q3ufh3G484ciN68MPG
         IpRPJ5oyq2VpO0dlJlw+MpXNPz60DtjxsdEG3KET5MEBpRjCwrAMZBd/PFKYpJdLoI9v
         nJD04TohSakGnF4yEH5KcMR3RD9WDtVmhKysmM099VOY23iHOFfhKU4P/hJiwb+K6JpC
         iWetRT4dIW4QtusJR3KSQZb8mjXpf+7/RI3JwpcTQwSFKSSErdlexb8deo82AL3l64ed
         N93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652907; x=1792257707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=keoG8XwVgpA6EDDGDJlk3W6Or07o/787lmm8XZwarFg=;
        b=hWWs5Q+XOCZBGCyKvo62wSJoa7+YPPHxf6j5dvV6do0pcLTtgEAhvZtQ0VF7KO/j9Q
         y7eIcWSZWGtshwsd9JZMx1FqhFig3QbLzcJx4IMRl7CXp/tVWdLYSOOVk+M2Va7Zv/bP
         gNjdbOhLKYC7pFzlVkuVLC0QplErQ749YYXmGzIbwpRZKB8O8Ujr15ckkvUNKx1DEuE3
         IAKPBy2KbFlbv3Qhz9tQyV/IAJzNmr7in/oTvbym16SXGyDQG3ew0e7r8Dls1Jwxj/rC
         BJD0JzsfY1+FV3mMVMMEJxOROdgNwU9bT08AfHG3GeulkjEZhzqxPtz5NSoHWy3DkxMG
         3S/Q==
X-Gm-Message-State: AFq9FYJ9cwZbGdYB1lkILs/jWMPV94qOEJEP+rXIvW0yR84t710HKEEl
	0p5advc0LuscEOLwZ3BF7wDpplYPhX42fNzi0HQRLb+yBJj14u6StKMy
X-Gm-Gg: AYBFou1t+1A3x0Gm1/BkQ6i+b8uJmCQKmAwnK8vddSX7qsZmclFeMmh2Exku0RLjhYu
	ZGkZnrPQo4wETOTGATdT/MyeqsDL1JNcqD5bSelez2DdtcvrqSKDicUD4TnIq/ixgfvZbVsuuqL
	m7dzkGxz7VnfxOYM6t4Yc1ep2HgtTxgGDkzGmSpQtXhxLlO1ecwXERmrefSpCIJV+ncFFPnBTWx
	middPzTstYIY/+PD8RnQWPyPFmwZL/lWrEnV5HkH+01m5ukrJZwNRVX7B3OWuDZKC7E2FEZlsqW
	i2G/m2Nk1f8pVxu3ZwtUVNAcgo3myQ8Cuc6yjqIf70QisvhYl2ebs19hGl+PrkiJHAOTfVtlDMU
	6lo8A61jg/kRODkqI9MsvqNnkFi2/Yz/JDGRZY6cK8VROXIIAM7vAYYrjlm+1VJGSNfBVaDUGe5
	uiJd0D+VJE1a7PzcnHrDX6sJUjSQul3hK++l5fJEjKq+Y0cVzMQEFEfTwtlzpkvezyl9kvDWm43
	Ab24xRC7KG2aNfxgVzOsUa5h38jRdQRBs8++RK1++jPoi4sAghRSDdw9nPalJ3lLEhqjGfwSGg5
	5r44dyTAJcqodD9UFM44HGMHfEg=
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr100564775e9.29.1791652906732;
        Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Sat, 10 Oct 2026 17:21:41 +0000
Message-ID: <20261010172142.2138956-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_102149_164530_7A2D5753 
X-CRM114-Status: GOOD (  32.31  )
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

cfi_cmdset_0001 lets a linearly mapped chip be pointed at, so jffs2 can
scan it in place. cfi_cmdset_0002 never got point(), and the jffs2 mount
on an AMD-style NOR copies every used eraseblock through
map_copy_from() instead.

Add a point()/unpoint() pair modeled on cfi_intelext_point(), entering
array mode with the AMD reset command; get_chip() already handles
FL_POINT. Like cfi_cmdset_0001 it is only enabled for maps that are
linear and read through the simple accessors. Where it differs:

- Points share the chip when no operation is suspended, and the reboot
  reset may proceed from an idle FL_POINT (the chip is already in array
  mode); an unpoint after that reset is not an error. On cfi_cmdset_0001
  a point held across reboot leaves cfi_intelext_reset() waiting
  forever.
- unpoint() releases the chip only when the last reference goes, and
  point() returns the error when nothing could be pointed.

As with cfi_cmdset_0001, a held point makes writes, erases and sync on
that chip wait uninterruptibly for the last unpoint, and system suspend
fails with -EAGAIN. That matters for cramfs on MTD (CONFIG_CRAMFS_MTD),
which keeps its whole image pointed while mounted: before this patch
mtd_point() failed on AMD chips and cramfs fell back to the block
device; now, with cramfs and jffs2 on the same chip, jffs2 writes and
garbage collection, flash_erase, sync(2) - and so reboot(8), which syncs
first - block until cramfs is unmounted. Name cfi_cmdset_0002 next to
cfi_cmdset_0001 in the cramfs documentation's list of drivers that
support point().

On an Octeon CN6635 board with a 100 MB jffs2 partition on an M29EW
(8-bit bus, ~3.4 MB/s reads) the mount drops from 15-30 s to under 1 s.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 Documentation/filesystems/cramfs.rst |  11 +-
 drivers/mtd/chips/cfi_cmdset_0002.c  | 156 ++++++++++++++++++++++++++-
 2 files changed, 160 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/cramfs.rst b/Documentation/filesystems/cramfs.rst
index 221c0bf..7b706c5 100644
--- a/Documentation/filesystems/cramfs.rst
+++ b/Documentation/filesystems/cramfs.rst
@@ -75,11 +75,12 @@ The location of the cramfs image in memory is system dependent. You must
 know the proper physical address where the cramfs image is located and
 configure an MTD device for it. Also, that MTD device must be supported
 by a map driver that implements the "point" method. Examples of such
-MTD drivers are cfi_cmdset_0001 (Intel/Sharp CFI flash) or physmap
-(Flash device in physical memory map). MTD partitions based on such devices
-are fine too. Then that device should be specified with the "mtd:" prefix
-as the mount device argument. For example, to mount the MTD device named
-"fs_partition" on the /mnt directory::
+MTD drivers are cfi_cmdset_0001 (Intel/Sharp CFI flash), cfi_cmdset_0002
+(AMD/Fujitsu CFI flash) or physmap (Flash device in physical memory map).
+MTD partitions based on such devices are fine too. Then that device should
+be specified with the "mtd:" prefix as the mount device argument. For
+example, to mount the MTD device named "fs_partition" on the /mnt
+directory::
 
     $ mount -t cramfs mtd:fs_partition /mnt
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index bd4f1ed..67dfa8f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -63,6 +63,9 @@ enum cfi_quirks {
 };
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_point(struct mtd_info *mtd, loff_t from, size_t len,
+			    size_t *retlen, void **virt, resource_size_t *phys);
+static int cfi_amdstd_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 #if !FORCE_WORD_WRITE
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -512,6 +515,22 @@ static struct cfi_fixup jedec_fixup_table[] = {
 	{ 0, 0, NULL }
 };
 
+/*
+ * Let jffs2 scan a linearly mapped flash in place, as cfi_cmdset_0001
+ * does: without point() its mount copies every used eraseblock. Only
+ * for maps read through the simple accessors - a pointer bypasses any
+ * byte swapping or bus locking a map driver does in its own.
+ */
+static void fixup_use_point(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
+		mtd->_point   = cfi_amdstd_point;
+		mtd->_unpoint = cfi_amdstd_unpoint;
+	}
+}
+
 static struct cfi_fixup fixup_table[] = {
 	/* The CFI vendor ids and the JEDEC vendor IDs appear
 	 * to be common.  It is like the devices id's are as
@@ -519,6 +538,7 @@ static struct cfi_fixup fixup_table[] = {
 	 * we know that is the case.
 	 */
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point },
 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },
 	{ 0, 0, NULL }
 };
@@ -976,8 +996,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return -EIO;
 
 	case FL_POINT:
-		/* Only if there's no operation suspended... */
-		if (mode == FL_READY && chip->oldstate == FL_READY)
+		/*
+		 * Only if there's no operation suspended: the chip is in
+		 * array mode, so reads, further points and the reboot
+		 * reset (which only re-enters array mode) can go ahead.
+		 */
+		if ((mode == FL_READY || mode == FL_POINT ||
+		     mode == FL_SHUTDOWN) && chip->oldstate == FL_READY)
 			return 0;
 		fallthrough;
 	default:
@@ -1216,6 +1241,133 @@ do {  \
 
 #endif
 
+static int do_point_onechip(struct map_info *map, struct flchip *chip,
+			    loff_t adr, size_t len)
+{
+	unsigned long cmd_addr;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret;
+
+	adr += chip->start;
+
+	/* Ensure cmd read/writes are aligned. */
+	cmd_addr = adr & ~(map_bankwidth(map) - 1);
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, cmd_addr, FL_POINT);
+	if (!ret) {
+		if (chip->state != FL_POINT && chip->state != FL_READY)
+			map_write(map, CMD(0xf0), cmd_addr);
+
+		chip->state = FL_POINT;
+		chip->ref_point_counter++;
+	}
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
+static int cfi_amdstd_point(struct mtd_info *mtd, loff_t from, size_t len,
+			    size_t *retlen, void **virt, resource_size_t *phys)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long ofs, last_end = 0;
+	int chipnum;
+	int ret = -EINVAL;
+
+	if (!map->virt)
+		return -EINVAL;
+
+	/* ofs: offset within the first chip that the first read should start */
+	chipnum = (from >> cfi->chipshift);
+	ofs = from - (chipnum << cfi->chipshift);
+
+	*virt = map->virt + cfi->chips[chipnum].start + ofs;
+	if (phys)
+		*phys = map->phys + cfi->chips[chipnum].start + ofs;
+
+	while (len) {
+		unsigned long thislen;
+
+		if (chipnum >= cfi->numchips)
+			break;
+
+		/* We cannot point across chips that are virtually disjoint */
+		if (!last_end)
+			last_end = cfi->chips[chipnum].start;
+		else if (cfi->chips[chipnum].start != last_end)
+			break;
+
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
+		else
+			thislen = len;
+
+		ret = do_point_onechip(map, &cfi->chips[chipnum], ofs, thislen);
+		if (ret)
+			break;
+
+		*retlen += thislen;
+		len -= thislen;
+
+		ofs = 0;
+		last_end += 1 << cfi->chipshift;
+		chipnum++;
+	}
+	return *retlen ? 0 : ret;
+}
+
+static int cfi_amdstd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long ofs;
+	int chipnum, err = 0;
+
+	/* ofs: offset within the first chip that the first read should start */
+	chipnum = (from >> cfi->chipshift);
+	ofs = from - (chipnum << cfi->chipshift);
+
+	while (len && !err) {
+		unsigned long thislen;
+		struct flchip *chip;
+
+		if (chipnum >= cfi->numchips)
+			break;
+		chip = &cfi->chips[chipnum];
+
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
+		else
+			thislen = len;
+
+		mutex_lock(&chip->mutex);
+		if (chip->state == FL_POINT) {
+			/* The last reader resumes whatever the first suspended */
+			if (--chip->ref_point_counter == 0) {
+				chip->state = FL_READY;
+				put_chip(map, chip, chip->start);
+			}
+		} else if (chip->state != FL_SHUTDOWN) {
+			/*
+			 * After the reboot reset nothing is pointed any more;
+			 * ref_point_counter no longer matters there.
+			 */
+			pr_err("%s: Error: unpoint called on non pointed region\n",
+			       map->name);
+			err = -EINVAL;
+		}
+		mutex_unlock(&chip->mutex);
+
+		len -= thislen;
+		ofs = 0;
+		chipnum++;
+	}
+
+	return err;
+}
+
 static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
 	unsigned long cmd_addr;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
