Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sowN-0007U1-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 16:16:11 +0000
Date: Mon, 6 Nov 2000 16:27:16 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <18972.973522453@redhat.com>
Message-ID: <Pine.LNX.4.10.10011061625520.530-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 6 Nov 2000, David Woodhouse wrote:

> 
> Try this:
> 
> Index: mtdblock.c
> ===================================================================
> RCS file: /home/cvs/mtd/kernel/mtdblock.c,v
> retrieving revision 1.29
> diff -u -r1.29 mtdblock.c
> --- mtdblock.c	2000/11/03 04:59:01	1.29
> +++ mtdblock.c	2000/11/06 14:54:06
> @@ -58,6 +58,11 @@
>  #define blkdev_dequeue_request(req) do {CURRENT = req->next;} while (0)
>  #else
>  #define RQFUNC_ARG request_queue_t *q
> +static void mtdblock_plug_device(request_queue_t *q, kdev_t dev)
> +{
> +	/* Do nothing. We don't want plugging */
> +	return;
> +}
>  #endif
>  
>  

Yup.  Already tried that like I said earlier.  No difference.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
