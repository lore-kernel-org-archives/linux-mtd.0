Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Crkor-0000i0-8I
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 17:30:27 -0500
Message-ID: <41F03217.3070300@redhat.com>
Date: Thu, 20 Jan 2005 16:35:03 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41ED2EB3.1070203@redhat.com>	
	<1106068748.16877.109.camel@tglx.tec.linutronix.de>	
	<41ED50B7.9000107@redhat.com>
	<1106082905.16877.141.camel@tglx.tec.linutronix.de>
Content-Type: multipart/mixed; boundary="------------010202070704020408020205"
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: additional error checks for AG-AND erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010202070704020408020205
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Thomas Gleixner wrote:
	:
> 
> Rename nand_read_ecc to do_nand_read_ecc and add an flag argument. Look
> at the erase function, where we have the additional argument for
> allowbbt. 
> flag bits:	0-7 tolerable errors
> 		8   do not get chip
> or something like that.
> Create a new wrapper function nand_read_ecc which calls do_nand_read_ecc
> with flags = 0xff. Depending on this argument we grab the device and
> release it on the end and react on the error check.
> The same call can be done from erase in the failure path. 
> 
> To make this actually work we should add a member like
> int (*ext_errchk) (.....)
> which is checked in the error path
> if (this->ext_errchk) {
> 	res = this->ext_errchk(....);
> }
> This is a board supplied function, as the board driver knows how much
> errors are acceptable. We return the number of corrected bits anyway in
> the correct_data() function, but we check only for -1 at the moment.
> An additional check does not hurt here, as we are in the slow path
> again. We check the return value of correct_data() for 
> (res == -1 || res > flags & 0xff) which ensures in the normal case this
> tolerance will never bite us, as error correction of 256 bits is unreal.
> 
> Hope that helps. I think this will make the code not uglier than it is
> anyway and keeps it nicely dependend on the board drivers featurelist.


Attached is a patch that I think implements what you described.  Please 
let me know if I've missed anything or gone astray in the details.

Note:  I changed a few literals to defined symbols in 'nand_base.c'. 
Please let me know if you would prefer this in a separate patch (or not 
at all).


Thank you,

d.marlin
=========

--------------010202070704020408020205
Content-Type: text/plain;
 name="ag-and-05.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ag-and-05.patch"

Index: include/linux/mtd/nand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/nand.h,v
retrieving revision 1.69
diff -u -r1.69 nand.h
--- include/linux/mtd/nand.h	17 Jan 2005 18:29:18 -0000	1.69
+++ include/linux/mtd/nand.h	20 Jan 2005 20:48:12 -0000
@@ -50,6 +50,8 @@
  *			update of nand_chip structure description
  *  01-17-2005 dmarlin	added extended commands for AG-AND device and added option 
  * 			for BBT_AUTO_REFRESH.
+ *  01-20-2005 dmarlin	added optional pointer to hardware specific callback for 
+ *			extra error status checks.
  */
 #ifndef __LINUX_MTD_NAND_H
 #define __LINUX_MTD_NAND_H
@@ -164,7 +166,7 @@
 
 /*
  * Constants for Hardware ECC
-*/
+ */
 /* Reset Hardware ECC for read */
 #define NAND_ECC_READ		0
 /* Reset Hardware ECC for write */
@@ -172,6 +174,10 @@
 /* Enable Hardware ECC before syndrom is read back from flash */
 #define NAND_ECC_READSYN	2
 
+/* Bit mask for flags passed to do_nand_read_ecc */
+#define NAND_GET_DEVICE		0x80
+
+
 /* Option constants for bizarre disfunctionality and real
 *  features
 */
@@ -308,6 +314,8 @@
  * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for initial bad block scan 
  * @controller:		[OPTIONAL] a pointer to a hardware controller structure which is shared among multiple independend devices
  * @priv:		[OPTIONAL] pointer to private chip date
+ * @errstat:		[OPTIONAL] hardware specific function to perform additional error status checks 
+ *			(determine if errors are correctable)
  */
  
 struct nand_chip {
@@ -363,6 +371,7 @@
 	struct nand_bbt_descr	*badblock_pattern;
 	struct nand_hw_control  *controller;
 	void		*priv;
+	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state, int status, int page);
 };
 
 /*
@@ -484,6 +493,9 @@
 extern int nand_default_bbt (struct mtd_info *mtd);
 extern int nand_isbad_bbt (struct mtd_info *mtd, loff_t offs, int allowbbt);
 extern int nand_erase_nand (struct mtd_info *mtd, struct erase_info *instr, int allowbbt);
+extern int do_nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
+                             size_t * retlen, u_char * buf, u_char * oob_buf,
+                             struct nand_oobinfo *oobsel, int flags);
 
 /*
 * Constants for oob configuration
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.128
diff -u -r1.128 nand_base.c
--- drivers/mtd/nand/nand_base.c	18 Jan 2005 16:14:56 -0000	1.128
+++ drivers/mtd/nand/nand_base.c	20 Jan 2005 20:49:37 -0000
@@ -42,6 +42,10 @@
  * 		a "device recovery" operation must be performed when power is restored
  * 		to ensure correct operation.
  *
+ *  01-20-2005	dmarlin: added support for optional hardware specific callback routine to 
+ *		perform extra error status checks on erase and write failures.  This required
+ *		adding a wrapper function for nand_read_ecc.
+ *
  * Credits:
  *	David Woodhouse for adding multichip support  
  *	
@@ -480,7 +484,7 @@
 	struct nand_chip *this = mtd->priv;
 	/* Check the WP bit */
 	this->cmdfunc (mtd, NAND_CMD_STATUS, -1, -1);
