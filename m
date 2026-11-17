Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D670606A33D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dee/RhJ1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulZCCr+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lcIDAHuwksmv3dV8pRGGqizLFFVovZ7sT5DpMH5q3+U=; b=Dee/RhJ1CXUVKSNEBVtbtVJC51
	vbC027bVRyolrpnGF8HypseJcFN692CsAxOkD56BGBp3YvUcd8YiaTm/uP6snIOY3h6eKoxe/JYJa
	KyTG0pCYtbHE3DIJ8pp7/uyfHhVB3lMdrxPTWIiQrJjtYYa2z/hgharUf2OeKwyT6izSBpwNUNvxs
	sJwCJc/8fFJhmr+BhcuCTlG3aFZ3bfFLMSo0XqZ4jEPHSGThsdnUsZ77m4beYsSbkGv7Rfs0Bq191
	n/aeLYpRNPHBidtxZVUnieg+V0Gted2D7f4sTVdBHxWE9yDpnUdll8sccRUC5SxwXiqOjmQvSF8N7
	aKYvOUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw3-000000079GW-30O5;
	Tue, 17 Nov 2026 21:41:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw0-000000079F9-3bIG
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 21:41:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so131387f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951707; x=1795556507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9ECy7qx0HTIAGTgptqCz6Ap2mwcl7ltxQWIu4DbPCE=;
        b=ulZCCr+aytXXLrlSspryp3uGAlr3a7Y7VrCFUV/kuJjF/lFFZ6nZDaKDKFG2MiDZLy
         QWhBr5QsuSQ6C5O6vvU26WxaYd922i2CBAGH8c6kvFzFi6RRhesB7YQEGsBfSFHgzrrJ
         7e5W6RcUWETUTCnrbnK5s2Rh2kaAPqOgGClDjMLvwU+oXUEHPAtsGFANJ3SeN6Vx1tBD
         TwYGt2UfRIx6fdOVKcjs1wg5q6f6VY5XGN4vi02ej6qzwB+eW8JvY2gF3eTs6l1rvd9F
         N4ccj+/zSgxNNk6GL4Uc0Bawb+O/G32rqMmIkuK7+OMD6lfYo7cTymtB7OqZDJzncd7b
         oTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951707; x=1795556507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9ECy7qx0HTIAGTgptqCz6Ap2mwcl7ltxQWIu4DbPCE=;
        b=ExZih4evuXky4kmaT9bPOdpzbPPDmYDGtf/THN09UPbNDn7w8uLYNbwNUiATBesADc
         VCFiEwmY6pXaperDPnb37nvebsBdlY0Rads8OIrSIUm9/V91b+xj6gCpvVLw5i16KJk9
         zlgxfsXqDfT+UOvxDl25yVKIrd4OOzqhF9CJlObrcnWvKBaWRqMeL5WbSMGDSaht4vMH
         79Us9wtgoIW7lcrJRUqdpU/Bi6bendEbxZftpa9/n5UzLbzlFwo2K5W8ZwVXg/gpUHUm
         fYx8ONyKGk8O33ZS3Omv8KbiTY5hC1tTyhhhYT6GHDwC1u0OOHBbrIxnCcapW4mRo5/i
         Mz4w==
X-Gm-Message-State: APuU4Z+OtL651D8/Ui5WC537t+Z3kNWLcZg3c0O2CnI2XVTcxPNHLtXo
	JkvZVE455BfMe4s0bZT8qW5MzGTU9HCIxx4zCpnfnHvPEUWuTgdcqsFn
X-Gm-Gg: AZFdTZcd5jTfWmHdVNyz5lDIhUYjXoI2I+ZppIPgbzHUFRsO0FbKeGqFUKa3g42fwEy
	ndLFIO1tBC/H7A8dlxdhQjAO8SfjFIHm/xQq7Ggysstm2nm/Fvelw+PEcVbALXwoyH1090sqKco
	NoNhdv9pRxfSbUFuVDpPoCajAbqKxpuXwG5I8pEacdcA2Qi4IsOW5YxO3jk7eGQ8rBvkYHuyAO9
	D9leNJyBfyV+posdo+/pzhQUBsPacgiF52LqhdbtX2/iyNC7URc2Rtb9tmxvHYv89BU/oB5QI+/
	wxRx/kYyQEuWRBJp7/WWMp8sbW+iXkqfpilbwor/9pnZluX+EUZHMqUFLkvqVYaajhON6m1qSgw
	M+ynitNT5JrEvoNt4jOjIE0ecW7kFDe9HjkxYm9JE/Clkn/645HPxgwUeHAdjckrOlPuwf6rwaz
	D4V/p8GVBAm5vNb2v2ivVHeT05WdHc/vwfYdPghNVkuhNVE3wArmSimbOX1uOsmU8/Sir006xci
	pptH50WPI5pDp72BMJnztmFP8nw7vqjLPrIzZwtNTJbosnCUaDo7eWQJqSxB4Yvz/xAc38rNdkF
	kAPpHiWiavQ3+mehcGyjsMSlWHpq6nmALHlLnGZ1EPDlgeEvBP7MJI+LOSzKaZiz/8A7U+MI4AD
	mbtRS9p8rmWsg6SbqhxQo0qnAALrdCvzKa/RU/GWaLFoIGp4pyw2+nqmHBimuQB5xwnx0
