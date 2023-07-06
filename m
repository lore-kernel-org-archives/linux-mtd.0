Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B34EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=we8DERNtI/KbfvCOKqZatPtJCWgb+B05F83Y0iQwz/M=; b=Gj1GkUXlD076sE
	FMLVlOmDUi18SVXxmZfVG3h+MrqJYEUTsEo0UNM8cMnrSIGpae46EeIKlsbGOc+ON9FHVoGuh0Fgb
	z3GA8d9gwH/1Kd6Lq2iswDFsEpfgdnTgswzaLRgYcADzqRVlezcrGbOWWNfTnNV/2IoWTznRt3hjr
	xHf5iMBVVnZ/GocFQvTasEOYiUEUQDnMdw2SJPtrpx9t1Ay/9cJThvT1kCtgCVmhbp1T64Pod9VR8
	9oJNbloB/kBd+xvRFtTTBBamflOTm/7WC/h3JfkY1j1aBdAcLY9Fv9kmSIAV6nqGf2sdgzQH8IH77
	393Iwz6qFlfZ67Z3PkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMGO-001DlS-0o;
	Thu, 06 Jul 2023 10:31:04 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMGK-001Dkj-37
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jul 2023 10:31:02 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27D4D1FE81;
	Thu,  6 Jul 2023 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688639459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcNDrPJIIBM1X7LIBRDVAwvKuZGT1oAcgJGf+1Sy2TU=;
	b=W3Q7uSTjmS76OIbXTawFr2zcGdDSiCkFBRCOWvvgGu5SUV2FiW9goEdtx/Yk7xQ+gANSS8
	KW/RsZ+np8RQDEPNtkUF0zkJ6b0T7sanpkG5Wb8y4IqP8ujvFKMwmojvr5c9V0K6W0ENIQ
	BCpVXaCSi7YN38TEi8rx2/NEk3FvFNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688639459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcNDrPJIIBM1X7LIBRDVAwvKuZGT1oAcgJGf+1Sy2TU=;
	b=fWwsj/P2v2mk+cKIoPxix+mSmaAmLeHu5eOFg1E47uNO4HWZAh4njaTYQ1oB8yctl6nmGl
	ZVf4W0gEBMWfpHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1994E138FC;
	Thu,  6 Jul 2023 10:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uQ4zBuOXpmT2dgAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 10:30:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A1B3AA0707; Thu,  6 Jul 2023 12:30:58 +0200 (CEST)
Date: Thu, 6 Jul 2023 12:30:58 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 10/92] ubifs: convert to simple_rename_timestamp
Message-ID: <20230706103058.xfg4pti3tyqghpla@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-8-jlayton@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705190309.579783-8-jlayton@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_033101_158047_68F3FE9A 
X-CRM114-Status: GOOD (  22.92  )
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

On Wed 05-07-23 15:00:35, Jeff Layton wrote:
> A rename potentially involves updating 4 different inode timestamps.
> Convert to the new simple_rename_timestamp helper function.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ubifs/dir.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index ef0499edc248..7ec25310bd8a 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1414,8 +1414,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
>  	 * Like most other Unix systems, set the @i_ctime for inodes on a
>  	 * rename.
>  	 */
> -	time = current_time(old_dir);
> -	old_inode->i_ctime = time;
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
>  
>  	/* We must adjust parent link count when renaming directories */
>  	if (is_dir) {
> @@ -1444,13 +1443,11 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
>  
>  	old_dir->i_size -= old_sz;
>  	ubifs_inode(old_dir)->ui_size = old_dir->i_size;
> -	old_dir->i_mtime = old_dir->i_ctime = time;
> -	new_dir->i_mtime = new_dir->i_ctime = time;
>  
>  	/*
>  	 * And finally, if we unlinked a direntry which happened to have the
>  	 * same name as the moved direntry, we have to decrement @i_nlink of
> -	 * the unlinked inode and change its ctime.
> +	 * the unlinked inode.
>  	 */
>  	if (unlink) {
>  		/*
> @@ -1462,7 +1459,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
>  			clear_nlink(new_inode);
>  		else
>  			drop_nlink(new_inode);
> -		new_inode->i_ctime = time;
>  	} else {
>  		new_dir->i_size += new_sz;
>  		ubifs_inode(new_dir)->ui_size = new_dir->i_size;
> @@ -1557,7 +1553,6 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
>  	int sync = IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir);
>  	struct inode *fst_inode = d_inode(old_dentry);
>  	struct inode *snd_inode = d_inode(new_dentry);
> -	struct timespec64 time;
>  	int err;
>  	struct fscrypt_name fst_nm, snd_nm;
>  
> @@ -1588,11 +1583,7 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
>  
>  	lock_4_inodes(old_dir, new_dir, NULL, NULL);
>  
> -	time = current_time(old_dir);
> -	fst_inode->i_ctime = time;
> -	snd_inode->i_ctime = time;
> -	old_dir->i_mtime = old_dir->i_ctime = time;
> -	new_dir->i_mtime = new_dir->i_ctime = time;
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
>  
>  	if (old_dir != new_dir) {
>  		if (S_ISDIR(fst_inode->i_mode) && !S_ISDIR(snd_inode->i_mode)) {
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
