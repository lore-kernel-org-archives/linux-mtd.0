Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zav7-0000kd-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:55:09 +0100
Date: Mon, 27 Mar 2000 16:55:01 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: New release of MTD code pending. 
In-Reply-To: <9873.954167938@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000327164508.26529C-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, David Woodhouse wrote:

> alex@cendio.se said:
> >  Sure, but there are some architecture changes that should be done
> > before that. (The ones we discussed last week). 
> 
> Definitely. I'm going through the FTL code first - to remind myself of how it 
> actually works. Then I'll get round to making the changes we talked about.
> 
> As it is, I haven't actually looked at some of this code in three years. For 
> example, I had no clue how the async erases worked until I just reread it.

I've got some questions on the async erase btw:

When I fire away a flash erase, can i just continue working with the
flash, content with knowing that if i do a read or write while the chip is
erasing it will block? I thought so at first, and it would be the logical
thing. 

Some code in the current drivers made me doubt this though, so i added an
explicit sleep until i got the finished callback.

The code in question is stuff like: 
doc100.c: flashcard_read():
 /* There is an erase in progress or pending for this device. Stop it */
 timeron = del_timer(&flashcard_timer);
                
 if (priv->cur_erases && priv->cur_erases->cell == cell) 
 {
   /* The erase is on the current cell. Just return all 0xff */ 
   add_timer(&flashcard_timer);
                        
   printk("Cell %d currently erasing. Setting to all 0xff\n",cell);
   memset(buf, 0xff, *retlen);
   return 0;

WTF is this?

Also, doc2000.c: doc_erase() doesn't seem to call the callback function at
all.

/ Alex








To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
