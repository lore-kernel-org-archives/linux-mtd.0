Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3cCe-00088f-BY
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2005 12:16:20 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20050812195524.6bda771b.vwool@ru.mvista.com>
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
	<20050812191146.2e38ed1c.vwool@ru.mvista.com>
	<1123860984.23647.95.camel@tglx.tec.linutronix.de>
	<20050812195524.6bda771b.vwool@ru.mvista.com>
Content-Type: text/plain
Date: Fri, 12 Aug 2005 16:16:24 +0000
Message-Id: <1123863384.23647.105.camel@tglx.tec.linutronix.de>
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

On Fri, 2005-08-12 at 19:55 +0400, Vitaly Wool wrote:
> @@ -768,6 +770,11 @@
>  	active = this;
>  	spin_lock(lock);
>  
> +	if (this->state == new_state) {
> +		spin_unlock(lock);
> +		return;
> +	}
> +
>  	/* Hardware controller shared among independend devices */

Urggh. That breaks everything except FL_PM_SUSPENDED as you return for
all cases, where this->state and new_state are equal. 

You want to return 0, when the FLASH is already in suspend state ?

tglx

Index: nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.148
diff -u -p -r1.148 nand_base.c
--- nand_base.c	4 Aug 2005 17:14:48 -0000	1.148
+++ nand_base.c	12 Aug 2005 16:14:47 -0000
@@ -755,7 +755,7 @@ static void nand_command_lp (struct mtd_
  *
  * Get the device and lock it for exclusive access
  */
-static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
+static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
 {
 	struct nand_chip *active;
 	spinlock_t *lock;
@@ -778,7 +778,11 @@ retry:
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
