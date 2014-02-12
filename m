Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDeP5-0004ZW-Fx
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 18:19:24 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: AW: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
Date: Wed, 12 Feb 2014 13:11:31 -0500
Message-ID: <87txc4w698.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> On 11 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:

>>> short update (I was out of office the rest of last week).  I compiled
>>> the kernel with the debug flags for debug list and lock alloc.  The 
>>> kernel compiled with gcc-4.8.2 didn't start (no output on serial 
>>> console and reboot of the system).  I didn't try (yet) to find out 
>>> what happens at startup.

> Bill Pringlemeir wrote:
>> You don't need to enable the 'lock alloc' debugging; Just the 'debug
>> list' as Richard suggested.  One at a time would work and give clues
>> if you can reproduce it.

On 12 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:

> I tested this, compiled with gcc.4-4-4. I had an error one time, but
> there was no bug report for list handling, only kernel oops:

> Internal error: Oops: 17 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 Tainted: G O (3.6.11 #26)
> PC is at __up_write+0x38/0x168
> LR is at __up_write+0x20/0x168
> pc : [<c0234df0>]    lr : [<c0234dd8>]    psr: a0000093
> sp : c726bc20  ip : c79c83bc  fp : 60000013
> r10: c71fed3c  r9 : 00000001  r8 : c71fed38
> r7 : 00000000  r6 : c726a000  r5 : 00000000  r4 : c71fed20
> r3 : 00000001  r2 : c726a000  r1 : 00000000  r0 : 00000002
> Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 0005317f  Table: 87104000  DAC: 00000015
> Process RAVENNA_streame (pid: 852, stack limit = 0xc726a270)
> Stack: (0xc726bc20 to 0xc726c000)
> (__up_write+0x38/0x168) from (leb_write_unlock+0xbc/0x13c)
> (leb_write_unlock+0xbc/0x13c) from (ubi_eba_write_leb+0xa0/0x53c)
> (ubi_eba_write_leb+0xa0/0x53c) from (ubi_leb_write+0xe4/0xe8)
> (ubi_leb_write+0xe4/0xe8) from (ubifs_leb_write+0x9c/0x128)
> (ubifs_leb_write+0x9c/0x128) from (ubifs_wbuf_write_nolock+0x358/0x6f8)
> (ubifs_wbuf_write_nolock+0x358/0x6f8) from (ubifs_jnl_write_data+0x1a0/0x298)
> (ubifs_jnl_write_data+0x1a0/0x298) from (do_writepage+0x8c/0x224)
> (do_writepage+0x8c/0x224) from (__writepage+0x14/0x64)
> (__writepage+0x14/0x64) from (write_cache_pages+0x1cc/0x458)
> (write_cache_pages+0x1cc/0x458) from (generic_writepages+0x40/0x60)
> (generic_writepages+0x40/0x60) from (__filemap_fdatawrite_range+0x64/0x6c)
> (__filemap_fdatawrite_range+0x64/0x6c) from \
       (filemap_write_and_wait_range+0x40/0x6c)
> (filemap_write_and_wait_range+0x40/0x6c) from (ubifs_fsync+0x44/0xb8)
> (ubifs_fsync+0x44/0xb8) from (vfs_fsync_range+0x40/0x44)
> (vfs_fsync_range+0x40/0x44) from (vfs_fsync+0x24/0x2c)
> (vfs_fsync+0x24/0x2c) from (do_fsync+0x28/0x50)
> (do_fsync+0x28/0x50) from (ret_fast_syscall+0x0/0x2c)
> Code: e48a7004 e5985004 e15a0005 0a000029 (e595300c)
> ---[ end trace 8ee04e42747b7c3c ]---
> note: RAVENNA_streame[852] exited with preempt_count 2

$ printf "\x04\x70\x8a\xe4\x04\x50\x98\xe5\x05\x00\x5a\xe1\x29\x00\x00\x0a\x0c\x30\x95\xe5" > crash.dump
$ objdump --disassemble-all -m arm -b binary crash.dump 

crash.dump:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:   e48a7004        str     r7, [sl], #4
   4:   e5985004        ldr     r5, [r8, #4]
   8:   e15a0005        cmp     sl, r5
   c:   0a000029        beq     0xb8
  10:   e595300c        ldr     r3, [r5, #12]

'r5' is NULL.  It seems to be the same symptom.  If you run your ARM
objdump with -S on either vmlinux or '__up_write', it will help confirm
that it is the list corrupted again.  The assembler above should match.

What is 'RAVENNA_streame'?  Is this your standard test and not the '8k
binary' copy test or are you doing the copy test with this process also
running?

We have 'IRQs off', which makes sense for __up_write.  Trying
'ftrace_dump_on_oops' as Richard suggests would be helpful to find out
what went on before.  It might also make sense to dump some
'rwsem_waiter' nodes on the error?  It looks like '__up_write' might
normally have an empty list?  Certainly an non-empty 'rwsem_waiter' is
going to trigger the condition more often?  I guess I can look to see
what might cause this, even if I can not reproduce it.  The
'preemp_count' has been two every time you have this; is that true?

> Today I compiled the kernel with debug lock alloc flags. The test runs
> already for some hours, but no error.  It sounds perhaps strange, but
> there seems to be an issue with max/mean erase count.  To make the
> debug list tests I changed my hardware. The bug occurred rather
> quickly after some minutes.  On the system I used for my overnight
> tests, I never saw the bug again, even with a kernel I used before to
> reproduce the bug several times.

>>> I compiled the same kernel (and same config) with gcc-4.4.4. The
>>> write test runs now for over 16 hours without error.  Next step is
>>> to find out wether this is due to a changed timing because of the
>>> debug flags or if it's the compiler.

> This was the hardware which never showed the bug again ...  As
> mentioned above, I had the bug also with gcc-4.4.4 on a newer
> hardware.

I stopped the test on my device at about 1/2 billion mxc_nand
interrupts.  My hardware is older and probably has well worn flash.  The
age of the flash can determine how long an erase/write takes.  It is
possible the flash chip is altering timing which exposes the bug.  Ie,
how long it takes for the MTD to read, write or erase.  I might try your
'triple-8k file test' on a device with newer flash.  I don't think this
is a compiler issue; although different compilers will produce slightly
different code with different timing.  People have seen this on many
different systems with different Linux versions and compilers.  That
said, verification is always good.

Fwiw,
Bill Pringlemeir.
