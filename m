Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A9CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 18:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VK+pzUJsiFmQajnJC3xD1jSQc7oPYfIcpbGDKfg/hE=; b=HV4X4URW2pYCtb
	NBR4Ij7Kah10gzUIP4SPJkN07I2ITNgTcVmVVeKB1e7y/cSkmRuDSb6e8+UbFHTTFnzBsyB+nlvHQ
	vZXQ6qC+N6wgAf3It2aqllsmIY42Y1FJjzBUdbeClM/g16t5iJWWmFeArzehOuR7A6qDO72jHy+LB
	flwcZLg5HXlorECtj+4kez+pCg0bLlGEKcWpD6xMUXvFCI+E+L4YElXVEyFdQzp48qmc8QC41ir33
	cIYt6rNRxoVHE0b+hLjWFhpjzwV/zhO5/N/NL8kri3fdURfTI9ZbDtdAWlWGeyqkXBY4TaVXkMOzj
	ue9d1gCHLieivzh8yETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbV7-00000008MS3-2hJd;
	Sat, 10 Oct 2026 18:08:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbV4-00000008MQJ-3kCH
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 18:08:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8770005e9.3
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655729; x=1792260529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uu6tLw7RBdSZwF7/zjsiaXn5M72rA/y7SVsm74T1Ulw=;
        b=AWOlNWQ2jP7vCNyd/nTuL1Ohj3JcJjyZ9OoS8+W+HsjbMr6hZNjWg9tna5f9/In3Lf
         zQfL8v0IeANOCeXQ8ZWSU0p4WX923yzfIFY5TJJgqH8d1zpPBbgVk0pKpiLy4vZ9jbjo
         Pq+1igGy4DBA7w+zG+zSPAVLiJf48zcPsO6mBNrmQeIv5shh+m19VJYICV//I9iLmhrx
         NT9mahxqQYCnf80wvvXfM8vbhByBauBU39XimSFYU30f2GiMno7dFNXYF/AVXxC3u49m
         OWHgt3WMEVTV+cp90bxyEcRxpCYDWyMtyPFs6POFMOZf00sKIvCVS3Q0oqUFG78vrIiQ
         fR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655729; x=1792260529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uu6tLw7RBdSZwF7/zjsiaXn5M72rA/y7SVsm74T1Ulw=;
        b=ePnZs6DN933SwNce57gaCn8+eNJyG+gRHclLR0AfGdOsbtIN6ONW5Qm11CETP3tslo
         Cphnc6LZpdeRpTVnRfsvdstb3PjztVanlJPdvmDMpwxmLTei8gayHYtYO0aobL396KD5
         yaG/vmYtHJjEe70mvwXU7XWo9czV99doOcH2KZRoxakwzCYRlEXDB+q7nQnU1HSZQEw2
         g0RYg17rGDGJ/IoSAp1A//y04Y9FS2IBLVuyzt+JAFC1RmTwP26KI5f743bFcOkK2wSe
         grnPEDsTYh8aG6UgOnTik45lTbqL26lsTb3uQn8wucok+1ooF5SquajG4YPNywnMseN0
         QGPA==
X-Gm-Message-State: AFq9FYJx78ycknoNCSfbmyKNpAqcMs0+poOI50ALpjtluHk1aGqj5vxc
	29Ht9NOgtegtRv10UGWPBC6mKW6CN9OdG1QR8uP+crovE/dwwqA5bLj2
X-Gm-Gg: AYBFou30Aqc9Ks4mbcSHzX1IOaes3VMVIBuT2n93+xFQHdW+ZHVKGJk8GR7ZgpY5pw2
	E/J+qXsSHKZ6eNVT6wf14WfBWve9wSxrhTyOXoP5XJdyIR8qs/Z34hHfyQYwjif3O+X9O1l2VkQ
	7LWnMgJY5wWYuMMEnkZe1Qxrd59eLCZnKkWl4Ti3oKlpoBR/7Hbf9GeqaAbTENsgdSQnChFrPzP
	1l8nW3sVedZcgiQRBdiSuW3lRshigON08uXZjLF+wAmU9UqzRxpaYKJ+D9poZNWUJVikK8hC2Sg
	xV1pOmClXnCz/RjV7L3VbFyhocOuIsD5jNhTr08d5VaZkvLos1m9YczqPjLVkjgoXLriu7UuNPz
	AnffAd/3CKREZrpQgFGYeH/t9FyeIl0MNj1vmSbPW/aewLP06IWcKi+1yTtBGGGadkoD7otZh+D
	VvjZHTmf5bCUvvaoIN8jWjW00cAYiSQKUFUbfLFubGK8xYgUfhbyMQpgWaZohH5WUOMrvyV+FQw
	Q0v0WTytUBJYtdrdA95ywjjeu2l80lxCHYHep/zQPF5xAKP9uGb9UuArYgPMcVbXzduhiTgFREU
	/aPIYgBblo2pwzAJ
X-Received: by 2002:a05:6000:2383:b0:48a:f509:c22a with SMTP id ffacd0b85a97d-48dba703c63mr8497882f8f.0.1791655728619;
        Sat, 10 Oct 2026 11:08:48 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:47 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Sat, 10 Oct 2026 18:08:39 +0000
Message-ID: <20261010180840.2152492-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_110851_027874_8C08341D 
X-CRM114-Status: GOOD (  34.02  )
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
- A point never suspends an erase; it waits for the erase to finish.
  The erase would otherwise stay suspended for as long as the point
  is held, and the reboot reset with it.

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
v2: a point no longer suspends an erase in progress; it waits for
    the erase instead (sashiko).

 Documentation/filesystems/cramfs.rst |  11 +-
 drivers/mtd/chips/cfi_cmdset_0002.c  | 162 ++++++++++++++++++++++++++-
 2 files changed, 165 insertions(+), 8 deletions(-)

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
index bd4f1ed..7abb101 100644
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
@@ -922,8 +942,12 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return 0;
 
 	case FL_ERASING:
+		/*
+		 * Not for a point: the erase would stay suspended for as
+		 * long as it is held, which for cramfs is the whole mount.
+		 */
 		if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
-		    !(mode == FL_READY || mode == FL_POINT ||
+		    !(mode == FL_READY ||
 		    (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))
 			goto sleep;
 
@@ -976,8 +1000,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
@@ -1216,6 +1245,133 @@ do {  \
 
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
