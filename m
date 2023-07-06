Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2631EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9g0yv64sO9gynjbj3F2pyvAvxACDYaV3ahB7uAJ2lXg=; b=kMEliWvhKVpvlO
	O0ChlIfH6J/I6YLF5WUHh53Chls2ieDMceWjQS1j7zZ/yA0JQ/EFCbYVP1cru76WiYitPYxu1hl9K
	a9i79f64HxFXtuzHOcWDiAslzcuL2+zqg+NfdzHPLigYFJjBh/sDDSsWJ7MKx2fDxO+iKQTYk7Q2N
	6yeNDfKQSmpKm6tyYHJI8Fp1IgiC/delyr9UB6lbsEgP0rqFcXLSPYBGfQ84+KDE4fPMfE0Bue7nc
	CIDqSLwjZy/pfZzzHf0gcsiVyUjqHsuI5Q8vHeXOrWHVgzWM/dz+nDFR6zCv0DQmAbNFzKMH/I0wo
	U1B7S6WKNK33vsJyifPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOzF-001lK8-2d;
	Thu, 06 Jul 2023 13:25:33 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOzC-001lJP-1y
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jul 2023 13:25:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1CDD1F747;
	Thu,  6 Jul 2023 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688649927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrUeEBIcYpuxv4Y9yvbW5ln5CEUDlLn3XNVZJeYvEJs=;
	b=Iu0LwLMQPzdy2AFlACp4ndugY2UR7qABiRsBt9yo/zcgYK3mnVXjjMsgiRQR7Ji8G564Bv
	IgzNoR4tR6MlJ5wDLQLznEXUtk8O9cez+Vl5dqSDJrHlEFDaUUPSJnOtn4on1AtgYQMLms
	poJgacbYeuSA3ODF9K+2yj6jnSmSQWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688649927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrUeEBIcYpuxv4Y9yvbW5ln5CEUDlLn3XNVZJeYvEJs=;
	b=kjc/CmwEwHTv0Lfs4iw1mnQod1YcAAXHPl4FgJeP+uliJ8Phee2SlA7nJSkCPwGBheoM29
	xdBIK0ti8tUEFaBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0A01138EE;
	Thu,  6 Jul 2023 13:25:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HtPMNsbApmTBVQAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 13:25:26 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E99D8A0707; Thu,  6 Jul 2023 15:25:25 +0200 (CEST)
Date: Thu, 6 Jul 2023 15:25:25 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 54/92] jffs2: convert to ctime accessor functions
Message-ID: <20230706132525.xnaiyc7omafbxniy@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-52-jlayton@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705190309.579783-52-jlayton@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_062530_817328_B09DFC78 
X-CRM114-Status: GOOD (  23.77  )
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

