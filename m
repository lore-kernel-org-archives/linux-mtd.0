Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8589D1D484
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rH1bzS/mddpUa/VOmIMwNedqFmAu2NyZKN0YQnUwa8=; b=r2eX9fRIKkexw8
	Aq/Eew40zxrNyxX7nrceq/CSr5MR6n9wpSuEByBNNp5Vp9j11NMDuuCN6p1oezW35DTQkAoCUmco7
	rPdI0PaNsROrGxSQtei8DVXr4gypiGq3FSd7edJaWjuvwq2suq2/oXZFBy4izjHMYIBWF9c2lTdK4
	OGq6W+KxWjnzJS80jcmZiMeKslyWnPBtCpr5lJ0PoQUYM5xV5gZduA5/W04DEGNxyJRQWV+dWAT/m
	pKpvYGviG70gI98PpWNWGXCQXQAmYX0sa1Fk9JcvgcNVp5CYIduugLZif5LEYmioeLX1xLzx5arHI
	2Bw+bqsbEn4+gblnh7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduV1-00000000ZRc-2aXW;
	Thu, 08 Jan 2026 18:12:43 +0000
Received: from mail.parknet.co.jp ([210.171.160.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduUy-00000000ZQK-1BFT
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 18:12:42 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 4677D26F765D;
	Fri,  9 Jan 2026 03:12:33 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1767895953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VE+eLbPxS+2/NxdS4iC5ykEp/h4Ri6SH4uWUI0CKCww=;
	b=gca1nAhL0iYeKhrMxVW/YkNVQGsmR2FtA0K2e0pt9zd3L8VZwxpcEfUTVG6wgn+2tFPTSO
	HeW+ni5Q59lRV2kUjNcId9ow+1k5DhIo1N5oAHHp1l0frRz0p+GdCrJ5yDI66gxE8KEOn7
	v8zc7gU5ici9xYmL+L7s3KQ9RND4Zj9v/GNEYNheUomswbwI2MAFPIY0boWLymkQQnV9lD
	55Q1xjqtAMVsY4vr4S+L3pqkV4l+GHZ+5Sx/JiLr+J5yUBW4ypUc8Y8oNHBEL1KgKVh31j
	qSpaEXlZVcdannHzIb1g2WajxumAtmJFSTEQRXXN49o5ilDnu6uppAB9swxKLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1767895953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VE+eLbPxS+2/NxdS4iC5ykEp/h4Ri6SH4uWUI0CKCww=;
	b=dpcKqiHv5kPZON+sXPbBLz5lebhV2Omji1CcWNcfUdqkirKgF5cr6kEKLmZbrHERXCyoN2
	F8vLjq1Lz09KhaCQ==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 608ICUsL013625
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 9 Jan 2026 03:12:31 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 608ICTic019851
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 9 Jan 2026 03:12:29 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 608ICKe4019849;
	Fri, 9 Jan 2026 03:12:20 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis de Bethencourt <luisbg@kernel.org>,
        Salah Triki
 <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        Christoph
 Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>,
        Anders Larsen
 <al@alarsen.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian
 Brauner <brauner@kernel.org>,
        David Sterba <dsterba@suse.com>, Chris
 Mason <clm@fb.com>,
        Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>,
        Yue Hu <zbestahu@gmail.com>, Jeffle Xu
 <jefflexu@linux.alibaba.com>,
        Sandeep Dhavale <dhavale@google.com>,
        Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
        Jan Kara <jack@suse.com>, "Theodore Ts'o" <tytso@mit.edu>,
        Andreas Dilger
 <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        David
 Woodhouse <dwmw2@infradead.org>,
        Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi
 <konishi.ryusuke@gmail.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Mark
 Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
        Joseph Qi
 <joseph.qi@linux.alibaba.com>,
        Mike Marshall <hubcap@omnibond.com>,
        Martin Brandenburg <martin@omnibond.com>,
        Miklos Szeredi
 <miklos@szeredi.hu>,
        Amir Goldstein <amir73il@gmail.com>,
        Phillip
 Lougher <phillip@squashfs.org.uk>,
        Carlos Maiolino <cem@kernel.org>, Hugh Dickins <hughd@google.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Yuezhang Mo
 <yuezhang.mo@sony.com>,
        Chuck Lever <chuck.lever@oracle.com>,
        Alexander
 Aring <alex.aring@gmail.com>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Matthew Wilcox (Oracle)"
 <willy@infradead.org>,
        Eric Van Hensbergen <ericvh@kernel.org>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet
 <asmadeus@codewreck.org>,
        Christian Schoenebeck
 <linux_oss@crudebyte.com>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>,
        Trond Myklebust <trondmy@kernel.org>,
        Anna
 Schumaker <anna@kernel.org>, Steve French <sfrench@samba.org>,
        Paulo
 Alcantara <pc@manguebit.org>,
        Ronnie Sahlberg <ronniesahlberg@gmail.com>,
        Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
        Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
        linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
        ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
        linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-mm@kvack.org, gfs2@lists.linux.dev, linux-doc@vger.kernel.org,
        v9fs@lists.linux.dev, ceph-devel@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org
Subject: Re: [PATCH 09/24] fat: add setlease file operation
In-Reply-To: <20260108-setlease-6-20-v1-9-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
	<20260108-setlease-6-20-v1-9-ea4dec9b67fa@kernel.org>
Date: Fri, 09 Jan 2026 03:12:20 +0900
Message-ID: <875x9c3rej.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_101240_896619_2EA3C71D 
X-CRM114-Status: GOOD (  14.63  )
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

Jeff Layton <jlayton@kernel.org> writes:

> Add the setlease file_operation to fat_file_operations and
> fat_dir_operations, pointing to generic_setlease.  A future patch will
> change the default behavior to reject lease attempts with -EINVAL when
> there is no setlease file operation defined. Add generic_setlease to
> retain the ability to set leases on this filesystem.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

> ---
>  fs/fat/dir.c  | 2 ++
>  fs/fat/file.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/fs/fat/dir.c b/fs/fat/dir.c
> index 92b091783966af6a9e6f5ead1a382a98dd92bba0..807bc8b1bc145a9f15765920670c6233f7e87e55 100644
> --- a/fs/fat/dir.c
> +++ b/fs/fat/dir.c
> @@ -16,6 +16,7 @@
>  
>  #include <linux/slab.h>
>  #include <linux/compat.h>
> +#include <linux/filelock.h>
>  #include <linux/uaccess.h>
>  #include <linux/iversion.h>
>  #include "fat.h"
> @@ -876,6 +877,7 @@ const struct file_operations fat_dir_operations = {
>  	.compat_ioctl	= fat_compat_dir_ioctl,
>  #endif
>  	.fsync		= fat_file_fsync,
> +	.setlease	= generic_setlease,
>  };
>  
>  static int fat_get_short_entry(struct inode *dir, loff_t *pos,
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index 4fc49a614fb8fd64e219db60c6d9e7dd100aea1c..d50a6d8bfaae0c75b2dbe838d108135206d0f123 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -13,6 +13,7 @@
>  #include <linux/mount.h>
>  #include <linux/blkdev.h>
>  #include <linux/backing-dev.h>
> +#include <linux/filelock.h>
>  #include <linux/fsnotify.h>
>  #include <linux/security.h>
>  #include <linux/falloc.h>
> @@ -212,6 +213,7 @@ const struct file_operations fat_file_operations = {
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fallocate	= fat_fallocate,
> +	.setlease	= generic_setlease,
>  };
>  
>  static int fat_cont_expand(struct inode *inode, loff_t size)

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
