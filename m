Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cAkZ-0007Nv-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 21:16:15 +0100
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E475@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: "'joakim.tjernlund@lumentis.se'" <joakim.tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Disk blocks for long periods
Date: Tue, 6 Aug 2002 16:16:10 -0400 
MIME-Version: 1.0
Content-Type: text/plain
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

joakim.tjernlund@lumentis.se said:

> hmm, I just noticed that the BIG kernel lock is held while 
> the erasing thread executes, since kupdate takes it in 
> sync_old_buffers() (if I understand this code correctly). 
> Maybe that is causing current->need_resched to be set?
> 
> Also, is it not a bad idea to hold the kernel lock for, 
> possibly, seconds while erasing sectors?

If it is doing that, it doesn't seem right to me. But I 
thought jffs2/mtd bypassed the kernel buffers, so maybe 
kupdate and sync_old_buffers() are not involved here? I don't
know much about this.
 
> I assume your chip does not support buffered writes? or is it 
> just do_write_one_word() that is causing the log delays?

No, it doesn't support buffered writes. The long delay I saw
comes from sleeping for a jiffie during each call to
do_write_oneword().

Dave Ellis
dge@sixnetio.com
