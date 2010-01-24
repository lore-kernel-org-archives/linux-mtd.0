Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NZ9gH-0001ML-9b
	for linux-mtd@lists.infradead.org; Sun, 24 Jan 2010 21:07:41 +0000
Received: by fxm1 with SMTP id 1so980789fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Jan 2010 13:07:34 -0800 (PST)
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <4B591573.60602@theptrgroup.com>
References: <4B591573.60602@theptrgroup.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 24 Jan 2010 23:07:31 +0200
Message-Id: <1264367251.2401.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

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

Is this reproducible?

> [    5.984232] UBIFS assert failed in ubifs_dirty_inode at 377 (pid 1011)

I'd like to see stack trace for this - it should have been printed as
well. This assert fails:

ubifs_assert(mutex_is_locked(&ui->ui_mutex));

and the stack trace should tell how we ended up in 
ubifs_dirty_inode(). Obvilusly something changed in the generic VFS
layers which broke UBIFS locking assumptions.

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

The rest just tells that the budgeting is screwed up, but does not
really tell why.

> ... Goes on forever, or at least the target becomes unresponsive and I 
> need to power cycle.

You have tons of output to the serial line the system becomes
unresponsive. You can control where the kernel messages go. E.g., here
is some description at the end:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

> It occurs in both the DENX 2.6.31 and the DENX 2.6.33-rc4 (which was 
> merged the infradead kernel on December 10th).

OK.

> I have the latest and greatest mtd-utils which I needed to fix my 
> ubiformat problem.
> 
> It occurs no matter whether I ubiformat an ubi image on the target or 
> whether I install the rootfs via untaring to a ubifs mount point.
> 
> Here are the boot messages of one where the ubifs fails:

...

> Mounting local filesystems:  [  OK  ] 
>  
> 
> [    5.783968] UBIFS assert failed in ubifs_dirty_inode at 377 (pid 
> 1011)


The most interesting stack dump for the first error is not there because
it was not printed to the serial console. Please, take a look here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

At the item number 4 you'll find some solutions. The 'ignore_loglevel'
kernel option should be suitable for you. Please, add it and send me the
stack dump.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
