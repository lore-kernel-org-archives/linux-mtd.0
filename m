Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258EDC2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 07:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E1A320738
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 07:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IdTmKcUD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emcraft.com header.i=@emcraft.com header.b="D6Jup0JS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E1A320738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8kuGaOCZliHDN/IHR8sHX20OruE375+m/a624/6wo34=; b=IdTmKcUDtsq1fAtdF552zL3Uz
	MXkt3C/WaNRkFaI2ohYYZn19L4bH7N61R9fyl/vTK2lo279dSFzTioYuEz6TM/CbLttzNXHsMBgX7
	FJZejeDWagI+E5MxDVlnIKRbQwdwVrRb163AsFnUozbNymCbW/ZKtmuztPpKdNPfuAVr2IzWdLIpP
	GR3K8Rfpv61IUkRyxxeNtQBNRmD+QM13omNAuvRt87vqSrdw7rYRCKIa5T+RjY2G2Y1Yn/3rl7Iby
	odpZlDdmE72QqexNaUMvnUkibkLtNE6II7SDmK6GDYFK5nGrc+yq0R+K83CceWzl7kpLyU10fCKOt
	ZGb5ARJUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh6PS-0003bk-DQ; Mon, 23 Nov 2020 07:37:14 +0000
Received: from mail.emcraft.com ([142.93.143.113])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh6PP-0003bA-N6
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 07:37:12 +0000
Received: from sergmir.emcraft.com (unknown [95.165.7.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.emcraft.com (Postfix) with ESMTPSA id 1D4D43F024;
 Mon, 23 Nov 2020 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emcraft.com;
 s=default; t=1606117028;
 bh=sCowTSY93ddMjdJL3PJpji4nBDSLauuHzrQLUzozcHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D6Jup0JS14rck6hFQES6lbXICEJofEzYql7qaTNrIcIlKm69ZbBAaE7aNCnQ2Pbfm
 6poZmBJazQOiSbJ6mxiPwY2yVk8qHDshkpMhQOy2Tf7xWXWQ7H/vxVMNNqRX8MGMFl
 ggHN4nUsimTM58g4JroshguSj1lmb2owVqbzBhNE=
Date: Mon, 23 Nov 2020 10:37:06 +0300
From: Sergei Poselenov <sposelenov@emcraft.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Help with UBI failure analysis
Message-ID: <20201123103706.13a56898@sergmir.emcraft.com>
In-Reply-To: <CAFLxGvyp9C6BuM3V3DDxCrs3LCuWc0dJgACZShB5qU01SHwh2Q@mail.gmail.com>
References: <20200924113518.7c6dda33@sergmir>
 <CAFLxGvyp9C6BuM3V3DDxCrs3LCuWc0dJgACZShB5qU01SHwh2Q@mail.gmail.com>
Organization: Emcraft Systems
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_023712_085810_226E4147 
X-CRM114-Status: GOOD (  26.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

Sorry for a long delay and thanks a lot for your reply. Could you please look at the crash dump below?

We set up a simple write-compare test on that device (please see the original message in the threa), on an empty UBI partition:
DIR=/mnt/data

rm -rf $DIR/*
touch $DIR/a1 $DIR/a2

while :; do
        for sz in 1 10 3 5; do
                cs1=`md5sum $DIR/a1 | cut -f1 -d' '`
                cs2=`md5sum $DIR/a2 | cut -f1 -d' '`
                if [ "$cs1" = "$cs2" ]; then
                        echo -n "." 
                else
                        echo "ERROR: $DIR/a1 and $DIR/a2 differ" 
                        exit 1
                fi
                mv $DIR/a1 $DIR/b1
                mv $DIR/a2 $DIR/b2
                dd if=/dev/urandom of=/tmp/rnd count=$sz bs=1M 2> /dev/null
                cp /tmp/rnd $DIR/a1
                cp /tmp/rnd $DIR/a2
                sync; echo 3 > /proc/sys/vm/drop_caches > /dev/null
        done
done


After about ~3days, the test failed with the following messages on the board console:
=================================
...........................................................................................................
...........................................................................................................
.......................................ubi1 warning: ubi_eba_copy_leb: read data back from PEB 895 and it is different
ubi1 error: wear_leveling_worker: error -22 while moving PEB 1 to PEB 895
ubi1 warning: ubi_ro_mode: switch to read-only mode
CPU: 0 PID: 181 Comm: ubi_bgt1d Not tainted 4.5.0 #4
Hardware name: Freescale i.MX6 SoloX (Device Tree)
[<800160f4>] (unwind_backtrace) from [<80013400>] (show_stack+0x10/0x14)
[<80013400>] (show_stack) from [<8029c6ec>] (dump_stack+0x88/0x9c)
[<8029c6ec>] (dump_stack) from [<8039fac8>] (wear_leveling_worker+0x808/0x858)
[<8039fac8>] (wear_leveling_worker) from [<8039e724>] (do_work+0x84/0x104)
[<8039e724>] (do_work) from [<803a02c8>] (ubi_thread+0xd4/0x170)
[<803a02c8>] (ubi_thread) from [<8003c9c0>] (kthread+0xdc/0xf4)
[<8003c9c0>] (kthread) from [<8000f7b8>] (ret_from_fork+0x14/0x3c)
ubi1 error: do_work: work failed with error code -22
ubi1 error: ubi_io_write: read-only mode
ubi1 error: ubi_write_fastmap: unable to write vid_hdr to fastmap SB!
ubi1 error: ubi_thread: ubi_bgt1d: work failed with error code -22
ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-30
ubi1 error: ubi_io_write: read-only mode
ubi1 warning: ubi_eba_write_leb: failed to write VID header to LEB 0:2476, PEB 885
UBIFS error (ubi1:0 pid 22714): ubifs_leb_map: mapping LEB 2476 failed, error -30
UBIFS warning (ubi1:0 pid 22714): ubifs_ro_mode: switched to read-only mode, error -30
CPU: 0 PID: 22714 Comm: cp Not tainted 4.5.0 #4
Hardware name: Freescale i.MX6 SoloX (Device Tree)
[<800160f4>] (unwind_backtrace) from [<80013400>] (show_stack+0x10/0x14)
[<80013400>] (show_stack) from [<8029c6ec>] (dump_stack+0x88/0x9c)
[<8029c6ec>] (dump_stack) from [<802057f8>] (ubifs_leb_map+0x118/0x120)
[<802057f8>] (ubifs_leb_map) from [<8020ef00>] (ubifs_add_bud_to_log+0x1d0/0x330)
[<8020ef00>] (ubifs_add_bud_to_log) from [<801f9b94>] (make_reservation+0x378/0x4ac)
[<801f9b94>] (make_reservation) from [<801fa5bc>] (ubifs_jnl_write_data+0xe4/0x264)
[<801fa5bc>] (ubifs_jnl_write_data) from [<801fc1ec>] (do_writepage+0x78/0x1cc)
[<801fc1ec>] (do_writepage) from [<800aafc0>] (__writepage+0x14/0x40)
[<800aafc0>] (__writepage) from [<800ab86c>] (write_cache_pages+0x170/0x3c0)
[<800ab86c>] (write_cache_pages) from [<800abafc>] (generic_writepages+0x40/0x60)
[<800abafc>] (generic_writepages) from [<800a2f68>] (__filemap_fdatawrite_range+0x78/0x9c)
[<800a2f68>] (__filemap_fdatawrite_range) from [<800a30a8>] (filemap_write_and_wait_range+0x34/0x74)
[<800a30a8>] (filemap_write_and_wait_range) from [<801fc934>] (ubifs_fsync+0x40/0xb4)
[<801fc934>] (ubifs_fsync) from [<800a3e70>] (generic_file_write_iter+0x1b0/0x264)
[<800a3e70>] (generic_file_write_iter) from [<801fde28>] (ubifs_write_iter+0xe8/0x178)
[<801fde28>] (ubifs_write_iter) from [<800e3820>] (__vfs_write+0xa8/0xd8)
[<800e3820>] (__vfs_write) from [<800e451c>] (vfs_write+0x90/0x164)
[<800e451c>] (vfs_write) from [<800e4f64>] (SyS_write+0x44/0x9c)
[<800e4f64>] (SyS_write) from [<8000f700>] (ret_fast_syscall+0x0/0x3c)
CPU: 0 PID: 22714 Comm: cp Not tainted 4.5.0 #4
Hardware name: Freescale i.MX6 SoloX (Device Tree)
[<800160f4>] (unwind_backtrace) from [<80013400>] (show_stack+0x10/0x14)
[<80013400>] (show_stack) from [<8029c6ec>] (dump_stack+0x88/0x9c)
[<8029c6ec>] (dump_stack) from [<802057e4>] (ubifs_leb_map+0x104/0x120)
[<802057e4>] (ubifs_leb_map) from [<8020ef00>] (ubifs_add_bud_to_log+0x1d0/0x330)
[<8020ef00>] (ubifs_add_bud_to_log) from [<801f9b94>] (make_reservation+0x378/0x4ac)
[<801f9b94>] (make_reservation) from [<801fa5bc>] (ubifs_jnl_write_data+0xe4/0x264)
[<801fa5bc>] (ubifs_jnl_write_data) from [<801fc1ec>] (do_writepage+0x78/0x1cc)
[<801fc1ec>] (do_writepage) from [<800aafc0>] (__writepage+0x14/0x40)
[<800aafc0>] (__writepage) from [<800ab86c>] (write_cache_pages+0x170/0x3c0)
[<800ab86c>] (write_cache_pages) from [<800abafc>] (generic_writepages+0x40/0x60)
[<800abafc>] (generic_writepages) from [<800a2f68>] (__filemap_fdatawrite_range+0x78/0x9c)
[<800a2f68>] (__filemap_fdatawrite_range) from [<800a30a8>] (filemap_write_and_wait_range+0x34/0x74)
[<800a30a8>] (filemap_write_and_wait_range) from [<801fc934>] (ubifs_fsync+0x40/0xb4)
[<801fc934>] (ubifs_fsync) from [<800a3e70>] (generic_file_write_iter+0x1b0/0x264)
[<800a3e70>] (generic_file_write_iter) from [<801fde28>] (ubifs_write_iter+0xe8/0x178)
[<801fde28>] (ubifs_write_iter) from [<800e3820>] (__vfs_write+0xa8/0xd8)
[<800e3820>] (__vfs_write) from [<800e451c>] (vfs_write+0x90/0x164)
[<800e451c>] (vfs_write) from [<800e4f64>] (SyS_write+0x44/0x9c)
[<800e4f64>] (SyS_write) from [<8000f700>] (ret_fast_syscall+0x0/0x3c)
UBIFS error (ubi1:0 pid 22714): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi1:0 pid 22714): do_writepage: cannot write page 299 of inode 58400, error -30
cp: write error: Read-only file system
cp: can't create '/mnt/data/a2': Read-only file system
UBIFS error (ubi1:0 pid 6): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi1:0 pid 6): do_writepage: cannot write page 300 of inode 58400, error -30
UBIFS error (ubi1:0 pid 6): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi1:0 pid 6): do_writepage: cannot write page 301 of inode 58400, error -30
md5sum: can't open '/mnt/data/a2': No such file or directory
ERROR: /mnt/data/a1 and /mnt/data/a2 differ
~ #
~ # UBIFS error (ubi1:0 pid 6): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi1:0 pid 6): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi1:0 pid 6): do_writepage: cannot write page 303 of inode 58400, error -30
========================

Could you please share you thoughts on what could cause such errors? Does it confirm your initial suggestion that something happened on the MTD layer?

--
Regards,
Sergei Poselenov,
Emcraft Systems

On Thu, 24 Sep 2020 12:42:46 +0200 Richard Weinberger <richard.weinberger@gmail.com> wrote:

> On Thu, Sep 24, 2020 at 10:41 AM Sergei Poselenov
> <sposelenov@emcraft.com> wrote:
> > Freeing unused kernel memory: 280K (80898000 - 808de000)
> > UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (0 but expected 9)
> > UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 12:100352, LEB mapping status 1
> > Not a node, first 24 bytes:
> > 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 02 00 00 08 00 00 00 10 00                          UBI#....................  
> 
> So, UBIFS reads from a node and finds a UBI EC header, this must not happen.
> UBI headers are invisible to UBIFS. If UBIFS reads from a LEB and a
> given offset, the offset is translated
> to read data after the page(s) where EC/VID headers reside.
> 
> *unless* LEB 12 offset 100352 contains an UBIFS data node for a
> nanddump you did before
> and the index tree is corrupted. But I don't think so.
> 
> Looks more like a problem on the mtd side.
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
