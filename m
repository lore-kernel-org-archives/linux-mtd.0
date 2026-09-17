Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7044FC982C1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga6UxIyhnyzV+u4UzZwQ9DYK1RpHXuNp9Ov7cig5Z4A=; b=HIanzGredaK4Qqbvq1ao5kgZ2R
	nmrO4VvAF8/GCB3caR3KMHgNGczu8fGNzPlaMHByzks910eC1QUAr0IkVbu37nASTk5CX/1Av9t0l
	HcA+pFyB49YMdiSgz3JjRjSd8HlEgkU4bnAwxdTbMiHlff9QpN3h2ZHKv0ySXXdl5+qXOGRSJUcAS
	Z3GkJTXn7spRbQvFIDbh6//1VzLnYp7mcAf1q5708Ur13EBdLJY9Iu/n//NjtjbQW4fkIrF/4E857
	6dNxq28fW9m59l+/3Z/RzMsJdZo6XRSA4qdjAwGv3gxS1yQovoJ+AmTjGuqwB3v18iC/V8DWu8Erk
	zkwTBWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x770w-0000000Ap48-2arq;
	Thu, 17 Sep 2026 07:58:38 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x770t-0000000Ap2e-3PlO
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 07:58:37 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-85d45ae011cso3207317b3.2
        for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2026 00:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789631914; cv=none;
        d=google.com; s=arc-20260327;
        b=kUhv4gEcKeuc0ExY2+OnTzbNZ+W4RcHwUrBQq2nB95H9/lr2vphdTLc/1RwH6RC5Xr
         snsNNnHWgnBumGqGj41XTXIoz739akij8drxHY1vEyoS53NzxyOX1LfpVZ2Cs0rZNolY
         ZWHNsL4At1CXgQlkO5eaI0MXyGPa5bvMglViys77/9elLZ79EqLrV8sa20vnM71wZgIs
         wR19hXl6hBv2BrRtpMp0HGb3ruhk5dldK2U6m3QubIKmGGuvR2j9Nth2TmTC1pT1lvmk
         2zj5xVjs0UIRn+e9cdlCfh88lHPQmzy47Vway1+IlU+TWUGMtIH6CYEyKa4MrgdQuCgI
         tzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DwdWN9VFDqGRtbCjz/kUfyQYAbd1HiLxZP0xptgmx/c=;
        fh=Pl7cF+m8QVxmtp50vfHwUKpIxkrxnEF/kdsDOGyODtM=;
        b=mfJXJwZqjdJT8ZPkbdouNoBRJoRMWKnvCmndwG93qWX25y7j9xK2GZ77R2jsVnOtr7
         Z6c4/vZWmtRtyv6t1afbcWFZBY7BiJoQubfiJMKj8xVYpCBr3GfjtozqFZehnU64EVbq
         aRFnt7OjURRgm3PB9giFL5Jrm48pr4DO+aDDAkef0fhuY6yHIq9ZImtH1RwWH0tj2z0I
         AbC3oWKojDTGBku3YeWPUmJpjXyPsRqnkkyU6PWzPfSPBNMhDV/cLIGMYjDEQw8Wh+Ek
         n15JYWpN74Am9UlPUnIfea7Pl5N+MkxJty0fBa575ABkgnBfXcK1Z85vg6SXWYJ31nkB
         YazQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789631914; x=1790236714; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwdWN9VFDqGRtbCjz/kUfyQYAbd1HiLxZP0xptgmx/c=;
        b=UbDvBR4CZIVenJ/cb2wovcMpX0STXiUEYsyWgwemmLTt9rnac7z0j3uQzZqmEE/sQl
         0PPUJ1L0mD6pAE+vRf3hf0bzcbYY+tpSIq843pQ+4giu5eFmIf3t+36Z980FM7CV+fw6
         47Nj/iz0MNk8fL1tuRoxfLVuBHVORRbXw0DG3egfmq5NO5pxUzfJt2fN2VKoTHqwhYx2
         5ip09CyeYnOR6zBSsB+/ZiTKkH9T7NriFUZSeHxh9FkPi7iRPBerFfZp78uHqTUGDuJl
         1n6HubJXjUIpfSCBotoYzGn5Yd0nLkYoGtFR/nKqvZGNfA9ZRUbL5Sg6GnjCG8ITztOC
         CiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631914; x=1790236714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DwdWN9VFDqGRtbCjz/kUfyQYAbd1HiLxZP0xptgmx/c=;
        b=C0G9OByOsjTycTLP2huccfyQGwskgqZx8gTXbKuF7tn2QvhC+sHTtY/yC8/biqmUZn
         3GYovfJiF38/KmJlHFMUyyqp9aOXuPPBsRKNir6iW4Cql75KNlysXR0vX9h7X1lPFztd
         7VYz7z384pH2kliZS72eiQpBX1eoSCkSWgw5xXiald650n9ZdY27rTLmIWP9tfhGVGup
         XYoFDsz4hiOZpUMpHF1WOGJLg7XbRBrF9WdcQ0Lc3MdINONc09AdrJ25RRLsw+Pjkbne
         cY9/+NBFJGm9ks5/0NUr1KiD1ZpyX1KBLMwv7ieePMsOUBoAPbJzR/WoH23asV4VSI6V
         g0YQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2eTwTm2+YTRerVopIKFXHHgRPzevY3smal3JS+SCRUg+hMe1HWDKZoCwQJYQ97UZdw8PQl+b6ScM=@lists.infradead.org
