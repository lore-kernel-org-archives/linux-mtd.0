Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13EiHm-0004JP-00
	for mtd-list@infradead.org; Wed, 19 Jul 2000 02:04:30 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13EiHk-0004JJ-00
	for mtd@infradead.org; Wed, 19 Jul 2000 02:04:29 +0100
Received: from evoserve.com (gateway.evoserve.com [210.16.10.120])
	by athena.evoserve.com (8.9.3/8.9.3) with ESMTP id JAA23534
	for <mtd@infradead.org>; Wed, 19 Jul 2000 09:06:38 +0800
Message-ID: <3975038D.40CF3B90@evoserve.com>
Date: Wed, 19 Jul 2000 09:25:33 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: jffs_file_write and DOC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I observed that the jffs_file_write function misbehaves when given a
chunk bigger than MAX_CHUNK_SIZE. It is passed a chunk exactly equal to
MAX_CHUNK_SIZE so when it adds the inode and the name the resulting
chunk in is more or less 60 bytes bigger than MAX_CHUNK_SIZE which is
4096 bytes in my case with the DOC2000.

Cat just writes a file shorter than it should be on flash. I used a
modified DOC_loadbios utility to download my JFFS images to the DOC. If
I dont write anything to it I could mount and unmount cleanly. But when
I write to it, I get bad checksums on the next mount and totoal mount
failure after couple more mounts.

How is jffs_write_file called when we write a large file to flash? I
dont see any loops in jffs_file_write. Does the VFS layer handle the
subdivisions and calls jffs_file_write with chunks equal to max chunk
size? How do we handle this ?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
