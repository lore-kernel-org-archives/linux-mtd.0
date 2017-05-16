Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPy-0001MT-CL
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:41 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org
Subject: [PATCH v2 26/53] libata: fix identation on a kernel-doc markup
Date: Tue, 16 May 2017 09:16:18 -0300
Message-Id: <83af4e1f80ae178fe7bc4ad2f91de46997d736b6.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sphinx got confused with the markup identation:
	./drivers/ata/libata-scsi.c:3402: ERROR: Unexpected indentation.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/ata/libata-scsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 49ba9834c715..dcd38d9e9804 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -3398,9 +3398,10 @@ static size_t ata_format_dsm_trim_descr(struct scsi_cmnd *cmd, u32 trmax,
  *
  * Translate a SCSI WRITE SAME command to be either a DSM TRIM command or
  * an SCT Write Same command.
- * Based on WRITE SAME has the UNMAP flag
- *   When set translate to DSM TRIM
- *   When clear translate to SCT Write Same
+ * Based on WRITE SAME has the UNMAP flag:
+ *
+ *   - When set translate to DSM TRIM
+ *   - When clear translate to SCT Write Same
  */
 static unsigned int ata_scsi_write_same_xlat(struct ata_queued_cmd *qc)
 {
-- 
2.9.3
