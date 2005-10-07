Received: from host46-203.pool8538.interbusiness.it ([85.38.203.46]
	helo=dave-tech.it)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENsO8-0002jJ-LS
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2005 09:36:11 -0400
Message-ID: <43467A0F.9040403@dave-tech.it>
Date: Fri, 07 Oct 2005 15:37:19 +0200
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Jeff.Fellin@rflelect.com
References: <OFC64F478F.8A49EB26-ON85257093.0045228F@teal.com>
In-Reply-To: <OFC64F478F.8A49EB26-ON85257093.0045228F@teal.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD crash with kernel 2.6.13
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jeff,

thanks a lot for you help. I forwarded your message to David Woodhouse. 
I hope this can help to find the bug.

-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it


> llandre,
> I had a similar problem with the 2.4.29 devfs code, the problem wasn't
> an uninitialized wait queue, although the system failure looked similiar
> to yours. The problem was actually an entry being added to the wait_queue
> call schedule(), and when rescheduled not removing itself from the
> wait_queue.
> Later when someone else called wake_up for the wait_queue, __wake_up_common
> paniced with a zero pointer.
> 
> Maybe this situation is happening with the MTD code. I don't have 2.6.13
> to look at.
> 
> Jeff Fellin
> RFL Electronics
> Jeff.Fellin@rflelect.com
> 973 334-3100, x 327
> 
> 
>                                                                                                                                    
>                       llandre                                                                                                      
>                       <r&d2@dave-tech.it>               To:       linux-mtd@lists.infradead.org                                    
>                       Sent by:                          cc:                                                                        
>                       linux-mtd-bounces@lists.in        Subject:  MTD crash with kernel 2.6.13                                     
>                       fradead.org                                                                                                  
>                                                                                                                                    
>                                                                                                                                    
>                       10/07/2005 06:26                                                                                             
>                                                                                                                                    
>                                                                                                                                    
> 
> 
> 
> 
> Hi all,
> 
> I encountered a problem with MTD with kernel 2.6.13 on ARM architecure.
> It crashes in __wake_up_common function when I try to erase a MTD
> partition on StrataFlash. I've already talked with David Woodhouse over
> #mtd channel and it really seems it is a bug in MTD code (he suggests it
> is due to an uninitialized wait queue). I tried to patch the kernel with
> latest MTD code but the crash still occurs. Here are available the full
> dumps of the console (with and without DEBUG_WAITQ flag):
> http://www.dave-tech.it/download/misc/sw/zefeer/zelk/mtd/
> 
> Anybody experienced the same problem? Any suggestions about how to solve
> it?
> 
> 
> Thanks in advance,
> llandre
> 
> DAVE Electronics System House - R&D Department
> web:   http://www.dave-tech.it
> email: r&d2@dave-tech.it
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
> 
> 
