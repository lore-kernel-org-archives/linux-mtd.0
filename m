Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13waGU-0001J5-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 01:24:30 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13waGT-0001Iz-00
	for mtd@infradead.org; Fri, 17 Nov 2000 01:24:29 +0000
Date: Fri, 17 Nov 2000 01:24:18 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: Erwin Authried <eauth@softsys.co.at>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: block device for 2.0
In-Reply-To: <Pine.LNX.4.30.0011162016000.5921-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.30.0011170123320.1138-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 16 Nov 2000, Nicolas Pitre wrote:

> Why not the other way around, i.e. CONFIG_MTD_BLOCK and CONFIG_MTD_BLOCK_RO?
> The read-only one is more the "special case" than the read-write one...

Yep, fine. Erwin, feel free to commit this change if you want to.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
