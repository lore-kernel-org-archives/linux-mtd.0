Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Nvgt-0006wj-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 11:44:47 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Nvgo-0006wd-00
	for mtd@infradead.org; Wed, 31 Jan 2001 11:44:44 +0000
Message-ID: <01C08B82.5716DF60@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: MTD patches for 2.0 / 2.2 kernels
Date: Wed, 31 Jan 2001 12:35:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I took a look at the "patches" directory and recognized that 
the patches that are available via ftp have the complete mtd
tree included. Wouldn' t it be much nicer to have a patch
script (like patchin.sh), that 
1. makes symlinks from the kernel source into the mtd tree,
and 2. applies a very small patch for the kernel source 
(init/main.c, drivers/Makefile, ...)

I think that would be much more maintainable and easier to
use than the seperate patches from the ftp server. It could even
be reduced to invoke the patch script with the path to the
kernel source, and the script might retrieve the version from
there to apply the correct patch. I'd like to see all the patches
inside the CVS distribution, instead of having them to download
via ftp seperately. 

Is there a special reason why there is a seperate link for 
each mtd source file in patchin.sh, instead of having just one
symbolic link for the mtd directory? This way, the kernel would 
still be compileable if files are added to the mtd directory,
without having to care about the symlinks.

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
