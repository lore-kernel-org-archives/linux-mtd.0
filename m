Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14AWHU-0001LW-00
	for mtd-list@infradead.org; Mon, 25 Dec 2000 11:59:08 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14AWHS-0001LQ-00
	for mtd@infradead.org; Mon, 25 Dec 2000 11:59:07 +0000
Date: Mon, 25 Dec 2000 11:59:01 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nick Ivanter <nick@auriga.ru>
cc: <mark.langsdorf@amd.com>,  <mtd@infradead.org>
Subject: Re: CFI ident problems with AMD chips.
In-Reply-To: <3A473302.74DD6A6B@auriga.ru>
Message-ID: <Pine.LNX.4.30.0012251158200.3604-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 25 Dec 2000, Nick Ivanter wrote:

> They surely have differnet Device ID's which can be found in a datasheet
> and compared with the reported ones.

My code to report JEDEC ID for them was returning {0,0}. I'll poke at that
again when I go back to work next week.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
