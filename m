Received: from smtp-102.nerim.net ([62.4.16.102] helo=kraid.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eYo4-000413-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 10:54:00 +0000
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by kraid.nerim.net (Postfix) with ESMTP id 14DCF40EF4
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 12:25:01 +0100 (CET)
Received: from slist by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 18eZI4-0004p0-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 12:25:00 +0100
Date: Fri, 31 Jan 2003 12:25:00 +0100
From: Stephane List <stephane.list@lilotux.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Howto handle 2 flashs with addresses not contiguous ?
Message-ID: <20030131112500.GA18237@lilotux.net>
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

Hi,

My mtd drivers are not far from working..
I've replaced CONFIG_ZLIB by CONFIG_ZLIB_DEFLATE and INFLATE
It's compiled and linked in lib.a but I can't see the functions in
System.map ! And when I insmod jffs2, I've got unresolved symbols..


I've got flash at physical address :
0x1000 0000 - 0x11FF FFFF
and
0X2000 0000 - 0x21FF FFFF

what is the good method to handle this ? I don't thing it's a good
solution to ioremap from the beginning of the first flash to the end of
the second. Will it work if I copy physmap.c in a second file to have 2
physmap drivers inserted in my kernel ?

Thanks
Stephane

PS : I hope you understand my english

-- 
Stephane List
http://slist.lilotux.net
