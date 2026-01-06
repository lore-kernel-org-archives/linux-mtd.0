Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301B5CDC165
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOaG557j1jCTduqyjk+KpTYwsLEnXy5oTNqpNbF0AZU=; b=0wbEOf+VxSJR0u
	pRWDFTDbwFArvC54UTKLly/zBShszTGMtaTpnVnyA1JH9d7TJFn7pVWpZGt+61Z6pMV4F8Y1P/NJr
	QTMYmWBqPFmxWT4OYjDoLjuNDF2JT6hYyIwrnPKuioHQmlP3LWmE2RCZw6T2bzsXb1DfUcUr6ISn/
	K+mi8P84eqwfjS6SYMHM+VhyLaUmZEIQM4RKPx7KGEy0rhIwbVxZWKv6Q5CoujuN7P+yLxJ0TL3Q6
	DNTf6UKl28y2c+w/EZz+/F1JcR+jiwDenvhJKo+umNgbEimkM8fzdKewPIwm31Ti+fGO8mXe0DvW3
	6aOMv6KqvTBzi3sxr+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5aq-0000000CvHr-2c5r;
	Tue, 06 Jan 2026 11:51:20 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5an-0000000CvHR-2Txm
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 11:51:18 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91521339E5;
	Tue,  6 Jan 2026 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767700275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+KPeQENvV+O/84zcPgyGQayvwQOIDU8ipu7wxTPCxY=;
	b=EuFRxB0GBUUK/2ME9+pf5w/rKS4fGtRjcOEF5CfsS+nuBArE5Xg7veXeSQeEUfh4mjygKi
	uIWzlDgK8iC6bgLhv0RnCYwt1hXbCRlo1itouoYoCfk5goifKDdMXA+XAdf+lGEDL/XvUC
	7Tgvw/bftvZ1Ds1gnU3ZLy16qdbk2Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767700275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+KPeQENvV+O/84zcPgyGQayvwQOIDU8ipu7wxTPCxY=;
	b=XXAALmfoLa5a0x3HtN4Xc0A+EewD+8htszWLKg9qx2rcCs2uBbJDcqESKRnY4nd12f9uuG
	3aV/TTSmqx/NEfBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767700275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+KPeQENvV+O/84zcPgyGQayvwQOIDU8ipu7wxTPCxY=;
	b=EuFRxB0GBUUK/2ME9+pf5w/rKS4fGtRjcOEF5CfsS+nuBArE5Xg7veXeSQeEUfh4mjygKi
	uIWzlDgK8iC6bgLhv0RnCYwt1hXbCRlo1itouoYoCfk5goifKDdMXA+XAdf+lGEDL/XvUC
	7Tgvw/bftvZ1Ds1gnU3ZLy16qdbk2Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767700275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+KPeQENvV+O/84zcPgyGQayvwQOIDU8ipu7wxTPCxY=;
	b=XXAALmfoLa5a0x3HtN4Xc0A+EewD+8htszWLKg9qx2rcCs2uBbJDcqESKRnY4nd12f9uuG
	3aV/TTSmqx/NEfBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 853D43EA63;
	Tue,  6 Jan 2026 11:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R7eDIDP3XGmnZgAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 06 Jan 2026 11:51:15 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 3EDBEA08E3; Tue,  6 Jan 2026 12:51:00 +0100 (CET)
Date: Tue, 6 Jan 2026 12:51:00 +0100
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
Subject: Re: [PATCH 09/11] fs: refactor file_update_time_flags
Message-ID: <t3klyln4eejq7olm3bseuje2lao6jh3a26kpzkdqrnak5l2sdh@ehrk2o6mmxfw>
References: <20260106075008.1610195-1-hch@lst.de>
 <20260106075008.1610195-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106075008.1610195-10-hch@lst.de>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:email,suse.cz:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035117_776226_D774059B 
X-CRM114-Status: GOOD (  23.30  )
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

On Tue 06-01-26 08:50:03, Christoph Hellwig wrote:
> Split all the inode timestamp flags into a helper.  This not only
> makes the code a bit more readable, but also optimizes away the
> further checks as soon as know we need an update.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 01e4f6b9b46e..d2bfe302e647 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2378,31 +2378,30 @@ struct timespec64 current_time(struct inode *inode)
>  }
>  EXPORT_SYMBOL(current_time);
>  
> +static inline bool need_cmtime_update(struct inode *inode)
> +{
> +	struct timespec64 now = current_time(inode), ts;
> +
> +	ts = inode_get_mtime(inode);
> +	if (!timespec64_equal(&ts, &now))
> +		return true;
> +	ts = inode_get_ctime(inode);
> +	if (!timespec64_equal(&ts, &now))
> +		return true;
> +	return IS_I_VERSION(inode) && inode_iversion_need_inc(inode);
> +}
> +
>  static int file_update_time_flags(struct file *file, unsigned int flags)
>  {
>  	struct inode *inode = file_inode(file);
> -	struct timespec64 now, ts;
> -	bool need_update = false;
> -	int ret = 0;
> +	int ret;
>  
>  	/* First try to exhaust all avenues to not sync */
>  	if (IS_NOCMTIME(inode))
>  		return 0;
>  	if (unlikely(file->f_mode & FMODE_NOCMTIME))
>  		return 0;
> -
> -	now = current_time(inode);
> -
> -	ts = inode_get_mtime(inode);
> -	if (!timespec64_equal(&ts, &now))
> -		need_update = true;
> -	ts = inode_get_ctime(inode);
> -	if (!timespec64_equal(&ts, &now))
> -		need_update = true;
> -	if (IS_I_VERSION(inode) && inode_iversion_need_inc(inode))
> -		need_update = true;
> -
> -	if (!need_update)
> +	if (!need_cmtime_update(inode))
>  		return 0;
>  
>  	flags &= IOCB_NOWAIT;
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
