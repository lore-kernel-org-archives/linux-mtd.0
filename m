Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13hqjj-0008FV-00
	for mtd-list@infradead.org; Sat, 07 Oct 2000 10:57:47 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13hqji-0008FP-00
	for mtd@infradead.org; Sat, 07 Oct 2000 10:57:46 +0100
Date: Sat, 7 Oct 2000 10:57:16 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: mtd@infradead.org
Subject: Re: cfi_amdext_sync, cfi_intelext_sync
In-Reply-To: <39DE61C0.48806B95@mvista.com>
Message-ID: <Pine.LNX.4.21.0010071052230.1017-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 6 Oct 2000, Alice Hennessy wrote:

> Hi,
> 
> Found a bug in cfi_cmdset_0001.c and  cfi_cmdset_0002.c in functions
> cfi_intelext_sync and cfi_amdext_sync respectively.  The call to
> remove_wait_queue is missing after the "add_wait_queue;spin_unlock_bh;
> schedule"   sequence in the default case.

Doh! Well spotted. 

> A nice touch is that we are in spin_lock_bh so the system hangs as well.

Thinks.... it's too early in the morning for me to decide whether it's
safe to drop the lock _before_ calling wake_up(). Probably. 

> If you agree, should I check in the fix?

Yes please.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
