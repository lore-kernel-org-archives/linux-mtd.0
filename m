Received: from smtp-102.noc.nerim.net ([62.4.17.102] helo=mallaury.noc.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ecp6-0004ii-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 15:11:20 +0000
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by mallaury.noc.nerim.net (Postfix) with ESMTP id 8A13B62FB2
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 16:42:20 +0100 (CET)
Received: from slist by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 18edJ7-0005Wn-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 16:42:21 +0100
Date: Fri, 31 Jan 2003 16:42:21 +0100
From: Stephane List <stephane.list@lilotux.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Compilation of util directory
Message-ID: <20030131154221.GB21200@lilotux.net>
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

With the latest CVS code, I can't compile mkfs.jffs2.c

mips_fp_le-gcc -I../include -O2 -Wall -Wstrict-prototypes -Wshadow   -c -o mkfs.jffs2.o mkfs.jffs2.c
mkfs.jffs2.c: In function `write_regular_file':
mkfs.jffs2.c:823: incompatible types in assignment
mkfs.jffs2.c: In function `write_symlink':
mkfs.jffs2.c:925: incompatible types in assignment
mkfs.jffs2.c: In function `write_pipe':
mkfs.jffs2.c:967: incompatible types in assignment
mkfs.jffs2.c: In function `write_special_file':
mkfs.jffs2.c:1007: incompatible types in assignment
make: *** [mkfs.jffs2.o] Erreur 1

-- 
Stephane List
http://slist.lilotux.net
