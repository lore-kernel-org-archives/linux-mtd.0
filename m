Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18KP6M-00059b-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2002 20:29:34 +0000
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4A7@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: 'Ken Offer' <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Subject: RE: Problem: 51MB partition max size on jffs2
Date: Fri, 6 Dec 2002 16:00:04 -0500 
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

Ken Offer wrote: 
> Ok, I switched back to the latest CVS and tried to mount the 
> partition. 
>   No luck, even with a 32MB partition.  I get:
> 
> mount -t jffs2 /dev/mtdblock1 /mnt/jffs
> mount: /dev/mtdblock1 is not a valid block device
> 
> I have tried the latest CVS with both the "vmalloc c->blocks" change 
> and without.  In both cases mount fails the same way.  I turned up 
> debugging all the way for jffs2 and mtd but no messages were 
> printed to 
> /var/log/messages.  Guess I need to scour the jffs2 code and add some 
> more printks...

The latest CVS (05-Dec-2002) is working for me with kmalloc()
for c->blocks. 128MB Nand flash, 8MB Nor Flash and slram running
on battery-backed RAM all work. I have only tried copying some
files to them, no extensive testing, but they all mount OK. This
is with PPC 2.4.18.

Dave
