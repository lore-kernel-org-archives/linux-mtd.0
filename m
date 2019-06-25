Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C69C48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 17:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C8620883
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 17:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRmFZK2r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C8620883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMB4biAfTFdL2mur7aLVZod6enHGM9Emhw59r7Yk57s=; b=XRmFZK2rsMyFUW
	SM9oNThBKigX3+bb3MOY7cN6N4iFzrCHlFtwZTLKplOVWC0rgUrkH/qJOaHIMcQOt90GoPRQ8IgFx
	qQcqObU46nWyPmwQZBKnX4mScW2vh/N1lNpOF3eIe9ThnIdgvBgmo4Cj0FhkHphs6gICNscMzAY+s
	u447pgdgB1/HvuqYjDBGaMjxO/JIp0E8NLQIhb63t1WIwcacKHJdkPAjp0QxYPc+bA51qLSmeZbnp
	fEHuSUsVumPUTMwx4erNGRCt+CigHYrsGO4vFSF53maBKB0R8Bm6sXOjz3uKS4avk1Zad0F1DGR11
	9GEL/w5c2Es99MvfGLWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfpJ6-0001rC-KE; Tue, 25 Jun 2019 17:32:36 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfpJ3-0001qc-QB
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 17:32:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E8FBAD8A;
 Tue, 25 Jun 2019 17:32:32 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 2D2B6DA8F6; Tue, 25 Jun 2019 19:33:16 +0200 (CEST)
Date: Tue, 25 Jun 2019 19:33:16 +0200
From: David Sterba <dsterba@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 2/4] vfs: create a generic checking function for
 FS_IOC_FSSETXATTR
Message-ID: <20190625173316.GU8917@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Christoph Hellwig <hch@infradead.org>, matthew.garrett@nebula.com,
 yuchao0@huawei.com, tytso@mit.edu, shaggy@kernel.org,
 ard.biesheuvel@linaro.org, josef@toxicpanda.com, clm@fb.com,
 adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138952.1664814.16552129914959122837.stgit@magnolia>
 <20190625105725.GB26085@infradead.org>
 <20190625170248.GS8917@twin.jikos.cz>
 <20190625171616.GB2230847@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625171616.GB2230847@magnolia>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_103234_143220_BDB639F2 
X-CRM114-Status: GOOD (  19.14  )
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
Reply-To: dsterba@suse.cz
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-btrfs@vger.kernel.org, yuchao0@huawei.com, dsterba@suse.cz, clm@fb.com,
 adilger.kernel@dilger.ca, matthew.garrett@nebula.com, cluster-devel@redhat.com,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, josef@toxicpanda.com,
 linux-nilfs@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 10:16:16AM -0700, Darrick J. Wong wrote:
> On Tue, Jun 25, 2019 at 07:02:48PM +0200, David Sterba wrote:
> > On Tue, Jun 25, 2019 at 03:57:25AM -0700, Christoph Hellwig wrote:
> > > On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> > > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > > 
> > > > Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> > > > fsxattr values so that we can standardize some of the implementation
> > > > behaviors.
> > > > 
> > > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > > ---
> > > >  fs/btrfs/ioctl.c   |   21 +++++++++-------
> > > >  fs/ext4/ioctl.c    |   27 ++++++++++++++------
> > > >  fs/f2fs/file.c     |   26 ++++++++++++++-----
> > > >  fs/inode.c         |   17 +++++++++++++
> > > >  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
> > > >  include/linux/fs.h |    3 ++
> > > >  6 files changed, 111 insertions(+), 53 deletions(-)
> > > > 
> > > > 
> > > > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > > > index f408aa93b0cf..7ddda5b4b6a6 100644
> > > > --- a/fs/btrfs/ioctl.c
> > > > +++ b/fs/btrfs/ioctl.c
> > > > @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> > > > +				     struct fsxattr *fa)
> > > > +{
> > > > +	memset(fa, 0, sizeof(*fa));
> > > > +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > > 
> > > Is there really much of a point in this helper? Epeciall as
> > > the zeroing could easily be done in the variable declaration
> > > line using
> > > 
> > > 	struct fsxattr fa = { };
> > 
> > Agreed, not counting the initialization the wrapper is merely another
> > name for btrfs_inode_flags_to_xflags. I also find it slightly confusing
> > that __btrfs_ioctl_fsgetxattr name is too close to the ioctl callback
> > implementation btrfs_ioctl_fsgetxattr but only does some initialization.
> 
> Ok; it's easily enough changed to:
> 
> 	struct fsxattr old_fa = {
> 		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
> 	};

Works for me, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
