Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13oMRo-0003qB-00
	for mtd-list@infradead.org; Wed, 25 Oct 2000 10:02:12 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13oMRn-0003q5-00
	for mtd@infradead.org; Wed, 25 Oct 2000 10:02:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13oMJV-0003oY-00@infradead.org> 
References: <E13oMJV-0003oY-00@infradead.org> 
To: ollie@sis.com.tw
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel doc2001.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Oct 2000 10:01:42 +0100
Message-ID: <18954.972464502@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ollie@infradead.org said:
> Log Message: 
> use memcpy_(from|to)_io to increase perfromance a little bit 

Here be dragons. 

Beware that this doesn't start trying to do 32-bit accesses, where the top 
three bytes are random, and that it doesn't break the ECC.

Probably worth setting USE_MEMCPY in include/linux/mtd/doc2000.h in with 
all the other arch-dependent stuff to set up ReadDOC etc. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
