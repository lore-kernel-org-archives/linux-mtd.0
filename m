Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tmot-0006Ru-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 08:12:27 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13tmos-0006Ro-00
	for mtd@infradead.org; Thu, 09 Nov 2000 08:12:26 +0000
Date: Thu, 9 Nov 2000 08:12:19 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.10.10011081916440.927-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.21.0011090809270.4610-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Upon further consideration, it may be cleaner (at the cost of _slightly_
higher io_request_lock contention) just to _not_ drop the spinlock between
finishing one request and checking to see if the queue is empty.

How about this?

 	exit_sighand(tsk);
 	exit_fs(tsk);
 
+	spin_lock_irq(&io_request_lock);
 	while (!leaving) {
 		add_wait_queue(&thr_wq, &wait);
 		set_current_state(TASK_INTERRUPTIBLE);
-		spin_lock_irq(&io_request_lock);
 		if (QUEUE_EMPTY) {
 			spin_unlock_irq(&io_request_lock);
 			schedule();
 			remove_wait_queue(&thr_wq, &wait); 
+			spin_lock_irq(&io_request_lock);
 		} else {
 			remove_wait_queue(&thr_wq, &wait); 
 			set_current_state(TASK_RUNNING);
 			handle_mtdblock_request();
-			spin_unlock_irq(&io_request_lock);
 		}
 	}
+	spin_unlock_irq(&io_request_lock);
 	up(&thread_sem);
 	return 0;
 }


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
