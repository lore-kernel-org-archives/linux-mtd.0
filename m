Received: from smtp-102.nerim.net ([62.4.16.102] helo=kraid.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18gMPq-00039f-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2003 10:04:26 +0000
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by kraid.nerim.net (Postfix) with ESMTP id D3D5240F5D
	for <linux-mtd@lists.infradead.org>; Wed,  5 Feb 2003 11:04:25 +0100 (CET)
Received: from slist by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 18gMPp-0001IH-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2003 11:04:25 +0100
Date: Wed, 5 Feb 2003 11:04:25 +0100
From: Stephane List <stephane.list@lilotux.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <20030205100425.GA4852@lilotux.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Intel Strataflash on MIPS
Content-Type: text/plain; charset=us-ascii
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

Hi David,

One thing I didn't told you, is that I'm using an IDT.
This is a CPU with a MIPS inside.

In linux kernel, you've wrote :

./include/asm-mips/io.h
#define IO_SPACE_LIMIT 0xffff


That's why I can't read more than 0xFFFF bytes in my flash, and that's
why I can't erase the second sector of my flash, could you tell me how
to modify the mtd driver to make it MIPS compliant ?

Thanks


-- 
Stephane List
http://slist.lilotux.net
