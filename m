Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LtRt-0004lG-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 20:56:53 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14LtRs-0004lA-00
	for mtd@infradead.org; Thu, 25 Jan 2001 20:56:52 +0000
Date: Thu, 25 Jan 2001 20:56:38 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Brian Michalk <michalk@awpi.com>
cc: <mtd@infradead.org>
Subject: RE: fdisk problems 
In-Reply-To: <NEBBLKIBMLGPAFMHEJICIEMMCEAA.michalk@awpi.com>
Message-ID: <Pine.LNX.4.30.0101252051460.20287-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 25 Jan 2001,  Brian Michalk wrote:

> MTD_READECC(...) < 0

If you define ECC_DEBUG in doc2000.c, I think you'll find it's reporting
an ECC failure. Before I left work, I managed to reproduce this, as
M-Systems sent me some 72MiB units a couple of days ago. Unfortunately, I
don't know _why_ it's reporting the ECC failure.

For now, can you change the code so it ignores that and continues?

You don't have anything valuable on that DiskOnChip at the moment, do 
you?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
