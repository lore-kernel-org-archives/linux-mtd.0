Received: from h2.hallyn.com ([78.46.35.8])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4vcq-0006aA-BV
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 19:02:36 +0000
Date: Fri, 4 Dec 2015 13:02:14 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Subject: Re: [PATCH 12/19] fs: Don't remove suid for CAP_FSETID in s_user_ns
Message-ID: <20151204190214.GC3624@mail.hallyn.com>
References: <1449070821-73820-1-git-send-email-seth.forshee@canonical.com>
 <1449070821-73820-13-git-send-email-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449070821-73820-13-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Seth Forshee (seth.forshee@canonical.com):
> Expand the check in should_remove_suid() to keep privileges for
> CAP_FSETID in s_user_ns rather than init_user_ns.
> 
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Acked-by: Serge Hallyn <serge.hallyn@canonical.com>

> ---
>  fs/inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 01c036fe1950..3e7c74da9304 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1684,7 +1684,8 @@ int should_remove_suid(struct dentry *dentry)
>  	if (unlikely((mode & S_ISGID) && (mode & S_IXGRP)))
>  		kill |= ATTR_KILL_SGID;
>  
> -	if (unlikely(kill && !capable(CAP_FSETID) && S_ISREG(mode)))
> +	if (unlikely(kill && !ns_capable(dentry->d_sb->s_user_ns, CAP_FSETID) &&
> +		     S_ISREG(mode)))
>  		return kill;
>  
>  	return 0;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