X-Gm-Message-State: AFuF++myVWw33V3jpqHBXe2qItwLBiu8LwIomW+/jdmE1vwDhxrTizgY
	ciNAzuMR8RkszQNTXeRNPRGHKeaX1eqIMfBc9w8SWtnkhGOqAbiEE67ZrwiYWHYmXWWri8pRtkm
	lh5GOnlwCr4VraGpDpv0FgSpQga6RIyB+ctgyDW0WiCM=
X-Gm-Gg: AYBFou1WNTQ2DPYpBY4W54j+LEWq0z2A/n07H0YNLTPozc2gmbQ0aMKnuzsYrnkmqIJ
	iFAEYM/Z/Y0J16b2VtLn/dwDvj+rf5msJJQtxV514qjKizyO5P5lgRthfa/qp0/WZwtrZb8nagt
	KnG4BnexuFoFVu3iTLqf55YPHC3D5cve83NB0JIoknBZLiR4I/jZvLa+qVZ4cjTvL4mwBUPiQUV
	Vdi7QbTrWa4lhPdgFvmQGazq+wQzr4a1g1eMVGsvn2KIE7snaIn1EDgp7FnEMRXuOslh8skbKJp
	mVzr9pQphF6yZyZo0BKv58rqsXPtgFFT8o91D/oKDM8D3ZnNLSzB19ylLt/deRkvwwWzKE4XPxR
	FVrcRcABaBszK3UiqxLazmAt2/PB9tCddBYc0cCl7RwcyZJ4e3gRhKUnC+GBspqHMehv5DiAgQV
	nleiw2Qv8z77Va+rI=
X-Received: by 2002:a05:690c:a4c9:b0:873:5bb2:6c31 with SMTP id
 00721157ae682-892292a76bcmr12630057b3.56.1789631913597; Thu, 17 Sep 2026
 00:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
