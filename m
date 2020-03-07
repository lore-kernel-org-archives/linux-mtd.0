Return-Path: <SRS0=A5yI=4Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A7EC10F00
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 05:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DF220674
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 05:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nq0duZe/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYAdPqjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DF220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKpWMg0BUsBCFmYaZX4RUf6evV2JDOArLJ3W5hf0VO4=; b=Nq0duZe/oge3o3
	px/e6fKL9GQmSmwXo+D3QZNqTib+gb0N1NxnjAPEZZeszPWsPh+DF/uNqHzhs9e2OEp29p33rFGot
	aELEjOlPo7Hxvu/+MR0HBN/4kKPMwQne7rpgvPeUd6VtGVomPwpUVDYp1/0saTlI8I+8dzGh6zMu7
	3VRrj8oSiJsIRS9KmDq60/p5vNjiRTFBGvu60Mj9m9XiuBBtZ6eGkn+qrqbi5Ip9sz9isp7dFj/iW
	c219bcobQ2+abwFX4vqQn3puhxUWhodOn+D6KWxd2oByuuQLPx1TZVfOQURUYqEGgJy3VxERut4TI
	ve9trmQQfAAYlszjve1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jARh1-0006Qe-Da; Sat, 07 Mar 2020 05:08:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jARgy-0006Q6-2J
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2020 05:08:05 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D96C20674;
 Sat,  7 Mar 2020 05:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583557682;
 bh=Exd7GA4dQ4U4CixA1eLJpm+MKE5/qMe3SNvfx+b8xy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYAdPqjCGBVnxQaopP4xvS8wWZ7dp+kNv1lqozW+Kz+YfWIzlm0IrFUAcIuGFEQaR
 86QmvLGLweykJJdRcX6h/DsnsM8eNTBByP5RGuCiw837LhCHn/wPfIJFIeancj/3P4
 9Tpdd09AWlGbt3W+8gAHsCCUn5e0JoAr9Si/OnwA=
Date: Fri, 6 Mar 2020 21:08:00 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v8 0/8] Support for Casefolding and Encryption
Message-ID: <20200307050800.GA1069@sol.localdomain>
References: <20200307023611.204708-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_210804_153705_3D21B083 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2020 at 06:36:03PM -0800, Daniel Rosenberg wrote:
> These patches are all on top of torvalds/master
> 
> Ext4 and F2FS currently both support casefolding and encryption, but not at
> the same time. These patches aim to rectify that.
> 
> I've left off the Ext4 patches that enable casefolding and ecryption from
> this revision since they still need some fixups, and I haven't gotten around
> to the fsck changes yet.
> 
> I moved the identical casefolding dcache operations for ext4 and f2fs into
> fs/libfs.c, as all filesystems using casefolded names will want them.
> 
> I've also adjust fscrypt to not set it's d_revalidate operation during it's
> prepare lookup, instead having the calling filesystem set it up. This is
> done to that the filesystem may have it's own dentry_operations. Also added
> a helper function in libfs.c that will work for filesystems supporting both
> casefolding and fscrypt.
> 
> For Ext4, since the hash for encrypted casefolded directory names cannot be
> computed without the key, we need to store the hash on disk. We only do so
> for encrypted and casefolded directories to avoid on disk format changes.
> Previously encryption and casefolding could not be on the same filesystem,
> and we're relaxing that requirement. F2fs is a bit more straightforward
> since it already stores hashes on disk.
> 
> I've updated the related tools with just enough to enable the feature. I
> still need to adjust ext4's fsck's, although without access to the keys,
> neither fsck will be able to verify the hashes of casefolded and encrypted
> names.
> 

Can you please do some more testing?  Just playing around with casefolding (not
even encryption yet), it didn't take long to notice some problems.  E.g.

$ mkfs.f2fs -f -C utf8 /dev/vdc
$ mount /vdc
$ mkdir /vdc/dir
$ chattr +F /vdc/dir
$ echo foo > /vdc/dir/a
$ cat /vdc/dir/A
foo
$ rm /vdc/dir/a
$ cat /vdc/dir/A
foo

I.e. 'rm' only deleted "a", not "A", even though they're the same file.

Also, there's a casefolding test in xfstests, and with this patchset applied it
fails and causes kernel warnings.  It passes without this patchset applied.

$ kvm-xfstests -c f2fs -g casefold

