Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13oNNt-0003zq-00
	for mtd-list@infradead.org; Wed, 25 Oct 2000 11:02:13 +0100
Message-ID: <39F6AF69.100AC50E@sis.com.tw>
Date: Wed, 25 Oct 2000 18:01:13 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel doc2001.c'
References: <E13oMJV-0003oY-00@infradead.org> <18954.972464502@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> ollie@infradead.org said:
> > Log Message:
> > use memcpy_(from|to)_io to increase perfromance a little bit
> 
> Here be dragons.
> 
> Beware that this doesn't start trying to do 32-bit accesses, where the top
> three bytes are random, and that it doesn't break the ECC.
> 
> Probably worth setting USE_MEMCPY in include/linux/mtd/doc2000.h in with
> all the other arch-dependent stuff to set up ReadDOC etc.
> 

Oops, sorry. I just copy it from the dis-asm of M-Systems' driver.
USE_MEMCPY should be protected by #ifdef 386 stuff.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
