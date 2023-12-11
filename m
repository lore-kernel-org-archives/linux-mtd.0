Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA31C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuQh2AkgZtZKdNVCTvxSS+BcqxeF9+Sbk0gxoFi5FGc=; b=sbN0CpkVNMhm3l
	J2l+LQBwBaM2n8T4gwbq1UO1urkY2a+Zj52c5z4k/72IU5V5VKMBwpmiJS5cPM4pvL/X3A1u55+Sj
	uCjVAcN9FZd4FEr73KMkiJRxzH9W3rWVfZu61t2eFq3bBV4aMSuNyX/Fg0R/ZA7wrZgt+11bBmNA9
	ef52Eu1I4snAAvkIAkD8lmqULR8TwHF/joExBHUOcX1WfWg/rFoIkYemxsTP6oJHn7MTm5zJkMENL
	I/AfSsqsQ1q26wDDy/4SuYw53CWPtomNDcmbycZnsK4SKOTK61X95MnjVhJf0ZdOCnVHamLG3NXOr
	lS5WV0jx85XupkjL2RCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChxp-005KN4-0x;
	Mon, 11 Dec 2023 15:12:57 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChxg-005KEg-0P
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 15:12:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2AA1E0017;
	Mon, 11 Dec 2023 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702307566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2JHxD84DRVgTb0d1ZhOrLjE36g3BfuxDbe2pYLA6Gw=;
	b=O8hGPUiQDtfQu17Xw+CO87hUBhs8vvpqaR19J7YEWHftLusXRdr98DReDmIaE6a1feZL3D
	r4h7xjTEyVnMQSJSqmgsBCbHcfDq9N9/sCal6XcPS9Jb7J5XbMdu6kwpVD8UGqq0HQdv7L
	6Ygp9g2rgB3AAVElpfESQWu4F8Gi9FM229Iio34gaSBVkNQ9afagrnv6sdV+KNKRL3RCPg
	B6v4KEqydcEaqjECUveDGirAyWwssPBSqPAFA93xUirsxo/nLXha/NB2a5ezO1s/OwarZe
	PMbCZeZ/ZPairuEuC5IlYJJc1F/VmLIn6dEUzHEuKmZ6218XEGEjhJ/+kHdwNg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [RFC PATCH 3/6] block: partitions: efi: Separate out GPT-specific code
Date: Mon, 11 Dec 2023 16:12:39 +0100
Message-ID: <20231211151244.289349-4-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211151244.289349-1-romain.gantois@bootlin.com>
References: <20231211151244.289349-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_071248_475378_0935FBBE 
X-CRM114-Status: GOOD (  25.09  )
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

The current GPT parser implemented in the block layer mixes
blockdev-specific code with GPT concepts. Separate out device-agnostic GPT
functions from the rest of the parser, in preparation for the creation of a
new generic purpose GPT parser library.

This mostly implies renaming functions and changing argument types. The
only significant change is the new gpt_validate_header function, which has
been separated out from the is_gpt_valid function.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 block/partitions/efi.c | 199 ++++++++++++++++++++++-------------------
 include/linux/gpt.h    |  37 +++++++-
 2 files changed, 143 insertions(+), 93 deletions(-)

diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index bac514a62d61..3630ebf4b997 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -151,7 +151,7 @@ static inline int pmbr_part_valid(gpt_mbr_record *part)
 }
 
 /**
- * is_pmbr_valid(): test Protective MBR for validity
+ * gpt_is_pmbr_valid(): test Protective MBR for validity
  * @mbr: pointer to a legacy mbr structure
  * @total_sectors: amount of sectors in the device
  *
@@ -168,7 +168,7 @@ static inline int pmbr_part_valid(gpt_mbr_record *part)
  * Returns 0 upon invalid MBR, or GPT_MBR_PROTECTIVE or
  * GPT_MBR_HYBRID depending on the device layout.
  */
