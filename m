Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAHGS-00049n-95
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 14:14:12 +0000
Received: by mail-wm0-x233.google.com with SMTP id g23so145396642wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 06:13:47 -0800 (PST)
Subject: Re: Unable to remount ubifs after many unclean reboot
To: Olivier Singla <olivier.singla@gmail.com>, linux-mtd@lists.infradead.org
References: <CACcFhEU=U1f0HM9bZvWosM0odDqg7x5QE=dWV+7fMj+4aAho4g@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4318d4ee-4ed6-a3db-5783-75cef32986b7@gmail.com>
Date: Fri, 25 Nov 2016 15:13:44 +0100
MIME-Version: 1.0
In-Reply-To: <CACcFhEU=U1f0HM9bZvWosM0odDqg7x5QE=dWV+7fMj+4aAho4g@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/22/2016 04:17 PM, Olivier Singla wrote:
> Hi,
> 
> I am working for an embedded system using 4GB NAND Flash
> (MT29F32G08ABAAAWP), ubifs, and 3.6.5 kernel (A9 dualcore).

So you're using ancient unsupported kernel version and a controller/CPU
which you do not disclose. It's hard to help.

Can you check whether this problem still happens in mainline?

Are you using MLC NAND ? I suspect you do ...

. Using a
> simple test program, I am able to have UBIFS to fail to mount the NAND
> partition (I am using pretty much all the 4GB of the NAND). The test
> is quite simple: mount the ubifs partition at boot time, then write a
> file (justa  few KB), do a sync, wait a few seconds, and then reboot
> (/sbin/reboot, and -important point- I have a micro-controller which
> does a power-cycle). Intentionally, I did NOT unmount the ubifs
> partition. Later on, I changed the test to unmount the ubifs partition
> (but I still do not detach the ubi volume). What I am seeing is that
> after many iterations (usually around a thousand), ubifs could not
> mount the ubifs partition, both under u-boot and Linux.
> 
> Under Linux, this is what I see when ubifs try to mount the partition:
> 
> [   55.646884] UBIFS: background thread "ubifs_bgt0_0" started, PID 858
> [   56.013037] UBIFS: recovery needed
> [   56.258731] UBI warning: ubi_io_read: error -119 while reading
> 294912 bytes from PEB 600:753664, read only 294912 bytes, retry
> [   56.320616] UBI warning: ubi_io_read: error -119 while reading
> 294912 bytes from PEB 600:753664, read only 294912 bytes, retry
> [   56.382444] UBI warning: ubi_io_read: error -119 while reading
> 294912 bytes from PEB 600:753664, read only 294912 bytes, retry
> [   56.444263] UBI error: ubi_io_read: error -119 while reading 294912
> bytes from PEB 600:753664, read 294912 bytes
> [   56.454775] CPU: 0 PID: 857 Comm: mount Not tainted 3.14.29 #16
> [   56.460888] Backtrace:
> [   56.463441] [<c0011ea8>] (dump_backtrace) from [<c00120bc>]
> (show_stack+0x18/0x1c)
> [   56.471255]  r7:000b8000 r6:ede50000 r5:00000000 r4:c06c730c
> [   56.477151] [<c00120a4>] (show_stack) from [<c04f4074>]
> (dump_stack+0x94/0xcc)
> [   56.484636] [<c04f3fe0>] (dump_stack) from [<c031d390>]
> (ubi_io_read+0x134/0x314)
> [   56.492356]  r7:000b8000 r6:00000000 r5:00048000 r4:ffffff89
> [   56.498233] [<c031d25c>] (ubi_io_read) from [<c031ae84>]
> (ubi_eba_read_leb+0x140/0x3e4)
> etc.
> 
> At this point, my only option is to erase the NAND, and recreate the
> UBIFS partition, which I can then use as usual. When I redo the test,
> the PEB failing are at a different address in the flash, but this is
> still a whole nand erase block size (1 MB in the case of this nand
> part).
> 
> I realize this test might not be realistic, but the idea is to test
> how the system would behave after several power loss, with and without
> clean unmount.
> 
> I noticed that even after un-mounting the ubifs partition the ubi
> working thread (ubifs_bgt0_0) is still running. I am wondering if this
> thread could schedule a nand erase even in the case of the ubisfs
> partition unmounted? If this is the case, doing the ubidetach, which
> stop the thread should help, is that a fair statement?
> 
> I thought that the whole idea of ubifs was to be protected again
> unexpected loss of power. I understand that obviously I could loose
> some data, but at least ubifs should be able to mount the partition.
> 
> Any idea what could be wrong? And also should using ubidetach help, in
> the case of testing reboot with clean unmount ?
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


-- 
Best regards,
Marek Vasut
