Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hWML-0001jA-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 13:44:33 +0100
Received: from chambertin.convergence.de ([212.84.236.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hWMK-0001j4-00
	for mtd@infradead.org; Mon, 26 Mar 2001 13:44:32 +0100
Message-ID: <3ABF2CB0.3D7EFE4B@convergence.de>
Date: Mon, 26 Mar 2001 13:49:04 +0200
From: Frank Neuber <neuber@convergence.de>
MIME-Version: 1.0
To: ihristov@databrokers.net, mtd@infradead.org
Subject: re: Can't compile 2.4.2 kernel after MTD patch
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> nftl.c: In function `NFTL_findwriteunit':
> nftl.c:624: `MTD_DEBUG_LEVEL_1' undeclared (first use in this
function)
> nftl.c:624: (Each undeclared identifier is reported only once

there is a small bug in nftl.c! The debug variable should be
MTD_DEBUG_LEVEL1  :-)

Frank




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
