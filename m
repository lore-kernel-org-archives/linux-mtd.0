Received: from belize.chezphil.org ([80.68.91.122])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoiGc-00038q-Kh
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 11:51:52 -0400
Received: from localhost ([127.0.0.1] helo=chezphil.org)
	by belize.chezphil.org with esmtp (Exim 4.50) id 1HomnF-0005iM-0k
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 21:41:49 +0100
From: "Phil Endecott" <spam_from_linux_mtd@chezphil.org>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 17 May 2007 16:51:39 +0100
Subject: alloc/free quesion in ixp4xx driver
Message-ID: <1179417099816@dmwebmail.belize.chezphil.org>
MIME-Version: 1.0
Content-Type: text/plain; format="flowed"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear MTD experts,

I have been looking at the MTD ixp4xx driver 
(drivers/mtd/maps/ixp4xx.c), mainly as an example of something that 
uses the ixp4xx expansion bus, and I have a couple of questions.  I 
apologise for being a "newbie" on this subject, I have not written a 
lot of kernel code.

- In ixp4xx_flash_probe(), a struct ixp4xx_flash_info in kalloc()ed.  
Where is it freed?

- In ixp4xx_flash_remove() you have:
       release_resource(info->res);
       kfree(info->res);
   In other places where release_resource() is called I do not see a 
call to kfree().  Is this right?

Most likely, this is all OK and I need to learn more about how these 
functions should be used.  But my thought on seeing this was that the 
kfree() should have been freeing info, not info->res.

I am also uncertain about release_resource() vs. release_mem_region().  
Are they interchangeable?

I have been looking at 2.6.21, but a quick check at 
http://git.infradead.org/?p=mtd-2.6.git;a=blob;f=drivers/mtd/maps/ixp4xx.c;h=7a828e3e6446d7f9254f083d3b02bb2e9e02e9e0;hb=HEAD 
suggests that it is the same in your tree (if I have understood gitweb properly).


Many thanks,

Phil.

P.S. I'm subscribed to the digest, so if you Cc: me in your reply I'll 
see it sooner.
