Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E3C001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj1INJYzh9lWL/btmDm39LkW1F2tnd+f80oax4iTRwA=; b=l3rCSgSP4p19Li
	cFpKTEq6oBqk3i+FwRg1IK1FzzWxwCeijuwjw8aMZnWMlKbyRjIRd0HUKe4BE6zjORHx1VUGwvLDv
	kuGKDirqKAiMCewqsqE08mmHiYFRDfWNjVEqE7lv8tYta8aBqNJpXGhOqW+p4Da8kvpluZ3vylyu3
	NWwtE9x0hR9qu7qkwUkB/VnYEY+YZ/s62uEznxq3PS1consADbjsy49dllVqXhd5h4oBVxmeP+BRR
	DuAfSOhEgxArxuy2NUJ/5gVKKKadKxZUpgclmuPilieYpy+QC63nnhaFuTb9kNw5eRzc1F6Hbxi4u
	W0R1xiJ7Brup2DQ9CbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDb-0035xx-0c;
	Fri, 28 Jul 2023 11:01:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDV-0035tz-32;
	Fri, 28 Jul 2023 11:01:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70293620F0;
	Fri, 28 Jul 2023 11:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71689C433C8;
	Fri, 28 Jul 2023 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690542063;
	bh=OHILmmeiUht8a/iNB32Wqo6p3CZSNTmmXf/wqdU8eyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUHncmkLN11wgaMD1KR1Gy5if09x5xh0KGyx50ZGUuC2fBx+ijTW2wECE/sOye+rG
	 qDHl4LIc5ruyg2PAO1VZI95ZW/5j7Q0Vo/saVvtDVwvUJlMtgeQjFVYzjalCOIixt6
	 gEQ+u8asPVZluAxs1HoSNgHXPJA0QhMWBw4NywwMFrjIj9j61U5pX9yO+iEoVUAfbu
	 mdakOz70WJL7rxDzg7P00Ji6kHPu+xHi68+/TquTtcuasIukOIAL/+DVn48WGku6nx
	 2ORenDwB3jD7HGc7jH1b/evq7YZ9RS2gsMH8Qjv3EgEZjMk8pxaawj3uGeQKo/zCuQ
	 +lMRyzmoHCobQ==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Dave Chinner <david@fromorbit.com>,
	Anthony Iliopoulos <ailiop@suse.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@lists.linux.dev,
	devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org,
	linux-mm@kvack.org,
	linux-xfs@vger.kernel.org,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Xiubo Li <xiubli@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>,
	coda@cs.cmu.edu,
	Tyler Hicks <code@tyhicks.com>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: (subset) [PATCH v6 0/7] fs: implement multigrain timestamps
Date: Fri, 28 Jul 2023 13:00:37 +0200
Message-Id: <20230728-unrecht-ersichtlich-cfa7d0c703d1@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=brauner@kernel.org; h=from:subject:message-id; bh=4DjYiXolHUh8qQu1N+OzbWT4vtvmgyT4c+N7Ht8XGtY=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQcnsy9IaFu+ZP9z1N8rj/+PH2Pm5FLY6hTmXAw+6xpv069 EIk93lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARMyFGhh2xp3MqP+WJ6kre7E0z/m vxVuf2tOrqbz/KOXZnbdld4czI8C9ly15G/weVYRsOZM6bEHF4077Al0vcwkM2vDFrTz89nQsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_040106_065193_636EC865 
X-CRM114-Status: GOOD (  16.22  )
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

On Tue, 25 Jul 2023 10:58:13 -0400, Jeff Layton wrote:
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

Survives xfstests (tmpfs, ext4, overlayfs) and the fs portions of LTP.
Let's keep our eyes open for any potential issues. Past suspects has
been IMA interacting with overlayfs. We'll see. Picked everything minus
the tmpfs-writepage patch that was contentious.

---

Applied to the vfs.ctime branch of the vfs/vfs.git tree.
Patches in the vfs.ctime branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ctime

[1/7] fs: pass the request_mask to generic_fillattr
      https://git.kernel.org/vfs/vfs/c/0a6ab6dc6958
[2/7] fs: add infrastructure for multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/d242b98ac3e9
[4/7] tmpfs: add support for multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/1f31c58cf032
[5/7] xfs: switch to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/859dd91017dd
[6/7] ext4: switch to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/093af249eab4
[7/7] btrfs: convert to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/b90a04d1c30c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
