Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14L5rZ-0004oD-00
	for mtd-list@infradead.org; Tue, 23 Jan 2001 16:00:05 +0000
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14L5rX-0004o7-00
	for mtd@infradead.org; Tue, 23 Jan 2001 16:00:04 +0000
Message-ID: <52AF3CB987C7D41183CD0090271F67C301C7CE@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "JFFS (E-mail)" <jffs-dev@axis.com>, "MTD (E-mail)"
	 <mtd@infradead.org>
Subject: Endless garbage collection
Date: Tue, 23 Jan 2001 15:59:20 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

It's possible to get the garbage collection going in an endless loop by
creating lots of small files. eg, if I create 25 files, each 0 bytes long,
on an empty filesystem, garbage collection starts and goes on and on.

Perhaps the test for too much RAM being used in thread_should_wake() ought
to take the number of files into account? ie should it be:

	/* If there is too much RAM used by the various structures, GC */
	if (jffs_get_node_inuse() >
(c->fmc->used_size/c->fmc->max_chunk_size * 5 + 25 + jffs_get_file_count()))
{

where  jffs_get_file_count() returns the number of files on the filesystem.

Simon



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
