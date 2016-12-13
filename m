Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGrzX-0007S1-17
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 18:39:57 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 2/2] ubifs: Use fscrypt ioctl() helpers
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20161212232759.30239-2-richard@nod.at>
Date: Tue, 13 Dec 2016 19:39:33 +0100
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, dedekind1@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6865661F-911A-4BF9-B60B-D5605AD6F382@sigma-star.at>
References: <20161212232759.30239-1-richard@nod.at>
 <20161212232759.30239-2-richard@nod.at>
To: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 13.12.2016, at 00:27, Richard Weinberger <richard@nod.at> wrote:
>=20
> Commit db717d8e26c2 ("fscrypto: move ioctl processing more fully into
> common code") moved ioctl() related functions into fscrypt and offers
> us now a set of helper functions.
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> fs/ubifs/ioctl.c | 24 ++----------------------
> fs/ubifs/ubifs.h |  4 ++--
> 2 files changed, 4 insertions(+), 24 deletions(-)
>=20
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> index 3d10f5525274..78d713644df3 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -184,39 +184,19 @@ long ubifs_ioctl(struct file *file, unsigned int =
cmd, unsigned long arg)
> 	case FS_IOC_SET_ENCRYPTION_POLICY: {
> #ifdef CONFIG_UBIFS_FS_ENCRYPTION
> 		struct ubifs_info *c =3D inode->i_sb->s_fs_info;
> -		struct fscrypt_policy policy;
> -
> -		if (copy_from_user(&policy,
> -				   (struct fscrypt_policy __user *)arg,
> -				   sizeof(policy)))
> -			return -EFAULT;
>=20
> 		err =3D ubifs_enable_encryption(c);
> 		if (err)
> 			return err;
>=20
> -		err =3D fscrypt_process_policy(file, &policy);
> -
> -		return err;
> +		return fscrypt_ioctl_set_policy(file, (const void __user =
*)arg);
> #else
> 		return -EOPNOTSUPP;
> #endif
> 	}
> 	case FS_IOC_GET_ENCRYPTION_POLICY: {
> #ifdef CONFIG_UBIFS_FS_ENCRYPTION
> -		struct fscrypt_policy policy;
> -
> -		if (!ubifs_crypt_is_encrypted(inode))
> -			return -ENOENT;
> -
> -		err =3D fscrypt_get_policy(inode, &policy);
> -		if (err)
> -			return err;
> -
> -		if (copy_to_user((void __user *)arg, &policy, =
sizeof(policy)))
> -			return -EFAULT;
> -
> -		return 0;
> +		return fscrypt_ioctl_get_policy(file, (void __user =
*)arg);
> #else
> 		return -EOPNOTSUPP;
> #endif
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 8d0e4818e3ea..ca72382ce6cc 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1806,8 +1806,8 @@ int ubifs_decompress(const struct ubifs_info *c, =
const void *buf, int len,
> #define fscrypt_pullback_bio_page       =
fscrypt_notsupp_pullback_bio_page
> #define fscrypt_restore_control_page    =
fscrypt_notsupp_restore_control_page
> #define fscrypt_zeroout_range           fscrypt_notsupp_zeroout_range
> -#define fscrypt_process_policy          =
fscrypt_notsupp_process_policy
> -#define fscrypt_get_policy              fscrypt_notsupp_get_policy
> +#define fscrypt_ioctl_set_policy	fscrypt_notsupp_ioctl_set_policy
> +#define fscrypt_ioctl_get_policy	fscrypt_notsupp_ioctl_get_policy
> #define fscrypt_has_permitted_context   =
fscrypt_notsupp_has_permitted_context
> #define fscrypt_inherit_context         =
fscrypt_notsupp_inherit_context
> #define fscrypt_get_encryption_info     =
fscrypt_notsupp_get_encryption_info
> --=20
> 2.10.2

Looks good to me.

Reviewed-by: David Gstir <david@sigma-star.at>

- David=
