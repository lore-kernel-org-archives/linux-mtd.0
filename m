Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CB4606A331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vlQNv8yW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=v14WN48b;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OvkNExNy;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=v14WN48b;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OvkNExNy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cxahY3xhWASMTtiptHf6gtWnX//v0HyTR/NurTkezNg=; b=vlQNv8yW7bSWQJ33/29R2w/R+F
	E37iEwFey+C/kGUsaHd8EIg88NrPQleYLkqNIrJjHeKKUYHzA4eC1AY/KNEeFI7pExHVsneZMoLgk
	BBNfAujo//oy/fdDqj8dJkkysHISjppDW/rHwiIctpCOwhzBAne8lnw8dNiUdA+oG9l9urj7D7KNh
	76Hlb2wlATdTgqnoKbCCahcOz+RwcJD7vU/gm0CtSpQ6zWC9SynRR6CjWli/OqlMv0KUNeZ+E12mB
	2o+yWt67LtLP5iulCuxrVJ7n8RWO9QwfrEu3NkU8QnZc4M5oDLTlEtb3mT17o0z3lC+gtESetqt9v
	Rd3YyZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtqZ-00000008Jud-35kc;
	Thu, 05 Nov 2026 09:33:27 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtq8-00000008Jqv-2D95
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 09:33:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 43A9421F5B;
	Thu,  5 Nov 2026 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793871178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgu8NzTJnS2R+zD0u6Z5S8xrxcIoknrqJKi9obAmajo=;
	b=v14WN48bHlIql9h5HLTugaVISujZG1I/c68I+QtgBbLoIBApSEacYXXWBcqgCfJXFq6f+A
	a04b7rV9MZ+1A7GaOjZPNsUBb09L6OB9bhWH1gZyydPZAUwPj8q85pTy4SRbmwmJ76LAqC
	SSzXuvpaBX/SH14eaONLs8VdXTpBuaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793871178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgu8NzTJnS2R+zD0u6Z5S8xrxcIoknrqJKi9obAmajo=;
	b=OvkNExNyUPYRAlVHRPqHODS9azrcpr+2lIkcR7gaa3TaHUtdVPDuCCR60na21ee4PYtMBN
	8FyqEylcSu5PIbBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793871178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgu8NzTJnS2R+zD0u6Z5S8xrxcIoknrqJKi9obAmajo=;
	b=v14WN48bHlIql9h5HLTugaVISujZG1I/c68I+QtgBbLoIBApSEacYXXWBcqgCfJXFq6f+A
	a04b7rV9MZ+1A7GaOjZPNsUBb09L6OB9bhWH1gZyydPZAUwPj8q85pTy4SRbmwmJ76LAqC
	SSzXuvpaBX/SH14eaONLs8VdXTpBuaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793871178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgu8NzTJnS2R+zD0u6Z5S8xrxcIoknrqJKi9obAmajo=;
	b=OvkNExNyUPYRAlVHRPqHODS9azrcpr+2lIkcR7gaa3TaHUtdVPDuCCR60na21ee4PYtMBN
	8FyqEylcSu5PIbBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 160DB134F4;
	Thu,  5 Nov 2026 09:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jQQAOUlN7GrMbwAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 05 Nov 2026 09:32:58 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 9A6FBB666; Thu, 05 Nov 2026 10:32:57 +0100 (CET)
Date: Thu, 5 Nov 2026 10:32:57 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 31/34] ext4: use the generic emergency read-only state
Message-ID: <m2tpyczkdirf7z4pnidxf3375ykgs6mrybxz6aejffpfgptw26@vfepghgrvgdr>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-31-2f44f64f0b66@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-31-2f44f64f0b66@kernel.org>
X-Spam-Level: 
X-Spamd-Result: default: False [-11.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_013301_972056_6CC6FCE6 
X-CRM114-Status: GOOD (  17.28  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu 29-10-26 17:07:22, Christian Brauner wrote:
> Set SB_STATE_EMERGENCY_RO next to EXT4_FLAGS_EMERGENCY_RO when an error
> makes the filesystem read-only. The VFS then refuses modifications
> before they reach ext4 and reports the superblock as read-only like it
> did when ext4 still set SB_RDONLY. The shutdown state stays ext4's own
> and so do all of ext4's checks because they cover both states. ext4
> keeps showing "emergency_ro" in its mount options.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good! Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  fs/ext4/super.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index ae5ba6823c01..afbdbb607b14 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -757,6 +757,7 @@ static void ext4_handle_error(struct super_block *sb, bool force_ro, int error,
>  	 * and other problems.
>  	 */
>  	set_bit(EXT4_FLAGS_EMERGENCY_RO, &EXT4_SB(sb)->s_ext4_flags);
> +	sb_set_emergency_ro(sb);
>  }
>  
>  static void update_super_work(struct work_struct *work)
> 
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
