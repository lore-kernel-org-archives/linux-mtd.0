Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lYfm-0003rT-00
	for mtd-list@infradead.org; Tue, 17 Oct 2000 16:29:02 +0100
Subject: Re: typo in sbc_mediagx.c
In-Reply-To: <31016.971770537@redhat.com> from David Woodhouse at "Oct 17, 2000
 09:15:37 am"
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 17 Oct 2000 11:28:58 -0400 (EDT)
CC: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <E13lYfi-0006hw-00@mokona.furryterror.org>
From: Amy Fong <afong@furryterror.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> 
> nico@cam.org said:
> > Fixed. 
> 
> Thanks. 
> 
> Note that if you're using mtdblock.c you'll need to use v1.23 - 1.24 is my 
> first attempt at using a kernel thread and it doesn't actually appear to 
> work. It'll probably be a few days before I get a chance to look at it 
> again - volunteers are welcome if you feel so inclined :)
> 
> --
> dwmw2

Uh yeah. You're using the QUEUE_EMPTY macro which doesn't really exist
in 2.2 or at least exists as 

include/lists.h:

#define QUEUE_EMPTY(head, listnam) \
        ((QUEUE_FIRST(head, listnam) == QUEUE_LAST(head, listnam)) && \
	((u_long)QUEUE_FIRST(head, listnam) == (u_long)head))

as opposed to 

2.4's include/blk.h
#define QUEUE_EMPTY list_empty(&blk_dev[MAJOR_NR].request_queue.queue_head)

<twitch> 

;)




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
