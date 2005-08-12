Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3cfP-0000Av-Vu
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2005 12:46:04 -0400
Date: Fri, 12 Aug 2005 20:46:25 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Message-Id: <20050812204625.263719f3.vwool@ru.mvista.com>
In-Reply-To: <1123863384.23647.105.camel@tglx.tec.linutronix.de>
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
	<20050812191146.2e38ed1c.vwool@ru.mvista.com>
	<1123860984.23647.95.camel@tglx.tec.linutronix.de>
	<20050812195524.6bda771b.vwool@ru.mvista.com>
	<1123863384.23647.105.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Index: nand_base.c
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
> retrieving revision 1.148
> diff -u -p -r1.148 nand_base.c
> --- nand_base.c	4 Aug 2005 17:14:48 -0000	1.148
> +++ nand_base.c	12 Aug 2005 16:14:47 -0000
> @@ -755,7 +755,7 @@ static void nand_command_lp (struct mtd_
>   *
>   * Get the device and lock it for exclusive access
>   */
> -static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
> +static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
>  {
>  	struct nand_chip *active;
>  	spinlock_t *lock;
> @@ -778,7 +778,11 @@ retry:
>  	if (active == this && this->state == FL_READY) {
>  		this->state = new_state;
>  		spin_unlock(lock);
> -		return;
> +		return 0;
> +	}
> +	if (new_state == FL_PM_SUSPENDED) {
> +		spin_unlock(lock);
> +		return (this->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
>  	}
>  	set_current_state(TASK_UNINTERRUPTIBLE);
>  	add_wait_queue(wq, &wait);
> 

10x, that's definitely better... 
Lemme insert the complete patch then:

Index: linux-2.6.10/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.10.orig/include/linux/mtd/nand.h
+++ linux-2.6.10/include/linux/mtd/nand.h
@@ -244,6 +244,7 @@
 	FL_ERASING,
 	FL_SYNCING,
 	FL_CACHEDPRG,
+	FL_PM_SUSPENDED,
 } nand_state_t;
 
 /* Keep gcc happy */
Index: linux-2.6.10/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.10.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6.10/drivers/mtd/nand/nand_base.c
@@ -46,6 +46,8 @@
  *		perform extra error status checks on erase and write failures.  This required
  *		adding a wrapper function for nand_read_ecc.
  *
+ * 08-20-2005	vwool: suspend/resume added
+ *
  * Credits:
  *	David Woodhouse for adding multichip support  
  *	
@@ -153,7 +155,7 @@
 #define nand_verify_pages(...) (0)
 #endif
 		
-static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state);
+static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state);
 
 /**
  * nand_release_device - [GENERIC] release chip
@@ -755,7 +757,7 @@
  *
  * Get the device and lock it for exclusive access
  */
-static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
+static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
 {
 	struct nand_chip *active;
 	spinlock_t *lock;
@@ -778,7 +780,11 @@
 	if (active == this && this->state == FL_READY) {
 		this->state = new_state;
 		spin_unlock(lock);
-		return;
+		return 0;
+	}
+	if (new_state == FL_PM_SUSPENDED) {
+		spin_unlock(lock);
+		return (this->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
 	}
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(wq, &wait);
@@ -2284,6 +2290,34 @@
 }
 
 /**
+ * nand_suspend - [MTD Interface] Suspend the NAND flash
+ * @mtd:	MTD device structure
+ */
+static int nand_suspend(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+
+	return nand_get_device (this, mtd, FL_PM_SUSPENDED);
+}
+
+/**
+ * nand_resume - [MTD Interface] Resume the NAND flash
+ * @mtd:	MTD device structure
+ */
+static void nand_resume(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+
+	if (this->state == FL_PM_SUSPENDED)
+		nand_release_device(mtd);
+	else
+		printk(KERN_ERR "resume() called for the chip which is not "
+				"in suspended state\n");
+
+}
+
+
+/**
  * nand_scan - [NAND Interface] Scan for the NAND device
  * @mtd:	MTD device structure
  * @maxchips:	Number of chips to scan for
@@ -2642,8 +2676,8 @@
 	mtd->sync = nand_sync;
 	mtd->lock = NULL;
 	mtd->unlock = NULL;
-	mtd->suspend = NULL;
-	mtd->resume = NULL;
+	mtd->suspend = nand_suspend;
+	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
 
