Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12uaz0-0007FM-00
	for mtd-list@infradead.org; Wed, 24 May 2000 14:13:58 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12uayz-0007FG-00
	for cvs-notify@infradead.org; Wed, 24 May 2000 14:13:57 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c intrep.h jffs_fm.c jffs_fm.h'
Message-Id: <E12uayz-0007FG-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Wed, 24 May 2000 14:13:57 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv27828

Modified Files:
	intrep.c intrep.h jffs_fm.c jffs_fm.h 
Log Message:
Patch from finn håkansson (finn@axis.se).
Changelog:

        * intrep.c (jffs_rewrite_data): Added a missing free_page().
        (jffs_garbage_collect_next): Modified the computations of
        the amount of data to rewrite. Correctly check if `dirty_fm'
        was allocated.
        (jffs_try_to_erase): Better handle the return value from
        the call to jffs_clear_end_of_node.
        Added and changed some printouts.
        Modified the TODO list and the header.
        * intrep.h: Modified the header.
        * jffs_fm.h: Likewise.
        * jffs_fm.c: Likewise.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
