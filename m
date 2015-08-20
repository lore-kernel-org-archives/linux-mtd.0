Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSG0D-0003u1-P9
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 02:54:54 +0000
Message-ID: <55D54006.9030700@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 10:48:38 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, Subodh
 Nijsure <snijsure@grid-net.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Brad Mouring <brad.mouring@ni.com>, Gratian Crisan <gratian.crisan@ni.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] ubifs: Remove dead xattr code
References: <1440016553-26481-1-git-send-email-richard@nod.at>
In-Reply-To: <1440016553-26481-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> This is a partial revert of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef=
53
> ("UBIFS: Add security.* XATTR support for the UBIFS").

Hi Richard,
	What about a full reverting of this commit. In ubifs, we
*can* support any namespace of xattr including user, trusted, security
or other anyone prefixed by any words. But we have a check_namespace()
in xattr.c to limit what we want to support. That said, if we want to
"Add security.* XATTR support for the UBIFS", what we need to do is
just extending the check_namespace() to allow security namespace pass.
And yes, check_namespace() have been supporting security namespace.

So, IMHO, we do not depend on the generic mechanism at all, and we can
fully revert this commit.

But strange to me, why we picked this commit for ubifs? Artem, is there
something I am missing?

Yang
>
> As UBIFS does not use generic inode xattr inode operations
> the code behind sb->s_xattr is never called.
> Remove that dead code for now.
>
> Cc: Subodh Nijsure <snijsure@grid-net.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Brad Mouring <brad.mouring@ni.com>
> Cc: Gratian Crisan <gratian.crisan@ni.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Reported-by: Andreas Gr=C3=BCnbacher <andreas.gruenbacher@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> After the merge window (and my vacation) I'll have the time to
> re-introduce/work security xattr support.
>
> Thanks,
> //richard
> ---
>   fs/ubifs/super.c |  1 -
>   fs/ubifs/ubifs.h |  1 -
>   fs/ubifs/xattr.c | 40 ----------------------------------------
>   3 files changed, 42 deletions(-)
>
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 9547a278..c71edca 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2037,7 +2037,6 @@ static int ubifs_fill_super(struct super_block *sb,=
 void *data, int silent)
>   	if (c->max_inode_sz > MAX_LFS_FILESIZE)
>   		sb->s_maxbytes =3D c->max_inode_sz =3D MAX_LFS_FILESIZE;
>   	sb->s_op =3D &ubifs_super_operations;
> -	sb->s_xattr =3D ubifs_xattr_handlers;
>
>   	mutex_lock(&c->umount_mutex);
>   	err =3D mount_ubifs(c);
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index de75902..33b6ee7 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1470,7 +1470,6 @@ extern spinlock_t ubifs_infos_lock;
>   extern atomic_long_t ubifs_clean_zn_cnt;
>   extern struct kmem_cache *ubifs_inode_slab;
>   extern const struct super_operations ubifs_super_operations;
> -extern const struct xattr_handler *ubifs_xattr_handlers[];
>   extern const struct address_space_operations ubifs_file_address_operati=
ons;
>   extern const struct file_operations ubifs_file_operations;
>   extern const struct inode_operations ubifs_file_inode_operations;
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 96f3448..b512b14 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -582,46 +582,6 @@ out_free:
>   	return err;
>   }
>
> -static size_t security_listxattr(struct dentry *d, char *list, size_t li=
st_size,
> -				 const char *name, size_t name_len, int flags)
> -{
> -	const int prefix_len =3D XATTR_SECURITY_PREFIX_LEN;
> -	const size_t total_len =3D prefix_len + name_len + 1;
> -
> -	if (list && total_len <=3D list_size) {
> -		memcpy(list, XATTR_SECURITY_PREFIX, prefix_len);
> -		memcpy(list + prefix_len, name, name_len);
> -		list[prefix_len + name_len] =3D '\0';
> -	}
> -
> -	return total_len;
> -}
> -
> -static int security_getxattr(struct dentry *d, const char *name, void *b=
uffer,
> -		      size_t size, int flags)
> -{
> -	return ubifs_getxattr(d, name, buffer, size);
> -}
> -
> -static int security_setxattr(struct dentry *d, const char *name,
> -			     const void *value, size_t size, int flags,
> -			     int handler_flags)
> -{
> -	return ubifs_setxattr(d, name, value, size, flags);
> -}
> -
> -static const struct xattr_handler ubifs_xattr_security_handler =3D {
> -	.prefix =3D XATTR_SECURITY_PREFIX,
> -	.list   =3D security_listxattr,
> -	.get    =3D security_getxattr,
> -	.set    =3D security_setxattr,
> -};
> -
> -const struct xattr_handler *ubifs_xattr_handlers[] =3D {
> -	&ubifs_xattr_security_handler,
> -	NULL,
> -};
> -
>   static int init_xattrs(struct inode *inode, const struct xattr *xattr_a=
rray,
>   		      void *fs_info)
>   {
>
