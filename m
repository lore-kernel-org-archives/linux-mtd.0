Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12dWhs-0001Fi-00
	for mtd-list@infradead.org; Fri, 07 Apr 2000 12:13:44 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12dWhr-0001Fc-00
	for mtd@infradead.org; Fri, 07 Apr 2000 12:13:43 +0100
Received: from localhost (alex@localhost)
	by tammy.signum.se (8.9.3/8.9.3) with ESMTP id NAA10483
	for <mtd@infradead.org>; Fri, 7 Apr 2000 13:15:42 +0200
Date: Fri, 7 Apr 2000 13:15:42 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
Subject: get_mtd_device()
Message-ID: <Pine.LNX.4.10.10004071300060.10428-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Why was get_mtd_device() removed?

I need it or something like it in jffs to get the mtd device from the
minor device of the mtdblock device i shall mount.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
