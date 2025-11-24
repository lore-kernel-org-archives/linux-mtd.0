Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470FFCFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6079HmqmEikTZmDqy8fPds74pGEVn2V6JxI/kjrQMI=; b=ON/cS3+qq5mWjQ
	be/1OV3mkK9VXfod7kX4wcXd/alsvnVSc631qBlMzCZqdQhtHv0vl0CY/Gz6eRWq+fosABvaF2kg5
	fBVClmA3ROEX/seuS7zfbRhUqBndSny597QUlscvy8wBYQDvwKT+9LUpErBAn6dX+0g9uL6EH8x2y
	s8c/sTUNV8NUI7IK0iQsb4/X+LegLLPhDbgu7uybA8MCUZwhMPRIiVBkrDVO/bnwwEMtxJJbuiY86
	kg1FMTOzC1v2ztoLhR3WbxnMkuSOS0kn5ojNuXl84G/lNXnQ8i579pnXXASukCwwOsNbV7A+du1dj
	NGx7K0XU2uBFZBW1HnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWez-0000000Bkyi-0XM0;
	Mon, 24 Nov 2025 13:31:17 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWev-0000000Bkxx-31qH
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:31:15 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 698F822389;
	Mon, 24 Nov 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763991071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mf2fLCJ+jeW81FuVPLBs9rqu8dErI3KF//hwSxw3Imc=;
	b=vRufgBFlaBhxgVGfhXTPC9H1e0YBN8wrCoZ9A7r8z1KFJq3nEkneIVhIKeTw5zDfxirmQc
	Ugxys06Yko6/NKvP2ZC5pnyLfUGQTaNhBTZBuiwHH+0cxoh0BnYCenbgbg6EdZPIf+/NKK
	Uo1pLM86/odX1QvwaKCE/DcUARsz+9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763991071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mf2fLCJ+jeW81FuVPLBs9rqu8dErI3KF//hwSxw3Imc=;
	b=stlPtU5zigKUXL5Qb6dtWRjcSQQfKulrzaSKJC0dlGKt98uFqgP0iiOk5olJTkYT/kXTSO
	L+p/jaqSmw1K0FCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vRufgBFl;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=stlPtU5z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763991071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mf2fLCJ+jeW81FuVPLBs9rqu8dErI3KF//hwSxw3Imc=;
	b=vRufgBFlaBhxgVGfhXTPC9H1e0YBN8wrCoZ9A7r8z1KFJq3nEkneIVhIKeTw5zDfxirmQc
	Ugxys06Yko6/NKvP2ZC5pnyLfUGQTaNhBTZBuiwHH+0cxoh0BnYCenbgbg6EdZPIf+/NKK
	Uo1pLM86/odX1QvwaKCE/DcUARsz+9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763991071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mf2fLCJ+jeW81FuVPLBs9rqu8dErI3KF//hwSxw3Imc=;
	b=stlPtU5zigKUXL5Qb6dtWRjcSQQfKulrzaSKJC0dlGKt98uFqgP0iiOk5olJTkYT/kXTSO
	L+p/jaqSmw1K0FCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 597873EA63;
	Mon, 24 Nov 2025 13:31:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fFZ5FR9eJGnvWAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 13:31:11 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id C5EE0A0A04; Mon, 24 Nov 2025 14:31:02 +0100 (CET)
Date: Mon, 24 Nov 2025 14:31:02 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 10/14] fs: factor out a sync_lazytime helper
Message-ID: <vkobnnw3ij2n47bhhooawbw546dgwzii32nfqcx4bduoga5d7r@vdo5ryq4mffz>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-11-hch@lst.de>
X-Rspamd-Queue-Id: 698F822389
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,suse.com:email,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_053114_758860_3343293E 
X-CRM114-Status: GOOD (  17.38  )
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

On Fri 14-11-25 07:26:13, Christoph Hellwig wrote:
> Centralize how we synchronize a lazytime update into the actual on-disk
> timestamp into a single helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

...

>  	/*
> -	 * If the inode has dirty timestamps and we need to write them, call
> -	 * mark_inode_dirty_sync() to notify the filesystem about it and to
> -	 * change I_DIRTY_TIME into I_DIRTY_SYNC.
> +	 * For data integrity writeback, or when the dirty interval expired,
> +	 * ask the file system to propagata lazy timestamp updates into real
> +	 * dirty state.
>  	 */
> -	if ((inode->i_state & I_DIRTY_TIME) &&
> -	    (wbc->sync_mode == WB_SYNC_ALL ||
> -	     time_after(jiffies, inode->dirtied_time_when +
> -			dirtytime_expire_interval * HZ))) {
> -		trace_writeback_lazytime(inode);
> -		mark_inode_dirty_sync(inode);
> -	}
> +	if (wbc->sync_mode == WB_SYNC_ALL ||
> +	    time_after(jiffies, inode->dirtied_time_when +
> +			dirtytime_expire_interval * HZ))
> +		sync_lazytime(inode);

The checking of inode->dirtied_time_when for inode potentially without
I_DIRTY_TIME set (and thus with unclear value of dirtied_time_when) is kind
of odd. It is harmless but IMO still not a good practice. Can't we keep
this condition as is and just call sync_lazytime()?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
