Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD760CFD313
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qG43o9kh94LeLXfgHj7FaJsWroHJH5TlczzSTwXsFTo=; b=QAycj609pOQejO
	GaLu41Zz+4Xd6LFUVjXbxdT3CTWP4BackG0gfCjLnjjWQ71liHjTEoYgy9coBdQiTKbVccZz9fAfh
	sX4vA37NxeMmDrxYTcl9CpkJI7YMFPQz6tzVgEmClvJ/zOUfwaosd/UxiolLSFzk4Q2i5VrlIYMPg
	tX/ImrIHaNBDu7Fe96F7WH6q2NQhTdjpFnOpLdVm+OLHMphtRCFumds3HiTyZY1IF6jPXSh2yrE6G
	K2m+9+QGW/anzMNdgAD1hLdXgS9F4a4+0NVt6FPuHKaImdDIugWQs7CoNoWLrhI6Dj4rLRcL2Jq+2
	/JevJzjzgiyNdBhD58rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVAY-0000000Baia-1Zmh;
	Mon, 24 Nov 2025 11:55:46 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVAW-0000000Bai9-1rfe
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 11:55:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA3AD22203;
	Mon, 24 Nov 2025 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763985342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSUPBmRRhIf3ICzzSYYy0DbSuL+mqFQp5j6Y0ShZy6E=;
	b=WI9Sk9ODhAZPXGcq2Uode+O4iGyCcBzVhbzC3h8GAOEBiYvVpfXKiRe8jBsMLN7hSepHLz
	+v5QDDr2u2aZD5thgkLWP1FJLHNNs8e1pnwAdmbYJ558++fLA7ORafIEtJgfb9ZXcVSevv
	L/FjtSOvJI0g5DezkIwfh2ayJrZHxio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763985342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSUPBmRRhIf3ICzzSYYy0DbSuL+mqFQp5j6Y0ShZy6E=;
	b=ceIKiGx6KtbIc5uyM2x7HuBPAGghSBS5JgIOX/IbzPVY4TtLF55rjW+P7YCYF48kGDDfQi
	wg8munLWghiTYhDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=eTdsu0ye;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=T81JUWIF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763985341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSUPBmRRhIf3ICzzSYYy0DbSuL+mqFQp5j6Y0ShZy6E=;
	b=eTdsu0yeva+luYdBPL8M1psPiYjwoFEZip2zMuorcl8iynrpI6aI/27CwYvTSZtJVFz49L
	tRmGA9RI7Ve6tuRRWVmWh4GzolqrCwHorKgyIaUPT30hPJ4gwaeBS3TRlQd77lFCH3hHIC
	BO8dcQRHGHJIMg+18JCvMPJottMryPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763985341;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSUPBmRRhIf3ICzzSYYy0DbSuL+mqFQp5j6Y0ShZy6E=;
	b=T81JUWIFnNs+SNkU2Bx6IJ4Am3lWR/ot19FIPWXfW+o9hO0fRdLlZrFislT88rt29pzsuP
	7qKqx0solKmBwVDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DDF6E3EA61;
	Mon, 24 Nov 2025 11:55:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 40MuNr1HJGkOeQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 11:55:41 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A132AA0A04; Mon, 24 Nov 2025 12:55:37 +0100 (CET)
Date: Mon, 24 Nov 2025 12:55:37 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 03/14] fs: export vfs_utimes
Message-ID: <yspsdu6slp6ppotn5igefg7cnhx7obqspdzcl5vrf3n5i7dl5k@4emnh56gf56f>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-4-hch@lst.de>
X-Rspamd-Queue-Id: EA3AD22203
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:email];
	RCVD_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_035544_627077_CEDED14A 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri 14-11-25 07:26:06, Christoph Hellwig wrote:
> This will be used to replace an incorrect direct call into
> generic_update_time in btrfs.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Sure. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/utimes.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/utimes.c b/fs/utimes.c
> index c7c7958e57b2..3e7156396230 100644
> --- a/fs/utimes.c
> +++ b/fs/utimes.c
> @@ -76,6 +76,7 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
>  out:
>  	return error;
>  }
> +EXPORT_SYMBOL_GPL(vfs_utimes);
>  
>  static int do_utimes_path(int dfd, const char __user *filename,
>  		struct timespec64 *times, int flags)
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
