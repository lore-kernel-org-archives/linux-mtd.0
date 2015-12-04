Received: from h2.hallyn.com ([78.46.35.8])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4wcE-0000mj-OF
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 20:06:03 +0000
Date: Fri, 4 Dec 2015 14:05:41 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Subject: Re: [PATCH 18/19] fuse: Restrict allow_other to the superblock's
 namespace or a descendant
Message-ID: <20151204200541.GI3624@mail.hallyn.com>
References: <1449070821-73820-1-git-send-email-seth.forshee@canonical.com>
 <1449070821-73820-19-git-send-email-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449070821-73820-19-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Seth Forshee (seth.forshee@canonical.com):
> Unprivileged users are normally restricted from mounting with the
> allow_other option by system policy, but this could be bypassed
> for a mount done with user namespace root permissions. In such
> cases allow_other should not allow users outside the userns
> to access the mount as doing so would give the unprivileged user
> the ability to manipulate processes it would otherwise be unable
> to manipulate. Restrict allow_other to apply to users in the same
> userns used at mount or a descendant of that namespace.
> 
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>  fs/fuse/dir.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index f67f4dd86b36..5b8edb1203b8 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1018,8 +1018,14 @@ int fuse_allow_current_process(struct fuse_conn *fc)
>  {
>  	const struct cred *cred;
>  
> -	if (fc->flags & FUSE_ALLOW_OTHER)
> -		return 1;
> +	if (fc->flags & FUSE_ALLOW_OTHER) {
> +		struct user_namespace *ns;
> +		for (ns = current_user_ns(); ns; ns = ns->parent) {
> +			if (ns == fc->user_ns)
> +				return 1;
> +		}

	use current_in_userns() ?

> +		return 0;
> +	}
>  
>  	cred = current_cred();
>  	if (uid_eq(cred->euid, fc->user_id) &&
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