[...]
[    5.947961] ------------[ cut here ]------------
[    5.948714] WARNING: CPU: 1 PID: 1053 at fs/inode.c:302 drop_nlink+0x1e/0x30
[    5.949742] CPU: 1 PID: 1053 Comm: rm Not tainted 5.6.0-rc4-00008-gf9c20981ece1 #4
[    5.950835] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20191223_100556-anatol 04/01/2014
[    5.952234] RIP: 0010:drop_nlink+0x1e/0x30
[    5.952838] Code: 44 24 10 eb da 0f 0b 0f 1f 44 00 00 8b 47 40 8d 50 ff 85 c0 74 14 85 d2 89 57 40 75 0c 48 8b 47 28 f0 48 ff 80 98 5
[    5.955509] RSP: 0018:ffffc90001633d60 EFLAGS: 00010246
[    5.956273] RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000000000
[    5.957303] RDX: 00000000ffffffff RSI: 0000000000000001 RDI: ffff88807a84d688
[    5.958332] RBP: ffffc90001633d90 R08: 0000000000000000 R09: 0000000000000000
[    5.959363] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88807a84d688
[    5.960392] R13: ffff88807cf97648 R14: ffff88807a84da50 R15: ffff8880776bc000
[    5.961424] FS:  00007f7003d12540(0000) GS:ffff88807fd00000(0000) knlGS:0000000000000000
[    5.962588] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.963422] CR2: 000055a037bf5448 CR3: 00000000780ad000 CR4: 00000000003406e0
[    5.964453] Call Trace:
[    5.964828]  ? f2fs_drop_nlink+0x56/0x140
[    5.965417]  f2fs_delete_inline_entry+0x19e/0x1e0
[    5.966106]  f2fs_delete_entry+0x1be/0x320
[    5.966705]  f2fs_unlink+0x10c/0x360
[    5.967239]  vfs_unlink+0xf1/0x1d0
[    5.967747]  do_unlinkat+0x188/0x2c0
[    5.968254]  __x64_sys_unlinkat+0x33/0x50
[    5.968709]  do_syscall_64+0x4a/0x1f0
[    5.969130]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[    5.969533] RIP: 0033:0x7f7003c3bff7
[    5.969804] Code: 73 01 c3 48 8b 0d 99 ee 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 07 01 8
[    5.971154] RSP: 002b:00007ffde2c23588 EFLAGS: 00000206 ORIG_RAX: 0000000000000107
[    5.971707] RAX: ffffffffffffffda RBX: 000055a037bf5570 RCX: 00007f7003c3bff7
[    5.972242] RDX: 0000000000000000 RSI: 000055a037bf4340 RDI: 00000000ffffff9c
[    5.972774] RBP: 000055a037bf42b0 R08: 0000000000000003 R09: 0000000000000000
[    5.973305] R10: fffffffffffffbd8 R11: 0000000000000206 R12: 00007ffde2c23770
[    5.973837] R13: 0000000000000000 R14: 000055a037bf5570 R15: 0000000000000000
[    5.974367] irq event stamp: 1134
[    5.974621] hardirqs last  enabled at (1133): [<ffffffff810f6645>] ktime_get_coarse_real_ts64+0x95/0xb0
[    5.975321] hardirqs last disabled at (1134): [<ffffffff81001b79>] trace_hardirqs_off_thunk+0x1a/0x1c
[    5.976003] softirqs last  enabled at (502): [<ffffffff8102ab53>] fpu__clear+0xb3/0x1b0
[    5.976586] softirqs last disabled at (500): [<ffffffff8102ab15>] fpu__clear+0x75/0x1b0
[    5.977181] ---[ end trace 31b6c5defdf04f01 ]---
[    5.989770] ------------[ cut here ]------------
[...]
[failed, exit status 1] [21:03:50]- output mismatch (see /results/f2fs/results-default/generic/556.out.bad)
    --- tests/generic/556.out	2020-02-18 11:22:36.000000000 -0800
    +++ /results/f2fs/results-default/generic/556.out.bad	2020-03-06 21:03:50.783730049 -0800
    @@ -12,5 +12,5 @@
     # file: SCRATCH_MNT/xattrs/x/f1
     user.foo="bar"
     
    -touch: setting times of 'SCRATCH_MNT/strict/corac'$'\314\247\303': Invalid argument
    -touch: setting times of 'SCRATCH_MNT/strict/cora'$'\303\247\303': Invalid argument
    +_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
    +(see /results/f2fs/results-default/generic/556.full for details)
    ...
    (Run 'diff -u /root/xfstests/tests/generic/556.out /results/f2fs/results-default/generic/556.out.bad'  to see the entire diff)
Ran: generic/556
Failures: generic/556
Failed 1 of 1 tests

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
