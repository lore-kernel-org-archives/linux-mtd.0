Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FE7C48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 10:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3EE204EC
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 10:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="il/4uO5+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3EE204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7H3NQgSaEVYvNx5lnjl2e6zuv1PcP96cJc8nui5bDI=; b=il/4uO5+CiPNj5
	qXmntz4vxBcAstCyPCTfBDWKNUG0Meu80ON5yQDz7zMbzGVYVIqJlar1wvic09mE4colEWpDYgkx3
	E9qurNtQb3XKpDDBP43cZzbhDu9ZxZVkReRcMeoiHK/4ug9hZBWG0C0rrvYZMrg2EbcOLGrk+FzMN
	0p4k5i5oGKgNWSvlfgtz6CqJ0SBYPurQ5M3qGgBEfQ9PgBnmk9WKx7+DdIbKbtRfR/F48eZmwSMAk
	uCjknysziUgeWAOqZ+ZY0PbTc6Ed12Khxzc7H+3GwJ2MqD4BgkDNbL9DWTDfWBqLdskbm5SBnQMdO
	//owd36qfyt0ROnEyuZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfj8h-0000HQ-D6; Tue, 25 Jun 2019 10:57:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfj8f-0000HH-M9; Tue, 25 Jun 2019 10:57:25 +0000
Date: Tue, 25 Jun 2019 03:57:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 2/4] vfs: create a generic checking function for
 FS_IOC_FSSETXATTR
Message-ID: <20190625105725.GB26085@infradead.org>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138952.1664814.16552129914959122837.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156116138952.1664814.16552129914959122837.stgit@magnolia>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
 adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> fsxattr values so that we can standardize some of the implementation
> behaviors.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> ---
>  fs/btrfs/ioctl.c   |   21 +++++++++-------
>  fs/ext4/ioctl.c    |   27 ++++++++++++++------
>  fs/f2fs/file.c     |   26 ++++++++++++++-----
>  fs/inode.c         |   17 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
>  include/linux/fs.h |    3 ++
>  6 files changed, 111 insertions(+), 53 deletions(-)
> 
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index f408aa93b0cf..7ddda5b4b6a6 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
>  	return 0;
>  }
>  
> +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> +				     struct fsxattr *fa)
> +{
> +	memset(fa, 0, sizeof(*fa));
> +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);

Is there really much of a point in this helper? Epeciall as
the zeroing could easily be done in the variable declaration
line using

	struct fsxattr fa = { };

> +	memset(fa, 0, sizeof(struct fsxattr));
> +	fa->fsx_xflags = ext4_iflags_to_xflags(ei->i_flags & EXT4_FL_USER_VISIBLE);

Overly lone line.

> +	if (ext4_has_feature_project(inode->i_sb)) {
> +		fa->fsx_projid = (__u32)from_kprojid(&init_user_ns,
> +				ei->i_projid);

The cast here looks bogus.  Same comment for f2fs.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
