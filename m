Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141ZQ0-0008CU-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 19:30:56 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141ZPx-0008CO-00
	for mtd@infradead.org; Thu, 30 Nov 2000 19:30:55 +0000
Date: Thu, 30 Nov 2000 19:29:59 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Levi Khatskevitch <lkhatskevitch@hotmail.com>
cc: <linuxbios@lanl.gov>,  <mtd@infradead.org>
Subject: Re: init_doc2001 and init_doc2000 are hidden from init_mtd
In-Reply-To: <LAW-F59F8HGmCvoXM7e00005533@hotmail.com>
Message-ID: <Pine.LNX.4.30.0011301929370.5857-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 30 Nov 2000, Levi Khatskevitch wrote:

> I've just tested the new code, the doc2001 use count still gets increasingly
> negative on each access to /dev/mtd0. Like:

Are you sure you rebuilt mtdchar.o?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
