Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6D3C47BE6
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsHUD8kxqaCBzHDllywZdMkDpumSLbyiPxuJM6dQfMA=; b=hBfS+5MlvAjHGo
	sPDvLUdqJc6MlHEClNoie2OrOg1nqNZRTGzW86fc88KY3EY+tLVbKVyfZXjMpiOJzdPnbOqCzfP6R
	Iezn7zZyGCrnr5xG88Lg2TKXpFqP7IBxhDfEBBsnjWXIP8W40LRYobkdVsqG+pJ1LfJ6eTG7N4C/i
	hZlEf57RNE9kGEJt8QPISvoEB69klMDpqrp2guBIxeSdpUDD9a+LuZn1KEo5fOjN+q4oJ6lDfMPHd
	4siE5FJ16aVzwbMlpWK8zYilFM53JoG5t6g27pUhcKfXPkUO3LzAhxToOWTTSA4yAnMfwHlQdDzbv
	dvrwovTcdoS7Gi/F3XHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Br-0000000CsK3-18cP;
	Tue, 06 Jan 2026 11:25:31 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Bp-0000000CsJf-120x
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 11:25:30 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1B37339E3;
	Tue,  6 Jan 2026 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767698725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoqXUEQw/gQR60sCiYmykJAdx2Xen1POCWIrlnDZAIU=;
	b=fozyANzamKrH9z26sjY+XY02xX6to9o9MnqnwMGY3gpMULSzrHujo9FJlK0g5RBRoKFlNw
	C/SvQqwis+2NZ5GGBP6Ydu/N1sBy4J/d5QHzvos/FlZ5mIP4xAQ7VCD1V9CTxUB+feKXz7
	eaMyXYobIUrohY+zRT5LrpDNDVSQ8n4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767698725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoqXUEQw/gQR60sCiYmykJAdx2Xen1POCWIrlnDZAIU=;
	b=qJzI0cfAz/dmdD1tZAK6iWv9YlNzzc+RX7xqMf8ummvmrPSiG8Qx6sJrYuMhgAR4fRfPUS
	438iJDJQxKqnQ6DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767698725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoqXUEQw/gQR60sCiYmykJAdx2Xen1POCWIrlnDZAIU=;
	b=fozyANzamKrH9z26sjY+XY02xX6to9o9MnqnwMGY3gpMULSzrHujo9FJlK0g5RBRoKFlNw
	C/SvQqwis+2NZ5GGBP6Ydu/N1sBy4J/d5QHzvos/FlZ5mIP4xAQ7VCD1V9CTxUB+feKXz7
	eaMyXYobIUrohY+zRT5LrpDNDVSQ8n4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767698725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoqXUEQw/gQR60sCiYmykJAdx2Xen1POCWIrlnDZAIU=;
	b=qJzI0cfAz/dmdD1tZAK6iWv9YlNzzc+RX7xqMf8ummvmrPSiG8Qx6sJrYuMhgAR4fRfPUS
	438iJDJQxKqnQ6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B536C3EA63;
	Tue,  6 Jan 2026 11:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M7g5LCXxXGkSUAAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 06 Jan 2026 11:25:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 75210A08E3; Tue,  6 Jan 2026 12:25:25 +0100 (CET)
Date: Tue, 6 Jan 2026 12:25:25 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev, io-uring@vger.kernel.org, 
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 03/11] nfs: split nfs_update_timestamps
Message-ID: <wct2d2jrwausxgwusbnepzuegelkcl3s2veaixgrzehl6qcjyp@affaed5rinqo>
References: <20260106075008.1610195-1-hch@lst.de>
 <20260106075008.1610195-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106075008.1610195-4-hch@lst.de>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.984];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_032529_440684_AF945E63 
X-CRM114-Status: GOOD (  21.93  )
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

On Tue 06-01-26 08:49:57, Christoph Hellwig wrote:
> The VFS paths update either the atime or ctime and mtime but never mix
> between atime and the others.  Split nfs_update_timestamps to match this
> to prepare for cleaning up the VFS interfaces.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/nfs/inode.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index 84049f3cd340..3be8ba7b98c5 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -669,35 +669,31 @@ static void nfs_set_timestamps_to_ts(struct inode *inode, struct iattr *attr)
>  	NFS_I(inode)->cache_validity &= ~cache_flags;
>  }
>  
> -static void nfs_update_timestamps(struct inode *inode, unsigned int ia_valid)
> +static void nfs_update_atime(struct inode *inode)
>  {
> -	enum file_time_flags time_flags = 0;
> -	unsigned int cache_flags = 0;
> +	inode_update_timestamps(inode, S_ATIME);
> +	NFS_I(inode)->cache_validity &= ~NFS_INO_INVALID_ATIME;
> +}
>  
> -	if (ia_valid & ATTR_MTIME) {
> -		time_flags |= S_MTIME | S_CTIME;
> -		cache_flags |= NFS_INO_INVALID_CTIME | NFS_INO_INVALID_MTIME;
> -	}
> -	if (ia_valid & ATTR_ATIME) {
> -		time_flags |= S_ATIME;
> -		cache_flags |= NFS_INO_INVALID_ATIME;
> -	}
> -	inode_update_timestamps(inode, time_flags);
> -	NFS_I(inode)->cache_validity &= ~cache_flags;
> +static void nfs_update_mtime(struct inode *inode)
> +{
> +	inode_update_timestamps(inode, S_MTIME | S_CTIME);
> +	NFS_I(inode)->cache_validity &=
> +		~(NFS_INO_INVALID_CTIME | NFS_INO_INVALID_MTIME);
>  }
>  
>  void nfs_update_delegated_atime(struct inode *inode)
>  {
>  	spin_lock(&inode->i_lock);
>  	if (nfs_have_delegated_atime(inode))
> -		nfs_update_timestamps(inode, ATTR_ATIME);
> +		nfs_update_atime(inode);
>  	spin_unlock(&inode->i_lock);
>  }
>  
>  void nfs_update_delegated_mtime_locked(struct inode *inode)
>  {
>  	if (nfs_have_delegated_mtime(inode))
> -		nfs_update_timestamps(inode, ATTR_MTIME);
> +		nfs_update_mtime(inode);
>  }
>  
>  void nfs_update_delegated_mtime(struct inode *inode)
> @@ -747,7 +743,10 @@ nfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  						ATTR_ATIME|ATTR_ATIME_SET);
>  			}
>  		} else {
> -			nfs_update_timestamps(inode, attr->ia_valid);
> +			if (attr->ia_valid & ATTR_MTIME)
> +				nfs_update_mtime(inode);
> +			if (attr->ia_valid & ATTR_ATIME)
> +				nfs_update_atime(inode);
>  			attr->ia_valid &= ~(ATTR_MTIME|ATTR_ATIME);
>  		}
>  		spin_unlock(&inode->i_lock);
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
