Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eIPr-0006AR-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 16:19:23 +0000
Received: from localhost (rob@localhost)
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id g1MGUbJ20829
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 17:30:37 +0100
Date: Fri, 22 Feb 2002 17:30:37 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: linux-mtd@lists.infradead.org
Subject: Re-entrancy of flash erase/write
Message-ID: <Pine.LNX.4.21.0202221726010.8843-100000@dagobert.svc.sysgo.de>
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

Hi,

maybe I just don't know where to look, but..

Am I right in assuming that it is not possible to erase
and/or write different blocks of the same flash chip
concurrently ?

If so, where is the lock in the MTD code that would
prevent concurrent execution of erase/write on the
same chip by multiple processes ?

Thanks for any insights!

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
