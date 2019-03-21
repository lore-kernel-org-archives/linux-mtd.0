Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEA7C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 12:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119D3218D4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 12:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HwDuj8bk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119D3218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=320UrdzZJGwc3Iv09c+jbctzbha+scOAOaNzUV6pB/8=; b=HwDuj8bk+NZc8L
	n1/fs2xrqKBY+KleKM44sFoYjWfjKBaMCQ5ajg5aJgJZwSrtS2ScSnoh52881ahmiUYmILgHuQZOk
	vhKb2DC2m+UiktaeOnjAPZsractjd4/4QUZ2SZIn+S22WvNlOmMSeCOY30e0Lp5qsxNJw1wjEYazT
	+psjTn/m1FfvgZLW19Q4PtU4ATxp5U7TvMKi+m4dSXGnZuflh61Z7GGzxWQQ2lacFCgjpgqmuZ+Ks
	2BkgH6yPnaLeQMDv0UbE49kObTIXiqxLOZCviPtsCQBD9LWWQmS02M1ehqdHWlRY/aoCc5OEw7xUG
	1jCuY6uO2SWYSn/8CZpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6x7m-0004of-Mk; Thu, 21 Mar 2019 12:48:46 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6x7j-0004aI-Ty
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 12:48:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B0988609B26F;
 Thu, 21 Mar 2019 13:48:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KSrBmZ7Wph45; Thu, 21 Mar 2019 13:48:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 18E08608A397;
 Thu, 21 Mar 2019 13:48:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id q2xZYHhJpstt; Thu, 21 Mar 2019 13:48:41 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 632BC609B26F;
 Thu, 21 Mar 2019 13:48:40 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH 0/6] Convert mount_single-using filesystems to
 fs_context
Date: Thu, 21 Mar 2019 13:48:39 +0100
Message-ID: <3463221.D14WHduXq3@blindfold>
In-Reply-To: <155316902426.29884.2476392753144421312.stgit@warthog.procyon.org.uk>
References: <155316902426.29884.2476392753144421312.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_054844_262012_43E08305 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: squashfs-devel@lists.sourceforge.net, Nicolas Pitre <nico@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 21. M=E4rz 2019, 12:50:24 CET schrieb David Howells:
> =

> Hi Al,
> =

> Here's a set of patches that convert romfs, cramfs, jffs2 and squashfs to
> use the new fs_context struct and replace mount_mtd().  They have
> prerequisite commits (such as replacing mount_bdev()) that can be found in
> the branch detailed below.
> =

>  (1) Provide a replacement for mount_mtd() that takes an fs_context to
>      specify the parameters.
> =

>      I also put an mtd device pointer into the fs_context struct for use =
in
>      the sget_fc() test and set functions plus a destructor because
>      put_fs_context() can't reach into the mtd module.
> =

>  (2) Convert romfs.
> =

>  (3) Convert cramfs.
> =

>  (4) Convert jffs2.
> =

>  (5) Get rid of the now-obsolete mount_mtd() function.
> =

>  (6) Convert squashfs.
> =

> These can be found in the following branch:
> =

> 	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=
=3Dmount-api-viro

Hmm, I pulled this into 5.1-rc1 to test jffs2 but it oopes already while bo=
oting:

[    5.999847] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000068
[    6.002273] #PF error: [normal kernel read fault]
[    6.002912] PGD 0 P4D 0 =

[    6.003241] Oops: 0000 [#1] SMP PTI
[    6.003690] CPU: 3 PID: 1221 Comm: mount Not tainted 5.1.0-rc1+ #372
[    6.004494] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.11.0-0-g63451fc-prebuilt.qemu-project.org 04/01/2014
[    6.004504] RIP: 0010:reconfigure_super+0x17/0x1e0
[    6.004505] Code: 00 01 75 83 48 89 df e8 c7 e5 ff ff e9 76 ff ff ff 66 =
90 41 56 41 55 41 54 55 53 f7 47 68 ae ff 7f fd 48 8b 47 28 44 8b 77 64 <48=
> 8b 68 68 0f 85 a2 01 00 00 8b 95 38 02 00 00 85 d2 0f 85 89 01
[    6.004506] RSP: 0018:ffffb43cc0dafdf0 EFLAGS: 00010246
[    6.004507] RAX: 0000000000000000 RBX: ffff9d21b925cb00 RCX: ffff9d21b97=
3009c
[    6.004508] RDX: 0000000000000001 RSI: ffff9d21b925cb00 RDI: ffff9d21b92=
5cb00
[    6.004508] RBP: ffff9d21b9730000 R08: 0000000000200000 R09: 00000000000=
00000
[    6.004509] R10: ffffb43cc0dafe78 R11: 61c8864680b583eb R12: ffff9d21ba0=
cd000
[    6.004509] R13: ffffffff8d95a460 R14: 0000000000000000 R15: 00000000000=
00020
[    6.004512] FS:  00007fad96cea480(0000) GS:ffff9d21bab80000(0000) knlGS:=
0000000000000000
[    6.004514] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.004515] CR2: 0000000000000068 CR3: 0000000178dec000 CR4: 00000000000=
006e0
[    6.004516] Call Trace:
[    6.004530]  ? debugfs_get_inode+0x50/0x50
[    6.022494]  vfs_get_super+0x9c/0xe0
[    6.022973]  vfs_get_tree+0x38/0xf0
[    6.023451]  do_mount+0x728/0xd20
[    6.023905]  ? _copy_from_user+0x37/0x60
[    6.024436]  ? memdup_user+0x39/0x60
[    6.024917]  ksys_mount+0x7b/0xd0
[    6.025368]  __x64_sys_mount+0x1c/0x20
[    6.025876]  do_syscall_64+0x43/0xf0
[    6.026375]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
 =

Do I miss some other fix?

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
