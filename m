Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14L6Cf-00051k-00
	for mtd-list@infradead.org; Tue, 23 Jan 2001 16:21:53 +0000
Received: from [207.35.116.203] (helo=mail.colubris.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14L6Ce-00051e-00
	for mtd@infradead.org; Tue, 23 Jan 2001 16:21:52 +0000
Message-ID: <3A6DAF44.36276D34@colubris.com>
Date: Tue, 23 Jan 2001 11:20:20 -0500
From: Martin Gadbois <martin.gadbois@colubris.com>
MIME-Version: 1.0
To: Simon Munton <Simon.Munton@m4data.co.uk>
CC: "JFFS (E-mail)" <jffs-dev@axis.com>, "MTD (E-mail)" <mtd@infradead.org>
Subject: Re: Endless garbage collection
References: <52AF3CB987C7D41183CD0090271F67C301C7CE@m4eng.m4data.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Simon Munton wrote:

> It's possible to get the garbage collection going in an endless loop by
> creating lots of small files. eg, if I create 25 files, each 0 bytes long,
> on an empty filesystem, garbage collection starts and goes on and on.
>
> Perhaps the test for too much RAM being used in thread_should_wake() ought
> to take the number of files into account? ie should it be:
>
>         /* If there is too much RAM used by the various structures, GC */
>         if (jffs_get_node_inuse() >
> (c->fmc->used_size/c->fmc->max_chunk_size * 5 + 25 + jffs_get_file_count()))
> {
>
> where  jffs_get_file_count() returns the number of files on the filesystem.

You're absolutly right. The only issues are performance of the
jffs_get_file_count(), because it is executed every times an insert_node() is
called. We should keep a running count of how many files exists in the
partition, but I did not do that yet.
Here's my version:

if (jffs_get_node_inuse() > (c->fmc->used_size/c->fmc->max_chunk_size * 5
                        + jffs_foreach_file(c, jffs_file_count) * 2 + 50))
  return 1;

I suggest to raise 25 to 50, to avoid silly problems like this.



--
Martin Gadbois
S/W designer
Colubris Networks (http://www.colubris.com)





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
