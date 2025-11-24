Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8334ECFD313
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZvZdTWAchCW3sYSqn0PG0hCCrZK+JBvZDrBLt6mxBg=; b=PLNrPjekRhrQe+
	Xr9/7EfelfkANfRX/UQammaTmUBslv1QnFNzYWQ3piByGaql/MgQ8guL3BABN2wmwO1spLEEsen0m
	768qRhkDjQKzsSjU7CvpBkiulzoHgMF3nw34sL9803YEiuyCd5ciKTSOlXyg/3fpwGXRFCln9cJB/
	GdZ2ke48pAKEppcfonyDPbCEv2qov9WloqdK7dMBAUNsKWbxyn5WwYO6beEY2kpqQQOr9nNZfS7As
	bFUa9en1BvVaOY2QQsX+Q5C4lA0sgVPo1hRdqoGRZw/db+LiOz7eVhVc/GAW9HpV5WX2/fi+zpG+N
	a0ArbpQaIkqPpSBYrGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV9d-0000000Bacv-01XT;
	Mon, 24 Nov 2025 11:54:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV9a-0000000Baco-3zNt
	for linux-mtd@bombadil.infradead.org;
	Mon, 24 Nov 2025 11:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UXYEPN98/ffLRAchbjONXb8GdDC3sz8Urgjhuu0aKFE=; b=Dg6yV9uN3EN6dTc729E85btF2C
	GVAZP8avlqLCPUlu5YSy5DWYraCFRsS3ztMq9jTE90ebpjCifG/eTJ6iNRnhwMZ075xh3dx8BCMPq
	6PSmJu8HvpLXw3GV//U0Jc2Fl1JevjBJjRKGMSLLE1Ny2n1PBTPt1D31b4s+mfClTusvHKVpIRN/+
	BwQyqLNtCTXUNJ81XIlP7mFghzsyfU51EHFnQgcdSHE1aqndupXV75hvGCWwKH237c6RTiF4TZxVz
	wWLiRMHfdGEsY75u99OgXJP/UGm2M7y8XmGxNKgbwg/gvEscsXhzgXMeq+eWoZQm2kH6lqkLPuXcp
	XN8YQYvg==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUHw-00000003ZVL-35qc
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 10:59:22 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04E29221FA;
	Mon, 24 Nov 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763985282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXYEPN98/ffLRAchbjONXb8GdDC3sz8Urgjhuu0aKFE=;
	b=nQd4dI8DzJbdvL++gxBupED3DPdhib7fD06cyCs0h9+4MN1ilgsjN/1hHFOfgUsryiQOMn
	0oSQJt8E+C1Ui679UmjM0nZVYnfvcocnkRXAZpuQJPNngwiTZssrE8OjptnkjK4kZXiJ91
	6WyMUiGfX0Nl8X51sLHBz1930iLxkL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763985282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXYEPN98/ffLRAchbjONXb8GdDC3sz8Urgjhuu0aKFE=;
	b=Fz2/KMrdt2j6cWkJ87K4G33qKvWiMXMGPx1hWcvQ5xLnuC6o2129T7ADGgZM6sNvodCi2n
	RK+q/LJeMA4MkGAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763985282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXYEPN98/ffLRAchbjONXb8GdDC3sz8Urgjhuu0aKFE=;
	b=nQd4dI8DzJbdvL++gxBupED3DPdhib7fD06cyCs0h9+4MN1ilgsjN/1hHFOfgUsryiQOMn
	0oSQJt8E+C1Ui679UmjM0nZVYnfvcocnkRXAZpuQJPNngwiTZssrE8OjptnkjK4kZXiJ91
	6WyMUiGfX0Nl8X51sLHBz1930iLxkL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763985282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXYEPN98/ffLRAchbjONXb8GdDC3sz8Urgjhuu0aKFE=;
	b=Fz2/KMrdt2j6cWkJ87K4G33qKvWiMXMGPx1hWcvQ5xLnuC6o2129T7ADGgZM6sNvodCi2n
	RK+q/LJeMA4MkGAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E96113EA61;
	Mon, 24 Nov 2025 11:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +gv3OIFHJGk+eAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 11:54:41 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 9F186A0A04; Mon, 24 Nov 2025 12:54:33 +0100 (CET)
Date: Mon, 24 Nov 2025 12:54:33 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 02/14] fs: lift the FMODE_NOCMTIME check into
 file_update_time_flags
Message-ID: <5wv5u2sto54yelpzkxtdoekhfix7tsh5v7cyjrbnbvdvqmlssz@zpomezchur2d>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-3-hch@lst.de>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:email,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_105920_892548_697DB4FA 
X-CRM114-Status: GOOD (  26.79  )
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

On Fri 14-11-25 07:26:05, Christoph Hellwig wrote:
> FMODE_NOCMTIME used to be just a hack for the legacy XFS handle-based
> "invisible I/O", but commit e5e9b24ab8fa ("nfsd: freeze c/mtime updates
> with outstanding WRITE_ATTRS delegation") started using it from
> generic callers.
> 
> I'm not sure other file systems are actually read for this in general,
						^^ ready

> so the above commit should get a closer look, but for it to make any
> sense, file_update_time needs to respect the flag.
> 
> Lift the check from file_modified_flags to file_update_time so that
> users of file_update_time inherit the behavior and so that all the
> checks are done in one place.
> 
> Fixes: e5e9b24ab8fa ("nfsd: freeze c/mtime updates with outstanding WRITE_ATTRS delegation")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reagrdless whether FMODE_NOCMTIME works properly for all filesystems this
looks like a sensible step so feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 4884ffa931e7..24dab63844db 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2320,6 +2320,8 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
>  	/* First try to exhaust all avenues to not sync */
>  	if (IS_NOCMTIME(inode))
>  		return 0;
> +	if (unlikely(file->f_mode & FMODE_NOCMTIME))
> +		return 0;
>  
>  	now = current_time(inode);
>  
> @@ -2391,8 +2393,6 @@ static int file_modified_flags(struct file *file, int flags)
>  	ret = file_remove_privs_flags(file, flags);
>  	if (ret)
>  		return ret;
> -	if (unlikely(file->f_mode & FMODE_NOCMTIME))
> -		return 0;
>  	return file_update_time_flags(file, flags);
>  }
>  
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
