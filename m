Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SE4R-0007wS-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2002 10:47:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECFE4@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECFE4@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Memory leak problem with JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Jul 2002 10:47:32 +0100
Message-ID: <19190.1026294452@redhat.com>
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

fgiasson@mediatrix.com said:
>  So to confirm that the leak comes from the fact of doing repeated
> mount/umount, I setup a third test which is exactly like the first
> test, except that I removed mount and umount commands. That time free
> memory usage remained constant, which make me think that the leak is
> probably related to memory incorrectly freed at umount time.
> Nevertheless, the third test also hanged, after 170 loops, at copy
> command.	

Strange. Most JFFS2 memory allocations are done through dedicated slabs, 
rather than with kmalloc(). Can you reproduce this with JFFS2 as a module, 
unloading and reloading the module each time the file system is unmounted? 
That should cause a BUG() if any slab objects are still allocated when you 
try to unload the module. 

If it's a kmalloc(). there are few enough of them that it should be 
possible to track it down.

>  That time free memory usage remained constant, which make me think
> that the leak is probably related to memory incorrectly freed at
> umount time.  Nevertheless, the third test also hanged, after 170
> loops, at copy command.		 

That shouldn't ever happen. Where was it spending the time? (SysRq-P is 
your friend). If you can reproduce with debugging and show what it's 
actually _doing_ during this time, that would be useful.

>  Between, note that the sync command sprinkled in the test loops are
> there to speed up the process.  In fact, I observed that doing a sync
> after a file erasure triggers the gc and wait for it to complete its
> task, so when I write data to JFFS2 after it does not need to garbage
> collect in the mean time.  This makes write times to JFFS2 much more
> deterministic. 

Interesting. I'm not entirely convinced I know why that happens. sync() 
shouldn't really do anything at all.

>  I am using linux kernel 2.4.19 pre 7, and JFFS2 code from CVS as per
> May 14th, 2002.  By the way, does anybody can tell me if there is some
> sorts of branches or labels in JFFS2 CVS, other that time stamps?  Is
> there a label per linux release, for instance? 

There is occasionally a branch made for really experimental code, like when 
we started on NAND support. At the moment there aren't any such branches. 
All we have is the development on the trunk, and the jffs2-2_4-branch which 
contains the same code as is in Marcelo's 2.4.19-rc2. 

For anyone using JFFS2 in production, I would recommend using that version, 
rather than the trunk code. 

--
dwmw2
