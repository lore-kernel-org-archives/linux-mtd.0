Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132uVK-0002tR-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 12:41:42 +0100
Date: Fri, 16 Jun 2000 13:42:10 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c'
In-Reply-To: <E132u3n-0002oD-00@infradead.org>
Message-ID: <Pine.LNX.4.10.10006161340080.32189-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 16 Jun 2000, David Woodhouse wrote:

> Update of /home/cvs/mtd/fs/jffs
> In directory infradead.org:/tmp/cvs-serv10791
> 
> Modified Files:
> 	Makefile 
> Added Files:
> 	inode-v22.c 
> Removed Files:
> 	inode.c 
> Log Message:
> Add inode-v22.c and fix Makefile to compile the appropriate one according
> to which kernel we're part of.

Hmmm. There is quite a lot of 'spurious' differences in the 2.2 version
and the 2.3 version. They could be merged to be much more alike.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
