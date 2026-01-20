Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED0AD2ED0F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWetFtfCAga6CznmaYGfBDCRQPWUNyp0GV2t99m/cL0=; b=UEpVAnTcrD9mnS
	HL4vQ0KqKUr7VsT3glW3JS/QwE8GSbFBrcdY4VBNS4vqW+QxRCPFyoGpMJK2cwZwP+ERVmsfwGD+X
	aJOf9Tvqvgp99HwzdZQZJMH0yVfuIpKFkV34yHVqeGAww+sR0ixAAteOCl5fuVyVZUH87umCOZhRG
	DHY0hrHi5wOI95txXNX/mj/H4zGbmOSFeK/NWq/h50jD+ND4rdPhe8Vb2Ce3whFQJvd8s6ZHFIWVN
	CP4sjLfYt0fDbeROFZD12h+0bkXUw9qHIXNqmRqnpbh4HemCWRdw8Jjj/2X5kc/yfkC2mymUbWhbA
	GetMWtrXwSzat9afN5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Hc-00000003TSd-2hfT;
	Tue, 20 Jan 2026 08:40:16 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7HY-00000003TR2-00vJ
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 08:40:13 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD0C55BCC3;
	Tue, 20 Jan 2026 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768898407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
	b=lXbl/VQVuVPBPaq9av5smG5OFa/NhiwefeYAnKTxiTxM2QX9a0Jsbdpis0tVJFy+unWMtD
	bNh/ywftBTm5m2O2e7f0QmCLthEIxPwfSwEbrsfum9UBevwRj24bv8DnE2XCtOBZOykvGt
	AUYIB66up1nxz+RBb/9UrZZim7/aN7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768898407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
	b=LDOUWFgZ9L1jfR2KXNRaliX4q7afY0RWN0QEnpzcnPdpU998Wx8+N3DLW81My4a1pFp2EE
	dwI54JIvYwP/B5AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="lXbl/VQV";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=LDOUWFgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768898407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
	b=lXbl/VQVuVPBPaq9av5smG5OFa/NhiwefeYAnKTxiTxM2QX9a0Jsbdpis0tVJFy+unWMtD
	bNh/ywftBTm5m2O2e7f0QmCLthEIxPwfSwEbrsfum9UBevwRj24bv8DnE2XCtOBZOykvGt
	AUYIB66up1nxz+RBb/9UrZZim7/aN7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768898407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
	b=LDOUWFgZ9L1jfR2KXNRaliX4q7afY0RWN0QEnpzcnPdpU998Wx8+N3DLW81My4a1pFp2EE
	dwI54JIvYwP/B5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D31D3EA65;
	Tue, 20 Jan 2026 08:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3csLJmc/b2l8AwAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 20 Jan 2026 08:40:07 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 47975A09DA; Tue, 20 Jan 2026 09:40:07 +0100 (CET)
Date: Tue, 20 Jan 2026 09:40:07 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Cc: Jeff Layton <jlayton@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Jan Kara <jack@suse.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>, 
	Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Dave Chinner <david@fromorbit.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, linux-nilfs@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 02/31] exportfs: add new EXPORT_OP_STABLE_HANDLES flag
Message-ID: <56fr33ju43h6zzp6jrzrkyfag6r3jz6wpnk45oe5byy6fqyvti@d43hgikfuk7t>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
 <aW8ztQ-RbhxwzMk7@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW8ztQ-RbhxwzMk7@infradead.org>
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,oracle.com,brown.name,redhat.com,talpey.com,gmail.com,google.com,linux.alibaba.com,linux-foundation.org,mit.edu,dilger.ca,suse.com,huawei.com,vivo.com,dubeyko.com,fb.com,squashfs.org.uk,samba.org,manguebit.org,microsoft.com,szeredi.hu,omnibond.com,fasheh.com,evilplan.org,paragon-software.com,infradead.org,nod.at,suse.cz,mail.parknet.co.jp,lwn.net,fromorbit.com,vger.kernel.org,kvack.org,lists.ozlabs.org,lists.samba.org,lists.orangefs.org,lists.linux.dev,lists.sourceforge.net,lists.infradead.org];
	DKIM_TRACE(0.00)[suse.cz:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: AD0C55BCC3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_004012_203012_35337EE9 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon 19-01-26 23:50:13, Christoph Hellwig wrote:
> On Mon, Jan 19, 2026 at 11:26:19AM -0500, Jeff Layton wrote:
> > +  EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
> > +    stable across the lifetime of a file. This is a hard requirement for export
> > +    via nfsd. Any filesystem that is eligible to be exported via nfsd must
> > +    indicate this guarantee by setting this flag. Most disk-based filesystems
> > +    can do this naturally. Pseudofilesystems that are for local reporting and
> > +    control (e.g. kernfs, pidfs, nsfs) usually can't support this.
> 
> Suggested rewording, taking some of the ideas from Dave Chinners earlier
> comments into account:
> 
>   EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
>     stable across the lifetime of a file.  A file in this context is an
>     instantiated inode reachable by one or more file names, or still open after
>     the last name has been unlinked.  Reuses of the same on-disk inode structure
>     are considered new files and must provide different file handles from the
>     previous incarnation.  Most file systems designed to store user data
>     naturally provide this capability.  Pseudofilesystems that are for local
>     reporting and control (e.g. kernfs, pidfs, nsfs) usually can't support this.
> 
>     This flags is a hard requirement for export via nfsd. Any filesystem that
>     is eligible to be exported via nfsd must indicate this guarantee by
>     setting this flag.

I like this. It certainly makes the requirement of stability clearer to me
(with explanations before I couldn't quite see the difference between shmem
and kernfs). I'd note that fat or shmem (which are both exportable)
satisfy this only with reasonably high probability as they use
get_random_u32() for initializing their i_generation but I guess it's as
good as it gets for them.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
