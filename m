Received: from ns1.ixmail.hkcix.com ([202.181.230.228] helo=ixmail.hkcix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uD9e-00062a-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 14:24:10 +0100
Message-ID: <3BCED9DB.28F7D365@uniquemodem.com>
Date: Thu, 18 Oct 2001 21:32:11 +0800
From: data <data@uniquemodem.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: mtdblock.c cannot compile under Linux 2.2.x
References: <3BCD84E1.4DD484A6@uniquemodem.com> <25716.1003325012@redhat.com>
Content-Type: text/plain; charset=us-ascii
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

David,

Thanks for your reply. However, I don't quite catch your meaning for
don't apply the patch which adds the init calls. Could you please
elaborate further?

Secondly, I have encountered another error in mtdblock.c for subscribt
out of range. Could you please het me to have a look.

Best regards,

Jimmy

Compilation log:

/usr/src/linux/include/linux/mtd/compatmac.h:468:24: warning: "/*"
within comment
/usr/src/linux/include/linux/mtd/compatmac.h:469:51: warning: "/*"
within comment
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m386 -DCPU=386   -c -o mtdblock.o mtdblock.c
In file included from /usr/src/linux/include/linux/mtd/mtd.h:12,
                 from mtdblock.c:14:
/usr/src/linux/include/linux/mtd/compatmac.h:468:24: warning: "/*"
within comment
/usr/src/linux/include/linux/mtd/compatmac.h:469:51: warning: "/*"
within comment
mtdblock.c: In function `cleanup_mtdblock':
mtdblock.c:660: array subscript is not an integer
make[3]: *** [mtdblock.o] Error 1
make[3]: Leaving directory `/home/root/linux-2.2.18/drivers/mtd'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/home/root/linux-2.2.18/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/home/root/linux-2.2.18/drivers'
make: *** [_dir_drivers] Error 2
[root@localhost linux]#

End log


Program fail at  < blk_cleanup_queue(BLK_DEFAULT_QUEUE(MAJOR_NR));>

static void __exit cleanup_mtdblock(void)
{
        leaving = 1;
        wake_up(&thr_wq);
        down(&thread_sem);
#ifdef CONFIG_DEVFS_FS
        unregister_mtd_user(&notifier);
        devfs_unregister(devfs_dir_handle);
        devfs_unregister_blkdev(MTD_BLOCK_MAJOR, DEVICE_NAME);
#else
        unregister_blkdev(MAJOR_NR,DEVICE_NAME);
#endif
        blk_cleanup_queue(BLK_DEFAULT_QUEUE(MAJOR_NR));
        blksize_size[MAJOR_NR] = NULL;
        blk_size[MAJOR_NR] = NULL;
}

module_init(init_mtdblock);
module_exit(cleanup_mtdblock);
~





David Woodhouse wrote:

> Comment out the BLKGETSIZE64 stuff in include/linux/mtd/compatmac.h
> and
> don't apply the patch which adds the init calls - 2.2.18 can do that
> the
> new way.
>
> --
> dwmw2
