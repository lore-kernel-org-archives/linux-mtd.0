Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148J2w-0000Hh-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 09:26:58 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148J2u-0000Hb-00
	for mtd@infradead.org; Tue, 19 Dec 2000 09:26:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0012182131432A.11759@www.easysolutions.net> 
References: <0012182131432A.11759@www.easysolutions.net>  <Pine.LNX.4.30.0012172223230.15911-100000@imladris.demon.co.uk> 
To: shane@agendacomputing.com
Cc: Nicolas Pitre <nico@cam.org>, mstumpf@pobox.com, mtd@infradead.org
Subject: Re: MTD, generic physmap memory, MTD_BLOCK 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Dec 2000 09:24:18 +0000
Message-ID: <29168.977217858@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


shane@agendacomputing.com said:
>  But we are working on XIP for cramfs.  But this requires either
> expanding the  inode, or stealing a bit or two away from GIDS, or
> UIDs.  This is only a  "linear addressing" patch. 

I was looking at doing it in romfs. You can't have compression anyway, for 
obvious reasons, and it looked a little easier. But I suppose that wouldn't 
allow you to mix XIP-able and compressed files in the same fs.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
