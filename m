Received: from moutvdom01.kundenserver.de ([195.20.224.200])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15OewM-0001tL-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2001 13:36:02 +0100
Received: from [195.20.224.209] (helo=mrvdom02.schlund.de)
	by moutvdom01.kundenserver.de with esmtp (Exim 2.12 #2)
	id 15Of1v-0007RT-00
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2001 14:41:47 +0200
Received: from p3ee28cf3.dip0.t-ipconnect.de ([62.226.140.243] helo=linux.ste-el.de)
	by mrvdom02.schlund.de with esmtp (Exim 2.12 #2)
	id 15Of1u-0003dW-00
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2001 14:41:46 +0200
Received: from bonita (peter@bonita.local [192.168.0.13])
	by linux.ste-el.de (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) with SMTP id OAA08665
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2001 14:41:40 GMT
From: peter romero <promero@ste-el.de>
Reply-To: promero@ste-el.de
To: linux-mtd@lists.infradead.org
Subject: nftl via spia nand
Date: Mon, 23 Jul 2001 14:37:11 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <01072314374901.04442@bonita>
Content-Transfer-Encoding: 8bit
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

Hi,

I try to get NFTL via nand (spia.c) on running.

The access is via adress databus and I/O controll.

Who init this->wq ? 
I did it in spia with "init_waitqueue_head(&this->wq);"!

Is the SPIA board a Multiprocessor Board ? 
why spin_lock_bh ?

when i start schedul in nand.c :
 ..
 ..
 default:
         set_current_state (TASK_UNINTERRUPTIBLE);
         add_wait_queue (&this->wq, &wait);
         spin_unlock_bh (&this->chip_lock);
-                schedule();

         remove_wait_queue (&this->wq, &wait);
         goto retry;
 };

who wakes it up???

thanks in advance....

romero <promero@ste-el.de>
