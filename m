Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tmbG-0006QG-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 07:58:22 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13tmbF-0006QA-00
	for mtd@infradead.org; Thu, 09 Nov 2000 07:58:21 +0000
Date: Thu, 9 Nov 2000 07:58:17 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.10.10011081916440.927-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.21.0011090748110.4484-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 8 Nov 2000, Nicolas Pitre wrote:

> > I think we still need to disable plugging to protect the head of the 
> > list. It's a small race but it's non-zero.
> 
> Please show me.

	CPU 0			CPU 1

    handle_mtdblock_request()
	-> end_request()


	   * Request queue is now empty *

			    __make_request()
    io_request_unlock
			    	-> io_request_lock
				   plug_device_fn()
				   put request on queue
				   io_request_unlock


	   * Request queue is plugged, but !empty *

    io_request_lock
    if (!QUEUE_EMPTY)
	handle_mtdblock_request()  ---- BOOM!


I agree that plugging is useful for us. So rather than disabling it, how
about changing the check in mtdblock_thread() to:

	if (QUEUE_EMPTY || QUEUE_PLUGGED)

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
