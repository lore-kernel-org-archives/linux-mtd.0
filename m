Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 146fsv-0005oT-00
	for mtd-list@infradead.org; Thu, 14 Dec 2000 21:25:53 +0000
Date: Thu, 14 Dec 2000 16:25:50 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: <mtd@infradead.org>
Subject: Re: 2.4 stuff. 
In-Reply-To: <15785.976703098@redhat.com>
Message-ID: <Pine.LNX.4.30.0012141454510.3311-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 13 Dec 2000, David Woodhouse wrote:

>
> nico@cam.org said:
> >  I think the block write discussion has settled on the current code.
>
> Cool. I'll get the AMD code up and running on the new toy on my desk and
> send it off to Linus then.

I just looked at the cfi_cmdset_0002.c code. This will goof on big endian as
far as I can see.  A major cleanup, like what happened for
cfi_cmdset_0001.c, would be welcome there as well.

First, those functions could be cleaned out:

amd_send_cmd_at()
-----------------
- referenced only once;
- it applies cpu_to_le() on values which have already been correctly
  converted in cfi_build_cmd()... oops!;
- it should use cfi_write() instead of the current
  switch(map->buswidth) {...};
- probably diserve to be killed anyway.

amd_write_val()
---------------
- cfi_write() already does the same.

amd_read_val()
--------------
- cfi-read() already does the same.

Next, cfi_amdstd_write_byte_16() and cfi_amdstd_write_bytes_32() could
greatly benefit from being generalized i.e. merged together and even folded
into cfi_amdstd_write().  The code in cfi-cmdset-001.c should be a great
example for that.  It also removes all the #ifdef noise while still
preserving the ability for the compiler to optimize away the unused code
when a specific bus geometry is selected. In addition, such code as

	tmp = map->read32(map, ofs);
	tmp = be32_to_cpu(tmp);
	memcpy((u_char *)&tmp, buf, len);
	tmp = cpu_to_be32(tmp);

or ...

	tmp = map->read32(map, ofs - 1);
	tmp = (be32_to_cpu(tmp) & 0xFF000000) | buf[2] | (buf[1]  << 8) | buf[0] << 16;
	tmp = cpu_to_be32(tmp);

looks quite awful and suspicious to me.

Next, all calls to udelay() should be combined with a test on
current->need_resched and call schedule() instead of udelay() when true.
Otherwise kiss goodbye to your system's low latency when writes occur.

The last observation is the difference between cmdset-0001 and cmdset-002
for the state in which the task is put while waiting for the chip.  For
cmdset-001 the task is set to TASK_UNINTERRUPTIBLE for some reasons which
are surely valuable for cmdset-002 as well.

So enough criticism for now.  I would have been happy to clean this up
myself, however I don't have any toys with AMD flash in it so couldn't test
the changes at all which lower my motivation to do such work...


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
