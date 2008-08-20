Date: Wed, 20 Aug 2008 22:32:08 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: missing kernel-doc, please add/fix
In-Reply-To: <20080818141624.d84a1df3.rdunlap@xenotime.net>
Message-ID: <alpine.LFD.1.10.0808202207490.27575@casper.infradead.org>
References: <20080818141624.d84a1df3.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Randy,

> Warning(lin2627-rc3g4-kerndoc//include/linux/mtd/nand.h:294): No description found for parameter 'read_subpage'
> Warning(lin2627-rc3g4-kerndoc//drivers/mtd/nand/nand_base.c:809): No description found for parameter 'data_offs'
> Warning(lin2627-rc3g4-kerndoc//drivers/mtd/nand/nand_base.c:809): No description found for parameter 'readlen'
> Warning(lin2627-rc3g4-kerndoc//drivers/mtd/nand/nand_base.c:809): No description found for parameter 'bufpoi'
> 
Thanks a lot for catching the issues.
They are fixed in the following patch. 

Thanks Alexey



Signed-off-by: Alexey Korolev <akorolev@infradead.org>
-------------------------------------------------------------------------
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -801,9 +801,9 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
  * nand_read_subpage - [REPLACABLE] software ecc based sub-page read function
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
- * @dataofs	offset of requested data within the page
- * @readlen	data length
- * @buf:	buffer to store read data
+ * @data_offs:	offset of requested data within the page
+ * @readlen:	data length
+ * @bufpoi:	buffer to store read data
  */
 static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
 {
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index d99e569..fd19787 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -150,8 +150,8 @@ static const char addressbits[256] = {
 /**
  * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256-byte block
  * @mtd:	MTD block structure (unused)
- * @dat:	raw data
- * @ecc_code:	buffer for ECC
+ * @buf:	input buffer with raw data
+ * @code:	output buffer with ECC
  */
 int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 		       unsigned char *code)
@@ -390,7 +390,7 @@ EXPORT_SYMBOL(nand_calculate_ecc);
 /**
  * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
  * @mtd:	MTD block structure (unused)
- * @dat:	raw data read from the chip
+ * @buf:	raw data read from the chip
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
  *
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 81774e5..733d3f3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -248,6 +248,7 @@ struct nand_hw_control {
  * @read_page_raw:	function to read a raw page without ECC
  * @write_page_raw:	function to write a raw page without ECC
  * @read_page:	function to read a page according to the ecc generator requirements
+ * @read_subpage:	function to read parts of the page covered by ECC.
  * @write_page:	function to write a page according to the ecc generator requirements
  * @read_oob:	function to read chip OOB data
  * @write_oob:	function to write chip OOB data


p/s
Fixes are based on newest version of "git.infradead.org/mtd-2.6" 
It contains bit more warnings so they are fixed as well. 
