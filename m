Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEcCN-0006qo-6B
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 06:56:40 +0000
Message-ID: <4DB66CA3.2040906@denx.de>
Date: Tue, 26 Apr 2011 08:56:35 +0200
From: Stefano Babic <sbabic@denx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubiformat: libmt error (side effect from last Large Buffer Allocations
	patch)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: marathon96@gmail.com, Bastian Ruppert <bastian.ruppert@sewerin.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have seen a side effect introduced with Grant's patch. I have applied
the patchset and this fix the allocation problem in kernel.

However, on my system (davinci with only 32 MB RAM), ubiformat does not
work and reports the following error:

libmtd: error!: cannot write 129024 bytes to mtd3 (eraseblock 13, offset 0)
        error 22 (Invalid argument)
ubiformat: error!: cannot write eraseblock 13
           error 22 (Invalid argument)


I have found that an issue is raised when ubiformat tries to optimize
and skipping 0xFF, calling its internal function drop_ffs(). When a file
image is flashed, it is checked if the last part of the buffer is 0xFF,
and the length is reduced to contain the last byte in buffer not equal
to 0xFF. The resulting length is then aligned with the minimum flash I/O
size.

However, the result lenght can be an odd multiple of the minimum I/O
size, and when there is not enough memory available, the introduced
mtd_malloc_up_to_size() tries to allocate half the amount of requested
size, getting a buffer not aligned with the minimum I/O size. The result
is that the test in nand_base.c for the alignment fails:

if (NOTALIGNED(to) || NOTALIGNED(ops->len)) {
                printk(KERN_NOTICE "%s: Attempt to write not "


I traced the values of ops_len in nand_do_write_ops and the requested
size in ubiformat (I traced the new computed length after drop_ffs), and
I got that drop_ffs changed the length from 131072 (sector size) to
129024 (this is still aligned). This is 63 times the minimum I/O size on
my NAND (page size, 2048 bytes).

If enough memory is available, it works. If kmalloc() fails in
mtd_malloc_up_to_size(), a buffer of half length is allocated --> 64512
bytes. However, this buffer is *NOT* aligned with the minimum I/O size,
and then mtd_write fails:

ubiformat: flashing eraseblock 28 -- 17 % complete
	  CHANGED len newlen: 129024 len: 131072 min I/O size: 2048
           ^- Traced after drop_ffs:

subpagesize 2048 129024

^---Traced in kernel, nand_do_write_ops: subpage size, ops->len

.....

ubiformat: flashing eraseblock 31 -- 19 % complete  CHANGED len 129024
131072 2048
subpagesize 2048 64512 64512
                   ^
                   |-- kmalloc fails, 129024/2=64512 is allocated
			but this is not aligned

nand_do_write_ops: Attempt to write not page aligned data 1be0000 0
64512 2048
libmtd: error!: cannot write 129024 bytes to mtd3 (eraseblock 31, offset 0)
        error 22 (Invalid argument)
ubiformat: error!: cannot write eraseblock 31
           error 22 (Invalid argument)


If I remove the optimization in ubiformat, it works, because sector size
is a n-multiple of minimum I/O size. When kmalloc fails, a
131072/2=65536 buffer is allocated.

IMHO mtd_malloc_up_to_size() must allocate a buffer aligned with the
minimum I/O size. What about adding the I/O size as parameter to
mtd_malloc_up_to_size, so the function will return always an aligned
buffer ?

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================
