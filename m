Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tsaM-0007je-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 14:21:50 +0000
Date: Thu, 9 Nov 2000 09:34:21 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.21.0011090809270.4610-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10011090932050.927-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 9 Nov 2000, David Woodhouse wrote:

> 
> Upon further consideration, it may be cleaner (at the cost of _slightly_
> higher io_request_lock contention) just to _not_ drop the spinlock between
> finishing one request and checking to see if the queue is empty.
> 
> How about this?
> 
>  	exit_sighand(tsk);
>  	exit_fs(tsk);
>  
> +	spin_lock_irq(&io_request_lock);
>  	while (!leaving) {
>  		add_wait_queue(&thr_wq, &wait);
>  		set_current_state(TASK_INTERRUPTIBLE);
> -		spin_lock_irq(&io_request_lock);
>  		if (QUEUE_EMPTY) {
>  			spin_unlock_irq(&io_request_lock);
>  			schedule();
>  			remove_wait_queue(&thr_wq, &wait); 
> +			spin_lock_irq(&io_request_lock);
>  		} else {
>  			remove_wait_queue(&thr_wq, &wait); 
>  			set_current_state(TASK_RUNNING);
>  			handle_mtdblock_request();
> -			spin_unlock_irq(&io_request_lock);
>  		}
>  	}
> +	spin_unlock_irq(&io_request_lock);
>  	up(&thread_sem);
>  	return 0;
>  }

Yep!  This way there is no opened window between the two QUEUE_EMPTY
tests which is clearer.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
