Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Er0m-000566-00
	for mtd-list@infradead.org; Wed, 19 Jul 2000 11:23:32 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Er0k-000560-00
	for mtd@infradead.org; Wed, 19 Jul 2000 11:23:30 +0100
Received: from evoserve.com (gateway.evoserve.com [210.16.10.120])
	by athena.evoserve.com (8.9.3/8.9.3) with ESMTP id SAA12599
	for <mtd@infradead.org>; Wed, 19 Jul 2000 18:25:29 +0800
Message-ID: <39758691.74272A26@evoserve.com>
Date: Wed, 19 Jul 2000 18:44:34 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: multiple jffs_file_write calls
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Does the VFS layer do the subdivision of large file writes such that it
calls jffs_file_write multiple times with count exactly equal to
MAX_CHUNK_SIZE? When jffs_file_write writes the chunk it appends the
name and header to it and we end up with a chunk bigger than
MAX_CHUNK_SIZE. Should we make VFS aware of mtd like what I think should
be done or handle it in another way? What do you think?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