X-Received: by 2002:a05:6000:2602:b0:4a2:edb3:5d45 with SMTP id ffacd0b85a97d-4a63ae58033mr1542726f8f.41.1794951706891;
        Tue, 17 Nov 2026 13:41:46 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:46 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 2/4] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Tue, 17 Nov 2026 21:41:39 +0000
Message-ID: <20261117214141.3826637-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134148_978627_AC6C6E03 
X-CRM114-Status: GOOD (  36.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cfi_cmdset_0001 lets a linearly mapped chip be pointed at, so jffs2 can
scan it in place. cfi_cmdset_0002 never got point(), and the jffs2 mount
on an AMD-style NOR copies every used eraseblock through
map_copy_from() instead.

Add a point()/unpoint() pair modeled on cfi_intelext_point(), entering
array mode with the AMD reset command; get_chip() has an FL_POINT case
already, adjusted below. Like cfi_cmdset_0001 it is only enabled for
maps that are linear and read through the simple accessors. Where it
differs:

- Points share the chip when no operation is suspended, and the reboot
  reset may proceed from an idle FL_POINT (the chip is already in array
  mode); an unpoint after that reset is not an error. On cfi_cmdset_0001
  a point held across reboot leaves cfi_intelext_reset() waiting
  forever.
- unpoint() releases the chip only when the last reference goes, and
  point() returns the error when nothing could be pointed.
- A point never suspends an erase; it waits for the erase to finish.
  The erase would otherwise stay suspended for as long as the point
  is held, and the reboot reset with it. The cost: jffs2 also points
  at a data node the first time it checks its CRC
  (check_node_data()), so such a read that meets a garbage-collection
  erase now waits for that sector erase to finish, where mtd_read()
  would have suspended it.

As with cfi_cmdset_0001, a held point makes writes, erases and
mtd_sync() on that chip wait uninterruptibly for the last unpoint, and
system suspend fails with -EAGAIN. That matters for cramfs on MTD
(CONFIG_CRAMFS_MTD), which keeps its whole image pointed while
mounted: before this patch mtd_point() failed on AMD chips and cramfs
fell back to the block device; now, with cramfs and jffs2 on the same
chip, jffs2 writes and garbage collection, flash_erase, and the
mtd_sync() in jffs2's umount - so a shutdown that unmounts jffs2 while
cramfs is still the root - block until cramfs is unmounted.

Name cfi_cmdset_0002 next to cfi_cmdset_0001 in the cramfs
documentation's list of drivers that support point().

On an Octeon CN6635 board with a 100 MB jffs2 partition on an M29EW
(8-bit bus, ~3.4 MB/s reads) the mount drops from 15-30 s to under 1 s.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: David Woodhouse <dwmw2@infradead.org>
---
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
v3: the same for an XIP erase: FL_XIP_WHILE_ERASING no longer lets a
    point through (sashiko). The changelog states what waiting for
    the erase costs a jffs2 read, and names jffs2's umount mtd_sync()
    rather than sync(2) as what blocks behind a cramfs point.
v2: a point no longer suspends an erase in progress; it waits for
    the erase instead (sashiko).

 Documentation/filesystems/cramfs.rst |  11 +-
 drivers/mtd/chips/cfi_cmdset_0002.c  | 167 ++++++++++++++++++++++++++-
 2 files changed, 168 insertions(+), 10 deletions(-)

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
index 100cab9..1fc2709 100644
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
@@ -511,6 +514,22 @@ static struct cfi_fixup jedec_fixup_table[] = {
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
@@ -518,6 +537,7 @@ static struct cfi_fixup fixup_table[] = {
 	 * we know that is the case.
 	 */
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point },
 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },
 	{ 0, 0, NULL }
 };
@@ -921,8 +941,12 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
 
@@ -963,8 +987,9 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return 0;
 
 	case FL_XIP_WHILE_ERASING:
-		if (mode != FL_READY && mode != FL_POINT &&
-		    (!cfip || !(cfip->EraseSuspend&2)))
+		/* Not for a point either, see FL_ERASING */
+		if (mode == FL_POINT ||
+		    (mode != FL_READY && (!cfip || !(cfip->EraseSuspend & 2))))
 			goto sleep;
 		chip->oldstate = chip->state;
 		chip->state = FL_READY;
@@ -975,8 +1000,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
@@ -1215,6 +1245,133 @@ do {  \
 
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
