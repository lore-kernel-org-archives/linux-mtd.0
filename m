Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JgxRn-0001zM-Jq
	for linux-mtd@lists.infradead.org; Wed, 02 Apr 2008 07:31:52 +0000
Message-ID: <47F33527.7030709@nokia.com>
Date: Wed, 02 Apr 2008 10:26:31 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Ram <vshrirama@gmail.com>
Subject: Re: nand tests causes "uninterruptible sleep"
References: <8bf247760804010907q7a04c212wf437acfd5e44e937@mail.gmail.com>
In-Reply-To: <8bf247760804010907q7a04c212wf437acfd5e44e937@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ram wrote:
> Hi,
>   I am using linux 2.6.22. I am testing my nand driver/nand device.
>   I am using a arm based processor.
> 
>   To test my nand device, i am using fs-tests package that comes
>   with mtd-utils git tree.
> 
>   These are standard filesystem regression tests.
> 
>   I am running the test to test a particular partition.
> 
>   During one of the tests: The test process hangs.
>   When i do a ps -eal i get a -D against that process.
>   That particular process remains in that state forever.
> 
>   I have eliminated all the infinte loops (checks for busy/read pin/nand reset)
>   in my nand driver. I have tried to put debug prints to print
> failures in my nand
>   device. I dont see any failure prints when i run the tests.
> 
>   I tried doing "echo t > /proc/sysrq-trigger" i am appending the results.
> 
>   Basically, i am trying to isolate the code that is causing the process
>   to go into an uniterruptible sleep state.
> 
>   It is to be noted that - When the fs-tests process has gone into
> "uninterruptible
>   sleep state" accessing the partion under test makes that process
>   also go into the uninterruptible sleep state"
> 
>   What i am trying to say is - If i try to copy something to the
> "partition under test"
>   that process (cp) also goes into that state.
> 
>   In other words,  Once the fs-test process goes into -D state
> ("uninterruptible sleep state")
>   I cannot access the partition under test.
> 
>   However, i can access other partitions in the nand device without
> any problem.
> 
>    I need some suggestions/advices to debug the issue.
>    How does one debug such a issue.
> 
>   please advice.
> 
> Thanks and Regards,
>   sriram
> 
> 
> 
> 
> Output of echo t > /proc/sysrq-trigger
> -----------------------------------------------------
> 
> 
> 
> test_2        D C022BB54     0   267    248 (NOTLB)
> [<c022b620>] (schedule+0x0/0x608) from [<c022c434>] (io_schedule+0x2c/0x48)
> [<c022c408>] (io_schedule+0x0/0x48) from [<c0077eb4>] (sync_page+0x50/0x5c)
>  r5:00000000 r4:c38a3a34
> [<c0077e64>] (sync_page+0x0/0x5c) from [<c022c62c>] (__wait_on_bit+0x64/0xa8)
> [<c022c5c8>] (__wait_on_bit+0x0/0xa8) from [<c0078258>]
> (wait_on_page_bit+0xa8/0xb8)
> [<c00781b0>] (wait_on_page_bit+0x0/0xb8) from [<c0079e60>]
> (read_cache_page+0x38/0x58)
>  r6:00007080 r5:c0340a80 r4:00000000
> [<c0079e28>] (read_cache_page+0x0/0x58) from [<c0113c50>]
> (jffs2_gc_fetch_page+0x28/0x60)
>  r5:00007000 r4:c38a3afc
> [<c0113c28>] (jffs2_gc_fetch_page+0x0/0x60) from [<c011128c>]
> (jffs2_garbage_collect_pass+0x1130/0x185c)
>  r4:00007850
> [<c011015c>] (jffs2_garbage_collect_pass+0x0/0x185c) from [<c010b358>]
> (jffs2_reserve_space+0x134/0x1d0)
> [<c010b224>] (jffs2_reserve_space+0x0/0x1d0) from [<c010dd18>]
> (jffs2_write_inode_range+0x60/0x37c)
> [<c010dcb8>] (jffs2_write_inode_range+0x0/0x37c) from [<c0108f08>]
> (jffs2_commit_write+0x130/0x264)
> [<c0108dd8>] (jffs2_commit_write+0x0/0x264) from [<c007a5c4>]
> (generic_file_buffered_write+0x41c/0x610)
> [<c007a1ac>] (generic_file_buffered_write+0x4/0x610) from [<c007af84>]
> (__generic_file_aio_write_nolock+0x51c/0x54c)
> [<c007aa68>] (__generic_file_aio_write_nolock+0x0/0x54c) from
> [<c007b034>] (generic_file_aio_write+0x80/0xf4)
> [<c007afb8>] (generic_file_aio_write+0x4/0xf4) from [<c0097d10>]
> (do_sync_write+0xc0/0x110)
> [<c0097c50>] (do_sync_write+0x0/0x110) from [<c0097e2c>] (vfs_write+0xcc/0x150)
>  r9:c38a2000 r8:00000000 r7:00000190 r6:c38a3f78 r5:bec68b1c
> r4:c3d313e0
> [<c0097d60>] (vfs_write+0x0/0x150) from [<c0097f70>] (sys_write+0x4c/0x74)
>  r7:00007850 r6:c38a3f78 r5:c3d313e0 r4:c3d31400
> [<c0097f24>] (sys_write+0x0/0x74) from [<c0038de0>] (ret_fast_syscall+0x0/0x2c)
>  r8:c0038f84 r7:00000004 r6:00800000 r5:bec68cac r4:00000000
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


Looks like it is fixed in current MTD.  I found the following:



commit fc0e01974ccccc7530b7634a63ee3fcc57b845ea
Author: Jason Lunz <lunz@falooley.org>
Date:   Sat Sep 1 12:06:03 2007 -0700

    [JFFS2] fix write deadlock regression
    
    I've bisected the deadlock when many small appends are done on jffs2 down to
    this commit:
    
    commit 6fe6900e1e5b6fa9e5c59aa5061f244fe3f467e2
    Author: Nick Piggin <npiggin@suse.de>
    Date:   Sun May 6 14:49:04 2007 -0700
    
        mm: make read_cache_page synchronous
    
        Ensure pages are uptodate after returning from read_cache_page, which allows
        us to cut out most of the filesystem-internal PageUptodate calls.
    
        I didn't have a great look down the call chains, but this appears to fixes 7
        possible use-before uptodate in hfs, 2 in hfsplus, 1 in jfs, a few in
        ecryptfs, 1 in jffs2, and a possible cleared data overwritten with readpage in
        block2mtd.  All depending on whether the filler is async and/or can return
        with a !uptodate page.
    
    It introduced a wait to read_cache_page, as well as a
    read_cache_page_async function equivalent to the old read_cache_page
    without any callers.
    
    Switching jffs2_gc_fetch_page to read_cache_page_async for the old
    behavior makes the deadlocks go away, but maybe reintroduces the
    use-before-uptodate problem? I don't understand the mm/fs interaction
    well enough to say.
    
    [It's fine. dwmw2.]
    
    Signed-off-by: Jason Lunz <lunz@falooley.org>
    Signed-off-by: David Woodhouse <dwmw2@infradead.org>

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 1d3b7a9..8bc727b 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -627,7 +627,7 @@ unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
        struct inode *inode = OFNI_EDONI_2SFFJ(f);
        struct page *pg;
 
-       pg = read_cache_page(inode->i_mapping, offset >> PAGE_CACHE_SHIFT,
+       pg = read_cache_page_async(inode->i_mapping, offset >> PAGE_CACHE_SHIFT,
                             (void *)jffs2_do_readpage_unlock, inode);
        if (IS_ERR(pg))
                return (void *)pg;
