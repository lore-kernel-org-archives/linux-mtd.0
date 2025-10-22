Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F436CCD1A5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 01:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mu9aGFxo+S/Vo6yx19g8bNVtUwJQyYP9tWPHmax3Rsk=; b=bd6ncI4vL/PEqj
	BTL5/9mcO/1arbDRcl7ql4avwtf1HhdsWxSdlCn0sIjfA4+hj7CyDK5VBsVMPSENRbMoyThl7Uv7p
	MWNUkU09FOXAVdqZH4jQYTTHGlms80GsJPxNZLyHhqNVFdFlJdib+7q0nktDGOz9LiFIh5N/dzneS
	uTZ81ScNgl7/meS9sOJyzEtWMdcxNLPNUQ/Wvdx95Nrwxlk9q0Xn3dGzDfVtbrBXuW6HhZXSv+VkA
	zr8OcS2REVYXdNsWo7trLO3Mz2bcYdfQ3F6EYaVxuPb5FE0s5QJImP+m5KaBni7aRO3oL4bcOtb2y
	9S3LROvs4mPjyF9RpGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNop-00000001A4n-1qYU;
	Wed, 22 Oct 2025 01:39:15 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNol-00000001A2p-0EKY
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 01:39:12 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AD7792C0241;
	Wed, 22 Oct 2025 14:38:02 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1761097082;
	bh=/MbsSW3+Q9BLBlm5Zj/MlkP5p2oUX/nDrISBbxMv0L4=;
	h=From:To:Cc:Subject:Date:From;
	b=aIU7weqmGR8oKtXCsz5CVMJA0P+t1Z1uwi4F1RxEygGoZNpoRrLxHWq1C9NSHgMCT
	 6ek8WHH42EHM8RK+8rW6lC7hrMS79dq4EAY5qb3KY5GCe+Dim3gmD2XYMeEkw0WeK6
	 QO3eMRitYR0IZ+hFuhVaIXGnwT2fNjf9JY4wHFEIRh/atVmmG5CaSIvnP6C9gKCd1g
	 oq7Z8k7B9ZFQtdIOKCJU6EAuBT53d4IHX8fYXLp8vp4eZnqNYrdDpuPw2nbIy4uYnr
	 urJUjDTXiDX4kfGaVzVUsyLtYYPjWVe8AWpiRlqz2jImpnQYN7nr000GNSybLkgXBh
	 cHsWSj5e7pOuw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68f8357a0000>; Wed, 22 Oct 2025 14:38:02 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.16])
	by pat.atlnz.lc (Postfix) with ESMTP id 79A7913EE36;
	Wed, 22 Oct 2025 14:38:02 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 751342A0433; Wed, 22 Oct 2025 14:38:02 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Elad Nachman <enachman@marvell.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v0] mtd: rawnand: marvell: fix 8bit ECC layouts
Date: Wed, 22 Oct 2025 14:37:52 +1300
Message-ID: <20251022013752.2381694-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=NbFF1HD4 c=1 sm=1 tr=0 ts=68f8357a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=x6icFKpwvdMA:10 a=JNAATqg39HOsAI6RquoA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_183911_600230_A72CD9B6 
X-CRM114-Status: GOOD (  13.32  )
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

These were modified to appease a check in nand_scan_tail. This change led
to the last spare bytes never being written to or read from.

Modify the fix by restoring the layouts and setting ecc->steps to the
full_chunk_cnt value in the 8 bit ECC cases (4k and 8k page size). This
allows the driver to continue reading/writing all chunks while also
passing the check in nand_scan_tail.

Fixes: e6a30d0c48a1 ("mtd: rawnand: marvell: fix layouts")
Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/marvell_nand.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 303b3016a070..c20feacbaca8 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -292,10 +292,10 @@ static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] = {
 	MARVELL_LAYOUT( 2048,   512,  8,  2,  1, 1024,  0, 30,1024,64, 30),
 	MARVELL_LAYOUT( 2048,   512,  16, 4,  4, 512,   0, 30,  0, 32, 30),
 	MARVELL_LAYOUT( 4096,   512,  4,  2,  2, 2048, 32, 30,  0,  0,  0),
-	MARVELL_LAYOUT( 4096,   512,  8,  4,  4, 1024,  0, 30,  0, 64, 30),
+	MARVELL_LAYOUT( 4096,   512,  8,  5,  4, 1024,  0, 30,  0, 64, 30),
 	MARVELL_LAYOUT( 4096,   512,  16, 8,  8, 512,   0, 30,  0, 32, 30),
 	MARVELL_LAYOUT( 8192,   512,  4,  4,  4, 2048,  0, 30,  0,  0,  0),
-	MARVELL_LAYOUT( 8192,   512,  8,  8,  8, 1024,  0, 30,  0, 160, 30),
+	MARVELL_LAYOUT( 8192,   512,  8,  9,  8, 1024,  0, 30,  0, 160, 30),
 	MARVELL_LAYOUT( 8192,   512,  16, 16, 16, 512,  0, 30,  0,  32, 30),
 };
 
@@ -2286,7 +2286,16 @@ static int marvell_nand_hw_ecc_controller_init(struct mtd_info *mtd,
 	}
 
 	mtd_set_ooblayout(mtd, &marvell_nand_ooblayout_ops);
-	ecc->steps = l->nchunks;
+
+	/* Validity checks in nand_scan_tail assume even sized chunks, but in the case of 8bit
+	 * ECC with 4k/8k page size the last chunk is spare data, which is not sized to the data
+	 * chunks. Overwrite the ecc->steps to pass this validity check, while maintaining the
+	 * correct number of chunks in-driver.
+	 */
+	if (ecc->strength == 8 && mtd->writesize > SZ_2K)
+		ecc->steps = l->full_chunk_cnt;
+	else
+		ecc->steps = l->nchunks;
 	ecc->size = l->data_bytes;
 
 	if (ecc->strength == 1) {
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
