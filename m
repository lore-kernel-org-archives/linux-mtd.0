Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NZdE0-0004tK-0i
	for linux-mtd@lists.infradead.org; Tue, 26 Jan 2010 04:40:28 +0000
Received: by fxm22 with SMTP id 22so8800239fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Jan 2010 20:40:20 -0800 (PST)
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <4B591573.60602@theptrgroup.com>
References: <4B591573.60602@theptrgroup.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Jan 2010 06:40:08 +0200
Message-Id: <1264480808.2401.78.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	Matt Mackall <mpm@selenic.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-01-21 at 22:03 -0500, Jeff Angielski wrote:
> I am trying use an UBIFS root filesystem on my PowerPC MPC8544 but I am 
> seeing some intermitent problems with "UBIFS assert failed in 
> ubifs_dirty_inode" errors.
> 
> On the first boot after I program the NAND with a fresh UBI image, 
> everything seems to work ok.
> 
> After that, on subsequent powercycles or reboots, I sometimes see a boot 
> with the following error:
> 
> [    5.984232] UBIFS assert failed in ubifs_dirty_inode at 377 (pid 1011)

Interesting.

The stack trace for this assertion is:

[   42.724193] [df121e60] [c00070f8] show_stack+0x3c/0x17c (unreliable)
[   42.730566] [df121ea0] [c017e754] ubifs_dirty_inode+0xe0/0xe4
[   42.736325] [df121eb0] [c00c6fbc] __mark_inode_dirty+0x3c/0x16c
[   42.742260] [df121ec0] [c01f9034] random_write+0x8c/0xa4
[   42.747584] [df121ef0] [c00a4d2c] vfs_write+0xb4/0x184
[   42.752730] [df121f10] [c00a53e8] sys_write+0x4c/0x90
[   42.757795] [df121f40] [c000fd48] ret_from_syscall+0x0/0x3c

Which leads us to

~/git/linux-2.6/drivers/char/random.c, where we can find this code:

        inode->i_mtime = current_fs_time(inode->i_sb);
        mark_inode_dirty(inode);
        return (ssize_t)count;

which is the reason for the assertion and for the further budgeting
screw-up.

The thing is that UBIFS has to allocate budget every-time a clean inode
is made dirty. But the 'random' driver bypasses UBIFS budget allocation,
and instead, changes mtime directly and marks the inode as dirty
directly.

The driver should instead call the ->setattr() method of the inode,
which should do the right thing. IOW, something like this is needed:

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 8258982..f911781 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1108,6 +1108,7 @@ static ssize_t random_write(struct file *file,
const char __user *buffer,
 {
        size_t ret;
        struct inode *inode = file->f_path.dentry->d_inode;
+       struct iattr;

        ret = write_pool(&blocking_pool, buffer, count);
        if (ret)
@@ -1116,8 +1117,11 @@ static ssize_t random_write(struct file *file,
const char __user *buffer,
        if (ret)
                return ret;

-       inode->i_mtime = current_fs_time(inode->i_sb);
-       mark_inode_dirty(inode);
+       iattr->i_mtime = current_fs_time(inode->i_sb);
+       iattr->ia_valid = ATTR_ATIME;
+       ret = inode_setattr(inode, &attr);
+       if (ret)
+               return ret;
        return (ssize_t)count;
 }

Note - I did not even compile-test this. Would you try that please :-)

CCing Matt and lkml.

> If that message occurs, in less than 1 or 2 minutes, the system is 
> unresponsive and I start to see infinite messages of:
> 
> [   55.072791] UBIFS assert failed in ubifs_release_budget at 566 (pid 974)
> [   55.079502] Call Trace:
> [   55.081960] [df187ce0] [c00070f8] show_stack+0x3c/0x17c (unreliable)
> [   55.088334] [df187d20] [c0196a44] ubifs_release_budget+0x3e0/0x5d0
> [   55.094533] [df187d30] [c01752d4] release_existing_page_budget+0x30/0x40
> [   55.101241] [df187d60] [c01765ac] do_writepage+0xd0/0x1e4
> [   55.106652] [df187da0] [c00786e0] __writepage+0x24/0x80
> [   55.111884] [df187db0] [c0078b14] write_cache_pages+0x184/0x310
> [   55.117817] [df187e50] [c00c5cb0] writeback_single_inode+0xac/0x288
> [   55.124092] [df187e80] [c00c6608] writeback_inodes_wb+0x2d4/0x458
> [   55.130193] [df187ed0] [c00c68b8] wb_writeback+0x12c/0x200
> [   55.135686] [df187f40] [c00c6cb0] wb_do_writeback+0x224/0x244
> [   55.141439] [df187f80] [c00c6d38] bdi_writeback_task+0x68/0xa8
> [   55.147282] [df187fa0] [c0086430] bdi_start_fn+0x80/0x104
> [   55.152691] [df187fc0] [c0050cc4] kthread+0x78/0x7c
> [   55.157581] [df187ff0] [c000fac8] kernel_thread+0x4c/0x68
> [   55.163362] UBIFS assert failed in ubifs_budget_space at 463 (pid 1139)

[sip]

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
