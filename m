Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92C0C07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 06:59:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FAFF60FD8
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 06:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FAFF60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1JZv+QAuyXRQx9Pp9WVUysmAJgWHS+taIYdLuwg3qZo=; b=bQNlprNiquJtIc
	Z8DVVlQkZ3pHNb+bGsaf26Km056/alkWMv4nU176DUUxdCOFaY6koAnuhN7qZhYQygetnWLTUyY4m
	A0acBfIReY5jNnH5G/7sT1TrBZ7eGm7WBvbAkjXdNT9rzYHgdcQEsajmUxZ1nrtM5XjwTiKlGu4Bm
	PdjlKbbEO02n7zsLpbBIITcWuT7YxVYV7xxREei3nnW1WTLCWfgtF3WcvzoWk4bEigtg6IzZI7sSL
	mph9gdUBufwqdqS3zlPcNZC6eqrlF+xD9C/sf7sFsJPKY7g6Aibx/JcFeSaIz+ipdLUu9DFLy8l4Q
	9UTbJxK2cWabwslhAFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0IZ5-00823q-EJ; Mon, 05 Jul 2021 06:58:47 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0IYx-00821X-As
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 06:58:45 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id C83AA4C4B35;
 Mon,  5 Jul 2021 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1625468314; bh=9GgYe7js8K1Mcf36RWxohrwZG0B7X2yhQYnXnCEWYns=;
 h=Date:From:To:Cc:Subject;
 b=HcymprMh0elV8U/97aOdm88DmK2EyBXE56J9xGboscY/2jOT6pDZ+Z3iVQ1aFnMJy
 bI7vr4PIV21siCltOmJ3UpHTPUdMriaBo3giV9j3vyVKai4KtTQGvUFE2+NjOWi/M0
 ZDA380MyZk0GDY7SBRnicImjB72SjfjnTP6kiTiGIhAIeUr8K1d8g0LxI4VVISju6e
 wtEUYvaCX4RbXjD4AKe770tLl4P7tQSC4fVpwiBpV/hJIX0/589aWiFLNV/djWxGI0
 ClrcH1FQldV8Nls75+EsIWQGvF72tiYhercOYVQGh0jUEiT24ECNd92C/NMwRe/rXh
 WzyusIacT6r5g==
