Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13o2Mt-0007aN-00
	for mtd-list@infradead.org; Tue, 24 Oct 2000 12:35:47 +0100
Message-ID: <39F5767A.48E1A44C@cotw.com>
Date: Tue, 24 Oct 2000 06:46:02 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel mtdblock.c'
References: <E13nksk-0002RR-00@infradead.org> <18079.972375290@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> *(int *)0=0; doesn't cause an oops on all platforms. That was why BUG() was
> introduced. Probably better just to omit my paranoia checks altogether,
> once we're happy that mtdblock actually works. For now, surround them in
> #ifdef PARANOIA. I thought I'd done that already.
> 
Alright, will do.

> DECLARE_MUTEX_LOCKED wants adding to compatmac.h if it's not already there.
> 
Will do.

> What was the reasoning for removing the 'static' from the declaration of
> thr_wq?
> 
Uhhh...that would be my stupidity. I forgot to put 'static' back on
the declaration.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
