Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GqRn-0000xK-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 22:43:55 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14GqRl-0000xD-00
	for mtd@infradead.org; Thu, 11 Jan 2001 22:43:54 +0000
Date: Thu, 11 Jan 2001 22:43:49 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: <mtd@infradead.org>
Subject: Re: LOCK and UNLOCK functions
In-Reply-To: <3A5E19BB.B6F06694@mvista.com>
Message-ID: <Pine.LNX.4.30.0101112242450.6396-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 11 Jan 2001, Alice Hennessy wrote:

> BTW: what does "thinko" mean?

Bit like a typo, only an error in thinking rather than an error in typing.

> Then my choice would be to keep it simple and let userland keep track of
> what lock bits it has set in the past.

Sensible. Return -EINVAL for any unlock command which doesn't address the
whole device. But need some way for uspace to know that's the case.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