Date: Mon, 5 Jul 2021 08:58:33 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: s.hauer@pengutronix.de, miquel.raynal@bootlin.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org
Subject: [BUG RESEND] mtd: rawnand: gpmi: unsuspend failure under load
Message-ID: <20210705065833.2ezlhaspkkju4bh7@skn-laptop>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_235839_898584_D1AB5319 
X-CRM114-Status: GOOD (  18.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel and Sascha,

We are having some trouble when our i.MX6 unsuspends while writes to
ubifs is in progess. In the log it looks like it syncing the filesystem
before suspend.

The SoC a i.MX6ul/ull, the issue is (lucky for us) quite easy to reproduce.
The reproduce script: [0]
Kernel log when it happens: [1]

I have bisected the bug to: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")

Any idea to where I should start looking? or to what happens?

Esben have posted to patches that relates to suspend/unsuspend but it
doesn't seem to releated to this issue.
5bc6bb603b4d ("mtd: rawnand: gpmi: Fix suspend/resume problem")
d70486668cdf ("mtd: rawnand: gpmi: Restore nfc timing setup after suspend/resume")

/Sean

[0]
#!/bin/sh
dd if=/dev/urandom of=/tmp/test50M bs=1M count=50
cp /tmp/test50M /data/ &
echo mem > /sys/power/state

[1]
root@iwg26-v2:/data/root# ./ubicrash.sh
50+0 records in
50+0 records out
PM: suspend entry (deep)
Filesystems sync: 33.642 seconds
Freezing user space processes ... (elapsed 0.004 seconds) done.
OOM killer disabled.
Freezing remaining freezable tasks ... (elapsed 0.003 seconds) done.
printk: Suspending console(s) (use no_console_suspend to debug)
<SUSPEND/WAKE>
PM: suspend devices took 0.040 seconds
Disabling non-boot CPUs ...
ubi0 error: ubi_io_write: error -16 while writing 4096 bytes to PEB 544:53248, written 0 bytes
CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Workqueue: writeback wb_workfn (flush-ubifs_0_8)
[<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
[<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
[<c0970798>] (dump_stack) from [<c05dfe10>] (ubi_io_write+0x510/0x6b0)
[<c05dfe10>] (ubi_io_write) from [<c05dcd90>] (ubi_eba_write_leb+0x388/0x910)
[<c05dcd90>] (ubi_eba_write_leb) from [<c05daf34>] (ubi_leb_write+0xd0/0xe8)
[<c05daf34>] (ubi_leb_write) from [<c03cfeb4>] (ubifs_leb_write+0x68/0x104)
[<c03cfeb4>] (ubifs_leb_write) from [<c03d10e0>] (ubifs_wbuf_write_nolock+0x28c/0x74c)
[<c03d10e0>] (ubifs_wbuf_write_nolock) from [<c03c39f4>] (ubifs_jnl_write_data+0x1b8/0x2b4)
[<c03c39f4>] (ubifs_jnl_write_data) from [<c03c7060>] (do_writepage+0x1a4/0x244)
[<c03c7060>] (do_writepage) from [<c022c15c>] (__writepage+0x14/0x68)
[<c022c15c>] (__writepage) from [<c022ce38>] (write_cache_pages+0x1e4/0x3e8)
[<c022ce38>] (write_cache_pages) from [<c022ef04>] (do_writepages+0xa4/0xdc)
[<c022ef04>] (do_writepages) from [<c02ca69c>] (__writeback_single_inode+0x2c/0x1b4)
[<c02ca69c>] (__writeback_single_inode) from [<c02cad20>] (writeback_sb_inodes+0x200/0x470)
[<c02cad20>] (writeback_sb_inodes) from [<c02cafcc>] (__writeback_inodes_wb+0x3c/0xf4)
[<c02cafcc>] (__writeback_inodes_wb) from [<c02cb230>] (wb_writeback+0x1ac/0x20c)
[<c02cb230>] (wb_writeback) from [<c02cc2b0>] (wb_workfn+0x2c0/0x3d4)
[<c02cc2b0>] (wb_workfn) from [<c013a7e8>] (process_one_work+0x1dc/0x438)
[<c013a7e8>] (process_one_work) from [<c013aa8c>] (worker_thread+0x48/0x598)
[<c013aa8c>] (worker_thread) from [<c014074c>] (kthread+0x12c/0x140)
[<c014074c>] (kthread) from [<c0100170>] (ret_from_fork+0x14/0x24)
Exception stack(0xc26affb0 to 0xc26afff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
ubi0 error: ubi_dump_flash: err -16 while reading 4096 bytes from PEB 544:53248, read 0 bytes
ubi0 warning: ubi_eba_write_leb: failed to write data to PEB 544
ubi0 warning: ubi_ro_mode.part.0: switch to read-only mode
CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Workqueue: writeback wb_workfn (flush-ubifs_0_8)
[<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
[<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
[<c0970798>] (dump_stack) from [<c05dd27c>] (ubi_eba_write_leb+0x874/0x910)
[<c05dd27c>] (ubi_eba_write_leb) from [<c05daf34>] (ubi_leb_write+0xd0/0xe8)
[<c05daf34>] (ubi_leb_write) from [<c03cfeb4>] (ubifs_leb_write+0x68/0x104)
[<c03cfeb4>] (ubifs_leb_write) from [<c03d10e0>] (ubifs_wbuf_write_nolock+0x28c/0x74c)
[<c03d10e0>] (ubifs_wbuf_write_nolock) from [<c03c39f4>] (ubifs_jnl_write_data+0x1b8/0x2b4)
[<c03c39f4>] (ubifs_jnl_write_data) from [<c03c7060>] (do_writepage+0x1a4/0x244)
[<c03c7060>] (do_writepage) from [<c022c15c>] (__writepage+0x14/0x68)
[<c022c15c>] (__writepage) from [<c022ce38>] (write_cache_pages+0x1e4/0x3e8)
[<c022ce38>] (write_cache_pages) from [<c022ef04>] (do_writepages+0xa4/0xdc)
[<c022ef04>] (do_writepages) from [<c02ca69c>] (__writeback_single_inode+0x2c/0x1b4)
[<c02ca69c>] (__writeback_single_inode) from [<c02cad20>] (writeback_sb_inodes+0x200/0x470)
[<c02cad20>] (writeback_sb_inodes) from [<c02cafcc>] (__writeback_inodes_wb+0x3c/0xf4)
[<c02cafcc>] (__writeback_inodes_wb) from [<c02cb230>] (wb_writeback+0x1ac/0x20c)
[<c02cb230>] (wb_writeback) from [<c02cc2b0>] (wb_workfn+0x2c0/0x3d4)
[<c02cc2b0>] (wb_workfn) from [<c013a7e8>] (process_one_work+0x1dc/0x438)
[<c013a7e8>] (process_one_work) from [<c013aa8c>] (worker_thread+0x48/0x598)
[<c013aa8c>] (worker_thread) from [<c014074c>] (kthread+0x12c/0x140)
[<c014074c>] (kthread) from [<c0100170>] (ret_from_fork+0x14/0x24)
Exception stack(0xc26affb0 to 0xc26afff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
UBIFS error (ubi0:8 pid 69): ubifs_leb_write: writing 4096 bytes to LEB 166:45056 failed, error -16
UBIFS warning (ubi0:8 pid 69): ubifs_ro_mode.part.0: switched to read-only mode, error -16
CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Workqueue: writeback wb_workfn (flush-ubifs_0_8)
[<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
[<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
[<c0970798>] (dump_stack) from [<c03cff38>] (ubifs_leb_write+0xec/0x104)
[<c03cff38>] (ubifs_leb_write) from [<c03d10e0>] (ubifs_wbuf_write_nolock+0x28c/0x74c)
[<c03d10e0>] (ubifs_wbuf_write_nolock) from [<c03c39f4>] (ubifs_jnl_write_data+0x1b8/0x2b4)
[<c03c39f4>] (ubifs_jnl_write_data) from [<c03c7060>] (do_writepage+0x1a4/0x244)
[<c03c7060>] (do_writepage) from [<c022c15c>] (__writepage+0x14/0x68)
[<c022c15c>] (__writepage) from [<c022ce38>] (write_cache_pages+0x1e4/0x3e8)
[<c022ce38>] (write_cache_pages) from [<c022ef04>] (do_writepages+0xa4/0xdc)
[<c022ef04>] (do_writepages) from [<c02ca69c>] (__writeback_single_inode+0x2c/0x1b4)
[<c02ca69c>] (__writeback_single_inode) from [<c02cad20>] (writeback_sb_inodes+0x200/0x470)
[<c02cad20>] (writeback_sb_inodes) from [<c02cafcc>] (__writeback_inodes_wb+0x3c/0xf4)
[<c02cafcc>] (__writeback_inodes_wb) from [<c02cb230>] (wb_writeback+0x1ac/0x20c)
[<c02cb230>] (wb_writeback) from [<c02cc2b0>] (wb_workfn+0x2c0/0x3d4)
[<c02cc2b0>] (wb_workfn) from [<c013a7e8>] (process_one_work+0x1dc/0x438)
[<c013a7e8>] (process_one_work) from [<c013aa8c>] (worker_thread+0x48/0x598)
[<c013aa8c>] (worker_thread) from [<c014074c>] (kthread+0x12c/0x140)
[<c014074c>] (kthread) from [<c0100170>] (ret_from_fork+0x14/0x24)
Exception stack(0xc26affb0 to 0xc26afff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Workqueue: writeback wb_workfn (flush-ubifs_0_8)
[<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
[<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
[<c0970798>] (dump_stack) from [<c03cff3c>] (ubifs_leb_write+0xf0/0x104)
[<c03cff3c>] (ubifs_leb_write) from [<c03d10e0>] (ubifs_wbuf_write_nolock+0x28c/0x74c)
[<c03d10e0>] (ubifs_wbuf_write_nolock) from [<c03c39f4>] (ubifs_jnl_write_data+0x1b8/0x2b4)
[<c03c39f4>] (ubifs_jnl_write_data) from [<c03c7060>] (do_writepage+0x1a4/0x244)
[<c03c7060>] (do_writepage) from [<c022c15c>] (__writepage+0x14/0x68)
[<c022c15c>] (__writepage) from [<c022ce38>] (write_cache_pages+0x1e4/0x3e8)
[<c022ce38>] (write_cache_pages) from [<c022ef04>] (do_writepages+0xa4/0xdc)
[<c022ef04>] (do_writepages) from [<c02ca69c>] (__writeback_single_inode+0x2c/0x1b4)
[<c02ca69c>] (__writeback_single_inode) from [<c02cad20>] (writeback_sb_inodes+0x200/0x470)
[<c02cad20>] (writeback_sb_inodes) from [<c02cafcc>] (__writeback_inodes_wb+0x3c/0xf4)
[<c02cafcc>] (__writeback_inodes_wb) from [<c02cb230>] (wb_writeback+0x1ac/0x20c)
[<c02cb230>] (wb_writeback) from [<c02cc2b0>] (wb_workfn+0x2c0/0x3d4)
[<c02cc2b0>] (wb_workfn) from [<c013a7e8>] (process_one_work+0x1dc/0x438)
[<c013a7e8>] (process_one_work) from [<c013aa8c>] (worker_thread+0x48/0x598)
[<c013aa8c>] (worker_thread) from [<c014074c>] (kthread+0x12c/0x140)
[<c014074c>] (kthread) from [<c0100170>] (ret_from_fork+0x14/0x24)
Exception stack(0xc26affb0 to 0xc26afff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
UBIFS error (ubi0:8 pid 69): ubifs_wbuf_write_nolock: cannot write 4144 bytes to LEB 166:45056, error -16
 magic          0x6101831
 crc            0x72d11463
 node_type      1 (data node)
 group_type     0 (no node group)
 sqnum          453448
 len            4144
 key            (821, data, 10961)
 size           4096
 compr_typ      0
 data size      4096
 data (length = 4096):
 00000000: fe e5 d1 11 55 e1 37 e1 fc 5e 49 9a a4 eb 9a 0f bd f7 5f 4f 0e a1 6c 09 32 36 0b 95 7c 5c 19 a0
 00000020: 70 a0 97 f8 0c 7d a6 2b 89 c0 e5 c3 6a 00 4e 40 ab 3c ca bb ae b5 ff 74 f8 16 42 bd 7c 58 6b 10
 00000040: 2f 28 88 7d a8 06 94 02 4c ca 10 d5 0b 3e 70 ee e5 29 e4 c2 fc 17 c6 93 b7 e6 d2 70 2d 90 ad 0b
 00000060: 06 00 f1 7c 96 aa 10 74 25 e8 de 6e ff 67 46 fc ca 5d 8d 83 94 ed da a1 51 90 dc c7 56 97 bd fe
 00000080: 63 1d a8 7a d2 da a1 7e ef f9 6f ce 4f b5 76 5a 3d 70 35 66 2f aa 95 7d 89 30 43 33 66 87 b4 a0
 000000a0: 58 3c 3a 58 2d 36 6d ab 36 77 ca 93 5d ab 8e 1b 33 aa 22 71 8f 73 5f 27 0d 0d eb 0c 24 d4 59 80
 000000c0: 03 68 7d d4 a5 89 e2 48 68 48 da 42 b3 46 10 b6 a8 c6 19 58 8d f7 5a ec 87 05 7c 88 7e 7b 82 37
 000000e0: 59 f1 6b 5f de 57 e6 2e 9f fe b4 76 f6 34 e8 e5 8c 77 3a 1d 9e f5 0c 75 51 e5 0e 43 48 48 61 6c
 00000100: a9 09 52 86 28 a3 a3 d6 f8 2e 40 e6 4c b1 8d 1a 12 c8 e7 00 d8 3a 77 c1 c4 be ca 55 68 88 46 bc
 00000120: b5 0d 6c 38 79 fb df ec 9f b2 02 56 c9 38 77 a2 14 36 66 b8 39 76 de 40 5e 0e 33 a2 fe 46 63 db
 00000140: 0c d5 ed 7a 6a 7a bd bf c6 68 24 64 03 5e 10 08 18 ad c3 a6 0d 11 53 fc 37 82 b9 dd 7c 04 d3 a6
 00000160: af f6 59 df 57 e6 8b 1f 9e e9 eb c0 b3 28 cd bb 26 39 67 62 f3 b7 2a 87 90 06 12 2e 83 c2 ed 7a
 00000180: ad a0 c4 f1 40 f7 97 4a 87 44 a5 ef 63 48 da 1a 66 08 90 c7 97 d9 8c c5 f1 fe 4f 0a 30 3a bd 7b
 000001a0: 68 04 9c ec 66 a1 ca 51 30 5a 75 55 da 71 2a 9d a7 76 28 9d 09 5a 9e 89 54 ca 87 02 82 66 90 84
 000001c0: 55 ab 41 89 1a c9 82 43 01 bc 18 7b 15 df c2 26 89 75 3a 8a b0 51 da 80 40 f6 77 ee 4d d3 55 66
 000001e0: ab 46 13 bc 7c 01 93 31 b3 2d d0 25 75 31 f9 cc 27 ea 0b 43 bd ee 04 9a a0 e5 25 86 c9 44 f2 8f
 00000200: a0 90 9f 33 45 4b 70 b8 bb ce 21 58 fa 77 27 c1 fd e9 0f eb 52 68 3d 77 af 47 9a ad a9 23 6d 80
 00000220: 55 a9 cf 97 f3 1e 9c 95 33 39 59 4a c9 9e e3 e4 71 9d f3 37 53 c5 e5 f0 69 2a 84 51 3c 34 43 ef
 00000240: 18 6d aa a2 0b ea a2 3f 3f 1f c5 f8 ed bb d7 2c 9f 96 93 31 59 2c 12 04 ce 05 a0 13 6c 98 8e 7f
 00000260: f4 2b 82 ee d0 88 76 53 af a4 dc a8 93 d1 96 32 a8 38 c3 e4 c0 84 15 d9 f0 c1 51 64 8f 50 74 40
 00000280: 61 28 ce db 8d fc b8 9f 76 a8 29 49 f8 18 84 de fc 7a 7c e6 75 bb 06 08 ba 61 fb c6 81 1d a8 88
 000002a0: 7e d8 69 c4 c0 ed 3c 52 ac 5c ca da 34 74 9d 21 93 f6 0c 66 65 14 70 92 be 65 95 a4 45 77 71 c3
 000002c0: b4 f8 7d 83 30 96 ea 26 b2 eb be 1e dd cc dd 10 44 5e 5a 5b f5 53 b4 62 93 28 e3 1b 32 bc ff 24
 000002e0: 2a 3c e0 09 2d 81 4b 52 8d ce 27 d4 69 d0 7f f3 de 92 3b 6c 46 ca 97 ed 4a ad 1b 30 af d4 29 3e
 00000300: ff a7 07 66 e9 68 c1 c7 24 14 fa 8f 95 dc 87 32 39 1c 6f 49 cc 19 d8 97 3c 08 3c 9d 99 28 9d 0e
 00000320: 5a 30 6b d7 44 7b 01 50 7c 67 fe 5e b3 7f b5 3b 81 84 d9 1a 27 12 3d 99 fd 3a 3f 1a 69 18 b7 4d
 00000340: 3d 19 1e b3 09 1f 53 08 d0 10 7c d1 57 d7 70 ea 57 5f 5e 60 7c 7c 1f f2 72 bd 52 54 97 af df b6
 00000360: 59 5b c7 1c 70 9d 0b 11 8b a1 20 81 db fe e2 58 4f d5 f1 e4 52 3e 8a 41 30 0f 8b 81 bd b5 dc 1c
 00000380: 85 29 51 1d 2d 12 15 ad 13 30 5e 86 e4 f6 40 ea 97 7b 0c b6 0c b5 d5 c3 b3 5d 27 b7 ae 61 18 10
 000003a0: a9 22 6b 07 f4 de 89 2f 3c 5a f1 ad e5 ae cf 0e d3 be 68 43 53 a7 76 f5 9a 3d b9 41 c6 26 89 2c
 000003c0: 08 62 f2 29 30 b4 59 ff 8b d8 12 9c 11 7f 8b 3b 78 c6 f1 3c 2d 77 0e ad 44 52 eb 90 6d d3 b2 fa
 000003e0: 31 5c 16 2f 5c a9 c5 57 a9 55 06 77 0a c0 5e ce 90 81 b2 05 fa 6b 36 c5 10 0b e1 5b 35 19 85 6b
 00000400: d9 79 53 ff ac 87 df 1f cc d4 7a 10 29 08 2d 58 02 b6 40 41 0f 62 17 5a a7 06 f3 62 88 37 79 da
 00000420: 97 8f 1d 0a 58 83 99 f3 0a d1 b1 f7 ca 20 28 a8 9e 61 77 3a 8f 8d b9 53 f8 f7 61 0d d8 c9 f7 1e
 00000440: 72 e1 59 91 00 64 38 cb 43 b5 5d f8 e3 3f 44 f6 b6 08 cf c7 22 c8 2b 5b 5b 3c 29 09 45 08 f8 0a
 00000460: 5d 31 01 a2 99 84 40 0d 0a 7a 74 a0 7e 54 c4 59 31 f5 84 0a 3c 89 c4 d7 62 fb f9 8f e1 25 ed 2c
 00000480: 81 c4 cc 49 6b c6 96 1c 4b 0f 42 69 8b f5 18 f8 17 d2 c6 eb 45 af ea 41 6e cf ec 0c 0e c2 17 be
 000004a0: d0 98 82 2d 2b d8 3c 63 ac 55 6d 59 62 db 4d b8 6f 7c b3 2c 5f f6 4d 15 68 df 22 cd 0d 80 fe f4
 000004c0: 53 f0 3e 92 a3 6f d5 a4 c4 d4 f2 ed 5b d5 73 70 6a ef 30 59 e4 e4 a1 40 a4 71 5f 69 bf 61 16 76
 000004e0: cb 74 82 3c 74 72 9c 78 7b 37 fa 96 85 63 e0 f2 5e 99 80 0b 06 67 a0 2c 4f 91 4c b1 f0 10 f8 55
 00000500: 8b 6c 85 99 a2 1a c5 1a c3 ae 15 4d 15 76 71 eb c2 7e 99 6b 79 b8 ef 31 53 12 de bd e3 f3 57 4a
 00000520: ea e0 f6 3b e5 22 a8 9b da 32 db 8e 70 73 58 24 b9 fa bf 25 ed da 3f 02 a2 51 ac df c4 d0 7c b4
 00000540: 90 0b 92 16 b9 63 5c 97 2b b3 2b d3 52 ad bd 6b c7 90 9f dc f2 c0 29 57 f3 fc 84 d7 bf 43 0d ee
 00000560: 3b e7 c0 c7 76 1d 68 97 ca 21 f1 7b 1e f6 10 dc 57 fa c1 4b 88 15 73 40 42 f6 66 f4 29 39 05 bb
 00000580: 0a 5d 03 5d bb a2 c9 09 30 4f 51 50 4b 35 67 a7 33 1e 4c e5 1a 71 42 9c c4 b3 41 f0 60 c6 9f 6d
 000005a0: ab 9f c1 b1 01 cb 3b 20 ec 38 27 e1 ed 0b bb c8 07 be f7 74 8b ee 9b 0b ea 03 bf e1 00 04 19 cc
 000005c0: 4a 48 be 56 05 04 28 da db 1d aa 19 fc a4 2f ac 3c cf ef b0 a3 b7 60 59 87 b5 99 af 03 8c 30 d4
 000005e0: 81 92 b0 36 b0 2e 22 b5 7c f6 d5 ad 28 01 1b 0c 04 42 47 98 be e1 b1 ef 70 8a 60 da 0a d5 46 b8
 00000600: c8 f2 9c d0 d2 dd 53 e1 56 b6 e5 90 48 bd 3a d4 70 04 1d 38 df 67 e7 b7 f7 75 07 aa 89 b4 3e d0
 00000620: 5e 98 0b 1b 56 c7 dd 1f 88 91 75 02 8b e4 7b 88 53 2e 19 25 4a 25 c2 a2 14 71 68 7c 93 9a cb 85
 00000640: 9f 10 b2 e1 2f 0f 3a 8b dd 86 29 91 e9 70 38 5d 43 d5 9e f7 b4 66 de 44 08 81 6d c6 a5 8d 25 a6
 00000660: 90 db bb 62 27 d1 7a c5 c4 de d9 e3 80 09 de 6e cb 8e 97 f1 63 57 25 de 90 a3 7c 07 52 24 98 e6
 00000680: a6 48 06 2d 71 b8 6f 0f 30 c8 01 95 d1 92 c5 d1 27 11 71 18 5a c4 1f 11 ed c0 c0 93 df e6 15 cd
 000006a0: 73 b6 fc df 1c 63 2e 4f 60 32 08 a7 ec c8 f7 e5 88 23 6b 31 f3 a2 8e 89 67 0f fb 20 de 1d 1d 2d
 000006c0: 74 00 d7 2b 26 ac b8 06 3c ca a6 39 02 37 16 6a e7 12 e4 3a 24 61 3d b4 0b ab 92 0f b1 62 69 03
 000006e0: 99 64 92 5a e7 71 2c 52 8f 63 e2 12 d1 24 a9 8b 81 a1 6a 9c 32 45 29 cc 82 ba f5 49 86 70 29 08
 00000700: d0 86 f1 74 77 2f b2 b8 16 eb 05 d5 04 38 41 38 76 ae b9 14 6e 6e 93 16 c8 ef 6d b5 c4 74 9c 15
 00000720: 2d 4d 92 ce ee 08 0f 91 6e ac bf 72 0b 6a d9 5d 0d 6c 1e 06 9e f0 03 ae c5 2f 66 a2 01 28 10 8f
 00000740: c9 4a 84 70 3b c3 96 dd eb 00 8f b9 99 f3 15 e9 eb 4e b5 9a ae 27 01 f2 f2 c5 38 4f 5d c4 22 93
 00000760: c2 3d 57 7f 8e b3 38 5b d0 92 7e 2e fc 4d 8d f8 12 2d 14 d8 c9 1f f0 5e b2 42 fa 9d 9c 05 5f 77
 00000780: 24 a3 48 b7 f8 f7 80 4e 44 fc 0e 30 83 98 de aa 52 50 62 bb df 13 d2 83 62 b4 6c ef 2d cb a2 9e
 000007a0: ad 62 ff 93 af 30 a1 ac cf 36 a3 78 ec d9 8f 7d 7d d1 2a 85 75 78 90 f9 70 10 2e 70 d2 2d 26 e8
 000007c0: c7 b9 f9 52 9e 7d 10 27 8f 95 5a 4f 5d 2b 84 a4 18 be b7 ee a1 70 8d f1 17 12 1f 40 01 86 a3 38
 000007e0: b7 0a 85 50 a0 b8 a0 6d a8 79 96 cb 58 5d 81 da 77 67 d6 61 15 b2 06 77 61 e0 39 0a 7f 1a 9a 5a
 00000800: f9 a9 5f 89 bf 08 19 de 5e d6 a5 f4 cd 8e b4 ec 61 20 c1 39 be 3b fd 97 8b c7 24 a4 fc 77 d6 7a
 00000820: 35 d6 28 4c 78 70 54 a3 af 8b 06 7c 3e 96 2e 02 6e 65 5b 36 d3 57 fa 61 aa 15 71 95 a1 4d 0e 9f
 00000840: 02 7d cf 86 c9 0d 14 e6 9f d9 57 d8 67 ce c6 2d 66 f6 04 20 99 68 6e dc f1 90 19 86 fd 98 cc e7
 00000860: c1 39 d2 a4 13 3c ed 88 07 26 ee d1 d9 af 1f 71 34 bc b1 0e 67 88 31 11 9a 4b 4d f5 37 37 b3 cd
 00000880: 3b a5 ba 7e a2 c1 80 42 93 6b 6e 33 c8 72 0b 11 81 27 91 9a 4a 88 3c 57 d4 9f 53 9c d1 3e b1 bb
 000008a0: fc fc 28 f6 4c f2 4e ce d3 8f bb 95 63 aa 94 14 0f 89 e4 13 c4 ca d3 09 8b 76 cb 4f b2 43 dd d1
 000008c0: 6c 53 62 68 ce b9 1f e6 5f dc da 7a 3d ec c4 46 ad 18 b0 df 3e d6 3f 4d 6f 00 9c 73 fa a4 1e f2
 000008e0: d2 e9 74 e1 d4 6a 42 8d ec 67 4d 9a 68 9d af 33 38 54 69 99 eb d8 db 2b d2 e5 8d a1 70 8c cb 6a
 00000900: cf 5a e8 85 e6 68 9b 71 56 1f 29 24 9f 81 74 ad 5f 1b e4 a6 e8 d2 13 8d 2f 8f 11 3f 65 e6 4a 8d
 00000920: ff cb f8 79 8c 8b 2e 1b 4d 7c d0 19 4d 1c 58 e2 2a 96 b0 89 55 69 e2 9f 29 d1 e1 b0 e9 7a a2 6c
 00000940: b2 03 08 64 1c af c4 a7 4c ac b4 30 b2 54 8a de 53 aa e3 fa 70 cd 5d d1 44 71 66 70 ad 25 d4 13
 00000960: b7 30 67 cd 7e e3 37 6b be ef f0 26 f0 e4 e1 74 e3 57 9e e9 5f a2 8f ba c6 7c 71 18 1c 07 f0 67
 00000980: 7b c0 a9 fe f2 49 dc e8 e3 ef b4 7c 63 06 9e d6 72 bc fd 3b e0 82 75 a3 a2 7d fa a1 0c d4 f3 58
 000009a0: 92 8a 07 a5 7d 98 00 e2 44 37 34 b3 84 bd 11 49 4a 7e 5a 3e de b9 ef 51 82 d5 f0 26 b0 cb d9 e2
 000009c0: 12 57 8c a5 17 8e 56 3c e2 b8 6a 50 35 c2 5c ef 76 5a 43 86 75 c5 03 0f 98 3e 85 e3 94 77 49 83
 000009e0: 71 e2 56 7b f0 e4 f8 ba dc 8b 71 b4 dd 3c fe 6a ee dc ab 52 73 a1 7d fa 31 e2 e7 f0 d6 c3 90 cd
 00000a00: 7b a1 da ad 36 88 c2 ae 0a d8 c3 61 50 29 df 5f 8d 21 88 d3 16 79 39 d5 ed a6 b8 03 53 d1 b7 d4
 00000a20: 90 67 a1 4a 77 f3 c8 05 2f c2 d2 de 8b 2d 4c a6 4c f9 6f 25 5b 00 71 de 65 56 63 97 38 02 86 b6
 00000a40: 52 d4 bc 58 33 40 c5 89 25 66 ab 0b f5 4f ee a2 50 3e 93 d8 47 63 0d a8 6d 12 18 b0 f6 69 81 b5
 00000a60: 6e cd 02 f3 21 f6 87 40 35 11 21 2d cb 7f 85 73 35 8a fa dc 7a a5 28 37 3d f7 23 da 11 e1 1b 03
 00000a80: c9 c0 da 04 fb de 16 f8 a6 b9 a5 2d d5 ae b0 85 59 a2 cc 9c 42 cf 35 1b 10 f0 f8 34 9d 68 79 59
 00000aa0: 49 81 d7 90 be c5 62 0e d7 8f 4d 02 50 de 41 27 30 82 e4 2e 57 b5 df 90 7e 0c 7a 08 91 8f d2 2d
 00000ac0: 2a f2 d2 fa e4 41 c0 76 6a 38 4f fd 46 d3 4c cc 2b 65 48 59 03 0a a8 d2 67 2c 05 38 ba 6f 5c 1b
 00000ae0: 4f 44 c9 c0 d6 ea 2e e4 db 94 db 48 a5 b7 2c 7a 47 dc ec d8 cd 66 2c c4 8f 45 68 57 01 f7 13 d7
 00000b00: fa 58 c3 e0 7e 17 03 cd 3e 4b f2 fa a3 13 aa e5 10 a6 a6 5b c4 ae 0f 5b 4b 81 56 d6 7b f3 9d 73
 00000b20: 5c 01 af f7 b4 af 85 b8 b8 28 10 28 c9 fc af 1a 6f 41 3b f5 7d 7c 2b 8b f4 ae 25 77 39 eb 10 c6
 00000b40: 9c 31 ad 9f 93 dd 7e 59 f3 91 b9 ae 35 ae 8d 49 4a e2 18 5e c0 14 8f 9b c6 35 20 c1 dc 48 8e ef
 00000b60: 13 53 03 cb 5d ed 7d 5a c4 30 bf 15 e7 10 6d 49 09 58 87 3a 62 80 8d 8e 60 1e 4d 2e d5 b1 fa a3
 00000b80: 78 1d 0e ab 2e 2b 90 86 77 8a 74 de 38 7b 99 e8 56 31 78 6a ec f2 5b c5 76 a2 09 51 a1 26 b7 a0
 00000ba0: 19 73 d7 ad 69 88 bb 51 69 ea 8d b7 eb 00 a5 51 96 c6 a6 6f bc 98 84 44 62 01 e6 ec f7 ca b1 95
 00000bc0: 22 ae 51 5a 19 f2 39 1f 3d f2 2a 61 4c a8 a6 d4 5c dc df e5 a4 91 f2 95 6e e7 e8 2c 54 84 8a f1
 00000be0: be a8 2d 7c 80 87 fc d6 8a dd 95 b7 28 a6 05 40 72 08 24 f6 e2 7f c5 af 04 9b 63 ba 2e 4e 76 8e
 00000c00: 3e 69 05 9e 0a 87 4d 83 29 1e 58 10 ee b3 8d 97 2d 6e df b2 12 c6 e5 8a b8 4d 55 67 3a a8 99 d6
 00000c20: 91 a5 c0 2f a8 ea 2c 37 ac 17 14 be 24 38 06 82 28 d9 30 29 f1 fe 67 a8 b7 24 73 74 50 08 6a ce
 00000c40: 8a 50 ed 35 a6 0c ae 18 6d 6e 55 ab 48 7c 55 55 f2 bc 3c 9e ff 68 9a 0d 8b 40 72 d7 de 1f 64 0e
 00000c60: 29 20 e0 f4 51 61 89 0c c9 8d 3d 2b de ff bb 79 ad f0 e2 e2 86 74 35 80 7e 54 f1 8c 8e 20 96 7d
 00000c80: 78 e1 c8 54 b3 dc c2 5d 5c de a7 08 c6 5b ee 95 48 71 b9 60 87 e4 a6 92 0d a6 67 37 93 d3 eb 0f
 00000ca0: 31 6d 72 70 4d d2 b7 60 75 e1 77 34 3d 23 df ad ca 43 b1 f4 40 83 1a e0 8a bb 35 47 2b 21 48 6e
 00000cc0: 4e 13 76 ab 4d 62 46 a8 fe 6b 19 8a 8d 00 b6 cc 4c dc 8b 24 95 de 21 be 87 6d 06 0b 25 e9 6b ec
 00000ce0: b9 72 ef a9 42 0e 33 fe 92 04 d5 56 fd 9d 3a 08 90 f9 a1 77 4e 85 dc 73 b1 2b 14 e4 9c 8b 32 dc
 00000d00: be 97 b1 2b f0 30 43 72 c9 71 87 d5 76 29 22 f3 a0 e1 36 22 36 d0 e6 3e 53 85 03 42 36 82 9d 69
 00000d20: 2e a9 ec 3e 44 b7 5e dd 7b f5 8a 36 ab 37 14 06 5d 00 32 65 d5 b4 8d 66 95 a6 5b 09 ec 70 6b cc
 00000d40: 4f 50 28 11 94 93 c9 2f dd f4 1d 9c 84 b4 49 d4 1c 36 d7 e0 5c 56 bd 71 ad dd 3b 8e e6 a8 93 21
 00000d60: df ad 81 41 3d 80 cc 11 85 a9 cc 17 3f 47 d0 57 ce 98 bd b5 ad 0b 22 27 02 9c 35 da af 8d 0e 31
 00000d80: b1 20 53 ac ee 0d b2 19 6f 4b f6 1c aa 36 84 80 c0 bc 15 d1 63 8d 38 f1 25 77 b5 3b a7 94 6d bc
 00000da0: f4 3f 98 ba 02 21 d8 6a d5 f7 3b d4 a8 6e e3 86 a0 2b 6c 35 10 94 13 14 ff 5b 41 45 3b 7b 70 cb
 00000dc0: 0f 18 14 b4 53 06 fc 89 b1 f4 9c 6b f1 53 ca e1 4a 96 28 0b 04 f3 ce 97 67 3b fc 40 96 00 a1 ed
 00000de0: 39 19 2a ce 88 e1 8c 90 86 11 84 2d 7a fb 1f 81 e0 d9 be 10 6f b0 9f b2 88 1c 2b 64 9b d8 f0 f3
 00000e00: 05 fd 28 aa fa 48 57 b6 0d d0 8f 1d a4 34 8a 13 71 ae 85 46 23 9a 8c 8f 30 3f 8f 8f 24 f6 da 27
 00000e20: a8 63 5d a9 99 f3 1d a3 13 12 71 9c f1 ca 89 0c e3 52 09 1c dc d9 4b bd f6 fd b1 96 5d 5a 63 93
 00000e40: d7 d1 86 a6 86 ed 38 36 9e 5b 18 46 2e 22 2e b9 e7 22 ac 69 69 ea 0e c6 19 74 1e 9b a6 56 50 f6
 00000e60: ea 57 6e 76 b1 d6 bb af 4b 13 ba 25 cb 98 fc c0 18 3c 68 aa dd d3 56 65 f7 bd 83 45 20 01 2b 9a
 00000e80: 2a ad f8 d8 cd 3b 2f f3 1a ab 84 de ae 3b 5d e1 d9 73 b6 3b 43 e2 b6 49 f6 2d 48 39 09 b2 28 eb
 00000ea0: f2 b7 d2 a3 f9 49 7b 44 35 3b 88 af 6d e1 db 9a 1b 28 df 17 a4 12 30 e4 c4 45 4f 05 ad 7f ef da
 00000ec0: 38 46 72 0e 8c 75 a3 57 d9 2e 54 db 22 62 5b 65 23 00 48 16 85 3d de 9c 57 60 cf 2c 0b e5 81 0f
 00000ee0: 45 9e f9 8d 15 4d 8a 76 4c c7 f5 4f cf ba 0d 38 fa 18 6c 37 12 4d fd a6 66 0b fa 14 61 d4 85 ea
 00000f00: 93 92 91 72 3e dc 33 42 b2 e9 23 d0 19 6a c9 8d db 7a 15 c5 eb 5e e9 17 6f d5 14 35 62 2f 05 a0
 00000f20: 2c 20 c6 17 b5 6b 82 9c 99 70 33 00 6c 9e 91 ec 9c 6e ad 0d f3 4e de aa 79 a5 ec 16 4e b8 f7 5e
 00000f40: 0a ee 71 09 60 08 ae 04 a2 ac cc bf cf af fb c2 7d 8e 66 ff 1b 2e 10 83 32 a7 b9 60 0d 88 2c 4f
 00000f60: 41 72 14 bd b1 fe 22 72 4d f2 9f f7 68 1b 55 7f 8d 08 01 2e de 16 be d7 61 28 b7 07 d4 ed 48 39
 00000f80: 13 a3 af c2 ce 29 fb 2f 6c 98 ea ab 23 c7 bd 13 89 2d 8b f6 5f 5f f0 47 a5 3a 63 37 e8 c9 8a f9
 00000fa0: b9 69 de 8f bb 80 6b 7c 50 23 e9 13 c7 91 75 20 22 84 92 d9 87 38 9e b1 16 f9 3c 55 0d a3 d1 1b
 00000fc0: 9e 1d 3f 34 1f 40 29 b8 d1 f7 ea 2e 76 6a c1 fb 25 70 26 70 0f 7c 22 92 21 e6 36 38 b1 b7 2c d7
 00000fe0: d3 d5 2c 58 8b 3e d4 d2 9b 3e e1 50 15 b4 0f a8 8b 9b c7 00 ef 4c ba fa 94 d1 1a d3 a5 a2 72 4b
CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Workqueue: writeback wb_workfn (flush-ubifs_0_8)
[<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
[<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
[<c0970798>] (dump_stack) from [<c03d14f8>] (ubifs_wbuf_write_nolock+0x6a4/0x74c)
[<c03d14f8>] (ubifs_wbuf_write_nolock) from [<c03c39f4>] (ubifs_jnl_write_data+0x1b8/0x2b4)
[<c03c39f4>] (ubifs_jnl_write_data) from [<c03c7060>] (do_writepage+0x1a4/0x244)
[<c03c7060>] (do_writepage) from [<c022c15c>] (__writepage+0x14/0x68)
[<c022c15c>] (__writepage) from [<c022ce38>] (write_cache_pages+0x1e4/0x3e8)
[<c022ce38>] (write_cache_pages) from [<c022ef04>] (do_writepages+0xa4/0xdc)
[<c022ef04>] (do_writepages) from [<c02ca69c>] (__writeback_single_inode+0x2c/0x1b4)
[<c02ca69c>] (__writeback_single_inode) from [<c02cad20>] (writeback_sb_inodes+0x200/0x470)
[<c02cad20>] (writeback_sb_inodes) from [<c02cafcc>] (__writeback_inodes_wb+0x3c/0xf4)
[<c02cafcc>] (__writeback_inodes_wb) from [<c02cb230>] (wb_writeback+0x1ac/0x20c)
[<c02cb230>] (wb_writeback) from [<c02cc2b0>] (wb_workfn+0x2c0/0x3d4)
[<c02cc2b0>] (wb_workfn) from [<c013a7e8>] (process_one_work+0x1dc/0x438)
[<c013a7e8>] (process_one_work) from [<c013aa8c>] (worker_thread+0x48/0x598)
[<c013aa8c>] (worker_thread) from [<c014074c>] (kthread+0x12c/0x140)
[<c014074c>] (kthread) from [<c0100170>] (ret_from_fork+0x14/0x24)
Exception stack(0xc26affb0 to 0xc26afff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
(pid 69) start dumping LEB 166
ubi0 warning: ubi_io_read: error -16 while reading 253952 bytes from PEB 544:8192, read only 0 bytes, retry
UBIFS error (ubi0:8 pid 69): ubifs_check_node: bad CRC: calculated 0x20247491, read 0x81e4f43c
UBIFS error (ubi0:8 pid 69): ubifs_check_node: bad node at LEB 166:41440
 magic          0x6101831
 crc            0x81e4f43c
 node_type      1 (data node)
 group_type     0 (no node group)
 sqnum          453447
 len            4144
 key            (821, data, 10960)
 size           4096
 compr_typ      0
 data size      4096
 data (length = 4096):
 00000000: 59 71 35 f4 cc bd 4d 80 d0 41 a3 f7 22 aa 70 ac 43 a3 2c 68 22 88 82 89 7e 6a 00 1d fe b4 97 e1
 00000020: 96 8f 33 63 d9 d4 ad 8b cd 1e 48 bb fb 3f cb 55 e7 e0 4b 11 e3 fa cf 26 06 2b 24 ec 12 e8 3d 36
 00000040: 63 19 cd 29 3c c2 7a 69 84 7e 88 5c 19 71 24 12 a7 f6 f8 ad db 29 8a d2 a4 a8 89 a7 09 22 f6 db
 00000060: 3c 16 1b f5 b9 89 ce 85 f2 d0 e4 d2 7c 33 e3 bb c4 b3 6a dc 2a a1 73 35 9a a0 30 d1 bc 35 21 37
 00000080: 78 f4 07 45 35 81 0d ad 21 8c 21 00 39 ec 58 04 2c 65 5d 73 03 62 af 89 7c d2 42 66 ad 34 37 1a
 000000a0: 7b 91 5c 2f 5e c1 f0 55 9e 57 62 7d b6 5c ef 1a 45 7c bd ea 66 5c 05 18 04 92 36 c7 1b dd eb d1
 000000c0: de 84 5c c6 40 bd 48 d2 07 99 cb c8 21 62 da 4c cb b8 13 9f 41 ba eb 1a a8 fa 96 ac eb 4a 14 8a
 000000e0: 06 76 da 19 b1 8d 4d 86 98 3c 03 0a 84 c9 d5 41 f0 91 ce 7a 0e 65 b2 d7 f8 28 f0 f9 f9 12 49 20
 00000100: 60 35 d0 ce 85 f2 a6 fc 6f 3b c6 09 50 1e 3f 89 ce 81 b9 92 b0 3d 4a 6c 35 39 bf 7b 21 2b f9 ba
 00000120: 22 68 0d c7 41 d5 4b 14 ea 53 dc c6 fa 73 82 34 cb 55 e7 f7 06 69 96 06 b3 ab 5e 56 ce af 9b d4
 00000140: 34 73 56 5f cb 87 f2 5f 8d e3 c8 65 1a fe 43 0e 0e 73 3d 1d 7c af 8e e2 34 a1 6f 9e 4c 74 2a 78
 00000160: 6f a1 8d 8f 89 69 2a 4d a7 a1 37 3d fc d7 04 cc be a5 91 34 70 34 3e ff 0f 6a a6 13 6b bf e6 df
 00000180: 86 cb e7 c3 60 7b 22 c1 7f f8 b5 ee 10 2a 9e 9e 39 aa 01 71 e5 11 48 b0 6a 45 a2 e8 73 30 79 f9
 000001a0: e0 21 57 a2 3e 31 5c 8f b7 b8 24 d6 56 c6 e7 77 92 f4 d0 94 7e c0 5f 24 77 0e dc 31 50 fb 33 08
 000001c0: e6 c8 d2 3e 1b 15 b5 c0 ca cb 45 ee 52 d3 a1 d1 bb 6b 93 83 3f ba 6b d4 ed 15 1d 00 6d f3 0d 21
 000001e0: 35 63 d7 bc ad ec 1c ba 44 21 47 69 ea 22 ff c2 52 91 38 1a ee 80 bf ee 29 0d 68 a7 ba e3 72 65
 00000200: da a4 5a e4 b2 61 dc b3 b6 74 28 5a c2 42 81 3c b9 19 5c 68 f4 d8 00 29 11 66 9c 82 3c 4c 56 ff
 00000220: d4 7e a3 1f f8 5b a4 95 1e b9 5f ac 79 23 0b 4c 47 76 82 28 d2 18 c0 00 2d b8 0a e6 e0 cf 2c af
 00000240: c6 51 aa ad fb 6e 63 ed 84 6c e1 5f 32 b2 de 37 b9 7a 2a 2d 12 bb 9d 33 46 4e 68 83 7e 76 a4 d1
 00000260: 57 3d 6c c6 7c 27 51 50 e4 99 03 76 ca 69 57 bc ae ec 2f b9 5f 8b 1a 35 43 18 72 c0 d5 4e 7d ed
 00000280: 5e 5d 1a ec 06 20 9b 58 d0 42 ac c4 fa 12 f9 27 75 a7 6e 2f 4b 7f 8d 5e 7e cf 3b fd ca 9a 79 53
 000002a0: 94 50 92 b4 98 f8 96 f3 fe 4d 82 84 5a 8e 37 ef 78 11 a6 6b c4 e4 30 f2 da 55 ea 88 8e 27 46 8e
 000002c0: 20 e8 fa be 5e 19 e4 a0 83 0b e0 e6 73 11 c0 f8 b8 5d f2 2a 57 c7 4e 46 e5 15 93 91 44 52 b6 c6
 000002e0: c6 f0 5a ba 42 b8 bf 9d b8 56 e8 4d 4f db 6b 26 5c 4f ef 0a 7d 7b cb a6 b2 3d 95 a4 1a fd 3e 77
 00000300: 0d 96 01 36 38 12 b1 1c ab a4 07 6a 92 41 8c 62 93 f0 98 ee 77 b5 31 7a 5f 4c ae 23 fb 32 9f eb
 00000320: f9 cf 3b 64 4b 8d b5 7f d9 6c a8 62 f5 20 74 4b 2a 3d 68 e1 21 72 b6 47 40 f9 58 fe 1f f7 39 37
 00000340: cb 21 29 4c d0 b2 fa 25 b7 cb 30 0a cd 95 6f 60 6a 75 2a ce 53 1d c1 95 dd d2 f9 da db c0 27 f2
 00000360: 35 3d e0 ef bd 0a 67 85 f7 1c 8a 43 f8 2d fd ca 0c 32 23 09 1d 01 13 1c bf 62 61 e1 83 3f 66 5d
 00000380: e0 be 04 03 8f 71 7b 22 40 73 db 99 c5 25 36 47 19 c3 3c f5 c7 11 b4 06 1d da d1 4d e5 ae cf 5e
 000003a0: b8 ae 4d 9a 2a fb ae 23 60 24 5b ad 83 95 80 75 de db 1b 15 71 ed 9f 91 2f 70 c3 ab fa bc b0 33
 000003c0: f8 8b 96 e5 2d fc 57 ef 85 bb 58 de c5 f1 2b 2c 58 55 1e da 85 b6 08 f9 06 28 8d 5f d8 3c 6e 78
 000003e0: 73 17 79 a0 7f 16 6b f7 03 ce 60 aa a3 d6 8c 90 32 54 3b 7d 7d 07 96 fd 2c b2 32 dc a8 a2 51 06
 00000400: 25 be 52 9a b1 1f e2 4b 38 92 a8 9f a8 2f 3c 21 b7 0a 91 6f c5 b1 95 c5 c9 1e 6c 4a 34 8a 4c 47
 00000420: 9a 02 58 c4 42 e2 6d 56 d7 46 f1 88 7c 27 48 8e e2 a8 70 08 f3 12 18 33 73 6a 62 73 77 55 26 3f
 00000440: 12 8e f9 53 d1 53 19 df 72 7a 8a ef 12 0b 78 39 90 b3 fe f4 8c d9 ab ee 27 14 0f 7c 2f 78 9d 83
 00000460: ce 87 62 bb 59 99 47 35 a4 01 db 59 fa 4a e5 c7 a6 5b 5b 8d 5e 0d 01 df 57 a7 a9 0f 55 c5 21 fe
 00000480: 86 25 c5 98 21 26 6a 81 36 5a 29 7d 87 42 bf 3a 8d 20 01 5b 41 15 45 68 7a cf c3 80 d2 63 9a 3e
 000004a0: 31 80 bd 8e 50 04 c1 71 d4 c7 f6 d1 66 ab ea 56 ca c2 7c 61 fe af 52 e2 16 59 d5 f3 71 1f 7b 64
 000004c0: 85 0d dc ad 8a 46 5a 3a 5c c9 73 a7 d4 4b e9 25 0d 34 91 5b 3f 1e a3 b2 67 f0 e8 e5 0c 33 59 e0
 000004e0: ad 54 e1 d4 a5 ee 37 6d 8a 0b aa d1 29 43 00 0f 28 8d f0 58 46 63 2c 21 a5 68 c7 51 ed 28 b1 97
 00000500: 24 98 ec 72 cd f5 d2 24 98 42 6c 26 6c 06 ea 4b bf 65 66 62 be 77 79 0c c3 eb 52 5b 71 bb f6 4a
 00000520: b1 cc 89 65 53 08 39 10 25 9e 45 f2 65 fb bb 61 d9 21 41 ae c3 5e 5e a2 ee 16 5d 69 99 9b ca 6b
 00000540: 15 69 9d 2d 0c 25 ad 6b 00 3d 19 8e 96 8f fb 2c 0e 15 8b 11 f5 81 91 bc 0d f9 c8 dc ed c7 28 b5
 00000560: 58 e9 44 b1 6c c4 98 4e 8e 74 d7 b4 6e 1e 78 04 a2 54 74 4d b6 8d d1 99 b7 31 48 30 67 75 f5 53
 00000580: 41 30 5e 4b 02 3d ce 69 95 de 1b 00 fb 07 eb 68 e9 d1 a3 18 64 f1 69 00 78 28 92 e0 54 af c9 89
 000005a0: 67 5e a4 03 ab 04 e7 6f e1 32 5a c0 5a 92 77 8c 32 01 c0 1d 8d e4 48 a6 f5 48 f1 06 f8 55 7d 4f
 000005c0: 81 b6 96 fd a5 0e d5 ea cf 11 21 4a 3a 5a b5 e5 45 ff 39 d1 ba 80 06 90 3b db eb 40 47 fb 8c 41
 000005e0: ac 0d c8 a5 11 f6 bd 3b 96 2a 50 8b ed 9d c3 4a 58 3b d3 11 56 7c f7 7b de ae 0b 71 f7 10 b1 f1
 00000600: de dc 2f 3f b0 47 28 fd 59 02 d9 16 8e 4c 13 11 1c 65 4e 72 a7 9a 75 2c c8 3d d1 2a 99 e4 52 76
 00000620: 3e 2f 80 b6 44 69 96 0f 98 c1 6e 26 f1 0f 71 f2 9a 30 8f 52 18 77 d2 da 1e e8 9a f5 5d 30 98 5f
 00000640: 51 f5 f8 89 30 f2 c3 a0 88 21 9c db 8f e0 34 55 0d d1 bd 76 e7 e0 25 b5 a1 8c ad 6d a3 c7 50 d0
 00000660: 9e bd be 99 0f 6e 2f 43 5e c3 82 aa e2 5b 1f cc f9 90 3a 37 ff 34 42 73 5a 80 10 61 e6 68 eb a8
 00000680: 60 70 db a7 b1 30 02 6e 62 47 ee e2 6d 2f 1e 3d 7c 50 8b a4 db 25 27 ea d6 88 9d a6 90 68 7f d4
 000006a0: 83 97 53 8f 47 e3 81 bc 9f 64 34 f4 b9 bd d8 68 d0 80 8e b3 1d 94 6f 87 b7 67 25 ea 36 1b 5c a1
 000006c0: 9d 61 a1 26 c4 dc 65 3a 19 29 88 6d 80 48 3e 2e 7a 7d e2 98 8b a9 31 eb 94 51 ad 67 22 60 92 33
 000006e0: 65 a2 a1 11 f8 b4 0d cd 7b ae 6e ee bb c7 8f 97 d4 b2 de 5b 1d 0e 93 e9 82 ba 05 eb 40 0d 81 ff
 00000700: ff 33 d7 ce 0d 86 69 3f fd 3e 7d c9 d0 ee e9 31 e5 5c 65 5c 9e 56 e2 70 03 10 60 0e a2 29 8b d5
 00000720: fe 45 78 b1 e0 fb d4 de 22 59 86 f8 3f 56 75 9e a4 d4 82 81 4c eb 19 4c b2 60 f9 5e 15 03 d6 72
 00000740: 7e d1 41 1a 4f c5 69 32 5e 63 05 8a fc 46 61 8e 68 c0 06 fd f5 9b ce 0e 38 8f 90 91 8a 78 9f ac
 00000760: 8e a9 74 b2 47 5b 87 89 07 9a 53 c3 1c 6d 56 9b 6e 43 22 6c 7b 03 2c 12 e0 05 84 1b a8 37 34 fc
 00000780: f1 07 82 84 19 97 d1 e4 4c fa 99 54 aa b2 ca e7 93 30 d8 f5 df a9 bf 49 f2 dd 94 40 06 2b 4d 6c
 000007a0: 9f d3 58 41 7d 56 c9 7f 06 8d 9a cf 0f 3e 9f f2 7d 72 b2 f5 d6 be 7a 0f 9c 67 6e 8e 66 66 92 28
 000007c0: 8e ab 42 3a 12 68 77 a2 7c 89 93 fc 53 09 96 7e 9b ca 93 e9 51 07 5e a8 0c 35 f8 22 e1 14 89 b9
 000007e0: 04 37 db 5c 8a b8 17 f0 e2 f1 eb 84 9a 4a aa 42 ba ff 7d 6f a4 7d f7 20 bd 96 c2 3f bb e5 d0 81
 00000800: a5 be 27 c7 fb a7 f0 c9 23 db fa b3 fd fb 6b 14 62 ee 47 29 80 5c bd 0f 56 51 6e a9 54 6e 91 5c
 00000820: 29 68 d4 22 25 ec c7 8b 08 a0 a7 c2 e8 72 2a f0 46 82 35 7a 47 74 51 e9 35 ae 9e 02 ca bf ab f1
 00000840: 6e 9d 45 c9 c4 d0 3c 7b 0f 97 24 df 97 df 10 41 fd 89 55 13 47 b7 83 11 f3 05 fd 43 21 58 43 85
 00000860: e3 0f 7f 2b f2 b3 6d 55 b0 25 51 62 d5 a3 07 75 de b6 5b d6 7c 4f d4 d3 92 dc 3a 49 93 df ab ae
 00000880: 58 81 d1 0e fc 45 0f fd a0 b7 f2 e4 ed c9 ba bf 6b b4 63 e2 ca df ae c0 9c 7a b8 a2 ca ef e0 31
 000008a0: 4c 88 a7 29 8e 58 29 79 ed 1e 90 ca e3 10 92 78 8a b8 0b f8 4b 6f 8f 53 46 92 10 f5 31 b4 23 fc
 000008c0: 5b 29 45 e1 a2 18 07 f9 64 23 1c 86 96 69 0d b8 50 e8 91 db ba 04 b6 17 42 15 96 1b 5c e7 9d 28
 000008e0: b3 ce a5 82 09 67 1a 3f ff 2d d2 f8 22 f7 0c ce 88 75 02 79 ad 31 9c af 4c f7 ea 68 57 4b a2 20
 00000900: 30 2b 3a b2 bd 12 2e 7b a3 7c 86 27 e5 0d 18 9b f5 69 a9 0f 02 13 41 e3 3d 99 90 e2 79 d3 71 9e
 00000920: 09 11 59 5e d4 c1 a5 77 9f 49 43 fd 43 ff 9b 06 a2 a7 0e 98 cb 68 ff 26 06 33 c3 52 3c ce c5 96
 00000940: 96 70 45 20 65 e0 44 bb 42 dc 62 58 45 ea dd 71 b4 83 dc 00 d5 6a f8 da 7a d4 cb 5b 71 ed 3f 61
 00000960: fc 33 bb e9 7c 24 fd af b7 46 a4 bd 3c 9b 97 9c 97 63 74 e3 af 2c ac b4 ff 9f 90 08 bb ba 0f c6
 00000980: 56 c6 73 ce b4 53 d3 25 aa 3d 5f cc 12 cc 8d 31 51 f0 02 cf 8b d6 44 89 08 46 47 99 d8 42 9c 6d
 000009a0: cf a7 f1 5f 2b a4 80 eb b9 4b fd d1 22 ef 7e 95 3f 66 b3 0c 80 e5 89 89 f7 5c 7c 71 a3 ca 9f 9e
 000009c0: 26 55 38 58 b5 95 6f 12 e7 8b d4 b2 98 64 3a 81 07 d9 2b ff cc 49 9e d1 4e cf 56 7c d9 6d 1e 8c
 000009e0: 75 93 38 21 f3 c4 3f a0 f4 fd 8d a6 93 92 1e bd 91 79 1f 40 cd 07 f7 0b cc b3 90 7b 10 bc ae 41
 00000a00: 38 01 a5 3b 8c 90 c5 b3 10 a3 c1 18 d6 59 51 99 bd 95 a6 11 ea 7b ed 04 22 a9 df f2 28 6e 49 ad
 00000a20: e0 e1 f2 87 75 46 94 1f 92 cc 4f 95 c8 72 e8 ac 0a 01 65 fc ee 08 6c cd e0 b1 75 c4 66 2e 27 6f
 00000a40: 8c e3 e2 e8 65 40 b3 14 37 56 23 e5 b2 e5 e5 3c a5 d5 d9 38 bf 41 69 21 66 2e 6f 7b 20 18 d5 ce
 00000a60: 98 d0 81 ce 56 9d 22 d6 f5 2d 95 20 cd b4 a1 f2 43 67 82 9e ed 7e 36 45 7d 51 35 da 14 46 e2 09
 00000a80: 7d ce b6 3a aa 41 ed 6a 48 b7 8e a5 8c 3f 08 3b b8 5e cb 47 ce 6c 6e 61 c6 18 a4 50 46 06 df ab
 00000aa0: 86 29 e1 42 26 d3 9f fe 02 29 0c bc 3d aa bb c7 48 59 16 6b c0 f8 16 23 af 53 e0 47 af 8c 07 e4
 00000ac0: 28 38 60 84 12 f9 47 c7 f7 d3 02 c6 cd 43 3f 24 a1 5b 78 0f 1e 9c 27 c5 6b 29 4d aa 35 6f 24 f8
 00000ae0: 41 59 a5 81 24 a5 d3 31 d4 fb 06 0a 38 06 72 4f 99 fd 7b 45 89 15 5a e4 d3 65 05 46 71 80 7f 86
 00000b00: be af de 66 a4 78 c2 77 4e b1 06 ba 44 9e b3 16 51 bf 1a db 4e 23 6b 52 48 f2 1e 4c 6b 03 85 b1
 00000b20: a9 85 b8 7f d0 a4 b2 5c 67 9f a7 ec 16 b2 1a 44 c3 f3 d3 31 22 55 d6 3a e4 d1 c1 0b 32 e4 6e ef
 00000b40: ce 4e 2d f7 ba 01 f2 42 b5 f7 74 46 87 db d6 0f 62 25 45 4e fd 01 37 7f 1b 3a 1e 31 e9 19 c1 5a
 00000b60: d4 f3 25 ce c3 9c 90 2a 10 b1 7b ca 7d d5 63 77 1a f5 c5 92 8f 99 5f fa 19 c9 5a 4e 87 86 c2 c7
 00000b80: eb 8f 96 db 78 43 dd 7e 52 9b 88 b9 ff 3d 40 f1 ef 99 e5 cd 72 aa c4 e2 d8 1f a6 8e 6d de c4 f1
 00000ba0: 07 e7 03 9a f6 fe 82 58 d3 c1 7c 20 c9 34 50 57 d7 e5 e7 21 bc 13 f0 5a 7d e8 8b e8 d6 03 6f 12
 00000bc0: 98 5a 80 c4 f7 eb eb e1 67 59 62 b3 54 8e f5 ef 46 c9 e8 4f 1c 11 83 63 5a 0a da 53 a1 64 81 69
 00000be0: 77 ef 04 0f ba d5 f3 ce b6 58 ca ac a1 9d c5 f9 3b fc 24 e4 ec a9 25 df b6 80 42 43 3e 05 6e 47
 00000c00: 85 13 b0 20 00 34 2f ca 13 c9 18 72 b8 ef 00 bf 76 ae 51 93 a3 6d 75 00 1c ef df f7 56 1d 54 c7
 00000c20: 63 59 a9 6e 30 e0 ac b0 aa 6b e5 0b 3f d9 48 00 d7 8a 7a af 94 02 2c c9 ed 7d d7 8a 66 13 62 d6
 00000c40: a3 b4 bc 61 32 44 db fa 88 51 da 90 84 5e 4a 91 47 4a 37 bf 98 19 e1 b7 1f 4c 20 73 cd 00 b1 b5
 00000c60: 10 fe a7 70 ce c2 7c 35 40 51 c9 87 12 cf f5 53 8a 30 9f 29 5a fd 7d 03 ff 26 29 1e f7 fc 88 03
 00000c80: c0 93 cb 10 65 3c 2f 9e f7 8d ef fe 7f 84 fc cb f7 66 ac 6d df 74 a5 78 f8 6a d6 85 75 4c 31 b5
 00000ca0: f3 55 94 e1 d7 aa 37 4a aa 91 ab 88 77 0d a8 b4 1c c9 fc 92 b5 aa 6b 45 1d ef 09 cb 1c 9a 2b a2
 00000cc0: 15 05 ed 08 ff 4c 5b 7f 87 7b 52 44 a2 21 df e5 37 0e a5 e8 20 b3 5a 0e bb c9 08 87 f2 bd 35 94
 00000ce0: 69 25 62 22 a0 2a c4 bd a7 2d 9a 07 9c 97 3d 1e 09 56 ad ac 55 93 d4 cb cb de f1 0a 82 bb 43 e4
 00000d00: 35 8e 46 c5 60 a2 21 2b ba 20 64 e3 a5 2b 8d f8 36 70 54 c1 f6 c5 23 96 3f 2c 19 2c b6 b0 31 0d
 00000d20: ef 09 40 70 e0 00 92 3e 32 cd 8b ac f3 5e 4a ed d1 93 e5 f1 7d 05 b4 00 96 57 a7 9b 8e 94 8a 3f
 00000d40: be ff d8 c3 b0 a3 cf 49 85 50 20 e5 06 94 4e d9 61 6b 77 bd 06 f1 19 eb 39 85 a5 49 0b 21 11 d7
 00000d60: d0 5a 4e 39 e8 a0 15 c3 88 02 31 43 66 7d cd b5 e9 d6 12 67 f7 54 3b 3b 06 54 c9 eb db aa 32 0f
 00000d80: b0 15 c9 d9 be 8b 8f c7 93 81 ba a9 e2 0d 20 9f 52 aa c8 72 0c 43 91 82 7a 13 f1 d2 7a 02 88 82
 00000da0: b7 5c c6 9f 5e bd 4b 17 eb be 2e 32 5a ac 23 89 77 30 40 0a ee e8 85 46 41 54 be 56 02 9c a6 01
 00000dc0: c4 59 0e 31 71 0a e1 45 80 41 90 86 e6 00 cb ea 60 55 ec 09 72 60 9f 16 f9 fd 9b 2b 96 76 97 a5
 00000de0: a7 ee 7c 06 b8 17 35 6f 73 b1 5d d2 35 b6 e8 dc ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000e20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000e40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000e60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000ea0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000ec0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000ee0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000f00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000f20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000f40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000f60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000fa0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000fc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 00000fe0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Workqueue: writeback wb_workfn (flush-ubifs_0_8)
[<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
[<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
[<c0970798>] (dump_stack) from [<c03d041c>] (ubifs_check_node+0x200/0x250)
[<c03d041c>] (ubifs_check_node) from [<c03d7af0>] (ubifs_scan_a_node+0x70/0x1b8)
[<c03d7af0>] (ubifs_scan_a_node) from [<c03d7f34>] (ubifs_scan+0x58/0x340)
[<c03d7f34>] (ubifs_scan) from [<c096fff0>] (ubifs_dump_leb+0x74/0x140)
[<c096fff0>] (ubifs_dump_leb) from [<c03d1504>] (ubifs_wbuf_write_nolock+0x6b0/0x74c)
[<c03d1504>] (ubifs_wbuf_write_nolock) from [<c03c39f4>] (ubifs_jnl_write_data+0x1b8/0x2b4)
[<c03c39f4>] (ubifs_jnl_write_data) from [<c03c7060>] (do_writepage+0x1a4/0x244)
[<c03c7060>] (do_writepage) from [<c022c15c>] (__writepage+0x14/0x68)
[<c022c15c>] (__writepage) from [<c022ce38>] (write_cache_pages+0x1e4/0x3e8)
[<c022ce38>] (write_cache_pages) from [<c022ef04>] (do_writepages+0xa4/0xdc)
[<c022ef04>] (do_writepages) from [<c02ca69c>] (__writeback_single_inode+0x2c/0x1b4)
[<c02ca69c>] (__writeback_single_inode) from [<c02cad20>] (writeback_sb_inodes+0x200/0x470)
[<c02cad20>] (writeback_sb_inodes) from [<c02cafcc>] (__writeback_inodes_wb+0x3c/0xf4)
[<c02cafcc>] (__writeback_inodes_wb) from [<c02cb230>] (wb_writeback+0x1ac/0x20c)
[<c02cb230>] (wb_writeback) from [<c02cc2b0>] (wb_workfn+0x2c0/0x3d4)
[<c02cc2b0>] (wb_workfn) from [<c013a7e8>] (process_one_work+0x1dc/0x438)
[<c013a7e8>] (process_one_work) from [<c013aa8c>] (worker_thread+0x48/0x598)
[<c013aa8c>] (worker_thread) from [<c014074c>] (kthread+0x12c/0x140)
[<c014074c>] (kthread) from [<c0100170>] (ret_from_fork+0x14/0x24)
Exception stack(0xc26affb0 to 0xc26afff8)
ffa0:                                     00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
UBIFS error (ubi0:8 pid 69): ubifs_scan: bad node
UBIFS error (ubi0:8 pid 69): ubifs_scanned_corruption: corruption at LEB 166:41440
UBIFS error (ubi0:8 pid 69): ubifs_scanned_corruption: first 8192 bytes from LEB 166:41440
UBIFS error (ubi0:8 pid 69): ubifs_scan: LEB 166 scanning failed
UBIFS error (ubi0:8 pid 69): ubifs_dump_leb: scan error -117
UBIFS error (ubi0:8 pid 69): do_writepage: cannot write page 10961 of inode 821, error -16
PM: resume devices took 0.090 seconds
OOM killer enabled.
Restarting tasks ... done.
PM: suspend exit
data/root# [  128.970733] UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 1539 bytes in jhead 2, error -30
UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 83 of inode 819, error -30
UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (ubi0:8 pid 157): ubifs_write_inode: can't write inode 819, error -30
UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 10962 of inode 821, error -30
UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 10963 of inode 821, error -30
UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 696 bytes in jhead 2, error -30
UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 0 of inode 819, error -30
UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
