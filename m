Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13w0TQ-0001Si-00
	for mtd-list@infradead.org; Wed, 15 Nov 2000 11:11:28 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13w0TM-0001Sb-00
	for mtd@infradead.org; Wed, 15 Nov 2000 11:11:25 +0000
Message-ID: <01C04EFC.A4EA0860@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: David Woodhouse <dwmw2@infradead.org>, 'Alice Hennessy'
	 <ahennessy@mvista.com>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: JEDEC support broken?
Date: Wed, 15 Nov 2000 12:07:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alice Hennessy[SMTP:ahennessy@mvista.com] wrote:
> I have a board that needs support for both cfi and jedec flashes.   So,
> the approach
> I have taken is to use physmap.c with an array of "physmap_info" structures
> that describe the window
> address, window size, buswidth and number of partitions for each flash.  I
> also use a double array of
> mtd_partition structures to divide each flash into partitions (making use
> of mtdpart.c).   This allows multiple
> flashes to be described in one mapping file so the file is really a
> description of a particular board.  There is
> a probe for a cfi flash  and if that fails, then a probe for a jedec
> flash.    This eliminates the use of
> CONFIG_MTD_PHYSMAP_START  (and len and buswidth).   Is this in keeping with
> the intent
> of the map file?
> 
> Alice
> 
I'd like to spin your idea a little bit further: Instead of having a description of a particular
board, I'd prefer to have one "generic" linear mapping file that is able to probe for 
flash in an adress range that is specified during configuration (starting adress and
length or end of the adress range, and possibly the adress increments for probing, e.g. 1MB).
This way, you would be able to support virtually all boards that carry linear, non-banked flash
without needing a specialized file for every board. That would be especially useful for uClinux ...

-erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
