Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147oBE-0001Rm-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 00:29:28 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 147oBD-0001Rg-00
	for mtd@infradead.org; Mon, 18 Dec 2000 00:29:27 +0000
Date: Mon, 18 Dec 2000 00:29:19 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: <eauth@softsys.co.at>
cc: <mtd@infradead.org>
Subject: module registration changes
Message-ID: <Pine.LNX.4.30.0012180026320.18907-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Please could people test the new stuff I've just committed to bypass the
inter_module_get code by using weakly-linked symbols? Especially on 2.0.

This should also fix the dependency on link order which was introduced by
the removal of get_module_symbol().

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
