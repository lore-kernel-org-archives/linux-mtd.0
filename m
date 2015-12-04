Received: from h2.hallyn.com ([78.46.35.8])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4u9J-0000G6-8V
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 17:28:02 +0000
Date: Fri, 4 Dec 2015 11:27:38 -0600
From: "Serge E. Hallyn" <serge.hallyn@ubuntu.com>
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
Subject: Re: [PATCH 09/19] fs: Refuse uid/gid changes which don't map into
 s_user_ns
Message-ID: <20151204172738.GA2280@mail.hallyn.com>
References: <1449070821-73820-1-git-send-email-seth.forshee@canonical.com>
 <1449070821-73820-10-git-send-email-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449070821-73820-10-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 09:40:09AM -0600, Seth Forshee wrote:
> Add checks to inode_change_ok to verify that uid and gid changes
> will map into the superblock's user namespace. If they do not
> fail with -EOVERFLOW. This cannot be overriden with ATTR_FORCE.
> 
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Acked-by: Serge Hallyn <serge.hallyn@canonical.com>

...  although i could see root on the host being upset that it can't
assign a uid not valid in the mounter's ns.  But it does seem safer.

> ---
>  fs/attr.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/attr.c b/fs/attr.c
> index 6530ced19697..55b46e3aa888 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -42,6 +42,17 @@ int inode_change_ok(const struct inode *inode, struct iattr *attr)
>  			return error;
>  	}
>  
> +	/*
> +	 * Verify that uid/gid changes are valid in the target namespace
> +	 * of the superblock. This cannot be overriden using ATTR_FORCE.
> +	 */
> +	if (ia_valid & ATTR_UID &&
> +	    from_kuid(inode->i_sb->s_user_ns, attr->ia_uid) == (uid_t)-1)
> +		return -EOVERFLOW;
> +	if (ia_valid & ATTR_GID &&
> +	    from_kgid(inode->i_sb->s_user_ns, attr->ia_gid) == (gid_t)-1)
> +		return -EOVERFLOW;
> +
>  	/* If force is set do it anyway. */
>  	if (ia_valid & ATTR_FORCE)
>  		return 0;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