On Wed 05-07-23 15:01:19, Jeff Layton wrote:
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/jffs2/dir.c      | 24 +++++++++++++++---------
>  fs/jffs2/file.c     |  3 ++-
>  fs/jffs2/fs.c       | 10 +++++-----
>  fs/jffs2/os-linux.h |  2 +-
>  4 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
> index 5075a0a6d594..091ab0eaabbe 100644
> --- a/fs/jffs2/dir.c
> +++ b/fs/jffs2/dir.c
> @@ -204,7 +204,8 @@ static int jffs2_create(struct mnt_idmap *idmap, struct inode *dir_i,
>  	if (ret)
>  		goto fail;
>  
> -	dir_i->i_mtime = dir_i->i_ctime = ITIME(je32_to_cpu(ri->ctime));
> +	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
> +					       ITIME(je32_to_cpu(ri->ctime)));
>  
>  	jffs2_free_raw_inode(ri);
>  
> @@ -237,7 +238,7 @@ static int jffs2_unlink(struct inode *dir_i, struct dentry *dentry)
>  	if (dead_f->inocache)
>  		set_nlink(d_inode(dentry), dead_f->inocache->pino_nlink);
>  	if (!ret)
> -		dir_i->i_mtime = dir_i->i_ctime = ITIME(now);
> +		dir_i->i_mtime = inode_set_ctime_to_ts(dir_i, ITIME(now));
>  	return ret;
>  }
>  /***********************************************************************/
> @@ -271,7 +272,7 @@ static int jffs2_link (struct dentry *old_dentry, struct inode *dir_i, struct de
>  		set_nlink(d_inode(old_dentry), ++f->inocache->pino_nlink);
>  		mutex_unlock(&f->sem);
>  		d_instantiate(dentry, d_inode(old_dentry));
> -		dir_i->i_mtime = dir_i->i_ctime = ITIME(now);
> +		dir_i->i_mtime = inode_set_ctime_to_ts(dir_i, ITIME(now));
>  		ihold(d_inode(old_dentry));
>  	}
>  	return ret;
> @@ -422,7 +423,8 @@ static int jffs2_symlink (struct mnt_idmap *idmap, struct inode *dir_i,
>  		goto fail;
>  	}
>  
> -	dir_i->i_mtime = dir_i->i_ctime = ITIME(je32_to_cpu(rd->mctime));
> +	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
> +					       ITIME(je32_to_cpu(rd->mctime)));
>  
>  	jffs2_free_raw_dirent(rd);
>  
> @@ -566,7 +568,8 @@ static int jffs2_mkdir (struct mnt_idmap *idmap, struct inode *dir_i,
>  		goto fail;
>  	}
>  
> -	dir_i->i_mtime = dir_i->i_ctime = ITIME(je32_to_cpu(rd->mctime));
> +	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
> +					       ITIME(je32_to_cpu(rd->mctime)));
>  	inc_nlink(dir_i);
>  
>  	jffs2_free_raw_dirent(rd);
> @@ -607,7 +610,7 @@ static int jffs2_rmdir (struct inode *dir_i, struct dentry *dentry)
>  	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name,
>  			      dentry->d_name.len, f, now);
>  	if (!ret) {
> -		dir_i->i_mtime = dir_i->i_ctime = ITIME(now);
> +		dir_i->i_mtime = inode_set_ctime_to_ts(dir_i, ITIME(now));
>  		clear_nlink(d_inode(dentry));
>  		drop_nlink(dir_i);
>  	}
> @@ -743,7 +746,8 @@ static int jffs2_mknod (struct mnt_idmap *idmap, struct inode *dir_i,
>  		goto fail;
>  	}
>  
> -	dir_i->i_mtime = dir_i->i_ctime = ITIME(je32_to_cpu(rd->mctime));
> +	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
> +					       ITIME(je32_to_cpu(rd->mctime)));
>  
>  	jffs2_free_raw_dirent(rd);
>  
> @@ -864,14 +868,16 @@ static int jffs2_rename (struct mnt_idmap *idmap,
>  		 * caller won't do it on its own since we are returning an error.
>  		 */
>  		d_invalidate(new_dentry);
> -		new_dir_i->i_mtime = new_dir_i->i_ctime = ITIME(now);
> +		new_dir_i->i_mtime = inode_set_ctime_to_ts(new_dir_i,
> +							   ITIME(now));
>  		return ret;
>  	}
>  
>  	if (d_is_dir(old_dentry))
>  		drop_nlink(old_dir_i);
>  
> -	new_dir_i->i_mtime = new_dir_i->i_ctime = old_dir_i->i_mtime = old_dir_i->i_ctime = ITIME(now);
> +	old_dir_i->i_mtime = inode_set_ctime_to_ts(old_dir_i, ITIME(now));
> +	new_dir_i->i_mtime = inode_set_ctime_to_ts(new_dir_i, ITIME(now));
>  
>  	return 0;
>  }
> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index 2345ca3f09ee..11c66793960e 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -317,7 +317,8 @@ static int jffs2_write_end(struct file *filp, struct address_space *mapping,
>  			inode->i_size = pos + writtenlen;
>  			inode->i_blocks = (inode->i_size + 511) >> 9;
>  
> -			inode->i_ctime = inode->i_mtime = ITIME(je32_to_cpu(ri->ctime));
> +			inode->i_mtime = inode_set_ctime_to_ts(inode,
> +							       ITIME(je32_to_cpu(ri->ctime)));
>  		}
>  	}
>  
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index 038516bee1ab..0403efab4089 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -115,7 +115,7 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
>  	ri->isize = cpu_to_je32((ivalid & ATTR_SIZE)?iattr->ia_size:inode->i_size);
>  	ri->atime = cpu_to_je32(I_SEC((ivalid & ATTR_ATIME)?iattr->ia_atime:inode->i_atime));
>  	ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode->i_mtime));
> -	ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode->i_ctime));
> +	ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode_get_ctime(inode)));
>  
>  	ri->offset = cpu_to_je32(0);
>  	ri->csize = ri->dsize = cpu_to_je32(mdatalen);
> @@ -148,7 +148,7 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
>  	}
>  	/* It worked. Update the inode */
>  	inode->i_atime = ITIME(je32_to_cpu(ri->atime));
> -	inode->i_ctime = ITIME(je32_to_cpu(ri->ctime));
> +	inode_set_ctime_to_ts(inode, ITIME(je32_to_cpu(ri->ctime)));
>  	inode->i_mtime = ITIME(je32_to_cpu(ri->mtime));
>  	inode->i_mode = jemode_to_cpu(ri->mode);
>  	i_uid_write(inode, je16_to_cpu(ri->uid));
> @@ -284,7 +284,7 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
>  	inode->i_size = je32_to_cpu(latest_node.isize);
>  	inode->i_atime = ITIME(je32_to_cpu(latest_node.atime));
>  	inode->i_mtime = ITIME(je32_to_cpu(latest_node.mtime));
> -	inode->i_ctime = ITIME(je32_to_cpu(latest_node.ctime));
> +	inode_set_ctime_to_ts(inode, ITIME(je32_to_cpu(latest_node.ctime)));
>  
>  	set_nlink(inode, f->inocache->pino_nlink);
>  
> @@ -388,7 +388,7 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
>  	iattr.ia_gid = inode->i_gid;
>  	iattr.ia_atime = inode->i_atime;
>  	iattr.ia_mtime = inode->i_mtime;
> -	iattr.ia_ctime = inode->i_ctime;
> +	iattr.ia_ctime = inode_get_ctime(inode);
>  
>  	jffs2_do_setattr(inode, &iattr);
>  }
> @@ -475,7 +475,7 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
>  	inode->i_mode = jemode_to_cpu(ri->mode);
>  	i_gid_write(inode, je16_to_cpu(ri->gid));
>  	i_uid_write(inode, je16_to_cpu(ri->uid));
> -	inode->i_atime = inode->i_ctime = inode->i_mtime = current_time(inode);
> +	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
>  	ri->atime = ri->mtime = ri->ctime = cpu_to_je32(I_SEC(inode->i_mtime));
>  
>  	inode->i_blocks = 0;
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index 8da19766c101..50727a1ff931 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -35,7 +35,7 @@ struct kvec;
>  #define ITIME(sec) ((struct timespec64){sec, 0})
>  #define JFFS2_NOW() JFFS2_CLAMP_TIME(ktime_get_real_seconds())
>  #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
> -#define JFFS2_F_I_CTIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_ctime)
> +#define JFFS2_F_I_CTIME(f) I_SEC(inode_get_ctime(OFNI_EDONI_2SFFJ(f)))
>  #define JFFS2_F_I_MTIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_mtime)
>  #define JFFS2_F_I_ATIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_atime)
>  #define sleep_on_spinunlock(wq, s)				\
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
