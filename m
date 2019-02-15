Return-Path: <SRS0=Utib=QW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70519C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Feb 2019 15:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE862190C
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Feb 2019 15:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvaxO6ew";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TdxYLF2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE862190C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHjeoppPoOl5vctNyYOqxGeORQaeQG/GfJz4KI71EKg=; b=LvaxO6ewaOdHWR
	k8wtY/uJXVXxXgfwZRdr09HceWa376N9TSC7nmGHhih7Tc3+sHwaPOJqp0PUWZMzr/wSj+A6mD4UN
	NJdpNxkJ1Rzzkb9WstBLBqYUAdfhnMnR7NQxi3PfFk8htZJf5e1pAA4CzI1ykVQy1X5V0HAvMTikh
	e3kjj8vpuOasHEpZhfjEb9rSmYiFO0y1YC693GXdKOX7Rxa8EQ5OW0LoAB/wE9XWFvWE5ZUIOYS8u
	C7YBsGhIHHfxaA8dR6azCR8kX1nzljtY4LRsJ3RB7wmJfQZhXJuOhj3kjDBjN4XIoOuoCuLRa39nw
	1U5Eo5uARTpwa26L4Vkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gufqt-0000VF-24; Fri, 15 Feb 2019 15:56:35 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gufqp-0000TV-Gf
 for linux-mtd@lists.infradead.org; Fri, 15 Feb 2019 15:56:33 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x1FFskfS012978;
 Fri, 15 Feb 2019 15:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=H/p/uq6cj+GvpAsur9UGOGjTXxChi2YnrN/BPDly/rc=;
 b=TdxYLF2/O4gQakE7ACJ4NA+Y1Iheezehzn0io67FMGYJLAR2YY+3paZCVCKZ5vpe1B6r
 z0JMzvi5iw8COHJ5AwoJ30GEUMyLt0iB5Tj3QAzdTv4JIyE9iIN21vckRnmKp+AHrfH0
 g8nSvpK18iihz1bf9Aj4otmpbSET1Yjt+r6/ZB0c1X35usKeC1BqLKZ9VSibIIZ/IdVq
 Ad/bKDzbQGbMAkdBM1zjSa3rbsl/TFiJLoTac5cUXf/jVjtPwjC9JiZYFW5A8xFqOa8T
 wqkxfMwzvybBV9apPU6ZLUpjiQo0WaRKxqIq5mcvwAaKaCiNad8kSN3KQdxe2xm0lM5o Vw== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
 by userp2130.oracle.com with ESMTP id 2qhrekxm1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Feb 2019 15:56:10 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id x1FFu916002203
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Feb 2019 15:56:09 GMT
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x1FFu6iw026202;
 Fri, 15 Feb 2019 15:56:07 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Feb 2019 15:56:06 +0000
Date: Fri, 15 Feb 2019 07:56:04 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH] vfs: don't decrement i_nlink in d_tmpfile
Message-ID: <20190215155604.GL32253@magnolia>
References: <20190214234908.GA6474@magnolia>
 <CAOQ4uxho2AK7g-uhHykGaG6n+aqad-SaCTC6Z_EaA4Jn07tDSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxho2AK7g-uhHykGaG6n+aqad-SaCTC6Z_EaA4Jn07tDSg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9168
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902150109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_075631_641945_6309BAE2 
X-CRM114-Status: GOOD (  30.66  )
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Tso <tytso@mit.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 yuchao0@huawei.com, Hugh Dickins <hughd@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>, dsterba@suse.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ext4 <linux-ext4@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Linux Btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 15, 2019 at 10:04:12AM +0200, Amir Goldstein wrote:
> On Fri, Feb 15, 2019 at 4:23 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> >
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> >
> > d_tmpfile was introduced to instantiate an inode in the dentry cache as
> > a temporary file.  This helper decrements the inode's nlink count and
> > dirties the inode, presumably so that filesystems could call new_inode
> > to create a new inode with nlink == 1 and then call d_tmpfile which will
> > decrement nlink.
> >
> > However, this doesn't play well with XFS, which needs to allocate,
> > initialize, and insert a tempfile inode on its unlinked list in a single
> > transaction.  In order to maintain referential integrity of the XFS
> > metadata, we cannot have an inode on the unlinked list with nlink >= 1.
> >
> > XFS and btrfs hack around d_tmpfile's behavior by creating the inode
> > with nlink == 0 and then incrementing it just prior to calling
> > d_tmpfile, anticipating that it will be reset to 0.
> >
> > Everywhere else outside of d_tmpfile, it appears that nlink updates and
> > persistence is the responsibility of individual filesystems.  Therefore,
> > move the nlink decrement out of d_tmpfile into the callers, and require
> > that callers only pass in inodes with nlink already set to 0.
> >
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > ---
> >  fs/btrfs/inode.c  |    8 --------
> >  fs/dcache.c       |    8 ++++++--
> >  fs/ext2/namei.c   |    2 +-
> >  fs/ext4/namei.c   |    1 +
> >  fs/f2fs/namei.c   |    1 +
> >  fs/minix/namei.c  |    2 +-
> >  fs/ubifs/dir.c    |    1 +
> >  fs/udf/namei.c    |    2 +-
> >  fs/xfs/xfs_iops.c |   13 ++-----------
> >  mm/shmem.c        |    1 +
> >  10 files changed, 15 insertions(+), 24 deletions(-)
> >
> > diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> > index 5c349667c761..bd189fc50f83 100644
> > --- a/fs/btrfs/inode.c
> > +++ b/fs/btrfs/inode.c
> > @@ -10382,14 +10382,6 @@ static int btrfs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
> >         if (ret)
> >                 goto out;
> >
> > -       /*
> > -        * We set number of links to 0 in btrfs_new_inode(), and here we set
> > -        * it to 1 because d_tmpfile() will issue a warning if the count is 0,
> > -        * through:
> > -        *
> > -        *    d_tmpfile() -> inode_dec_link_count() -> drop_nlink()
> > -        */
> > -       set_nlink(inode, 1);
> >         d_tmpfile(dentry, inode);
> >         unlock_new_inode(inode);
> >         mark_inode_dirty(inode);
> > diff --git a/fs/dcache.c b/fs/dcache.c
> > index aac41adf4743..5fb4ecce2589 100644
> > --- a/fs/dcache.c
> > +++ b/fs/dcache.c
> > @@ -3042,12 +3042,16 @@ void d_genocide(struct dentry *parent)
> >
> >  EXPORT_SYMBOL(d_genocide);
> >
> > +/*
> > + * Instantiate an inode in the dentry cache as a temporary file.  Callers must
> > + * ensure that @inode has a zero link count.
> > + */
> >  void d_tmpfile(struct dentry *dentry, struct inode *inode)
> >  {
> > -       inode_dec_link_count(inode);
> >         BUG_ON(dentry->d_name.name != dentry->d_iname ||
> >                 !hlist_unhashed(&dentry->d_u.d_alias) ||
> > -               !d_unlinked(dentry));
> > +               !d_unlinked(dentry) ||
> > +               inode->i_nlink != 0);
> 
> You've just promoted i_nlink filesystem accounting error (which
> are not that rare) from WARN_ON() to BUG_ON(), not to mention
> Linus' objection to any use of BUG_ON() at all.
> 
> !hlist_unhashed is anyway checked again in d_instantiate().
> !d_unlinked is not a reason to break the machine.
> The name check is really not a reason to break the machine.
> Can probably make tmp name code conditional to WARN_ON().

Fair enough, I'll remove the redundant checks and downgrade that to a
WARN_ON, if nobody else objects....

--D

> Thanks,
> Amir.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
