Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1332YT-00053x-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 21:17:29 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 1332YS-00053r-00
	for mtd@infradead.org; Fri, 16 Jun 2000 21:17:28 +0100
Date: Fri, 16 Jun 2000 22:17:37 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: Alexander Larsson <alex@cendio.se>
cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: Bug in JFFS
In-Reply-To: <Pine.LNX.4.10.10006161855460.32348-100000@tammy.signum.se>
Message-ID: <Pine.LNX.3.96.1000616221427.18983B-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 16 Jun 2000, Alexander Larsson wrote:
> We should use generic_file_write in jffs_file_operations instead of
> jffs_write_file. Then we should implement writepage, prepare_write and 
> commit_write in address_space_operations. These should look quite like
> jffs_write_file, so this wouldn't be hard.
> 
> There is one problem here though. For each write the page of the file that
> is modified is read in, modified and written out in its entierty. This
> means several small writes to a file will become several 4Kb writes to the
> log.

That's why its unsymmetric from the beginning. It does not matter if the
OS reads pages or files, but it matters if it writes pages or passes on
writes directly. The latter is more or less required by JFFS design, while
the former is not. If you start involving page-based file i/o, you're back
at the block-based journaling that any other JFS uses, eventually.. but
with more overhead :) 

I thought we had correct page invalidation in the write mechanism. Did it
disappear in the 2.2/2.3 port or was it never there ? :) 

-Bjorn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
