Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2551C48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 17:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B941F20883
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 17:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3cEpQq7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kRLzMzcD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B941F20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxVR/AMeDsVj6u7C7iMs2l1asW9u/gKtl2h05O7L2Vc=; b=e3cEpQq7lWT+Rz
	En4yOIDa0j+Gda9Sg38FL1bGR5a6OpWLB1fWJ7mu0vD4SCCr6AO9B7utgVTWAxL2XGJCm+ipc6/gL
	2htK+wgiks6lQhGPo622MHfg9wb6gcSM+R9Jni/Y7oXMUxiVVPAAQwXMsu5L+lnaBO+QXiaMtRUEK
	kx/twOz3HrBwZa3Ze9jMXofFZk/tigGfKyrdkjaoSIBBS+ieiFU3p7zM55wr5PygB5ewlftaiGJ5T
	Gv6lO0sB3ofZ0hl8C07MkwDYlxbgIJLaeEIvpF9tqoSCEZ3FUYXZTpyXpC5BQKz+FBIBvmJfz/dWG
	VAQPETV79Ip1XJxBFxUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfp3t-0002DB-MB; Tue, 25 Jun 2019 17:16:53 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfp3q-0002Ce-GL
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 17:16:52 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PHDjnK112356;
 Tue, 25 Jun 2019 17:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=8YOHqT1H5m87NYapYKi5uOloFdOjAQsayzwyn6FBGsU=;
 b=kRLzMzcD4dDTxKKrIatPNQ8UbCC6dJVjee0v4WI+ASaqAGwEtXxAYgVRxpW7bi2F0kdN
 +8BkhOTIe/oZhPnAYc1tUS8V4kAmfxQ6VRRo827Ml89rmcehwrL0IvipIkWsyxIORYzM
 dFZwu3TFJ2jAetMYP79ISwOmGkO6y3D31aAPNJXhXBih2Gr5GYQy3VEltfIlToeYcYTA
 OPEtp5J5s9kqXfLt+XUPAuzKiT8ERVsbjZlleEopgqvRqrrBmDlDLaWMStCqCoAydaCU
 P+tj3IggCOnLZs/3nlNDQyjq5pVdz1NFvQtV5k0sEbhsON1T5kYdVRGZQlOdlAbybMLW JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t9brt5t2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 17:16:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PHFVC3141059;
 Tue, 25 Jun 2019 17:16:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t9acc7vvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Jun 2019 17:16:23 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PHGMB9143216;
 Tue, 25 Jun 2019 17:16:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t9acc7vvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 17:16:22 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PHGJxo007776;
 Tue, 25 Jun 2019 17:16:19 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 10:16:19 -0700
Date: Tue, 25 Jun 2019 10:16:16 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: dsterba@suse.cz, Christoph Hellwig <hch@infradead.org>,
 matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 shaggy@kernel.org, ard.biesheuvel@linaro.org, josef@toxicpanda.com,
 clm@fb.com, adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 2/4] vfs: create a generic checking function for
 FS_IOC_FSSETXATTR
Message-ID: <20190625171616.GB2230847@magnolia>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138952.1664814.16552129914959122837.stgit@magnolia>
 <20190625105725.GB26085@infradead.org>
 <20190625170248.GS8917@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625170248.GS8917@twin.jikos.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_101650_690651_1FBC7A55 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 07:02:48PM +0200, David Sterba wrote:
> On Tue, Jun 25, 2019 at 03:57:25AM -0700, Christoph Hellwig wrote:
> > On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > 
> > > Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> > > fsxattr values so that we can standardize some of the implementation
> > > behaviors.
> > > 
> > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > ---
> > >  fs/btrfs/ioctl.c   |   21 +++++++++-------
> > >  fs/ext4/ioctl.c    |   27 ++++++++++++++------
> > >  fs/f2fs/file.c     |   26 ++++++++++++++-----
> > >  fs/inode.c         |   17 +++++++++++++
> > >  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
> > >  include/linux/fs.h |    3 ++
> > >  6 files changed, 111 insertions(+), 53 deletions(-)
> > > 
> > > 
> > > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > > index f408aa93b0cf..7ddda5b4b6a6 100644
> > > --- a/fs/btrfs/ioctl.c
> > > +++ b/fs/btrfs/ioctl.c
> > > @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
> > >  	return 0;
> > >  }
> > >  
> > > +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> > > +				     struct fsxattr *fa)
> > > +{
> > > +	memset(fa, 0, sizeof(*fa));
> > > +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > 
> > Is there really much of a point in this helper? Epeciall as
> > the zeroing could easily be done in the variable declaration
> > line using
> > 
> > 	struct fsxattr fa = { };
> 
> Agreed, not counting the initialization the wrapper is merely another
> name for btrfs_inode_flags_to_xflags. I also find it slightly confusing
> that __btrfs_ioctl_fsgetxattr name is too close to the ioctl callback
> implementation btrfs_ioctl_fsgetxattr but only does some initialization.

Ok; it's easily enough changed to:

	struct fsxattr old_fa = {
		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
	};

--D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
