Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TibU-0001ZS-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 12:03:40 +0000
Received: from aminocom.com (eclarke.aminocom.com [10.171.23.32])
	by aminocom.com (8.11.6/8.11.6) with ESMTP id g0OCEiO19805
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 12:14:44 GMT
Message-ID: <3C4FFA62.505BD064@aminocom.com>
Date: Thu, 24 Jan 2002 12:13:22 +0000
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Nand flash: hang after erase
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm playing with nandtest on an mtd partition, and found it hangs after
it has erased the first block. Putting in some debug I find that it gets
as far as the schedule call in mtdchar.c mtd_ioctl line 324. Here's a
snapshot:

	/*
	  FIXME: Allow INTERRUPTIBLE. Which means
	  not having the wait_queue head on the stack.
	  
	  If the wq_head is on the stack, and we
	  leave because we got interrupted, then the
	  wq_head is no longer there when the
	  callback routine tries to wake us up.
	*/
	ret = mtd->erase(mtd, erase);
	if (!ret) {
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&waitq, &wait);
		if (erase->state != MTD_ERASE_DONE &&
		    erase->state != MTD_ERASE_FAILED)
			schedule();
		remove_wait_queue(&waitq, &wait);
		set_current_state(TASK_RUNNING);
			ret = (erase->state == MTD_ERASE_FAILED)?-EIO:0;
	}

Since I'm still on the beginning of the learning curve somewhat I have
no idea what this is trying to achieve, or where to go from here. Ideas,
pointers, please?

Ta,
Beth
