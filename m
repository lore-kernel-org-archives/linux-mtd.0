Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1660Fz-00010p-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2001 02:03:27 +0000
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GN200I01U78X6@asu.edu> for linux-mtd@lists.infradead.org; Mon,
 19 Nov 2001 19:13:56 -0700 (MST)
Date: Mon, 19 Nov 2001 19:15:08 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: second "mount" hangs
In-reply-to: <001b01c17166$6af4de40$0100a8c0@secret.org.uk>
To: Si <spse@secret.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Michael Rothwell <rothwell@holly-springs.nc.us>, linux-mtd@lists.infradead.org
Message-id: <1006222508.15500.21.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <1006107094.1391.46.camel@gromit.house>
 <2915.1006111512@redhat.com> <001b01c17166$6af4de40$0100a8c0@secret.org.uk>
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

On Mon, 2001-11-19 at 18:54, Si wrote:
> >
> > I think that the last time I saw this reported, it was also on a blkmtd
> > device. A quick perusal of the blkmtd code shows that it uses sleep_on
> > functions - which makes me instantly assume it's racy.
> >
> > Simon - can you reproduce this problem?
> >
> > --
> > dwmw2
> 
> 
> This is reproducible on both blkmtd and mtdram (and probably others) - this
> is from stock 2.4.14
> testbox:/home/spse# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00400000 00020000 "mtdram test device"
> 
> testbox:/home/spse/src/mtd/util# ./mkfs.jffs2 >/dev/mtd/0
> testbox:/home/spse/src/mtd/util# mount -t jffs2 /dev/mtdblock/0 /mnt/test
> testbox:/home/spse/src/mtd/util# umount /mnt/test
> testbox:/home/spse/src/mtd/util# mount -t jffs2 /dev/mtdblock/0 /mnt/test
> testbox:/home/spse/src/mtd/util# mount -t jffs2 /dev/mtdblock/0 /mnt/test
> [Hang]
> 
> a ksymoops of a alt-sysrq T gives:
> Trace; c0232f55 <rwsem_down_read_failed+f5/118>
> Trace; c0235739 <stext_lock+789/31c6>
> Trace; c013de29 <sync_inodes+15/4c>
> Trace; c012ebc3 <fsync_dev+17/30>
> Trace; c013e427 <invalidate_device+17/58>
> Trace; c01cabce <mtdblock_release+22/b0>
> Trace; c0132e36 <blkdev_put+66/ac>
> Trace; c0131bcf <get_sb_bdev+1b7/2ec>
> Trace; c013fa23 <set_devname+27/54>
> Trace; c01321ab <do_kern_mount+af/13c>
> Trace; c0140755 <do_add_mount+21/cc>
> Trace; c01409db <do_mount+13f/158>
> Trace; c014084d <copy_mount_options+4d/9c>
> Trace; c0140a78 <sys_mount+84/c4>
> Trace; c0106b0b <system_call+33/38>
> 
> so possibly there is something in mtdblock that is going wrong.
> 

I've seen similar problems with busybox mount for some time (post
2.4.7ish) if the below entry is in /etc/fstab when busybox mount -a is
run, a similar hang occurs:

/dev/mtdblock2  /               jffs2   rw              0       0

both mount and kupdated are stuck in D states (this is on
2.4.15-pre6-rmk1)

Proc;  kupdated
>>EIP; c0021cbc <schedule+2a4/428>   <=====
Trace; c0021a18 <schedule+0/428>
Trace; c0145930 <__down_read+84/a0>
Trace; c01458ac <__down_read+0/a0>
Trace; c0049bac <sync_supers+f0/19c>
Trace; c0049abc <sync_supers+0/19c>
Trace; c00491f8 <sync_old_buffers+18/88>
Trace; c00491e0 <sync_old_buffers+0/88>
Trace; c0049598 <kupdate+140/150>
Trace; c0049458 <kupdate+0/150>
Trace; c001ac24 <kernel_thread+38/44>
Proc;  mount
>>EIP; c0021cbc <schedule+2a4/428>   <=====
Trace; c0021a18 <schedule+0/428>
Trace; c0145930 <__down_read+84/a0>
Trace; c01458ac <__down_read+0/a0>
Trace; c0049ccc <get_super+74/98>
Trace; c0049c58 <get_super+0/98>
Trace; c0059e9c <sync_inodes+1c/58>
Trace; c0059e80 <sync_inodes+0/58>
Trace; c0046150 <fsync_dev+28/40>
Trace; c0046128 <fsync_dev+0/40>
Trace; c005a694 <invalidate_device+24/68>
Trace; c005a670 <invalidate_device+0/68>
Trace; c00cb56c <mtdblock_release+28/114>
Trace; c00cb544 <mtdblock_release+0/114>
Trace; c004bb08 <blkdev_put+a0/128>
Trace; c004ba68 <blkdev_put+0/128>
Trace; c004a330 <get_sb_bdev+198/314>
Trace; c004a198 <get_sb_bdev+0/314>
Trace; c004aad4 <do_kern_mount+d4/1a4>
Trace; c004aa00 <do_kern_mount+0/1a4>
Trace; c005d5f0 <do_add_mount+28/14c>
Trace; c005d5c8 <do_add_mount+0/14c>
Trace; c005d93c <do_mount+150/164>
Trace; c005d7ec <do_mount+0/164>
Trace; c005d9ec <sys_mount+9c/e4>
Trace; c005d950 <sys_mount+0/e4>
Trace; c0019840 <ret_fast_syscall+0/38>
