Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GLEy-0004U5-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 14:29:08 +0000
Received: from localhost (rob@localhost)
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id fBIEdpe32676
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 15:39:51 +0100
Date: Tue, 18 Dec 2001 15:39:51 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: linux-mtd@lists.infradead.org
Subject: Map driver usage
Message-ID: <Pine.LNX.4.21.0112181515390.32030-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi everybody,

I have a question regarding the usage od the access primitives
(e.g. xx_read8(), xx_read16(), xx_copy_from() and so on). In writing
a map driver, can one assume that the MTD layer never calls these
functions to cross a flash device's block boundary ?

The reason I'm asking is that I am writing a new map driver for a board
that has a somwhat strange logical flash layout and I would like
to hide that by "shuffling" some of the blocks so that they appear
at different offsets. Transforming the offset parameter in the above
mentioned functions would be an easy way to do this, but it requires
that these functions are never asked to cross an erase block boundary.

Thanks for any insights

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
