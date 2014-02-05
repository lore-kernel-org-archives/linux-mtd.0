Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBAOp-0003KZ-F9
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2014 21:52:52 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Richard Weinberger <richard@nod.at>,
 "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
Date: Wed, 05 Feb 2014 16:45:26 -0500
In-Reply-To: <52F1F658.9080701@nod.at> (Richard Weinberger's message of "Wed,
 05 Feb 2014 09:29:12 +0100")
Message-ID: <87vbwt1bex.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Am 04.02.2014 18:01, schrieb Wiedemer, Thorsten (Lawo AG):

>> I made a "hardcore test" with:
>> $ while [ 1 ]; do cp <8kByte_file> tmp/<8kByte_file.1>; sync; done &
>> $ while [ 1 ]; do cp <8kByte_file> tmp/<8kByte_file.2>; sync; done &
>> $ while [ 1 ]; do cp <8kByte_file> tmp/<8kByte_file.3>; sync; done &

>> It took about 2-3 hours until I had an error (two times):

On  5 Feb 2014, richard@nod.at wrote:

> This test ran the over night without any error on my imx51 board. :-\

> Bill's great analysis showed that it may be a linked list corruption
> in rw_semaphore.  Thorsten, can you please enable CONFIG_DEBUG_LIST?
> Also try whether you can trigger the issue with lock debugging
> enabled.

I am trying to run the same test.  I have 'fastmap' enabled and
'kmemleak'.  I have various occurrences of these two,

unreferenced object 0xc2c06e50 (size 24):
  comm "sync", pid 2941, jiffies 855335 (age 6354.950s)
  hex dump (first 24 bytes):
    5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 79 00 00 00  ZZZZZZZZZZZZy...
    07 00 00 00 5a 5a 5a a5                          ....ZZZ.
  backtrace:
    [<c019a544>] kmem_cache_alloc+0x10c/0x1a0
    [<c02b2b6c>] ubi_update_fastmap+0xdc/0x14f4
    [<c02ac204>] ubi_wl_get_peb+0x28/0xbc
    [<c02a64c0>] ubi_eba_write_leb+0x23c/0x884
    [<c02a51a4>] ubi_leb_write+0xc4/0xe0
    [<c0200f38>] ubifs_leb_write+0x9c/0x130
    [<c020b28c>] ubifs_log_start_commit+0x230/0x3f4
    [<c020c368>] do_commit+0x134/0x870
    [<c01fbfa0>] ubifs_sync_fs+0x88/0x9c
    [<c01c30bc>] __sync_filesystem+0x74/0x98
    [<c01a2860>] iterate_supers+0x9c/0x104
    [<c01c31f4>] sys_sync+0x3c/0x68
    [<c0129300>] ret_fast_syscall+0x0/0x1c
    [<ffffffff>] 0xffffffff
unreferenced object 0xc2c06df0 (size 24):
  comm "flush-ubifs_0_3", pid 260, jiffies 867487 (age 6233.430s)
  hex dump (first 24 bytes):
    5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 7a 00 00 00  ZZZZZZZZZZZZz...
    1e 00 00 00 5a 5a 5a a5                          ....ZZZ.
  backtrace:
    [<c019a544>] kmem_cache_alloc+0x10c/0x1a0
    [<c02b2b6c>] ubi_update_fastmap+0xdc/0x14f4
    [<c02ac204>] ubi_wl_get_peb+0x28/0xbc
    [<c02a64c0>] ubi_eba_write_leb+0x23c/0x884
    [<c02a50c0>] ubi_leb_map+0x70/0x90
    [<c020125c>] ubifs_leb_map+0x74/0x100
    [<c020af44>] ubifs_add_bud_to_log+0x1f4/0x30c
    [<c01f4830>] make_reservation+0x2e0/0x3e0
    [<c01f53e8>] ubifs_jnl_write_data+0xfc/0x25c
    [<c01f838c>] do_writepage+0x88/0x260
    [<c017b368>] __writepage+0x18/0x84
    [<c017b98c>] write_cache_pages+0x1b4/0x3ac
    [<c01bead4>] writeback_single_inode+0x9c/0x258
    [<c01befac>] writeback_sb_inodes+0xbc/0x180
    [<c01bf6c0>] writeback_inodes_wb+0x7c/0x178
    [<c01bfa00>] wb_writeback+0x244/0x2ac

It is a 'cache' so I am suspicious of the kmemleak (also my Linux is old
[kmemleak] with the Ubi/UbiFs/Mtd patches).  However, I just wondered if
Thorsten has posted a .config somewhere?  I am testing on an IMX25
system as well and trying to replicate with his test.  The Linux version
is different as well.  I suspect Richard will have tried with 'fastmap'
as well?  Are you running without 'fastmap' Thorsten?  I will let my
system run over night.  Maybe just,

 $ grep -E 'MTD|UBI' .config | grep -v '^#'

is fine for your config?  Or maybe a full config to pastebin or
someplace?

I am pretty sure that http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
is not the cause of this issue; although it is a good thing to be aware
of.  You can apply the patch in the crosstool-ng directory to fix
gcc-4.8.  It is quite possible that the FSL/Linaro people have done
this.  The 4.8.2 doesn't seem to come with this patch in the vanilla
tarball.

Also, I have had this occur with gcc 4.7.  Especially, this same sort of
issue has been occurring for some time (before gcc 4.8's release on
2013-03-22).  Another memory issue was a suspect, but now it has been
fixed and we still seem to have the issue.

Fwiw,
Bill Pringlemeir.
