Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13L2Ff-0004Cd-00
	for mtd-list@infradead.org; Sat, 05 Aug 2000 12:36:27 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13L2Fe-0004CX-00
	for mtd@infradead.org; Sat, 05 Aug 2000 12:36:26 +0100
Date: Sat, 5 Aug 2000 12:35:02 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Juan Gonzo <kayemmess@yahoo.ca>
cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: compile errors - missing .h?
In-Reply-To: <20000804171302.3195.qmail@web5302.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0008051231460.929-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 4 Aug 2000, Juan Gonzo wrote:

> I updated via CVS my linux source tree today.  When I compile
> I get the following errors:
> 
> I remember a while back David saying that a person might
> miss updates to include/linux/jffs.h using CVS cause he 
> uses a symlink farm for this file.  I suspect this is why my
> compile is failing.
> 
> If this is the case, how can someone get 'jffs.h'?

The most reliable way to build JFFS is outside the kernel tree. Make sure
you don't have a 'jffs.h' in /usr/src/linux/include/linux.

Then go into the MTD CVS tree, in the 'fs/jffs/' directory, and type:
 make -C /usr/src/linux SUBDIRS=`pwd` modules

You may need to swap the comments on the following two lines in the
Makefile, depending on which kernel you're building against:

	#INODE_O := inode-v22.o
	INODE_O := inode-v23.o


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
