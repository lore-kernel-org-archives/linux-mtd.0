Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141skt-0003PB-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 16:09:47 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141skq-0003P5-00
	for mtd@infradead.org; Fri, 01 Dec 2000 16:09:47 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <LAW-F50uA8M6XQQez1e00006398@hotmail.com> 
References: <LAW-F50uA8M6XQQez1e00006398@hotmail.com> 
To: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: Re: blk_dev[93].request_fn == NULL bug is still there 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Dec 2000 16:08:35 +0000
Message-ID: <19732.975686915@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


lkhatskevitch@hotmail.com said:
>  BTW Initializing MTD before device_setup was different (actially
> worse), it  caused blk_dev[xxx].plug_tq.routine == NULL, that
> contition is not checked  by run_task_queue() and was causing kernel
> to crash. 

Ah. Sorry, I'd misread it and hadn't noticed the difference. 
Now I'm confused. Did it not complain about failing to register the blkdev?


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
