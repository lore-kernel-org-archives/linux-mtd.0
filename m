Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5BCDC165
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiCU8BUX2IMjWTjE11knzoWwes1ZTWEUseyuLbrQbYQ=; b=d6Ap7bMne/PvmG
	czooGwVhXWH4eAKIEgDI5GJH5hUMmP3l2dET9a2kLmAfjiGN2vIktGU2U9OYqPnCPd7ceExSGHRBS
	hp/SVp2I4OSD1IkkcY43m15SfKkfrX5Gy42MnOfHnNZebrAUf5t+jV/qoMqyQlcozLCFQVXs0Z5Rp
	njkh2nYeno3nzd76hc0JX0pILNpcpqZy19slzIy8MY6AH1Aos+mEwUBptYUbkgI5aG6yjCtzByzCP
	lFm7ujFNBtWBs1Hwr+t8DRk9F95tS3Fme8TS5A2iNz4Xo3civuZ8J4CkPuf/zKEoTQgqP1JFI5LIR
	nSMEpaKM4HStpUolQD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5YX-0000000Cv5T-0hQR;
	Tue, 06 Jan 2026 11:48:57 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5YT-0000000Cv57-3vqC
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 11:48:55 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1D785BCC3;
	Tue,  6 Jan 2026 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767700132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IP/eSkDYWNYVsv+citZDpQ6gmT70G3zQiek5WFeFPwk=;
	b=pTjJcLOVWJsvWsWm4yn2+rXb6RM2OMDkb39y5J55FCh51lojgYnWtlAbVgKVVe2ticu7q+
	+NGN56Fn5H2pbXmv3xdSEUnFGwWl8HLzXIUrpl3TqZuKQh15HTHIY2xios/2oua9qOGJzN
	yHeYpVlHUR7VWALebUokWP2uGHneLbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767700132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IP/eSkDYWNYVsv+citZDpQ6gmT70G3zQiek5WFeFPwk=;
	b=ysSfCKLwPHpibp7Yyz2eCK2ixmLd3g/t2F13fMJC9AJI+pA2t4DpZZt//+EW+ChEuVQ7jI
	FWaGyxUOHG2olsAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=rUfQLCR7;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=F3dvaPUH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767700131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IP/eSkDYWNYVsv+citZDpQ6gmT70G3zQiek5WFeFPwk=;
	b=rUfQLCR79sq3IBVB9bJaGGgMFH1iZK2wa6QLnSEgBO22jTgNOnIO1Nh8qyj2IHH+VngcN6
	D298On0Al/qHN0izAjkA8MGrFnGD7XNcP6gvUXIvUxe6P+ylsrb4Imz+EeflbpmDnHpdkv
	sJhKT9C2OM9ARIy3PktUFym3xVogZoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767700131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IP/eSkDYWNYVsv+citZDpQ6gmT70G3zQiek5WFeFPwk=;
	b=F3dvaPUHzMknwlplTR8NIYZmCiGNQ/GyNeJRL0aDYtxXVBUMWI7bEuvJu7+NlysvR+0Do6
	d9obg//P8ifHy9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 940493EA63;
	Tue,  6 Jan 2026 11:48:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PGfXI6P2XGkkZQAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 06 Jan 2026 11:48:51 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 4774CA08E3; Tue,  6 Jan 2026 12:48:47 +0100 (CET)
Date: Tue, 6 Jan 2026 12:48:47 +0100
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
Subject: Re: [PATCH 05/11] fs: refactor ->update_time handling
Message-ID: <jlw4ghr5vx32ss576akxes25oodlcx42zak7vjaaktlgn3m3d7@cbpcvx66y7za>
References: <20260106075008.1610195-1-hch@lst.de>
 <20260106075008.1610195-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106075008.1610195-6-hch@lst.de>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email,lst.de:email];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[lst.de:email,suse.com:email,suse.cz:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A1D785BCC3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_034854_149335_D9EDFB2D 
X-CRM114-Status: GOOD (  21.52  )
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

On Tue 06-01-26 08:49:59, Christoph Hellwig wrote:
> Pass the type of update (atime vs c/mtime plus version) as an enum
> instead of a set of flags that caused all kinds of confusion.
> Because inode_update_timestamps now can't return a modified version
> of those flags, return the I_DIRTY_* flags needed to persist the
> update, which is what the main caller in generic_update_time wants
> anyway, and which is suitable for the other callers that only want
> to know if an update happened.
> 
> The whole update_time path keeps the flags argument, which will be used
> to support non-blocking updates soon even if it is unused, and (the
> slightly renamed) inode_update_time also gains the possibility to return
> a negative errno to support this.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

...

> +static int inode_update_cmtime(struct inode *inode)
> +{
> +	struct timespec64 now = inode_set_ctime_current(inode);

This needs to be below sampling of ctime. Otherwise inode dirtying will be
broken...

> +	struct timespec64 ctime = inode_get_ctime(inode);
> +	struct timespec64 mtime = inode_get_mtime(inode);
> +	unsigned int dirty = 0;
> +	bool mtime_changed;
> +
> +	mtime_changed = !timespec64_equal(&now, &mtime);
> +	if (mtime_changed || !timespec64_equal(&now, &ctime))
> +		dirty = inode_time_dirty_flag(inode);
> +	if (mtime_changed)
> +		inode_set_mtime_to_ts(inode, now);
> +
> +	if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, !!dirty))
> +		dirty |= I_DIRTY_SYNC;
> +
> +	return dirty;
> +}

Otherwise the patch looks good to me.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
