Received: from dialup.rama.com.au ([202.0.186.166] helo=gateway.perth.rama.com.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15e7HT-0000BE-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 04:53:47 +0100
Received: from willhart-tech.com (IDENT:alex@[192.156.249.82])
	by gateway.perth.rama.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA08415
	for <linux-mtd@lists.infradead.org>; Tue, 4 Sep 2001 11:58:22 +0800
Message-ID: <3B945090.32C2E887@willhart-tech.com>
Date: Tue, 04 Sep 2001 11:54:56 +0800
From: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
MIME-Version: 1.0
To: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: _DoC_WaitReady in doc2000.c v1.45
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

I just updated to the latest CVS version of mtd and noticed that my
system got slower. A lot slower: with the 1.43 cvs version of doc2000.c
my system boots in 50 seconds, with the 1.45 version it boots in 2 min
20 sec. I noticed a long delay (the 1 min 30 sec difference) when the
DOC driver initializes between the: "Flash Chip Found: ..."  and "3
flash chips found" messages.

Anyway, after a few experiments with various CVS versions of doc2000.c,
I noticed that the _DoC_WaitReady function is the problem. If I replace
the _DoC_WaitReady from 1.45 with the version from 1.44 it works fine.

I was wondering if anyone has noticed this behaviour, and what were the
reasons to change it.

Just for the records, my kernel version is 2.4.7

Best Regards,
Alex.
