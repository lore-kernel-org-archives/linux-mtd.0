Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53294EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uk6mkZ5JGvJYvBTaovBOr7jk+NgUBmgeTRj23FXEx0Q=; b=lQWza/YQRaC+Iy
	RTiPBJ9dreLzrWWNRwebVBTaWpThKucXoaBx4T5g/xpfa4p21ySbYtIxC2V1THMLvFTTHbUmfzZAX
	2eQTMr8sdRlsIRut5VnWutM862KyuEFDMd4ehaHP0NKYZEVy9wyg44suOSCobqAY1XEie3vXSzgGv
	nzPfGfo/fccY8MWNHY0lR/RM9kgTn5mbhNA2rDImCYC6D4xsF7boC2Ljm4s/gOzQ7OwDMrT9RrwWL
	lWVBWY8TKswGbM78rRHaLms3ghWVm/763w/WJzsooVnEE7ab+osoOTTsmz/V9CG/zpRUP/gqIL23I
	/XqXPSgsMkgL+SMYSrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Z2-005gJK-05;
	Wed, 19 Jul 2023 06:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Z0-005gI1-0m
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xZssYNKocP7SJAjxckC3wBJ507CzulE9IvrMWjf3P+k=; b=Ay+rWR9PkrsKTwIrM18QYDHHmj
	mACWw161ZB/csGi4Ggv9LJCrkGUTdm2fUmuXTLmbRmWWRDZWI4S25FFogm+s2/O7VWSIgqSqLLZE5
	37YZ5OUfxNLrX6JjEj5Yg2lZ6XzrTutzz11rxdiCtYCl8CDYE48fH2wgV0RqZEf92qMZMJ6Lb4I8O
	DCD6mFkeejo9EK8TafINjlQd2r6/yxLYuFJt8XDaEWDH/jijnk6jD1gmeuhi0gYFd6N+CCfFHZc4E
	fvyfzW5g9P18sGuTKMRl5rpd9kZGOGUd8AWh4JNlIU64wdpBAnOG/hPzczsH5KlRNsKTz9L0ENsGs
	yZsNL1IA==;
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLw7S-00CPyt-0F
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 01:36:48 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1b0156a1c49so4832496fac.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1689730541; x=1692322541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZssYNKocP7SJAjxckC3wBJ507CzulE9IvrMWjf3P+k=;
        b=5Slf0Wf1DkEOl9A1TiQUYv8SMKm8hpMZkE2pdlrBFVPzzvpLYuiVjUXLVmHCw57mm3
         QfMAXPNPanSdHmq5ZWXmuM6TgukKEbveLzpwksx2dw9ZklwdjhA52vimEHT2eirBfa+2
         IT2vnquxNaJm7BjHGdah8DmKJSIjdo0Yp6c26+N05rt7PzrzOKrn94s8yKsSInPTUfNp
         YfGoevKBsYDtPuhIbewKvY1jLvJ5fb914inI0h60wc0+K8b0g/S/UYKcw11+BXpzkI08
         6FecWUvMm8TYFIR2erayRFzaDHDt6sysMcKT2DfDdd2VqMiXCbsW5RRwMl7laE7GyBrL
         HnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689730541; x=1692322541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZssYNKocP7SJAjxckC3wBJ507CzulE9IvrMWjf3P+k=;
        b=M+D0WucKLCaccO/TSmijtkg6tKaxENo9KKU9P3U5SpqNS72dlpeBFwoeoZvOWVAcZ0
         kCTdVeE63Il7gKG4KrNjIVxFDDb1KBfbGe/d6+4jSx+LeaKaKGG5lY3qPUb6vvytNJ9c
         FurA9xz//Gb7qHGnVVLxnFdkAiKPqZvfpv+6VSYz8udL87jDsgtyociWuAxMAzA5Kkkm
         9A2V9ndUfDLgVMUorkPy40DwbkMCjlMSZxMynyG2GuEQi98CYibALVynu90GNWnNP8v5
         MLW5GAzZ2Of+7x1wag5ZI9f+zljh9Kx9gkt7Z/u01lfI3GhrMnnh3aiqf3dmnCCEReqh
         bC6A==
X-Gm-Message-State: ABy/qLY/sXigqb2Aa09yQ+5PqxJTL6dtzATtSCxfHRJbIsjy/iWnFdWa
	j9LPwY3VyPbvkEzGBqVChMtVwA==
X-Google-Smtp-Source: APBJJlHb4gEwJfD+TL2icCrXL1rPSO1/If2sqk52+FC1gSV2ztjdma15fYoDbEqUpP5c7bsoFPcHEw==
X-Received: by 2002:a05:6870:96a6:b0:1b3:8d35:c85f with SMTP id o38-20020a05687096a600b001b38d35c85fmr1011777oaq.1.1689730541592;
        Tue, 18 Jul 2023 18:35:41 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au. [49.186.119.116])
        by smtp.gmail.com with ESMTPSA id 201-20020a6301d2000000b005633311c70dsm2343100pgb.32.2023.07.18.18.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 18:35:40 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qLw6L-007mcz-1V;
	Wed, 19 Jul 2023 11:35:37 +1000
Date: Wed, 19 Jul 2023 11:35:37 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
	Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@kernel.org>, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
	ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v5 6/8] xfs: switch to multigrain timestamps
Message-ID: <ZLc96V2Yo72sthsi@dread.disaster.area>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
 <20230713-mgctime-v5-6-9eb795d2ae37@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713-mgctime-v5-6-9eb795d2ae37@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_023646_364921_856B2677 
X-CRM114-Status: GOOD (  21.54  )
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

On Thu, Jul 13, 2023 at 07:00:55PM -0400, Jeff Layton wrote:
> Enable multigrain timestamps, which should ensure that there is an
> apparent change to the timestamp whenever it has been written after
> being actively observed via getattr.
> 
> Also, anytime the mtime changes, the ctime must also change, and those
> are now the only two options for xfs_trans_ichgtime. Have that function
> unconditionally bump the ctime, and warn if XFS_ICHGTIME_CHG is ever not
> set.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
>  fs/xfs/xfs_iops.c               | 4 ++--
>  fs/xfs/xfs_super.c              | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
> index 0c9df8df6d4a..86f5ffce2d89 100644
> --- a/fs/xfs/libxfs/xfs_trans_inode.c
> +++ b/fs/xfs/libxfs/xfs_trans_inode.c
> @@ -62,12 +62,12 @@ xfs_trans_ichgtime(
>  	ASSERT(tp);
>  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
>  
> -	tv = current_time(inode);
> +	/* If the mtime changes, then ctime must also change */
> +	WARN_ON_ONCE(!(flags & XFS_ICHGTIME_CHG));

Make that an ASSERT(flags & XFS_ICHGTIME_CHG), please. There's no
need to verify this at runtime on production kernels.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
