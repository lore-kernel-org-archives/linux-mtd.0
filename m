Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bvbe-00056X-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 05:06:02 +0100
Message-ID: <000701c23cfe$a1542040$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <tglx@linutronix.de>, <linux-mtd@lists.infradead.org>,
   "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>
References: <01c201c23c69$7995faa0$1b0448c0@gv.com.tw>  <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com>  <31970.1028543113@redhat.com>
Subject: Re: error when writing to jffs2 (success in another evb)
Date: Tue, 6 Aug 2002 12:06:23 +0800
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

by enabling CONFIG_JFFS2_FS_DEBUG=1
i discover a typo buggy in fs/jffs2/gc.c:
fs/fs.o: In function `jffs2_garbage_collect_hole':
gc.c(.text+0x45c9c): undefined reference to `unlikely'
gc.c(.text+0x45c9c): relocation truncated to fit: R_MIPS_26 unlikely
fixed it by add:
#include <linux/compiler.h>
to fs/jffs2/gc.c for macro<"unlikely">
---success
story----------------------------------------------------------------------
success story: in our evb241x, jffs2 is ported ok

# mount
/dev/root on / type jffs2 (rw)
none on /proc type proc (rw)
/dev/ram1 on /var type minix (rw)
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/mtdblock1            6.7M      2.3M      4.4M  34% /
/dev/ram1              1009.0k     23.0k    986.0k   2% /var
#
--- faulting
log---------------------------------------------------------------------
the faulting kernel in our evb13x can't boot today, so log can't send :<
log show: "kernel BUG at traps.c:623!"
(probably hw problem or buggy mips 2.4.17 kernel)

POSIX conformance testing by UNIFIX
kernel BUG at traps.c:623!
Unable to handle kernel paging request at virtual address 00000000, epc ==
8000e
d0c, ra == 8000ed0c
Oops in fault.c:do_page_fault, line 204:
$0 : 00000000 1000fc00 0000001b 00000001 801a77d0 00000001 00000001 000003ec
$8 : 80a04478 801ab45c 0000001b fffffee0 0000000d 80a04478 0000000a 80a04478
$16: 00000000 810bbea0 00000000 8000a2bc 0000000a 00000017 00000000 00000200
$24: 00000000 810bbd32                   810ba000 810bbe80 81f0dc10 8000ed0c
Hi : 00000000
Lo : 00000080
epc  : 8000ed0c    Not tainted
Status: 1000fc04
Cause : 3000000c
Process swapper (pid: 1, stackpage=810ba000)
Stack: 80157870 80157c24 0000026f 00000cff 00010f00 00000040 00000000
8000db6c
       8015b3a0 00000000 8006d164 00000005 801fb284 801fb298 00000000
ffff0000
       18000000 fc000000 ffff0000 00000000 0001869e 00000cff 00000cfc
8014c9d4
       00000004 80018e40 1000fc01 00000001 0000000a 810b7f30 00010f00
00000040
       00000000 8000a2bc 0000000a 00000017 00000000 00000200 00000001
80009e14
       8001fd50 ...
Call Trace: [<80157870>] [<80157c24>] [<8000db6c>] [<8015b3a0>] [<8006d164>]
[<8
014c9d4>]
 [<80018e40>] [<8000a2bc>] [<80009e14>] [<8001fd50>] [<8000a2bc>]
[<8000a2bc>]
 [<80018e40>] [<8000a2bc>] [<8000a2cc>] [<80019518>] [<80009e14>]
[<8000abec>]
 [<8000a020>] [<80019298>] [<8000abdc>]

Code: 24a57c24  0c006415  2406026f <ae000000> 8e2200ac  8e2400a0  04410002
0000
0000  24840004
Kernel panic: Attempted to kill init!

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "??" <kevin@gv.com.tw>
Cc: <tglx@linutronix.de>; <linux-mtd@lists.infradead.org>; "? ??"
<djh@gv.com.tw>; <cms@gv.com.tw>
Sent: Monday, August 05, 2002 6:25 PM
Subject: Re: error when writing to jffs2 (scan.c v1.79 20020725)


>
> kevin@gv.com.tw said:
> > scan.c v 1.79 20020725
>
> OK, then I don't know -- could you get full logs with
> CONFIG_JFFS2_FS_DEBUG=1 from mounting the file system to the oops? Make
> sure you are logging over a serial console so you catch _all_ the
messages,
> and remember they're at level KERN_DEBUG so echo 9 >
/proc/sys/kernel/printk
>
>
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
