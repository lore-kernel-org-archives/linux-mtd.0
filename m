Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cBUI-0007VB-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 22:03:30 +0100
Message-ID: <001f01c23d8d$11bbd240$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Dave Ellis" <DGE@sixnetio.com>
Cc: <linux-mtd@lists.infradead.org>
References: <00512BA4F9D3D311912A009027E9B8F407E475@NT>
Subject: Re: Disk blocks for long periods
Date: Tue, 6 Aug 2002 23:06:01 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


> joakim.tjernlund@lumentis.se said:
> 
> > hmm, I just noticed that the BIG kernel lock is held while 
> > the erasing thread executes, since kupdate takes it in 
> > sync_old_buffers() (if I understand this code correctly). 
> > Maybe that is causing current->need_resched to be set?
> > 
> > Also, is it not a bad idea to hold the kernel lock for, 
> > possibly, seconds while erasing sectors?
> 
> If it is doing that, it doesn't seem right to me. But I 
> thought jffs2/mtd bypassed the kernel buffers, so maybe 
> kupdate and sync_old_buffers() are not involved here? I don't
> know much about this.

hmm, just remembered that a spin_lock() is NOP on Uni Processor computers.

Kupdate does the erasing and puts a CLEANMARKER on it when its 
done.  Just follow sync_old_buffers()  until it ends up in jffs2_write_super()

BTW
          jffs2_mark_erased_blocks() also checks the newly erased block for
         0xffffffff by reading the EB back. Removing this test improves my litte test case 
         I wrote about in my previous post to the mtd list. The max copy time is reduced
         from 20 seconds to 15 seconds.

        Jocke 

>  
> > I assume your chip does not support buffered writes? or is it 
> > just do_write_one_word() that is causing the log delays?
> 
> No, it doesn't support buffered writes. The long delay I saw
> comes from sleeping for a jiffie during each call to
> do_write_oneword().

I tried your patch and it improved my write times as well. Thanks

> 
> Dave Ellis
> dge@sixnetio.com
