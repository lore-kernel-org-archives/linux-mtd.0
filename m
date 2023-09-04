Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9B9C83F3F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 18:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9HN5a15yfhP+TJrkpRuTQUGvo1yibblCiuiul4aug8=; b=percpC/xOo6lkd
	RNtytKK9r2FyfecRKPeMk4w59PuMruhjxHVUaoGzJwlbz9BSCbzKTcdCZuCXtJZs42DPx7/BpCoRO
	tcv4Nea9jtkrF4tNxwGKcSjiCUT9ca0Io4lbF0Mf+PXvowSVG/zFGZju4XZUI2cw94lDDJDvZHV1j
	zeWpLHUaVS6WfaE2JcgMdiB3GVIkJtRuSO2KSyc38CCE/v4gBsVSOC4vf7pGoOGPyEvhY/nfvlRiH
	iXaWkxin3C1Qevr5a3kmpPdMaGTWyXo58mkOupkzi7W8/SYfILSCm9FtE99FpmTbilbbjmEdnzLcl
	Wes2NUVHgNB+2pwCX08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdE2f-004ZDI-1D;
	Mon, 04 Sep 2023 18:11:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdE2b-004ZBv-1C;
	Mon, 04 Sep 2023 18:11:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9BE26CE0F96;
	Mon,  4 Sep 2023 18:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC393C433CA;
	Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693851068;
	bh=KWuluqFF5yFV+lOCkFnoct0phRXw96Jca/CuZaTU2kY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K3gkbkhJRwgpsacHeBsq0A7kucjUSGo8OzMP1ouPw/XPyf9sD5QK/Sf142+usc7ZE
	 C827H7oMTO9xQURopm4EWqGoFioLBjSEY4gmbRDnvHI4L+ywXrxJRVy5ldQmRaAtfj
	 1pffFi8IArgTV4dPuYUPdlhMXVuT7Hb/6kEuD4lj+4NJdrul8tjUb9OXjEUjpGn+jT
	 2ndFdt5oPLx5wHtLQ20DiaB9Xl09djxp9OA/4zW9QgSOHR3JDKxABg9kMIgFr5Ox62
	 wqlEdaiOf1aM8ubxkjKV3yvjnRyA83mc2npN6NfYoiPdtaZLbxGvWm4TgDkfWkglX8
	 L2qkw/qB1Voxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2BE4C04E26;
	Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [f2fs-dev] [PATCH v7 00/13] fs: implement multigrain timestamps
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106866.19669.14483196627780303129.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:08 +0000
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, ericvh@kernel.org,
 lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com,
 dhowells@redhat.com, marc.dionne@auristor.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, xiubli@redhat.com,
 idryomov@gmail.com, jaharkes@cs.cmu.edu, coda@cs.cmu.edu, code@tyhicks.com,
 xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, linkinjeon@kernel.org, sj1557.seo@samsung.com,
 jack@suse.com, tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, miklos@szeredi.hu, rpeterso@redhat.com,
 agruenba@redhat.com, gregkh@linuxfoundation.org, tj@kernel.org,
 trond.myklebust@hammerspace.com, anna@kernel.org,
 almaz.alexandrovich@paragon-software.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, hubcap@omnibond.com,
 martin@omnibond.com, mcgrof@kernel.org, keescook@chromium.org,
 yzaikin@google.com, sfrench@samba.org, pc@manguebit.com,
 ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com,
 senozhatsky@chromium.org, richard@nod.at, hdegoede@redhat.com,
 hughd@google.com, akpm@linux-foundation.org, amir73il@gmail.com,
 djwong@kernel.org, bcodding@redhat.com, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_111113_792038_FEE8A3D9 
X-CRM114-Status: GOOD (  11.28  )
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

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Mon, 07 Aug 2023 15:38:31 -0400 you wrote:
> The VFS always uses coarse-grained timestamps when updating the
> ctime and mtime after a change. This has the benefit of allowing
> filesystems to optimize away a lot metadata updates, down to around 1
> per jiffy, even when a file is under heavy writes.
> 
> Unfortunately, this coarseness has always been an issue when we're
> exporting via NFSv3, which relies on timestamps to validate caches. A
> lot of changes can happen in a jiffy, so timestamps aren't sufficient to
> help the client decide to invalidate the cache.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v7,01/13] fs: remove silly warning from current_time
    https://git.kernel.org/jaegeuk/f2fs/c/b3030e4f2344
  - [f2fs-dev,v7,02/13] fs: pass the request_mask to generic_fillattr
    https://git.kernel.org/jaegeuk/f2fs/c/0d72b92883c6
  - [f2fs-dev,v7,03/13] fs: drop the timespec64 arg from generic_update_time
    https://git.kernel.org/jaegeuk/f2fs/c/541d4c798a59
  - [f2fs-dev,v7,04/13] btrfs: have it use inode_update_timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/bb7cc0a62e47
  - [f2fs-dev,v7,05/13] fat: make fat_update_time get its own timestamp
    (no matching commit)
  - [f2fs-dev,v7,06/13] ubifs: have ubifs_update_time use inode_update_timestamps
    (no matching commit)
  - [f2fs-dev,v7,07/13] xfs: have xfs_vn_update_time gets its own timestamp
    (no matching commit)
  - [f2fs-dev,v7,08/13] fs: drop the timespec64 argument from update_time
    (no matching commit)
  - [f2fs-dev,v7,09/13] fs: add infrastructure for multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/ffb6cf19e063
  - [f2fs-dev,v7,10/13] tmpfs: add support for multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/d48c33972916
  - [f2fs-dev,v7,11/13] xfs: switch to multigrain timestamps
    (no matching commit)
  - [f2fs-dev,v7,12/13] ext4: switch to multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/0269b585868e
  - [f2fs-dev,v7,13/13] btrfs: convert to multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/50e9ceef1d4f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
