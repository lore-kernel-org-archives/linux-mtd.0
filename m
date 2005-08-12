Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3baQ-0006qk-VK
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2005 11:36:49 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20050812191146.2e38ed1c.vwool@ru.mvista.com>
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
	<20050812191146.2e38ed1c.vwool@ru.mvista.com>
Content-Type: text/plain
Date: Fri, 12 Aug 2005 15:36:24 +0000
Message-Id: <1123860984.23647.95.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-08-12 at 19:11 +0400, Vitaly Wool wrote:
> Hi Thomas,
> please find the patch below.
> 
> Best regards,
>    Vitaly
> 
> P. S. Is it reasonable to send the use case (i. e. the NAND driver I'm
> working at that uses the simple framework introduced)?

Sure

>  /**
> + * nand_suspend - [MTD Interface] Suspend the NAND flash
> + * @mtd:	MTD device structure
> + */
> +static int nand_suspend(struct mtd_info *mtd)
> +{
> +	struct nand_chip *this = mtd->priv;
> +	int ret = 0;
> +
> +	switch(this->state) {
> +		case FL_READY:
> +			nand_get_device (this, mtd, FL_PM_SUSPENDED);
> +		case FL_PM_SUSPENDED:
> +			break;
> +
> +		default:
> +			ret = -EAGAIN;
> +			break;
> +	}
> +	return ret;
> +}

This solution is racy. 

The correct solution is to do the check in nand_get_device with the lock
held. 

Index: nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.148
diff -u -p -r1.148 nand_base.c
--- nand_base.c	4 Aug 2005 17:14:48 -0000	1.148
+++ nand_base.c	12 Aug 2005 15:28:14 -0000
@@ -755,7 +755,7 @@ static void nand_command_lp (struct mtd_
  *
  * Get the device and lock it for exclusive access
  */
-static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
+static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
 {
 	struct nand_chip *active;
 	spinlock_t *lock;
@@ -778,8 +778,11 @@ retry:
 	if (active == this && this->state == FL_READY) {
 		this->state = new_state;
 		spin_unlock(lock);
-		return;
+		return 0;
 	}
+	if (new_state == FL_PM_SUSPENDED)
+		return -EAGAIN;
+
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(wq, &wait);
 	spin_unlock(lock);
