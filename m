Received: from emc.emcraft.ru ([213.24.253.239] ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160fkl-0005up-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 09:09:11 +0000
Received: from emc.emcraft.ru
	([127.0.0.1] helo=emcraft.ru ident=boris)
	by emc.emcraft.ru with esmtp (Exim 3.22 #1)
	id 160ftl-0007qp-00
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2001 12:18:29 +0300
Message-ID: <3BE65965.F5C16E70@emcraft.ru>
Date: Mon, 05 Nov 2001 12:18:29 +0300
From: Boris Bulkin <boris@emcraft.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DOC2000 support for a custom PPC750 board
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

Hi!

Could anyone please advise something on the following issue?

I'm working on port of a firmware program to a PPC750-based board, and I
need to support for booting Linux from a DOC2000 partition in the
firmware. I'm thinking of using existing MTD stuff as a base for my
efforts. Once the firmware is working, I'll need to support DOC in Linux
too.

I'm new to the MTD project, so any information will be very appreciated.
What is the current state of MTD support for DOC? Do MTD DOC drivers
require any firmware from M-Sys, or does MTD provide its own DOC
firmware? Then, I know that M-Systems  suggests running its DOS-based
tools for partitioning and formatting a DOC device. Are there any
open-source replacements for them?

Of course, my firmware program will be open-source, too.

Many thanks in advance.
Boris