-static int is_pmbr_valid(legacy_mbr *mbr, sector_t total_sectors)
+int gpt_is_pmbr_valid(legacy_mbr *mbr, sector_t total_sectors)
 {
 	uint32_t sz = 0;
 	int i, part = 0, ret = 0; /* invalid by default */
@@ -324,166 +324,183 @@ static gpt_header *alloc_read_gpt_header(struct parsed_partitions *state,
 }
 
 /**
- * is_gpt_valid() - tests one GPT header and PTEs for validity
- * @state: disk parsed partitions
- * @lba: logical block address of the GPT header to test
- * @gpt: GPT header ptr, filled on return.
- * @ptes: PTEs ptr, filled on return.
+ * gpt_validate_header() - tests one GPT header for validity
+ * @gpt:      header to check
+ * @lba:      logical block address of the GPT header to test
+ * @lba_size: logical block size of the partitioned device
+ * @lastlba:  last logical block on the partitioned device
  *
- * Description: returns 1 if valid,  0 on error.
- * If valid, returns pointers to newly allocated GPT header and PTEs.
+ * Returns 0 if validation was successful.
  */
-static int is_gpt_valid(struct parsed_partitions *state, u64 lba,
-			gpt_header **gpt, gpt_entry **ptes)
+int gpt_validate_header(gpt_header *gpt, u64 lba, unsigned int lba_size,
+			u64 lastlba)
 {
 	u32 crc, origcrc;
-	u64 lastlba, pt_size;
-
-	if (!ptes)
-		return 0;
-	if (!(*gpt = alloc_read_gpt_header(state, lba)))
-		return 0;
+	u64 pt_size;
 
 	/* Check the GUID Partition Table signature */
-	if (le64_to_cpu((*gpt)->signature) != GPT_HEADER_SIGNATURE) {
-		pr_debug("GUID Partition Table Header signature is wrong:"
-			 "%lld != %lld\n",
-			 (unsigned long long)le64_to_cpu((*gpt)->signature),
+	if (le64_to_cpu(gpt->signature) != GPT_HEADER_SIGNATURE) {
+		pr_debug("GUID Partition Table Header signature is wrong: %lld != %lld\n",
+			 (unsigned long long)le64_to_cpu(gpt->signature),
 			 (unsigned long long)GPT_HEADER_SIGNATURE);
-		goto fail;
+		return -EINVAL;
 	}
 
 	/* Check the GUID Partition Table header size is too big */
-	if (le32_to_cpu((*gpt)->header_size) >
-			queue_logical_block_size(state->disk->queue)) {
+	if (le32_to_cpu(gpt->header_size) > lba_size) {
 		pr_debug("GUID Partition Table Header size is too large: %u > %u\n",
-			le32_to_cpu((*gpt)->header_size),
-			queue_logical_block_size(state->disk->queue));
-		goto fail;
+			 le32_to_cpu(gpt->header_size), lba_size);
+		return -EINVAL;
 	}
 
 	/* Check the GUID Partition Table header size is too small */
-	if (le32_to_cpu((*gpt)->header_size) < sizeof(gpt_header)) {
+	if (le32_to_cpu(gpt->header_size) < sizeof(gpt_header)) {
 		pr_debug("GUID Partition Table Header size is too small: %u < %zu\n",
-			le32_to_cpu((*gpt)->header_size),
-			sizeof(gpt_header));
-		goto fail;
+			 le32_to_cpu(gpt->header_size),
+			 sizeof(gpt_header));
+		return -EINVAL;
 	}
 
 	/* Check the GUID Partition Table CRC */
-	origcrc = le32_to_cpu((*gpt)->header_crc32);
-	(*gpt)->header_crc32 = 0;
-	crc = efi_crc32((const unsigned char *) (*gpt), le32_to_cpu((*gpt)->header_size));
+	origcrc = le32_to_cpu(gpt->header_crc32);
+	gpt->header_crc32 = 0;
+	crc = efi_crc32((const unsigned char *)gpt, le32_to_cpu(gpt->header_size));
 
 	if (crc != origcrc) {
 		pr_debug("GUID Partition Table Header CRC is wrong: %x != %x\n",
 			 crc, origcrc);
-		goto fail;
+		return -EINVAL;
 	}
-	(*gpt)->header_crc32 = cpu_to_le32(origcrc);
+	gpt->header_crc32 = cpu_to_le32(origcrc);
 
 	/* Check that the my_lba entry points to the LBA that contains
-	 * the GUID Partition Table */
-	if (le64_to_cpu((*gpt)->my_lba) != lba) {
+	 * the GUID Partition Table
+	 */
+	if (le64_to_cpu(gpt->my_lba) != lba) {
 		pr_debug("GPT my_lba incorrect: %lld != %lld\n",
-			 (unsigned long long)le64_to_cpu((*gpt)->my_lba),
+			 (unsigned long long)le64_to_cpu(gpt->my_lba),
 			 (unsigned long long)lba);
-		goto fail;
+		return -EINVAL;
 	}
 
 	/* Check the first_usable_lba and last_usable_lba are
 	 * within the disk.
 	 */
-	lastlba = last_lba(state->disk);
-	if (le64_to_cpu((*gpt)->first_usable_lba) > lastlba) {
+	if (le64_to_cpu(gpt->first_usable_lba) > lastlba) {
 		pr_debug("GPT: first_usable_lba incorrect: %lld > %lld\n",
-			 (unsigned long long)le64_to_cpu((*gpt)->first_usable_lba),
+			 (unsigned long long)le64_to_cpu(gpt->first_usable_lba),
 			 (unsigned long long)lastlba);
-		goto fail;
+		return -EINVAL;
 	}
-	if (le64_to_cpu((*gpt)->last_usable_lba) > lastlba) {
+	if (le64_to_cpu(gpt->last_usable_lba) > lastlba) {
 		pr_debug("GPT: last_usable_lba incorrect: %lld > %lld\n",
-			 (unsigned long long)le64_to_cpu((*gpt)->last_usable_lba),
+			 (unsigned long long)le64_to_cpu(gpt->last_usable_lba),
 			 (unsigned long long)lastlba);
-		goto fail;
+		return -EINVAL;
 	}
-	if (le64_to_cpu((*gpt)->last_usable_lba) < le64_to_cpu((*gpt)->first_usable_lba)) {
+	if (le64_to_cpu(gpt->last_usable_lba) < le64_to_cpu(gpt->first_usable_lba)) {
 		pr_debug("GPT: last_usable_lba incorrect: %lld > %lld\n",
-			 (unsigned long long)le64_to_cpu((*gpt)->last_usable_lba),
-			 (unsigned long long)le64_to_cpu((*gpt)->first_usable_lba));
-		goto fail;
+			 (unsigned long long)le64_to_cpu(gpt->last_usable_lba),
+			 (unsigned long long)le64_to_cpu(gpt->first_usable_lba));
+		return -EINVAL;
 	}
+
 	/* Check that sizeof_partition_entry has the correct value */
-	if (le32_to_cpu((*gpt)->sizeof_partition_entry) != sizeof(gpt_entry)) {
+	if (le32_to_cpu(gpt->sizeof_partition_entry) != sizeof(gpt_entry)) {
 		pr_debug("GUID Partition Entry Size check failed.\n");
-		goto fail;
+		return -EINVAL;
 	}
 
 	/* Sanity check partition table size */
-	pt_size = (u64)le32_to_cpu((*gpt)->num_partition_entries) *
-		le32_to_cpu((*gpt)->sizeof_partition_entry);
+	pt_size = (u64)get_pt_size(gpt);
 	if (pt_size > KMALLOC_MAX_SIZE) {
 		pr_debug("GUID Partition Table is too large: %llu > %lu bytes\n",
 			 (unsigned long long)pt_size, KMALLOC_MAX_SIZE);
-		goto fail;
+		return -EINVAL;
 	}
 
-	if (!(*ptes = alloc_read_gpt_entries(state, *gpt)))
-		goto fail;
+	return 0;
+}
 
-	/* Check the GUID Partition Entry Array CRC */
-	crc = efi_crc32((const unsigned char *) (*ptes), pt_size);
+/* Check the GUID Partition Entry Array CRC */
+int gpt_check_pte_array_crc(gpt_header *gpt, gpt_entry *ptes)
+{
+	u32 crc;
 
-	if (crc != le32_to_cpu((*gpt)->partition_entry_array_crc32)) {
+	crc = efi_crc32((const unsigned char *)ptes, get_pt_size(gpt));
+	if (crc != le32_to_cpu(gpt->partition_entry_array_crc32)) {
 		pr_debug("GUID Partition Entry Array CRC check failed.\n");
-		goto fail_ptes;
+		return -EINVAL;
 	}
 
-	/* We're done, all's well */
-	return 1;
-
- fail_ptes:
-	kfree(*ptes);
-	*ptes = NULL;
- fail:
-	kfree(*gpt);
-	*gpt = NULL;
 	return 0;
 }
 
 /**
- * is_pte_valid() - tests one PTE for validity
- * @pte:pte to check
- * @lastlba: last lba of the disk
+ * is_gpt_valid() - tests one GPT header and PTEs for validity
+ * @state: disk parsed partitions
+ * @lba: logical block address of the GPT header to test
+ * @gpt: GPT header ptr, filled on return.
+ * @ptes: PTEs ptr, filled on return.
  *
  * Description: returns 1 if valid,  0 on error.
+ * If valid, returns pointers to newly allocated GPT header and PTEs.
  */
-static inline int
-is_pte_valid(const gpt_entry *pte, const u64 lastlba)
+static int is_gpt_valid(struct parsed_partitions *state, u64 lba,
+			gpt_header **gpt, gpt_entry **ptes)
 {
-	if ((!efi_guidcmp(pte->partition_type_guid, NULL_GUID)) ||
-	    le64_to_cpu(pte->starting_lba) > lastlba         ||
-	    le64_to_cpu(pte->ending_lba)   > lastlba)
+	u64 lastlba;
+
+	if (!ptes)
 		return 0;
+
+	*gpt = alloc_read_gpt_header(state, lba);
+	if (!(*gpt))
+		return 0;
+
+	lastlba = last_lba(state->disk);
+	if (gpt_validate_header(*gpt, lba,
+				queue_logical_block_size(state->disk->queue),
+				lastlba))
+		goto fail;
+
+	*ptes = alloc_read_gpt_entries(state, *gpt);
+	if (!(*ptes))
+		goto fail;
+
+	if (gpt_check_pte_array_crc(*gpt, *ptes))
+		goto fail_ptes;
+
+	/* We're done, all's well */
 	return 1;
+
+fail_ptes:
+	kfree(*ptes);
+	*ptes = NULL;
+fail:
+	kfree(*gpt);
+	*gpt = NULL;
+	return 0;
 }
 
 /**
- * compare_gpts() - Search disk for valid GPT headers and PTEs
+ * gpt_compare_alt() - Compares the Primary and Alternate GPT headers
  * @pgpt: primary GPT header
  * @agpt: alternate GPT header
  * @lastlba: last LBA number
  *
- * Description: Returns nothing.  Sanity checks pgpt and agpt fields
- * and prints warnings on discrepancies.
- * 
+ * Description: Sanity checks pgpt and agpt fields and prints warnings
+ * on discrepancies. Returns error count. GPT parsers can choose to
+ * ignore this or not.
+ *
  */
-static void
-compare_gpts(gpt_header *pgpt, gpt_header *agpt, u64 lastlba)
+int gpt_compare_alt(gpt_header *pgpt, gpt_header *agpt, u64 lastlba)
 {
 	int error_found = 0;
+
 	if (!pgpt || !agpt)
-		return;
+		return -EINVAL;
+
 	if (le64_to_cpu(pgpt->my_lba) != le64_to_cpu(agpt->alternate_lba)) {
 		pr_warn("GPT:Primary header LBA != Alt. header alternate_lba\n");
 		pr_warn("GPT:%lld != %lld\n",
@@ -557,7 +574,7 @@ compare_gpts(gpt_header *pgpt, gpt_header *agpt, u64 lastlba)
 
 	if (error_found)
 		pr_warn("GPT: Use GNU Parted to correct GPT errors.\n");
-	return;
+	return error_found;
 }
 
 /**
@@ -601,7 +618,7 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
 			goto fail;
 
 		read_lba(state, 0, (u8 *)legacymbr, sizeof(*legacymbr));
-		good_pmbr = is_pmbr_valid(legacymbr, total_sectors);
+		good_pmbr = gpt_is_pmbr_valid(legacymbr, total_sectors);
 		kfree(legacymbr);
 
 		if (!good_pmbr)
@@ -635,7 +652,7 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
 	if (!good_pgpt && !good_agpt)
 		goto fail;
 
-        compare_gpts(pgpt, agpt, lastlba);
+	gpt_compare_alt(pgpt, agpt, lastlba);
 
 	/* The good cases */
 	if (good_pgpt) {
@@ -674,7 +691,7 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
  * Description: Converts @size UTF16-LE symbols from @in string to 7-bit
  * ASCII characters and stores them to @out. Adds trailing zero to @out array.
  */
-static void utf16_le_to_7bit(const __le16 *in, unsigned int size, u8 *out)
+void utf16_le_to_7bit(const __le16 *in, unsigned int size, u8 *out)
 {
 	unsigned int i = 0;
 
@@ -731,7 +748,7 @@ int efi_partition(struct parsed_partitions *state)
 		u64 size = le64_to_cpu(ptes[i].ending_lba) -
 			le64_to_cpu(ptes[i].starting_lba) + 1ULL;
 
-		if (!is_pte_valid(&ptes[i], last_lba(state->disk)))
+		if (!gpt_is_pte_valid(&ptes[i], last_lba(state->disk)))
 			continue;
 
 		put_partition(state, i + 1, start * ssz, size * ssz);
diff --git a/include/linux/gpt.h b/include/linux/gpt.h
index 633be6bc826c..f7f5892fe256 100644
--- a/include/linux/gpt.h
+++ b/include/linux/gpt.h
@@ -8,8 +8,8 @@
  *   Copyright 2000,2001 Dell Inc.
  ************************************************************/
 
-#ifndef FS_PART_EFI_H_INCLUDED
-#define FS_PART_EFI_H_INCLUDED
+#ifndef _GPT_H
+#define _GPT_H
 
 #include <linux/types.h>
 #include <linux/fs.h>
@@ -111,4 +111,37 @@ typedef struct _legacy_mbr {
 	__le16 signature;
 } __packed legacy_mbr;
 
+// Helpers for validating GPT metadata
+int gpt_is_pmbr_valid(legacy_mbr *mbr, sector_t total_sectors);
+int gpt_validate_header(gpt_header *gpt, u64 lba, unsigned int lba_size,
+			u64 lastlba);
+int gpt_check_pte_array_crc(gpt_header *gpt, gpt_entry *ptes);
+int gpt_compare_alt(gpt_header *pgpt, gpt_header *agpt, u64 lastlba);
+
+/**
+ * is_pte_valid() - tests one PTE for validity
+ * @pte:pte to check
+ * @lastlba: last lba of the disk
+ *
+ * returns 1 if valid,  0 on error.
+ */
+	static inline bool
+gpt_is_pte_valid(const gpt_entry *pte, const u64 lastlba)
+{
+	if ((!efi_guidcmp(pte->partition_type_guid, NULL_GUID)) ||
+	    le64_to_cpu(pte->starting_lba) > lastlba         ||
+	    le64_to_cpu(pte->ending_lba)   > lastlba)
+		return 0;
+	return 1;
+}
+
+// Returns size in bytes of PTE array
+static inline int get_pt_size(gpt_header *gpt)
+{
+	return le32_to_cpu(gpt->num_partition_entries)
+		* le32_to_cpu(gpt->sizeof_partition_entry);
+}
+
+void utf16_le_to_7bit(const __le16 *in, unsigned int size, u8 *out);
+
 #endif
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
