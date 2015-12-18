Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA2uC-000792-Mo
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 21:49:41 +0000
Received: by mail-ob0-x231.google.com with SMTP id iw8so88348921obc.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 13:49:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHW51sUEt+3mxWE-pLdLvk_xmfuPdjSKTnGi2pBzbEK7CoUFRw@mail.gmail.com>
References: <CAHW51sUEt+3mxWE-pLdLvk_xmfuPdjSKTnGi2pBzbEK7CoUFRw@mail.gmail.com>
Date: Fri, 18 Dec 2015 22:49:19 +0100
Message-ID: <CAFLxGvzNPJQsae-JW_5KabJyDCh2aRKOC3mCWeH5JAboji1gCA@mail.gmail.com>
Subject: Re: Corrupt Empty Space Error at Runtime
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Adam <aps337@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 18, 2015 at 5:38 PM, Adam <aps337@gmail.com> wrote:
> Hello All,
>
> I am working on a at91sama5d3x based system running linux 3.18.9. I
> have been seeing an issue where during normal operation, I see the
> following....
>
>    kern.warn kernel: [<c00cabf4>] (vfs_fsync) from [<c025e2ec>]
> (loop_thread+0x420/0x740)
>    kern.warn kernel: [<c017cb64>] (ubifs_fsync) from [<c00cabf4>]
> (vfs_fsync+0x34/0x44)
>    kern.warn kernel: [<c006b3b8>] (filemap_write_and_wait_range) from
> [<c017cb64>] (ubifs_fsync+0x40/0xb4)
>    kern.warn kernel: [<c006b294>] (__filemap_fdatawrite_range) from
> [<c006b3b8>] (filemap_write_and_wait_range+0x34/0x74)
>    kern.warn kernel: [<c0073150>] (generic_writepages) from
> [<c006b294>] (__filemap_fdatawrite_range+0x4c/0x54)
>    kern.warn kernel: [<c0072f60>] (write_cache_pages) from
> [<c0073150>] (generic_writepages+0x40/0x60)
>    kern.warn kernel: [<c00727b4>] (__writepage) from [<c0072f60>]
> (write_cache_pages+0x1c4/0x374)
>    kern.warn kernel: [<c017c49c>] (do_writepage) from [<c00727b4>]
> (__writepage+0x14/0x5c)
>    kern.warn kernel: [<c017a6ec>] (ubifs_jnl_write_data) from
> [<c017c49c>] (do_writepage+0x94/0x1f4)
>    kern.warn kernel: [<c0179a54>] (make_reservation) from [<c017a6ec>]
> (ubifs_jnl_write_data+0xec/0x274)
>    kern.warn kernel: [<c01918dc>] (ubifs_garbage_collect) from
> [<c0179a54>] (make_reservation+0x108/0x46c)
>    kern.warn kernel: [<c00110b0>] (show_stack) from [<c01918dc>]
> (ubifs_garbage_collect+0x1d4/0x3e0)
>    kern.warn kernel: [<c00133fc>] (unwind_backtrace) from [<c00110b0>]
> (show_stack+0x10/0x14)
>    kern.warn kernel: CPU: 0 PID: 676 Comm: loop0 Not tainted 3.18.9 #1
>    kern.warn kernel: UBIFS warning (pid 676): ubifs_ro_mode: switched
> to read-only mode, error -117
>    kern.err kernel:  UBIFS error (pid 676): ubifs_scan: LEB 846 scanning failed
>    kern.debug kernel: 00001fe0: ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff ffffffff  ................................
>    kern.debug kernel: 00001fc0: ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff ffffffff  ................................
>    kern.debug kernel: 00001fa0: ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff ffffffff  ................................
>    kern.debug kernel: 00001f80: ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff ffffffff  ................................
>    kern.debug kernel: 00001f60: ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff ffffffff  ................................
>    kern.debug kernel: 00001f40: ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff ffffffff  ................................
>    <snip>
>
>
> In looking at source, appears that the failure scanning that LEB,
> causes the filesystem to be changed to read only mode. Based on the
> source, it also looks like I am losing a couple important debug error
> messages due to issue with our logging infrastructure (unfortunately
> serial console was not attached when failure occurred), but I think
> that we're encountering a 'corrupt empty space' condition. Does this
> seem right?

Can be. But to be sure we need full logs.

> In doing some research (mostly on archives of this mailing list), I
> believe that LEB 846 is an empty space block and that there has been a
> bit flip in it. Based on previous posts here and looking at atmel_nand
> driver, it looks like the atmel_nand driver (and underlying hardware)
> do not support ECC correction of bit flips in empty blocks and UBIFS
> doesn't currently have a way to deal with this.
>
> I see that some folks reported that they just hacked the ubifs_scan
> routine to not consider it corruption if the corrupt block was an
> empty block to workaround this issue. What is the disadvantage to
> doing this? It seems sort of harmless to have errors in empty blocks..
> no?
>
> What are other options? People must have ways of working around this.

UBIFS assumes that reading from empty space works.
It uses this for example at mount time to detect unclean mounts.
e.g. power-cut while erasing or writing.

Sadly some NAND flash controller's ECC functions do not work on empty
space. i.e. CRC(0xff) is not 0xff.

It is still undecided whether this should be addressed in MTD core or within
the individual NAND drivers.

-- 
Thanks,
//richard
