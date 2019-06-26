Return-Path: <SRS0=bYPC=UZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26501C48BD6
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 12:21:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16B220663
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 12:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="katQjLnx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16B220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXuIqdd1qWDpY/xKaAzHrdF3/QETllNB44vw1+ns8rc=; b=katQjLnxdWuAGm
	4kI2NycCpTBGPWYO/yrMv2091pqYfvEgvl/12YsJpQjUzmI24UnGAbOPnxvJzr0ef28m0dhHF/lbO
	dvKNEajc5AlNG5YRT90XJN+yDwFth+SU1SZbtKMv8B9g+gQSnC78l+NiWpXDxNJ473+7qPRMF7pK9
	BRVMqJpbaaqy1Yy4Ba3uxqTeP/HitQlIRXoUtR7B3vHaVkSgHIznWsEIp+WjseQ7DJUXDQA0R+6U7
	B5kKluwc2u9eFQvsbP/HK1KSiqObJk+wtuDzFsytPAVbO1Lp5ItkTtgGVZUMYNsN7fys/wb3Q1oj/
	aAE4C0xrdvnNWDcYZ9kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg6vP-0006vf-87; Wed, 26 Jun 2019 12:21:19 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg6vM-0006vD-A2
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2019 12:21:17 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DBE3308792C;
 Wed, 26 Jun 2019 12:20:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DAEC5D9C6;
 Wed, 26 Jun 2019 12:20:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26F8E1806B0E;
 Wed, 26 Jun 2019 12:20:43 +0000 (UTC)
Date: Wed, 26 Jun 2019 08:20:42 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <868182386.37358699.1561551642881.JavaMail.zimbra@redhat.com>
In-Reply-To: <156151633004.2283456.4175543089138173586.stgit@magnolia>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
 <156151633004.2283456.4175543089138173586.stgit@magnolia>
Subject: Re: [Cluster-devel] [PATCH 1/5] vfs: create a generic checking and
 prep function for FS_IOC_SETFLAGS
MIME-Version: 1.0
X-Originating-IP: [10.3.116.201, 10.4.195.9]
Thread-Topic: create a generic checking and prep function for FS_IOC_SETFLAGS
Thread-Index: 5u1cuSAsKRaw36dS1F+PjLFgFqc7sA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 26 Jun 2019 12:21:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_052116_374444_A1282A06 
X-CRM114-Status: GOOD (  10.97  )
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
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>, yuchao0@huawei.com,
 clm@fb.com, adilger kernel <adilger.kernel@dilger.ca>,
 ocfs2-devel@oss.oracle.com, Christoph Hellwig <hch@lst.de>,
 matthew garrett <matthew.garrett@nebula.com>, cluster-devel@redhat.com,
 hch@infradead.org, linux-ext4@vger.kernel.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, linux-nilfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
 ard biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

----- Original Message -----
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic function to check incoming FS_IOC_SETFLAGS flag values
> and later prepare the inode for updates so that we can standardize the
> implementations that follow ext4's flag values.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: David Sterba <dsterba@suse.com>
> ---
>  fs/btrfs/ioctl.c    |   13 +++++--------
>  fs/efivarfs/file.c  |   26 +++++++++++++++++---------
>  fs/ext2/ioctl.c     |   16 ++++------------
>  fs/ext4/ioctl.c     |   13 +++----------
>  fs/f2fs/file.c      |    7 ++++---
>  fs/gfs2/file.c      |   42 +++++++++++++++++++++++++++++-------------
>  fs/hfsplus/ioctl.c  |   21 ++++++++++++---------
>  fs/inode.c          |   24 ++++++++++++++++++++++++
>  fs/jfs/ioctl.c      |   22 +++++++---------------
>  fs/nilfs2/ioctl.c   |    9 ++-------
>  fs/ocfs2/ioctl.c    |   13 +++----------
>  fs/orangefs/file.c  |   35 ++++++++++++++++++++++++++---------
>  fs/reiserfs/ioctl.c |   10 ++++------
>  fs/ubifs/ioctl.c    |   13 +++----------
>  include/linux/fs.h  |    3 +++
>  15 files changed, 146 insertions(+), 121 deletions(-)

The gfs2 portion looks correct.

Reviewed-by: Bob Peterson <rpeterso@redhat.com>

Regards,

Bob Peterson

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