-	return (this->read_byte(mtd) & 0x80) ? 0 : 1; 
+	return (this->read_byte(mtd) & NAND_STATUS_WP) ? 0 : 1; 
 }
 
 /**
@@ -585,7 +589,7 @@
 		this->hwcontrol(mtd, NAND_CTL_SETCLE);
 		this->write_byte(mtd, NAND_CMD_STATUS);
 		this->hwcontrol(mtd, NAND_CTL_CLRCLE);
-		while ( !(this->read_byte(mtd) & 0x40));
+		while ( !(this->read_byte(mtd) & NAND_STATUS_READY));
 		return;
 
 	/* This applies to read commands */	
@@ -692,7 +696,7 @@
 		this->hwcontrol(mtd, NAND_CTL_SETCLE);
 		this->write_byte(mtd, NAND_CMD_STATUS);
 		this->hwcontrol(mtd, NAND_CTL_CLRCLE);
-		while ( !(this->read_byte(mtd) & 0x40));
+		while ( !(this->read_byte(mtd) & NAND_STATUS_READY));
 		return;
 
 	case NAND_CMD_READ0:
@@ -896,8 +900,14 @@
 	if (!cached) {
 		/* call wait ready function */
 		status = this->waitfunc (mtd, this, FL_WRITING);
+
+		/* See if operation failed and additional status checks are available */
+		if ((status & NAND_STATUS_FAIL) && (this->errstat)) {
+			status = this->errstat(mtd, this, FL_WRITING, status, page);
+		}
+
 		/* See if device thinks it succeeded */
-		if (status & 0x01) {
+		if (status & NAND_STATUS_FAIL) {
 			DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write, page 0x%08x, ", __FUNCTION__, page);
 			return -EIO;
 		}
@@ -1052,6 +1062,30 @@
 static int nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
 			  size_t * retlen, u_char * buf, u_char * oob_buf, struct nand_oobinfo *oobsel)
 {
+	return do_nand_read_ecc(mtd, from, len, retlen, buf, oob_buf, oobsel, 0xff);
+}
+
+
+/**
+ * do_nand_read_ecc - [MTD Interface] Read data with ECC
+ * @mtd:	MTD device structure
+ * @from:	offset to read from
+ * @len:	number of bytes to read
+ * @retlen:	pointer to variable to store the number of read bytes
+ * @buf:	the databuffer to put data
+ * @oob_buf:	filesystem supplied oob data buffer
+ * @oobsel:	oob selection structure
+ * @flags:	flag to indicate if nand_get_device/nand_release_device should be preformed
+ *		and how many corrected error bits are acceptable:
+ *		  bits 0..7 - number of tolerable errors
+ *		  bit  8    - 0 == do not get/release chip, 1 == get/release chip
+ *
+ * NAND read with ECC
+ */
+int do_nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
+			     size_t * retlen, u_char * buf, u_char * oob_buf, 
+			     struct nand_oobinfo *oobsel, int flags)
+{
 	int i, j, col, realpage, page, end, ecc, chipnr, sndcmd = 1;
 	int read = 0, oob = 0, ecc_status = 0, ecc_failed = 0;
 	struct nand_chip *this = mtd->priv;
@@ -1076,7 +1110,8 @@
 	}
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device (this, mtd, FL_READING);
+	if (flags & NAND_GET_DEVICE)
+		nand_get_device (this, mtd, FL_READING);
 
 	/* use userspace supplied oobinfo, if zero */
 	if (oobsel == NULL)
@@ -1180,7 +1215,8 @@
 					/* We calc error correction directly, it checks the hw
 					 * generator for an error, reads back the syndrome and
 					 * does the error correction on the fly */
-					if (this->correct_data(mtd, &data_poi[datidx], &oob_data[i], &ecc_code[i]) == -1) {
+					ecc_status = this->correct_data(mtd, &data_poi[datidx], &oob_data[i], &ecc_code[i]);
+					if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
 						DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: " 
 							"Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
 						ecc_failed++;
@@ -1219,7 +1255,7 @@
 				p[i] = ecc_status;
 			}
 			
-			if (ecc_status == -1) {	
+			if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {	
 				DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: " "Failed ECC read, page 0x%08x\n", page);
 				ecc_failed++;
 			}
@@ -1289,7 +1325,8 @@
 	}
 
 	/* Deselect and wake up anyone waiting on the device */
-	nand_release_device(mtd);
+	if (flags & NAND_GET_DEVICE)
+		nand_release_device(mtd);
 
 	/*
 	 * Return success, if no ECC failures, else -EBADMSG
@@ -1758,7 +1795,7 @@
 	status = this->waitfunc (mtd, this, FL_WRITING);
 
 	/* See if device thinks it succeeded */
-	if (status & 0x01) {
+	if (status & NAND_STATUS_FAIL) {
 		DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: " "Failed write, page 0x%08x\n", page);
 		ret = -EIO;
 		goto out;
@@ -2103,8 +2140,13 @@
 		
 		status = this->waitfunc (mtd, this, FL_ERASING);
 
+		/* See if operation failed and additional status checks are available */
+		if ((status & NAND_STATUS_FAIL) && (this->errstat)) {
+			status = this->errstat(mtd, this, FL_ERASING, status, page);
+		}
+
 		/* See if block erase succeeded */
-		if (status & 0x01) {
+		if (status & NAND_STATUS_FAIL) {
 			DEBUG (MTD_DEBUG_LEVEL0, "nand_erase: " "Failed erase, page 0x%08x\n", page);
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = (page << this->page_shift);

--------------010202070704020408020205--
