Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165zyP-0000zX-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2001 01:45:17 +0000
Message-ID: <001b01c17166$6af4de40$0100a8c0@secret.org.uk>
From: "Si" <spse@secret.org.uk>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Michael Rothwell" <rothwell@holly-springs.nc.us>
Cc: <linux-mtd@lists.infradead.org>
References: <1006107094.1391.46.camel@gromit.house>  <2915.1006111512@redhat.com>
Subject: Re: second "mount" hangs 
Date: Tue, 20 Nov 2001 01:54:14 -0000
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

>
> I think that the last time I saw this reported, it was also on a blkmtd
> device. A quick perusal of the blkmtd code shows that it uses sleep_on
> functions - which makes me instantly assume it's racy.
>
> Simon - can you reproduce this problem?
>
> --
> dwmw2


This is reproducible on both blkmtd and mtdram (and probably others) - this
is from stock 2.4.14
testbox:/home/spse# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"

testbox:/home/spse/src/mtd/util# ./mkfs.jffs2 >/dev/mtd/0
testbox:/home/spse/src/mtd/util# mount -t jffs2 /dev/mtdblock/0 /mnt/test
testbox:/home/spse/src/mtd/util# umount /mnt/test
testbox:/home/spse/src/mtd/util# mount -t jffs2 /dev/mtdblock/0 /mnt/test
testbox:/home/spse/src/mtd/util# mount -t jffs2 /dev/mtdblock/0 /mnt/test
[Hang]

a ksymoops of a alt-sysrq T gives:
Trace; c0232f55 <rwsem_down_read_failed+f5/118>
Trace; c0235739 <stext_lock+789/31c6>
Trace; c013de29 <sync_inodes+15/4c>
Trace; c012ebc3 <fsync_dev+17/30>
Trace; c013e427 <invalidate_device+17/58>
Trace; c01cabce <mtdblock_release+22/b0>
Trace; c0132e36 <blkdev_put+66/ac>
Trace; c0131bcf <get_sb_bdev+1b7/2ec>
Trace; c013fa23 <set_devname+27/54>
Trace; c01321ab <do_kern_mount+af/13c>
Trace; c0140755 <do_add_mount+21/cc>
Trace; c01409db <do_mount+13f/158>
Trace; c014084d <copy_mount_options+4d/9c>
Trace; c0140a78 <sys_mount+84/c4>
Trace; c0106b0b <system_call+33/38>

so possibly there is something in mtdblock that is going wrong.

cheers
si
