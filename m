Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgsQU-0001pr-LK
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 04:51:31 +0000
Received: by fxm3 with SMTP id 3so3248056fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 21:51:29 -0700 (PDT)
Subject: Re: Mounting UBIFS readonly - is it really readonly?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sergei Zhirikov <sfzhi@yahoo.com>
In-Reply-To: <i2namf$mj6$1@dough.gmane.org>
References: <i2namf$mj6$1@dough.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:51:26 +0300
Message-Id: <1280983886.1175.12.camel@localhost.localdomain>
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

On Tue, 2010-07-27 at 21:05 +0200, Sergei Zhirikov wrote:
> I hope someone can help me to resolve the following mystery.
> 
> I'm using UBIFS as the root filesystem always mounted readonly.
> The kernel boot parameters are:
> console=ttyS0,115200 ubi.mtd=2 root=ubi0:rootfs rootfstype=ubifs ro
> loglevel=6
> 
> As you can see, there is "ro", which causes UBIFS to be initially
> mounted readonly. And later it is *never* remounted read-write.
> Everything seems to work as expected (I get "Read-only file system"
> error upon a write attempt) except one thing. Somehow the modification
> time of /dev/console is updated every time the system boots. Note: I'm
> not talking about the /dev/console located inside the /dev mount
> (which is tmpfs and is obvously writable), I'm talking about
> the /dev/console located on the root file system and accessed
> (probably by init) before /dev is mounted. I'm really puzzled. How is
> this possible? The root filesystem has been readonly all the time and
> still the timestamp is somehow updated. Does anyone have an idea what
> might be going on there?
> 
> I'm using kernel 2.6.33.6 and classic sysvinit-2.86.

Hi,

very brief comment as I have not time now, sorry. Try to hack UBIFS and
add prints to the following functions:

ubifs_remount_rw()
mount_ubifs(), print if 'mounted_read_only != 0'

this way you will check whether UBIFS is really always RO.

Also, add a print to 'ubifs_write_inode()' to make sure no inodes are
ever written. Actually, there is already a 'dbg_gen()' print, just turn
it into

       printk(KERN_CRIT "inode %lu, mode %#x, nlink %u\n",
                inode->i_ino, (int)inode->i_mode, inode->i_nlink);

Also, add a print in 'ubifs_iget()' and print the timestamp there. Do
this after 'ubifs_tnc_lookup()'. Print timestamp there. You can even
find out inode number for /dev/console, and print this only for this
inode number.

This way you will see what is actually going on in UBIFS and prove that
there is an UBIFS bug, if there is.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
