Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eFVf-0006L6-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 12:36:23 +0100
Message-ID: <39D1DB9E.D1BAA64E@auriga.ru>
Date: Wed, 27 Sep 2000 15:35:58 +0400
From: Nick <nick@auriga.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: jffs-dev <jffs-dev@axis.com>, mtd <mtd@infradead.org>
Subject: Re: Finalized TODO list for NAND and JFFS...
References: <39D091DC.3218DE2D@cotw.com> <21835.969974378@passion.cygnus.co.uk>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Also add a checkpointing system or some way of removing the necessity of
> scanning the whole of the flash on mount.
>
> For a 21MB filesystem, that takes over a minute.
>
> --
> dwmw2

By the way, can't we shorten mount time for Intel chips by rewriting read
routines in such a way that they don't send Read Status Register command when
chip->status is FL_READY?

I think we can. Acually, I have tried already and it shortens mount time
dramatically.

So the question, as I can see it, is can we be sure that Status Register has
7th bit set when chip->status == FL_READY?

Any comments?

Nick



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
