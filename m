Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14a2he-0003ph-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 21:39:38 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14a2hd-0003pb-00
	for mtd@infradead.org; Mon, 05 Mar 2001 21:39:37 +0000
Date: Mon, 5 Mar 2001 21:39:34 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Robert Kaiser <rob@sysgo.de>
cc: <mtd@infradead.org>
Subject: Re: Bug in rpxlite.c ?
In-Reply-To: <01030522253302.04023@rob>
Message-ID: <Pine.LNX.4.30.0103052139060.6938-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 5 Mar 2001, Robert Kaiser wrote:

> I just stumbled over this line in rpxlite.c and I'm wondering if the "* ofs"
> should really be a "+ ofs":
> 
> __u8 rpxlite_read8(struct map_info *map, unsigned long ofs)
> {
>     return readb(map->map_priv_1 * ofs);
> }

Heh, yeah - I suppose nobody's tried to use 8-bit chips in an rpxlite 
board yet :) Please commit the change.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
