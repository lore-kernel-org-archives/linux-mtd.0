From: choudhri@cs.tamu.edu (Siddharth Choudhuri)
Date: Mon, 24 Mar 2003 12:23:16 -0600 (CST)
Subject: Flash trace...
Message-ID: <Pine.SOL.4.10.10303241208180.1668-100000@dogbert>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I am trying to get a trace/log of all reads, writes and erase made to
flash. I added some printk in mtdchar.c [mtd_write() function] and
mtdblock.c [handle_mtdblock_request() function], but I do not see any
messages on console. I have klogd and syslog running too. 

I am running jffs2 on / and did a couple of file I/Os to look for console
logs. Am I putting the printk in wrong  places ? I thought the mtdchar.c
and mtdblock.c should be the closest thing to flash as all flash I/O
requests would eventually go through these.

TIA
-siddharth

_____________________________________________________________________
     Unix is user friendly - its just picky about its friends.     
_____________________________________________________________________
