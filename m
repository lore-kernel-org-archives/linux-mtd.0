Received: from moutng.kundenserver.de ([212.227.17.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNVB0-0006cX-7V
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2009 16:34:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: [PATCH] UBI: add ioctl compatibility
Date: Thu, 15 Jan 2009 17:34:23 +0100
References: <1232036381.25068.10.camel@localhost.localdomain>
In-Reply-To: <1232036381.25068.10.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901151734.23870.arnd@arndb.de>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 January 2009, Artem Bityutskiy wrote:

> would you please glance if this patch all-right?

No, it's not. New ioctl numbers should not be added to fs/compat_ioctl.c
but rather to the file that implements the file operations (ubi/cdev.c).

The best way to do it would be to add functions that do

static long compat_vol_cdev_ioctl(struct file *file,
		unsigned int cmd, unsigned long arg)
{
	int ret;

	arg = (unsigned long)compat_ptr(arg);

	lock_kernel();
	ret = vol_cdev_locked_ioctl(file->f_inode, file, cmd, arg);
	unlock_kernel();

	return ret;
}

static long vol_cdev_ioctl(struct file *file,
		unsigned int cmd, unsigned long arg)
{
	int ret;

	lock_kernel();
	ret = vol_cdev_locked_ioctl(file->f_inode, file, cmd, arg);
	unlock_kernel();

	return ret;
}

and then use these two functions as your unlocked_ioctl and compat_ioctl
methods in file_operations.

If you can prove that you don't rely on the BKL, you can also drop the
{un,}lock_kernel() calls.


>  COMPATIBLE_IOCTL(MEMGETREGIONINFO)
>  COMPATIBLE_IOCTL(MEMGETBADBLOCK)
>  COMPATIBLE_IOCTL(MEMSETBADBLOCK)
> +/* UBI */
> +COMPATIBLE_IOCTL(UBI_IOCMKVOL)
> +ULONG_IOCTL(UBI_IOCRMVOL)
> +COMPATIBLE_IOCTL(UBI_IOCRSVOL)
> +COMPATIBLE_IOCTL(UBI_IOCRNVOL)
> +COMPATIBLE_IOCTL(UBI_IOCATT)
> +ULONG_IOCTL(UBI_IOCDET)
> +ULONG_IOCTL(UBI_IOCVOLUP)
> +ULONG_IOCTL(UBI_IOCEBER)
> +ULONG_IOCTL(UBI_IOCEBCH)
> +ULONG_IOCTL(UBI_IOCEBMAP)
> +ULONG_IOCTL(UBI_IOCEBUNMAP)
> +ULONG_IOCTL(UBI_IOCEBISMAP)

ULONG_IOCTL() would be wrong here, all your ioctl handlers expect
a pointer, not an unsigned long

	Arnd <><
