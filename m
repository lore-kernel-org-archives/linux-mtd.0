Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14gGuc-0007pn-00
	for mtd-list@infradead.org; Fri, 23 Mar 2001 02:02:46 +0000
Received: from new-york.lcs.mit.edu ([18.26.4.65])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14gGub-0007ph-00
	for mtd@infradead.org; Fri, 23 Mar 2001 02:02:45 +0000
Date: Thu, 22 Mar 2001 21:02:27 -0500 (EST)
Message-Id: <200103230202.f2N22R612056@new-york.lcs.mit.edu>
From: "Douglas S. J. De Couto" <decouto@lcs.mit.edu>
To: mtd@infradead.org
cc: ipaq@handhelds.org
Subject: jffs2 problem
Reply-to: decouto@lcs.mit.edu
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


running jffs2 on ipaq with linux, get the following errors:


Argh. Special inode #1013 had more than one node
Argh. Special inode #1007 had more than one node
Argh. Special inode #1019 had more than one node
Argh. Special inode #1014 had more than one node
Argh. Special inode #1009 had more than one node
Argh. Special inode #1022 had more than one node
Argh. Special inode #1016 had more than one node
Argh. Special inode #1017 had more than one node
Argh. Special inode #1020 had more than one node

i am not really sure what the file system is supposed to be doing, QPE
is running....

is this likely to happen if i forgot to erase the flash with eflash in
the boat loader before loading the jffs2 image?  e.g. i had one jffs2
image, and then i loaded another without eflashing.  or is it a bug?

the jffs2 image was produced using mkfs.jffs2 with options 
``-p -e 0x40000'' 

the kernel i compiled is from the handhelds.org CVS, and the CVS
version is... well ther are a lot of files, so if you want to know a
specific thing i can tell you.

cheers

d

-- 
Douglas S. J. De Couto    decouto@lcs.mit.edu



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
