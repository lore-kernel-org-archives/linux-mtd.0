Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147mF8-00016t-00
	for mtd-list@infradead.org; Sun, 17 Dec 2000 22:25:22 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 147mF6-00016n-00
	for mtd@infradead.org; Sun, 17 Dec 2000 22:25:21 +0000
Date: Sun, 17 Dec 2000 22:24:52 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Shane Nay <shane@agendacomputing.com>
cc: Nicolas Pitre <nico@cam.org>,  <mstumpf@pobox.com>,  <mtd@infradead.org>
Subject: Re: MTD, generic physmap memory, MTD_BLOCK
In-Reply-To: <0012160104041B.11759@www.easysolutions.net>
Message-ID: <Pine.LNX.4.30.0012172223230.15911-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Unless there's something missing (or I'm being dim) that code doesn't do
XIP. It still copies from the cramfs into the page provided to
cramfs_readpage.

What you want to do is make up some struct pages to represent the pages
of the ROM chip and pre-populate the page cache with those pages directly
- marked readonly, of course.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