In-Reply-To: <2026091753-broadness-bootie-b683@gregkh>
From: Chris Roy <iam@thechris.in>
Date: Thu, 17 Sep 2026 13:28:22 +0530
X-Gm-Features: AcwNN1XpJy0du_9xKUDmyUBPj5x207E9TNQ6LZAwxysAE2QZiRxTF0PGqeJF0kw
Message-ID: <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	joern@lazybastard.org
Content-Type: multipart/mixed; boundary="0000000000007d6517065ba92698"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_005835_955438_1AA3FA44 
X-CRM114-Status: GOOD (  37.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--0000000000007d6517065ba92698
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2026 at 13:05:00 +0530, Greg KH wrote:
> Did you forget the Assisted-by: tag?
>
> Make the comments make sense please. That's the problem of using a LLM :(

Fair. v3 adds Assisted-by and rewrites those comments.
Same approach as v2 otherwise. syzbot tested v2 cleanly on this bug.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

Please consider for linux-mtd.

On Thu, 17 Sept 2026 at 13:05, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 17, 2026 at 12:14:05PM +0530, Chris Roy wrote:
> > On Wed, 9 Sep 2026 08:19:24 -0700, syzbot wrote:
> > > syzbot found the following issue on:
> > > ...
> > > possible deadlock in ovl_create_object
> >
> > Follow-up / v2.
> >
> > v1 deferred the open with schedule_work() and an on-stack work_struct.
> > That cleared the lockdep cycle, but syzbot reported an ODEBUG warning
> > under CONFIG_DEBUG_OBJECTS_WORK.
> >
> > v2 uses a dedicated ordered workqueue and heap-allocated work, keeps a
> > module reference across the deferred open, flushes the queue before
> > exit, and serializes setup on the worker under a local mutex.
> >
> > Local testing with the C reproducer (LOCKDEP + DEBUG_OBJECTS_WORK):
> > unpatched hits the circular locking warning; v2 is clean.
> >
> > #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > master
> >
> > Please consider the patch for linux-mtd.
> >
> > On Thu, 17 Sept 2026 at 03:22, syzbot
> > <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> > > WARNING: ODEBUG bug in lookup_object_or_alloc
> > >
> > > ODEBUG: object ffffc90007cdf850 is on stack ffffc90007cd8000, but NOT annotated.
> > > ------------[ cut here ]------------
> > > 1
> > > WARNING: lib/debugobjects.c:672 at debug_object_is_on_stack lib/debugobjects.c:672 [inline], CPU#0: syz-executor162/6029
> > > WARNING: lib/debugobjects.c:672 at lookup_object_or_alloc.part.0.cold+0x19/0x40 lib/debugobjects.c:705, CPU#0: syz-executor162/6029
> > > Modules linked in:
> > > CPU: 0 UID: 0 PID: 6029 Comm: syz-executor162 Not tainted syzkaller #0 PREEMPT(full)
> > > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > > RIP: 0010:debug_object_is_on_stack lib/debugobjects.c:672 [inline]
> > > RIP: 0010:lookup_object_or_alloc.part.0.cold+0x19/0x40 lib/debugobjects.c:705
> > > Code: c4 60 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 83 c5 01 89 2d a0 1f 7d 1a 4c 89 e6 48 c7 c7 c0 39 62 8c e8 21 ae eb ff 90 <0f> 0b 90 e9 82 31 fe 03 83 c5 01 89 2d 7f 1f 7d 1a 49 39 c4 73 da
> > > RSP: 0018:ffffc90007cdf6c0 EFLAGS: 00010082
> > > RAX: 0000000000000050 RBX: ffff88802cb1d738 RCX: 0000000000000000
> > > RDX: 0000000000000050 RSI: ffffffff81ea1339 RDI: fffff52000f9bec9
> > > RBP: 0000000000000001 R08: 0000000000000007 R09: 0000000000000000
> > > R10: 8000000000000001 R11: 0000000000000001 R12: ffffc90007cdf850
> > > R13: ffff888034204b00 R14: 0000000000000000 R15: 0000000000000000
> > > FS:  00005555811b5400(0000) GS:ffff8880d5b57000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00005555811b8778 CR3: 000000002bbd8000 CR4: 0000000000352ef0
> > > Call Trace:
> > >  <TASK>
> > >  lookup_object_or_alloc lib/debugobjects.c:682 [inline]
> > >  __debug_object_init+0x2a9/0x3d0 lib/debugobjects.c:798
> > >  __init_work+0x51/0x60 kernel/workqueue.c:697
> > >  block2mtd_setup_defer+0xd7/0x1d0 drivers/mtd/devices/block2mtd.c:504
> > >  block2mtd_setup+0x9c/0x1e0 drivers/mtd/devices/block2mtd.c:529
> > >  param_attr_store+0x199/0x300 kernel/params.c:591
> > >  module_attr_store+0x58/0x80 kernel/params.c:906
> > >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> > >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> > >  iter_file_splice_write+0x830/0x10b0 fs/splice.c:736
> > >  do_splice_from fs/splice.c:936 [inline]
> > >  do_splice+0x109c/0x1fa0 fs/splice.c:1349
> > >  __do_splice+0x33b/0x370 fs/splice.c:1431
> > >  __do_sys_splice fs/splice.c:1634 [inline]
> > >  __se_sys_splice fs/splice.c:1616 [inline]
> > >  __x64_sys_splice+0x187/0x250 fs/splice.c:1616
> > >  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
> > >  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
> > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > RIP: 0033:0x7fa1c31b3437
> > > Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
> > > RSP: 002b:00007ffce5a2ac20 EFLAGS: 00000202 ORIG_RAX: 0000000000000113
> > > RAX: ffffffffffffffda RBX: 00005555811b5400 RCX: 00007fa1c31b3437
> > > RDX: 0000000000000005 RSI: 0000000000000000 RDI: 0000000000000003
> > > RBP: 00007fa1c31ec0fe R08: 0000000000000026 R09: 0000000000000000
> > > R10: 0000000000000000 R11: 0000000000000202 R12: 00005555811b7770
> > > R13: 0000000000000026 R14: 00007ffce5a2aca0 R15: 0000000000000002
> > >  </TASK>
> > >
> > >
> > > Tested on:
> > >
> > > commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=143de115580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
> > > compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> > > patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ade115580000
> > >
>
> > From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> > From: Chris Roy <iam@thechris.in>
> > Date: Thu, 17 Sep 2026 00:00:00 +0000
> > Subject: [PATCH v2] mtd: block2mtd: defer device open out of param/sysfs write
> >
> > block2mtd_setup() opens the named block device (VFS path walk) while
> > still under param_lock and kernfs_fop_write_iter. When that write
> > arrives via splice, a pipe mutex is held as well. That nests under
> > locks already ordered the other way with overlay sb_writers /
> > ovl_i_mutex and triggers lockdep, for example:
> >
> >   sb_writers -> pipe -> kernfs/param -> ovl_i_mutex -> sb_writers
> >
> > Drop param_lock and run setup on a dedicated ordered workqueue so the
> > open is not nested under that stack. Keep the call synchronous with
> > wait_for_completion().
> >
> > Changes since v1:
> > - allocate work on the heap (v1 tripped DEBUG_OBJECTS_WORK)
> > - use a dedicated ordered workqueue instead of system_wq
> > - hold a module reference across the deferred open
> > - flush and destroy the workqueue before exit teardown
> > - serialize setup2 on the worker under block2mtd_mutex
> > - keep early-boot paramline updates under that mutex
> >
> > Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
> > Signed-off-by: Chris Roy <iam@thechris.in>
> > ---
> >  drivers/mtd/devices/block2mtd.c | 121 ++++++++++++++++++++----
> >  1 file changed, 103 insertions(+), 18 deletions(-)
>
> Did you forget the Assisted-by: tag?
>
> >
> > --- a/drivers/mtd/devices/block2mtd.c
> > +++ b/drivers/mtd/devices/block2mtd.c
> > @@ -27,6 +27,8 @@
> >  #include <linux/init.h>
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mutex.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/completion.h>
> >  #include <linux/mount.h>
> >  #include <linux/slab.h>
> >  #include <linux/major.h>
> > @@ -45,6 +47,13 @@
> >
> >  /* Static info about the MTD, used in cleanup_module */
> >  static LIST_HEAD(blkmtd_device_list);
> > +/*
> > + * Serializes setup/teardown (including list updates). Never held by a
> > + * task that also holds param_lock / kernfs / pipe locks across a VFS open:
> > + * deferred setup runs on block2mtd_wq instead.
>
> Make the comments make sense please.  That's the problem of using a LLM :(
>
> thanks,
>
> greg k-h

--0000000000007d6517065ba92698
Content-Type: text/x-diff; charset="US-ASCII"; 
	name="0001-mtd-block2mtd-defer-device-open-out-of-param-sysfs-w.patch"
Content-Disposition: attachment; 
	filename="0001-mtd-block2mtd-defer-device-open-out-of-param-sysfs-w.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu58l3n10>
X-Attachment-Id: f_mu58l3n10

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpcyBSb3kgPGlhbUB0aGVjaHJpcy5pbj4KRGF0ZTogVGh1
LCAxNyBTZXAgMjAyNiAwMDowMDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0ggdjNdIG10ZDogYmxv
Y2sybXRkOiBkZWZlciBkZXZpY2Ugb3BlbiBvdXQgb2YgcGFyYW0vc3lzZnMgd3JpdGUKCmJsb2Nr
Mm10ZF9zZXR1cCgpIG9wZW5zIHRoZSBuYW1lZCBibG9jayBkZXZpY2Ugd2hpbGUgc3RpbGwgdW5k
ZXIKcGFyYW1fbG9jaywgYW5kIG9uIHRoZSBzeXNmcyB3cml0ZSBwYXRoIHVuZGVyIGtlcm5mcyAo
YW5kIHBvc3NpYmx5IGEKc3BsaWNlIHBpcGUgbG9jaykuIFRoYXQgbmVzdHMgVkZTIGxvY2tpbmcg
dGhlIHdyb25nIHdheSByZWxhdGl2ZSB0bwpvdmVybGF5ZnMgYW5kIHRyaXBzIGxvY2tkZXAuCgpE
cm9wIHBhcmFtX2xvY2sgYW5kIHJ1biBzZXR1cCBvbiBhIGRlZGljYXRlZCBvcmRlcmVkIHdvcmtx
dWV1ZS4gS2VlcAp0aGUgY2FsbCBzeW5jaHJvbm91cyB3aXRoIHdhaXRfZm9yX2NvbXBsZXRpb24o
KS4gQWxsb2NhdGUgdGhlIHdvcmsgb24KdGhlIGhlYXAgc28gREVCVUdfT0JKRUNUU19XT1JLIHN0
YXlzIHF1aWV0LgoKQ2hhbmdlcyBzaW5jZSB2MjoKLSByZXdyaXRlIHRoZSBuZXcgY29tbWVudHMg
dG8gbWF0Y2ggdGhlIHJlc3Qgb2YgdGhlIGZpbGUKCkNoYW5nZXMgc2luY2UgdjE6Ci0gaGVhcC1h
bGxvY2F0ZWQgd29yayAodjEgdHJpcHBlZCBERUJVR19PQkpFQ1RTX1dPUkspCi0gZGVkaWNhdGVk
IG9yZGVyZWQgd29ya3F1ZXVlIGluc3RlYWQgb2Ygc3lzdGVtX3dxCi0gbW9kdWxlIHJlZmVyZW5j
ZSBhY3Jvc3MgdGhlIGRlZmVycmVkIG9wZW4KLSBmbHVzaC9kZXN0cm95IHRoZSB3b3JrcXVldWUg
YmVmb3JlIGV4aXQgdGVhcmRvd24KLSBzZXJpYWxpemUgc2V0dXAyIG9uIHRoZSB3b3JrZXIgdW5k
ZXIgYmxvY2sybXRkX211dGV4Ci0gZWFybHktYm9vdCBwYXJhbWxpbmUgdXBkYXRlcyB1bmRlciB0
aGF0IG11dGV4CgpSZXBvcnRlZC1ieTogc3l6Ym90KzdjYWI2YTE5NjE5ZjFiOGVmYzAwQHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KQ2xvc2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS9idWc/ZXh0aWQ9N2NhYjZhMTk2MTlmMWI4ZWZjMDAKQXNzaXN0ZWQtYnk6IE1pc3RyYWwsIFF3
ZW4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgUm95IDxpYW1AdGhlY2hyaXMuaW4+Ci0tLQogZHJpdmVy
cy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYyB8IDExOCArKysrKysrKysrKysrKysrKysrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgotLS0g
YS9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCisrKyBiL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvYmxvY2sybXRkLmMKQEAgLTI3LDYgKzI3LDggQEAKICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+
CiAjaW5jbHVkZSA8bGludXgvbXRkL210ZC5oPgogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Cisj
aW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CisjaW5jbHVkZSA8bGludXgvY29tcGxldGlvbi5o
PgogI2luY2x1ZGUgPGxpbnV4L21vdW50Lmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21ham9yLmg+CkBAIC00NSw2ICs0Nyw5IEBACiAKIC8qIFN0YXRpYyBpbmZv
IGFib3V0IHRoZSBNVEQsIHVzZWQgaW4gY2xlYW51cF9tb2R1bGUgKi8KIHN0YXRpYyBMSVNUX0hF
QUQoYmxrbXRkX2RldmljZV9saXN0KTsKKy8qIFByb3RlY3RzIGJsa210ZF9kZXZpY2VfbGlzdCBh
bmQgZWFybHktYm9vdCBwYXJhbWxpbmUgdXBkYXRlcyAqLworc3RhdGljIERFRklORV9NVVRFWChi
bG9jazJtdGRfbXV0ZXgpOworc3RhdGljIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICpibG9jazJt
dGRfd3E7CiAKIAogc3RhdGljIHN0cnVjdCBwYWdlICpwYWdlX3JlYWQoc3RydWN0IGFkZHJlc3Nf
c3BhY2UgKm1hcHBpbmcsIHBnb2ZmX3QgaW5kZXgpCkBAIC00NjEsMzEgKzQ2Niw4OSBAQAogCXJl
dHVybiAwOwogfQogCitzdHJ1Y3QgYmxvY2sybXRkX3NldHVwX3dvcmsgeworCXN0cnVjdCB3b3Jr
X3N0cnVjdCB3b3JrOworCXN0cnVjdCBjb21wbGV0aW9uIGRvbmU7CisJY2hhciAqdmFsOworCWlu
dCByZXQ7Cit9OworCitzdGF0aWMgdm9pZCBibG9jazJtdGRfc2V0dXBfd29ya2ZuKHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgYmxvY2sybXRkX3NldHVwX3dvcmsgKncgPQor
CQljb250YWluZXJfb2Yod29yaywgc3RydWN0IGJsb2NrMm10ZF9zZXR1cF93b3JrLCB3b3JrKTsK
KworCW11dGV4X2xvY2soJmJsb2NrMm10ZF9tdXRleCk7CisJdy0+cmV0ID0gYmxvY2sybXRkX3Nl
dHVwMih3LT52YWwpOworCW11dGV4X3VubG9jaygmYmxvY2sybXRkX211dGV4KTsKKwljb21wbGV0
ZSgmdy0+ZG9uZSk7Cit9CisKKy8qIFF1ZXVlIHNldHVwMiBvbiBibG9jazJtdGRfd3E7IGNhbGxl
ciBob2xkcyBhIG1vZHVsZSByZWYgdW50aWwgcmV0dXJuICovCitzdGF0aWMgaW50IGJsb2NrMm10
ZF9zZXR1cF9kZWZlcihjb25zdCBjaGFyICp2YWwpCit7CisJc3RydWN0IGJsb2NrMm10ZF9zZXR1
cF93b3JrICp3OworCWludCByZXQ7CisKKwlpZiAoIWJsb2NrMm10ZF93cSkKKwkJcmV0dXJuIC1F
Tk9ERVY7CisKKwl3ID0ga3phbGxvYyhzaXplb2YoKncpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXcp
CisJCXJldHVybiAtRU5PTUVNOworCisJdy0+dmFsID0ga3N0cmR1cCh2YWwsIEdGUF9LRVJORUwp
OworCWlmICghdy0+dmFsKSB7CisJCWtmcmVlKHcpOworCQlyZXR1cm4gLUVOT01FTTsKKwl9CisK
Kwlpbml0X2NvbXBsZXRpb24oJnctPmRvbmUpOworCUlOSVRfV09SSygmdy0+d29yaywgYmxvY2sy
bXRkX3NldHVwX3dvcmtmbik7CisJcXVldWVfd29yayhibG9jazJtdGRfd3EsICZ3LT53b3JrKTsK
Kwl3YWl0X2Zvcl9jb21wbGV0aW9uKCZ3LT5kb25lKTsKKworCXJldCA9IHctPnJldDsKKwlrZnJl
ZSh3LT52YWwpOworCWtmcmVlKHcpOworCXJldHVybiByZXQ7Cit9CiAKIHN0YXRpYyBpbnQgYmxv
Y2sybXRkX3NldHVwKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAq
a3ApCiB7Ci0jaWZkZWYgTU9EVUxFCi0JcmV0dXJuIGJsb2NrMm10ZF9zZXR1cDIodmFsKTsKLSNl
bHNlCi0JLyogSWYgbW9yZSBwYXJhbWV0ZXJzIGFyZSBsYXRlciBwYXNzZWQgaW4gdmlhCi0JICAg
L3N5cy9tb2R1bGUvYmxvY2sybXRkL3BhcmFtZXRlcnMvYmxvY2sybXRkCi0JICAgYW5kIGJsb2Nr
Mm10ZF9pbml0KCkgaGFzIGFscmVhZHkgYmVlbiBjYWxsZWQsCi0JICAgd2UgY2FuIHBhcnNlIHRo
ZSBhcmd1bWVudCBub3cuICovCi0KLQlpZiAoYmxvY2sybXRkX2luaXRfY2FsbGVkKQotCQlyZXR1
cm4gYmxvY2sybXRkX3NldHVwMih2YWwpOwotCi0JLyogRHVyaW5nIGVhcmx5IGJvb3Qgc3RhZ2Us
IHdlIG9ubHkgc2F2ZSB0aGUgcGFyYW1ldGVycwotCSAgIGhlcmUuIFdlIG11c3QgcGFyc2UgdGhl
bSBsYXRlcjogaWYgdGhlIHBhcmFtIHBhc3NlZAotCSAgIGZyb20ga2VybmVsIGJvb3QgY29tbWFu
ZCBsaW5lLCBibG9jazJtdGRfc2V0dXAoKSBpcwotCSAgIGNhbGxlZCBzbyBlYXJseSB0aGF0IGl0
IGlzIG5vdCBwb3NzaWJsZSB0byByZXNvbHZlCi0JICAgdGhlIGRldmljZSAoZXZlbiBrbWFsbG9j
KCkgZmFpbHMpLiBEZXRlciB0aGF0IHdvcmsgdG8KLQkgICBibG9jazJtdGRfc2V0dXAyKCkuICov
CisJaW50IHJldCA9IDA7CiAKLQlzdHJzY3B5KGJsb2NrMm10ZF9wYXJhbWxpbmUsIHZhbCwgc2l6
ZW9mKGJsb2NrMm10ZF9wYXJhbWxpbmUpKTsKKwlpZiAoIXRyeV9tb2R1bGVfZ2V0KGtwLT5tb2Qp
KQorCQlyZXR1cm4gLUVOT0RFVjsKIAotCXJldHVybiAwOworCS8qIERvIG5vdCBvcGVuIGEgYmxv
Y2sgZGV2aWNlIHVuZGVyIHBhcmFtX2xvY2sgKi8KKwlrZXJuZWxfcGFyYW1fdW5sb2NrKGtwLT5t
b2QpOworCisjaWZuZGVmIE1PRFVMRQorCW11dGV4X2xvY2soJmJsb2NrMm10ZF9tdXRleCk7CisJ
aWYgKCFibG9jazJtdGRfaW5pdF9jYWxsZWQpIHsKKwkJLyogRWFybHkgYm9vdDogY2Fubm90IHJl
c29sdmUgYmxvY2sgZGV2aWNlcyB5ZXQuICovCisJCXN0cnNjcHkoYmxvY2sybXRkX3BhcmFtbGlu
ZSwgdmFsLCBzaXplb2YoYmxvY2sybXRkX3BhcmFtbGluZSkpOworCQltdXRleF91bmxvY2soJmJs
b2NrMm10ZF9tdXRleCk7CisJCWtlcm5lbF9wYXJhbV9sb2NrKGtwLT5tb2QpOworCQltb2R1bGVf
cHV0KGtwLT5tb2QpOworCQlyZXR1cm4gMDsKKwl9CisJbXV0ZXhfdW5sb2NrKCZibG9jazJtdGRf
bXV0ZXgpOwogI2VuZGlmCisKKwlpZiAoYmxvY2sybXRkX3dxKSB7CisJCXJldCA9IGJsb2NrMm10
ZF9zZXR1cF9kZWZlcih2YWwpOworCX0gZWxzZSB7CisJCS8qIFByZS1pbml0IChlLmcuIGluc21v
ZCBhcmdzKTogc2FmZSB0byBydW4gc2V0dXAyIGhlcmUgKi8KKwkJbXV0ZXhfbG9jaygmYmxvY2sy
bXRkX211dGV4KTsKKwkJcmV0ID0gYmxvY2sybXRkX3NldHVwMih2YWwpOworCQltdXRleF91bmxv
Y2soJmJsb2NrMm10ZF9tdXRleCk7CisJfQorCisJa2VybmVsX3BhcmFtX2xvY2soa3AtPm1vZCk7
CisJbW9kdWxlX3B1dChrcC0+bW9kKTsKKwlyZXR1cm4gcmV0OwogfQogCiAKQEAgLTQ5NiwxMCAr
NTU5LDE3IEBACiB7CiAJaW50IHJldCA9IDA7CiAKKwlibG9jazJtdGRfd3EgPSBhbGxvY19vcmRl
cmVkX3dvcmtxdWV1ZSgiYmxvY2sybXRkIiwgMCk7CisJaWYgKCFibG9jazJtdGRfd3EpCisJCXJl
dHVybiAtRU5PTUVNOworCiAjaWZuZGVmIE1PRFVMRQorCW11dGV4X2xvY2soJmJsb2NrMm10ZF9t
dXRleCk7CiAJaWYgKHN0cmxlbihibG9jazJtdGRfcGFyYW1saW5lKSkKIAkJcmV0ID0gYmxvY2sy
bXRkX3NldHVwMihibG9jazJtdGRfcGFyYW1saW5lKTsKKwkvKiBBdm9pZCByYWNpbmcgc3lzZnMg
d2l0aCB0aGUgZWFybHkgcGFyYW1saW5lICovCiAJYmxvY2sybXRkX2luaXRfY2FsbGVkID0gMTsK
KwltdXRleF91bmxvY2soJmJsb2NrMm10ZF9tdXRleCk7CiAjZW5kaWYKIAogCXJldHVybiByZXQ7
CkBAIC01MTAsOSArNTgwLDE2IEBACiB7CiAJc3RydWN0IGxpc3RfaGVhZCAqcG9zLCAqbmV4dDsK
IAotCS8qIFJlbW92ZSB0aGUgTVREIGRldmljZXMgKi8KKwlpZiAoYmxvY2sybXRkX3dxKSB7CisJ
CWZsdXNoX3dvcmtxdWV1ZShibG9jazJtdGRfd3EpOworCQlkZXN0cm95X3dvcmtxdWV1ZShibG9j
azJtdGRfd3EpOworCQlibG9jazJtdGRfd3EgPSBOVUxMOworCX0KKworCW11dGV4X2xvY2soJmJs
b2NrMm10ZF9tdXRleCk7CiAJbGlzdF9mb3JfZWFjaF9zYWZlKHBvcywgbmV4dCwgJmJsa210ZF9k
ZXZpY2VfbGlzdCkgewogCQlzdHJ1Y3QgYmxvY2sybXRkX2RldiAqZGV2ID0gbGlzdF9lbnRyeShw
b3MsIHR5cGVvZigqZGV2KSwgbGlzdCk7CisKIAkJYmxvY2sybXRkX3N5bmMoJmRldi0+bXRkKTsK
IAkJbXRkX2RldmljZV91bnJlZ2lzdGVyKCZkZXYtPm10ZCk7CiAJCW11dGV4X2Rlc3Ryb3koJmRl
di0+d3JpdGVfbXV0ZXgpOwpAQCAtNTIyLDYgKzU5OSw3IEBACiAJCWxpc3RfZGVsKCZkZXYtPmxp
c3QpOwogCQlibG9jazJtdGRfZnJlZV9kZXZpY2UoZGV2KTsKIAl9CisJbXV0ZXhfdW5sb2NrKCZi
bG9jazJtdGRfbXV0ZXgpOwogfQogCiBsYXRlX2luaXRjYWxsKGJsb2NrMm10ZF9pbml0KTsK
--0000000000007d6517065ba92698
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--0000000000007d6517065ba92698--

