Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C50CFD318
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C33UQdGyI28kxvlBRT3fZaaBzjveoYIn2kbf35GCS5w=; b=YVCeFLcD+vI/G1
	GOSQ1CFM7iQiJilsobukl53rQruEPAmgOkgkY1nlnf0Kwzvi4ySVeEuZCiqZrXrQlVag/IVE8WvwC
	DkwBDY1d4Ua7t+ua2hinwM4tEWDp2aMxZLpVuG65d1T/4hjerDuNIvzZaayqiDMBXlttugRnrFswf
	NFM1qlr13F/gw3s3ia/RsMF7pqS6sjjXQZLoVzy6dfDmDFFXMECnzlvCAXKjk+ydtl8c3yfJp3azp
	B1ruwJ1y1iON9DcrdH2Xdnfx7vKepbxjG5xhcLtDQ0Am1uPVfZQjXSL2EZrdIy+89fxX7oqGHlBGe
	n1jlLy2gJ5stGdVc9SvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaUT-0000000C6yB-0Dkj;
	Mon, 24 Nov 2025 17:36:41 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaUP-0000000C6xo-2vCw
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 17:36:38 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B46B75BCC2;
	Mon, 24 Nov 2025 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1764005795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2IZs/iJywacdojXMvk6M27OfFIstOkeVS4WvVUZksU=;
	b=pAANx02dXtFmVRv/b9/4fjYVaw9bU37MXsjfLUgb9Cm1odeC+dn7vCZi8K1qqa4bAB6Pl+
	PqBFI/lIRYgRfEawFwH+UMghvcc/L7DAPq9DWBLx6yzeut/8sx8X1cpY1I9UXgigltupUu
	JnReC0hSGKvh/HAxZhite2NOXbb5sSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1764005795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2IZs/iJywacdojXMvk6M27OfFIstOkeVS4WvVUZksU=;
	b=4c/b4Sor5YE0OMWOxhE09AyRQJZAtjf+C7NRbXkGiEImIBGvtmrqI9n3KIFLTNyYlFmvYX
	CoxaZK82MJuNcOBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=pAANx02d;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="4c/b4Sor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1764005795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2IZs/iJywacdojXMvk6M27OfFIstOkeVS4WvVUZksU=;
	b=pAANx02dXtFmVRv/b9/4fjYVaw9bU37MXsjfLUgb9Cm1odeC+dn7vCZi8K1qqa4bAB6Pl+
	PqBFI/lIRYgRfEawFwH+UMghvcc/L7DAPq9DWBLx6yzeut/8sx8X1cpY1I9UXgigltupUu
	JnReC0hSGKvh/HAxZhite2NOXbb5sSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1764005795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2IZs/iJywacdojXMvk6M27OfFIstOkeVS4WvVUZksU=;
	b=4c/b4Sor5YE0OMWOxhE09AyRQJZAtjf+C7NRbXkGiEImIBGvtmrqI9n3KIFLTNyYlFmvYX
	CoxaZK82MJuNcOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 943783EA66;
	Mon, 24 Nov 2025 17:36:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VZwpJKOXJGmzRQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 17:36:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 0CB0CA0A04; Mon, 24 Nov 2025 18:36:31 +0100 (CET)
Date: Mon, 24 Nov 2025 18:36:31 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 10/14] fs: factor out a sync_lazytime helper
Message-ID: <zxcwflyr4gjglqmpjnr6vgcb6iv3zu5iub4yf35i2kdhn37ox5@rudbrvydeev5>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-11-hch@lst.de>
 <vkobnnw3ij2n47bhhooawbw546dgwzii32nfqcx4bduoga5d7r@vdo5ryq4mffz>
 <20251124140924.GB14417@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124140924.GB14417@lst.de>
X-Rspamd-Queue-Id: B46B75BCC2
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_093637_886237_1B715CE1 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon 24-11-25 15:09:24, Christoph Hellwig wrote:
> On Mon, Nov 24, 2025 at 02:31:02PM +0100, Jan Kara wrote:
> > > +	if (wbc->sync_mode == WB_SYNC_ALL ||
> > > +	    time_after(jiffies, inode->dirtied_time_when +
> > > +			dirtytime_expire_interval * HZ))
> > > +		sync_lazytime(inode);
> > 
> > The checking of inode->dirtied_time_when for inode potentially without
> > I_DIRTY_TIME set (and thus with unclear value of dirtied_time_when) is kind
> > of odd. It is harmless but IMO still not a good practice. Can't we keep
> > this condition as is and just call sync_lazytime()?
> 
> As in keeping the I_DIRTY_TIME in the caller?  Sure, I could do that.

Yes, keeping I_DIRTY_TIME check at this call site.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
