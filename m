Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F98CCF2DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pv2uPRj9gKeC/d6Srwhc3JQ06YvtGkLfQcsv3BDKCBo=; b=x7O2g03N6bkEnb
	8zwzxUdL0XXLJSUJagJC51NKvybwZhMJP3bAZvNqPyr0ZSAzmkTa4CjFL1MW4w1kvOS1tMuozl1IQ
	7EaQXSGMebIWXRpRM/LLifxYLLYWvWEu67FtxXv39lKvt+IPR2+jo9y6SmKYRQ+X0QXjeNtQ2Uoix
	wOAEP4oQruhJJKwaBKMeJ66UMnUrf/+KOkIgOlsEZKoREuAFPbRRPFC3y3XzHxnkPeI39EBATFpPq
	/QY3526wiHK3NK8m5DfWFa2Bcf2mBwY0zPqTB6mOf9oic7jSh50jAcvSw4EaLiBYLCCYE1iJZMxiP
	fuXvwIrRjmH6A3B2ierw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIk2m-000000074Bw-1GPP;
	Mon, 19 Oct 2026 09:52:36 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIk2j-000000074BD-3HBK
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 09:52:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6896E1F44E;
	Mon, 19 Oct 2026 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1792403550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/XjywU63jHK3zYfOZqk/GFYoCnttMlmfWvXQ5qlU98=;
	b=DapX6O+Ip4pKRXdlJVwKoYbFSgZmnci+oTZVGWx9N//wk+3Co0A6Gy6VjLwyPbJnXuzAkL
	nK/2Yk9eDEsEWraU+H6ro4FbaBRxl+xMkoYT76R16fauUCeKeP7bK2SBFwKH5znABsckFq
	6f8cRPlmgFApKa7bh+P/Y4scW5VQEgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1792403550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/XjywU63jHK3zYfOZqk/GFYoCnttMlmfWvXQ5qlU98=;
	b=HkvNOVKWZPcLczlyzJhxbC7tMzVsoibO8LGhYXd0PSctA5J8hm3Rc9LMb4abX/F22nZPqn
	qBMliAhGPtxMP+Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1792403550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/XjywU63jHK3zYfOZqk/GFYoCnttMlmfWvXQ5qlU98=;
	b=DapX6O+Ip4pKRXdlJVwKoYbFSgZmnci+oTZVGWx9N//wk+3Co0A6Gy6VjLwyPbJnXuzAkL
	nK/2Yk9eDEsEWraU+H6ro4FbaBRxl+xMkoYT76R16fauUCeKeP7bK2SBFwKH5znABsckFq
	6f8cRPlmgFApKa7bh+P/Y4scW5VQEgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1792403550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/XjywU63jHK3zYfOZqk/GFYoCnttMlmfWvXQ5qlU98=;
	b=HkvNOVKWZPcLczlyzJhxbC7tMzVsoibO8LGhYXd0PSctA5J8hm3Rc9LMb4abX/F22nZPqn
	qBMliAhGPtxMP+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F3B4134B3;
	Mon, 19 Oct 2026 09:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id emzKBV7o1WpYOgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 19 Oct 2026 09:52:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id BB917A1413; Mon, 19 Oct 2026 11:52:25 +0200 (CEST)
Date: Mon, 19 Oct 2026 11:52:25 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 20/28] gfs2: wait for a pending withdraw before
 remounting read-only
Message-ID: <wauqpgtmmf2beg3pc2kqlbizrigd4ew26do4zqch5ilwdjy4cd@brolwbx25sem>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-20-60743a3dc326@kernel.org>
 <CAHc6FU5bdAjABRm=bnH68b2f66TZTDZ8sPdatLB2fS7-55U=yw@mail.gmail.com>
 <20261018-ungemacht-sodbrennen-hausordnung-42d33a4f7098@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261018-ungemacht-sodbrennen-hausordnung-42d33a4f7098@brauner>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_025233_984188_B31F17CC 
X-CRM114-Status: GOOD (  18.52  )
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

On Sun 18-10-26 17:48:34, Christian Brauner wrote:
...
> On Fri, Oct 16, 2026 at 02:32:01AM +0200, Andreas Gruenbacher wrote:
> > > diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> > > index 83b8bb6446e5..1535ce2b7aa8 100644
> > > --- a/fs/gfs2/util.c
> > > +++ b/fs/gfs2/util.c
> > > @@ -122,7 +122,7 @@ static void do_withdraw(struct gfs2_sbd *sdp)
> > >                 up_write(&sdp->sd_log_flush_lock);
> > >                 return;
> > >         }
> > > -       clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> > > +       clear_and_wake_up_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> > >         gfs2_ail_drain(sdp); /* frees all transactions */
> > >         up_write(&sdp->sd_log_flush_lock);
> > >
> > >
> > > --
> > > 2.53.0
> > >
> > 
> > this looks good all around, thank you very much. Can I add it to my gfs2 queue?
> 
> I was planning to just provide a stable branch for everyone to pull post
> -rc1. Then you can just pull that in?

On a related topic: I didn't find any branch with this work in vfs.git - I
wanted to check how all the things come together after adding the generic
emergency RO bit. So if you can push some inofficial branch for now it
would help me... Thanks!

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
