Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12hbKA-00078Q-00
	for mtd-list@infradead.org; Tue, 18 Apr 2000 17:58:06 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12hbK9-00078K-00
	for mtd@infradead.org; Tue, 18 Apr 2000 17:58:05 +0100
Date: Tue, 18 Apr 2000 17:59:16 +0100 (BST)
From: David Woodhouse <David.Woodhouse@mvhi.com>
To: Rodrigo Moya <rmoya@tsai.es>
cc: MTD List <mtd@infradead.org>, trevorw@zentropix.com
Subject: Re: no success
In-Reply-To: <38FB0948.A443C9F2@tsai.es>
Message-ID: <Pine.LNX.4.10.10004181756500.32688-100000@devel2.axiom.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 17 Apr 2000, Rodrigo Moya wrote:

> yes, all the nftla* devices have 93 as major number. Another thing, is
> that the kernel displays no messages about the MTD drivers. Should it
> show something?

It should. Are you sure you patched the init routines in properly? The
patch in the CVS patches (?) directory ought to work. Anyway, I'm
supposed to be on holiday. Trevor?

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
