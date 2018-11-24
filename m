Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQeqp-0000Pd-4c
 for linux-mtd@lists.infradead.org; Sat, 24 Nov 2018 20:48:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id c126so14676484wmh.0
 for <linux-mtd@lists.infradead.org>; Sat, 24 Nov 2018 12:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20181019083020.14335-1-daniel.santos@pobox.com>
 <d2f16a3a-7237-6c4e-5ff8-43f05bdb7e0f@huawei.com>
 <11f65a20-dfca-0ddc-8c7f-58f29afe8c04@pobox.com>
 <436a7243-4a32-40cd-5c40-6cc7f44d26c5@pobox.com>
In-Reply-To: <436a7243-4a32-40cd-5c40-6cc7f44d26c5@pobox.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 24 Nov 2018 21:48:02 +0100
Message-ID: <CAFLxGvwwgoBOWsp-Yxnmn9aKHTrft2gsUj1byRkNwT9o3MFCOg@mail.gmail.com>
Subject: Re: [PING 2] [PATCH] jffs2: Fix use of uninitialized delayed_work,
 lockdep breakage
To: daniel.santos@pobox.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: houtao1@huawei.com, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 24, 2018 at 4:32 PM Daniel Santos <daniel.santos@pobox.com> wrote:
>
> Ping 2!
>
> On 11/05/2018 03:38 PM, Daniel Santos wrote:
> > Ping.
> >
> > Daniel
> >
> > On 10/21/2018 07:32 PM, Hou Tao wrote:
> >> On 2018/10/19 16:30, Daniel Santos wrote:
> >>> jffs2_sync_fs makes the assumption that if CONFIG_JFFS2_FS_WRITEBUFFER
> >>> is defined then a write buffer is available and has been initialized.
> >>> However, this does is not the case when the mtd device has no
> >>> out-of-band buffer:
> >>>
> >>> int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
> >>> {
> >>>         if (!c->mtd->oobsize)
> >>>                 return 0;
> >>> ...
> >>>
> >>> The resulting call to cancel_delayed_work_sync passing a uninitialized
> >>> (but zeroed) delayed_work struct forces lockdep to become disabled.
> >>>
> >>> [   90.050639] overlayfs: upper fs does not support tmpfile.
> >>> [   90.652264] INFO: trying to register non-static key.
> >>> [   90.662171] the code is fine but needs lockdep annotation.
> >>> [   90.673090] turning off the locking correctness validator.
> >>> [   90.684021] CPU: 0 PID: 1762 Comm: mount_root Not tainted 4.14.63 #0
> >>> [   90.696672] Stack : 00000000 00000000 80d8f6a2 00000038 805f0000 80444600 8fe364f4 805dfbe7
> >>> [   90.713349]         80563a30 000006e2 8068370c 00000001 00000000 00000001 8e2fdc48 ffffffff
> >>> [   90.730020]         00000000 00000000 80d90000 00000000 00000106 00000000 6465746e 312e3420
> >>> [   90.746690]         6b636f6c 03bf0000 f8000000 20676e69 00000000 80000000 00000000 8e2c2a90
> >>> [   90.763362]         80d90000 00000001 00000000 8e2c2a90 00000003 80260dc0 08052098 80680000
> >>> [   90.780033]         ...
> >>> [   90.784902] Call Trace:
> >>> [   90.789793] [<8000f0d8>] show_stack+0xb8/0x148
> >>> [   90.798659] [<8005a000>] register_lock_class+0x270/0x55c
> >>> [   90.809247] [<8005cb64>] __lock_acquire+0x13c/0xf7c
> >>> [   90.818964] [<8005e314>] lock_acquire+0x194/0x1dc
> >>> [   90.828345] [<8003f27c>] flush_work+0x200/0x24c
> >>> [   90.837374] [<80041dfc>] __cancel_work_timer+0x158/0x210
> >>> [   90.847958] [<801a8770>] jffs2_sync_fs+0x20/0x54
> >>> [   90.857173] [<80125cf4>] iterate_supers+0xf4/0x120
> >>> [   90.866729] [<80158fc4>] sys_sync+0x44/0x9c
> >>> [   90.875067] [<80014424>] syscall_common+0x34/0x58
> >>>
> >>> Signed-off-by: Daniel Santos <daniel.santos@pobox.com>
> >>> ---
> >>>  fs/jffs2/super.c | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> >>> index 793ad30970ff..cae4ecda3c50 100644
> >>> --- a/fs/jffs2/super.c
> >>> +++ b/fs/jffs2/super.c
> >>> @@ -101,7 +101,8 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
> >>>     struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
> >>>
> >>>  #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
> >>> -   cancel_delayed_work_sync(&c->wbuf_dwork);
> >>> +   if (jffs2_is_writebuffered(c))
> >>> +           cancel_delayed_work_sync(&c->wbuf_dwork);
> >>>  #endif
> >>>
> >>>     mutex_lock(&c->alloc_sem);
> >>>
> >> Reviewed-by: Hou Tao <houtao1@huawei.com>

Boris, can you please queue up this patch?

-- 
Thanks,
//richard
