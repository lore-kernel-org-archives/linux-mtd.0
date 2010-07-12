Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OY95v-0001gi-2A
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 02:50:11 +0000
Received: by iwn40 with SMTP id 40so4812173iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Jul 2010 19:50:10 -0700 (PDT)
Message-ID: <4C3A82DF.8080604@gmail.com>
Date: Sun, 11 Jul 2010 21:50:07 -0500
From: Neal B <nealb001@gmail.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH 3/6] Mtd: fixed space related issues
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: maximlevitsky@gmail.com, cascardo@holoscopio.com,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	linux-mtd@lists.infradead.org, jkosina@suse.cz,
	mohanlaljangir@gmail.com, rmk+kernel@arm.linux.org.uk, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 From 5af46680b31132acbd587b953d390317796700de Mon Sep 17 00:00:00 2001
From: Neal Buckendahl <nealb001@gmail.com>
Date: Sun, 11 Jul 2010 17:26:13 -0500
Subject: [PATCH 3/6] Mtd: fixed space related issues found by the 
checkpatch.pl tool
      Signed-off-by: Neal Buckendahl <nealb001@gmail.com>
---
  drivers/mtd/inftlcore.c |   16 ++++++++--------
  1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 015a7fe..d318270 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -114,7 +114,7 @@ static void inftl_add_mtd(struct mtd_blktrans_ops 
*tr, struct mtd_info *mtd)
  			"(== 0x%lx sects)\n",
  			inftl->cylinders, inftl->heads , inftl->sectors,
  			(long)inftl->cylinders * (long)inftl->heads *
-			(long)inftl->sectors );
+			(long)inftl->sectors);
  	}

  	if (add_mtd_blktrans_dev(&inftl->mbd)) {
@@ -279,7 +279,7 @@ static u16 INFTL_foldchain(struct INFTLrecord 
*inftl, unsigned thisVUC, unsigned
  	 */
  	silly = MAX_LOOPS;
  	while (thisEUN < inftl->nb_blocks) {
-		for (block = 0; block < inftl->EraseSize/SECTORSIZE; block ++) {
+		for (block = 0; block < inftl->EraseSize/SECTORSIZE; block++) {
  			if ((BlockMap[block] != BLOCK_NIL) ||
  			    BlockDeleted[block])
  				continue;
@@ -291,7 +291,7 @@ static u16 INFTL_foldchain(struct INFTLrecord 
*inftl, unsigned thisVUC, unsigned
  			else
  				status = oob.b.Status | oob.b.Status1;

-			switch(status) {
+			switch (status) {
  			case SECTOR_FREE:
  			case SECTOR_IGNORE:
  				break;
@@ -341,7 +341,7 @@ static u16 INFTL_foldchain(struct INFTLrecord 
*inftl, unsigned thisVUC, unsigned

  		/*
  		 * Copy only in non free block (free blocks can only
-                 * happen in case of media errors or deleted blocks).
+		 * happen in case of media errors or deleted blocks).
  		 */
  		if (BlockMap[block] == BLOCK_NIL)
  			continue;
@@ -476,7 +476,7 @@ static inline u16 INFTL_findwriteunit(struct 
INFTLrecord *inftl, unsigned block)
  {
  	unsigned int thisVUC = block / (inftl->EraseSize / SECTORSIZE);
  	unsigned int thisEUN, writeEUN, prev_block, status;
-	unsigned long blockofs = (block * SECTORSIZE) & (inftl->EraseSize -1);
+	unsigned long blockofs = (block * SECTORSIZE) & (inftl->EraseSize - 1);
  	struct mtd_info *mtd = inftl->mbd.mtd;
  	struct inftl_oob oob;
  	struct inftl_bci bci;
@@ -504,7 +504,7 @@ static inline u16 INFTL_findwriteunit(struct 
INFTLrecord *inftl, unsigned block)
  			DEBUG(MTD_DEBUG_LEVEL3, "INFTL: status of block %d in "
  				"EUN %d is %x\n", block , writeEUN, status);

-			switch(status) {
+			switch (status) {
  			case SECTOR_FREE:
  				writeEUN = thisEUN;
  				break;
@@ -677,7 +677,7 @@ static void INFTL_trydeletechain(struct INFTLrecord 
*inftl, unsigned thisVUC)
  			else
  				status = bci.Status | bci.Status1;

-			switch(status) {
+			switch (status) {
  			case SECTOR_FREE:
  			case SECTOR_IGNORE:
  				break;
@@ -943,7 +943,7 @@ static struct mtd_blktrans_ops inftl_tr = {
  	.name		= "inftl",
  	.major		= INFTL_MAJOR,
  	.part_bits	= INFTL_PARTN_BITS,
-	.blksize 	= 512,
+	.blksize	= 512,
  	.getgeo		= inftl_getgeo,
  	.readsect	= inftl_readblock,
  	.writesect	= inftl_writeblock,
-- 
1.7.1
