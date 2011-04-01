Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gFK-00033J-Ip
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:26:47 +0000
Received: by pvh11 with SMTP id 11so773105pvh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 08:26:44 -0700 (PDT)
Date: Fri, 01 Apr 2011 08:26:41 -0700
Subject: [RFC] Removing FIXMEs in mtdchar.c: mtd_{read,write} (was Re:
	Recommendations on System Tuning for JFFS2/MTD 128 KiB Block Page
	Allocation Failures)
From: Grant Erickson <marathon96@gmail.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <C9BB3CC1.272A0%marathon96@gmail.com>
In-Reply-To: <C9A64151.264E1%marathon96@gmail.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/16/11 10:28 AM, Grant Erickson wrote:
> I've an OMAP3 ARM-based embedded system with 256 MiB of NAND flash and 64 MiB
> of RAM on Linux 2.6.32 in which both sys_mount (via mount) and sys_read (via
> fw_setenv) occasionally fail with "page allocation failure. order:5,
> mode:0xd0".
> 
> In the analysis I've done so far, sys_mount funnels down to jffs2_scan_medium
> which eventually calls kmalloc with a size of 128 KiB and flag GFP_KERNEL:
> 
>     sw/tps/linux/linux/fs/jffs2/scan.c:
>     ...
>     120         /* Respect kmalloc limitations */
>     121         if (buf_size > 128*1024)
>     122             buf_size = 128*1024;
>     123 
>     124         D1(printk(KERN_DEBUG "Allocating readbuf of %d bytes\n",
> buf_size));
>     125         flashbuf = kmalloc(buf_size, GFP_KERNEL);
>     126         if (!flashbuf)
>     127             return -ENOMEM;
>     128     }
>     ...
> 
> The sys_read case winds down to mtd_read which eventually calls kmalloc with a
> size of 128 KiB (to cover a single NAND erase blcok) and flag GFP_KERNEL:
> 
>     sw/tps/linux/linux/drivers/mtd/mtdchar:
>     ...
>     161     if (count > MAX_KMALLOC_SIZE)
>     162         kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
>     163     else
>     164         kbuf=kmalloc(count, GFP_KERNEL);
>     ...
> 
> Ostensibly this occurs because of memory fragmentation where any of the lower
> order blocks are are available must be non-contiguous.
> 
> ...
>
> The system is currently configured with the SLAB allocator. Has anyone found
> better fragmentation and low-memory performance with the default SLUB or
> embedded SLOB allocators? How about tweaking:
> 
>     vm.min_free_kbytes
> 
> Anyone met with success there?

For anyone following this thread, FWIW, I was able to reduce statistically
but not eliminate the likelihood of this issue occurring with set in
sysctl.conf:

    vm.min_free_kybtes = 2048

However, this problem is all about fragmentation, so a solution such as this
will never really guarantee that this problem goes away entirely.

In the meantime, I've been contemplating a more permanent solution in
mtdchar.c:mtd_{read,write} and, before pressing ahead with either, wanted to
get some feedback on which might have upstream integration support.

1) Simpler but Use More Memory

This approach keeps the code, more or less, as is; however, rather than
failing outright, it continues to attempt to allocate smaller and smaller
blocks (dividing by two each time) until either it succeeds or hits the
minimum (either count or PAGE_SIZE).

2) More Complex but Use Less Memory

This approach seems to be what was intimated in the "FIXME" comments from
2005 found in this code and maps in and pins user pages for the read or
write request using get_user_pages. Where possible, adjacent pages are
grouped together into iovec extents and then mtd_{read,write} are called in
a loop for each iovec covering that extent of mapped pages in a manner
similar to {read,write}v having been called from user space.

Comments welcomed.

Regards,

Grant
