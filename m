Received: from smtp-102.nerim.net ([62.4.16.102] helo=kraid.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eE9J-0000zw-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 12:50:33 +0000
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by kraid.nerim.net (Postfix) with ESMTP id 603DF40E31
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 14:21:33 +0100 (CET)
Received: from slist by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 18eEdJ-0003aV-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 14:21:33 +0100
Date: Thu, 30 Jan 2003 14:21:33 +0100
From: Stephane List <stephane.list@lilotux.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: crc32.h
Message-ID: <20030130132133.GA13604@lilotux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I'm using the CVS source code.
All files in "fs/jffs2" use #include <linux/crc32.h>
But this file is not part of 2.4.x kernel it's only in 2.5 


B.R.
Stephane
-- 
Stephane List
http://slist.lilotux.net
