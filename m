Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0A1C04A94
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzsHgGdJxztxK39xcFqJx5Hbn0aOtkaxTfXlzuxjUpQ=; b=Kp7gsXxivLsXYW
	CYP4Mvgbmw5QenDOGHyUO1izse9FV0UBV65+ie5UKwAZbTO72R4xTlxzKj5cUqmBZuXhN9o3dqoqN
	+tecu+DT50iXqEbH9qO1eAbCFEnA6Aax2dBUyzM3okX1AK0ZJdAwR10f0igdmWZZmNXyxGU7neGYw
	BVWaKMd3JG8B63tEgnjL7jlEicpGCYlsaTrdz2JglXhhODi+b+boD7zxrRRkiWWq/HcFUtKPwrbaZ
	waKTGTT4dXtIM4h8crWptDVIhLGgyvBgp167slZa2ihXHOtH0HL0kLMO+58cw7hMa5yFuMvNyAPa2
	56oqg4B/oP/7CC1K1Q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIel-0026H4-0G;
	Tue, 08 Aug 2023 09:05:35 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIei-0026Fx-1u;
	Tue, 08 Aug 2023 09:05:34 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95DB722467;
	Tue,  8 Aug 2023 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691485527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcZ0MvDWAvHGz+Tvz5BQspV1+Y90atrQ/21gTPDSJ5A=;
	b=ltvgN98jUPLfVGzwkX2IMCxL1+gt7mU2eMGWerKExKXl9rFxELcQOOu6LDPvkVgELBTWMM
	RPR+CvNDbp+v8nhbcYMs5NsoZ+s9OQ/UvQVEgQ88doFw/btLczZrQg2i1eZV1+ZBjvbv6d
	v//UiKTWiNGL8LuYIfEW5snVicPsNCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691485527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcZ0MvDWAvHGz+Tvz5BQspV1+Y90atrQ/21gTPDSJ5A=;
	b=NtHl8v8fs0QRleiCInWaMqHlp3B+YiNNeUD28RUprosc+RMkGA1oFQ5OJqyi3S1c2mho42
	UGYfjYfTqGY9zJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 818AE13451;
	Tue,  8 Aug 2023 09:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XtCQH1cF0mRUDgAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 08 Aug 2023 09:05:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 215FCA0769; Tue,  8 Aug 2023 11:05:27 +0200 (CEST)
Date: Tue, 8 Aug 2023 11:05:27 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
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
	Tejun Heo <tj@kernel.org>,
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
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v7 01/13] fs: remove silly warning from current_time
Message-ID: <20230808090527.nvn6vd5wdw4o5b2m@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-1-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-1-d1dec143a704@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_020532_833333_794819C7 
X-CRM114-Status: GOOD (  17.19  )
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

On Mon 07-08-23 15:38:32, Jeff Layton wrote:
> An inode with no superblock? Unpossible!
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index d4ab92233062..3fc251bfaf73 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2495,12 +2495,6 @@ struct timespec64 current_time(struct inode *inode)
>  	struct timespec64 now;
>  
>  	ktime_get_coarse_real_ts64(&now);
> -
> -	if (unlikely(!inode->i_sb)) {
> -		WARN(1, "current_time() called with uninitialized super_block in the inode");
> -		return now;
> -	}
> -
>  	return timestamp_truncate(now, inode);
>  }
>  EXPORT_SYMBOL(current_time);
> 
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
