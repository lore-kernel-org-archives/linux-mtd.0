Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STurU-00025t-SF
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:58:53 +0000
Message-ID: <1337000538.2528.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] Add security.* XATTR support for the UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: snijsure@grid-net.com
Date: Mon, 14 May 2012 16:02:18 +0300
In-Reply-To: <1336915488-23943-1-git-send-email-snijsure@grid-net.com>
References: <1336915488-23943-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uFcVq+Ipq9V/mIaQIYnj"
Mime-Version: 1.0
Cc: penguin-kernel@I-love.SAKURA.ne.jp, linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uFcVq+Ipq9V/mIaQIYnj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-13 at 06:24 -0700, snijsure@grid-net.com wrote:
> +int ubifs_security_getxattr(struct dentry *d, const char *name,
> +			    void *buffer, size_t size, int flags)
> +{
> +	if (strcmp(name, "") =3D=3D 0)
> +		return -EINVAL;
> +	return __ubifs_getxattr(d->d_inode, name, buffer, size);
> +}
> +
> +
> +int ubifs_security_setxattr(struct dentry *d, const char *name,
> +			    const void *value, size_t size,
> +			    int flags, int handler_flags)
> +{
> +	if (strcmp(name, "") =3D=3D 0)
> +		return -EINVAL;

Should this check pushed town to __ubifs_getxattr/__ubifs_setxattr ?
Does an extended attribute in general with zero name length legitimate?
Did you check whether the generic code already performs this check?

> +	return __ubifs_setxattr(d->d_inode, name, value,
> +				size, flags);
> +}
> +
> +struct xattr_handler ubifs_xattr_security_handler =3D {
> +	.prefix =3D XATTR_SECURITY_PREFIX,
> +	.list   =3D ubifs_security_listxattr,
> +	.get    =3D ubifs_security_getxattr,
> +	.set    =3D ubifs_security_setxattr,
> +};
> +
> +const struct xattr_handler *ubifs_xattr_handlers[] =3D {
> +	&ubifs_xattr_security_handler,
> +	NULL
> +};
> +
> +static int ubifs_initxattrs(struct inode *inode,
> +			    const struct xattr *xattr_array, void *fs_info)
> +{
> +	const struct xattr *xattr;
> +	char *name;
> +	int err =3D 0;
> +
> +	for (xattr =3D xattr_array; xattr->name !=3D NULL; xattr++) {
> +		name =3D kmalloc(XATTR_SECURITY_PREFIX_LEN +
> +			       strlen(xattr->name) + 1, GFP_NOFS);
> +		if (!name) {
> +			err =3D -ENOMEM;
> +			break;

Where is the already allocated memory freed in this case?

> +		}
> +		strcpy(name, XATTR_SECURITY_PREFIX);
> +		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
> +		err =3D __ubifs_setxattr(inode, name, xattr->value,
> +				       xattr->value_len, 0);
> +		kfree(name);
> +		if (err < 0)
> +			break;
> +	}
> +	return err;
> +}
> +
> +int
> +ubifs_init_security(struct inode *dentry, struct inode *inode,
> +		   const struct qstr *qstr)
> +{
> +	struct ubifs_inode *dir_ui =3D ubifs_inode(inode);
> +	int err =3D 0;
> +
> +	mutex_lock(&inode->i_mutex);
> +	mutex_lock(&dir_ui->ui_mutex);
> +

You do not actually need these mutexes, because "inode" is new, it is
not added to any lists yet, so you own it entirely. Which means that you
do not even need to introduce this helper function - just call
'security_inode_init_security()' directly.


--=20
Best Regards,
Artem Bityutskiy

--=-uFcVq+Ipq9V/mIaQIYnj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsQJaAAoJECmIfjd9wqK0seIP/1J40sHpJ6JsCVX4dOJBnpTO
HSyrgKVj9rNqvm81gfRj3deekf1dw/lZTyzsZd3AaD+5kkxWJx/Sb6u2yOudgBXf
rqI9x5kHQ3zDHzmZFM3RYOj8oYx/FMdCcGRphQfQ44YQrlNPuzSAPzghfbOpxhtm
3mtAEVkoMxQvi6a5hUo+mbo2JfEHGlHGK7OPCY4EYy1cgKdBjOdp/z9+SAp8TIPq
mr2D00rUrrTmcIq24vP5ls4sSU/WwCNSHuni45EF266qyKrVhdDpxslNOSXOKxD9
G9VEUp4KsnHu408RySSxJQcIK+rtPiw09rbBkqYZ577pAjBG+wI5zTRAV1lmfMUv
MCWaRAftsXR1UDWfNu5EY+Lcrb7OPjGNhTNVQ55DiZ5M6mmztb9iVPF7ZAQ7AbZG
sJvEporOx6PBDO4sHtm4r02cuVybIr5wJ8mJnG1U4WGcj5a4/zoTcUyT8JOkPAr+
UpPsvH1FLEcR4Belk/JeTa43RZK641OX5gNjrIFn1djLSH95DlXXUNXUYc2CdDf0
xj/uCyikLFbiPInrk4q/UDEpJ9i7Q+TKRBgf6H/2MCVnnxoa/Gk2W+lWW/TRwp9p
+GmEy1JjqJZa7APdOVJxZ6AXQ1yuP7flpkD1pPSMemqCQckSxuLDuiuMjkokW7u9
J+S4dSMaDz3L/Iety9HT
=IkfA
-----END PGP SIGNATURE-----

--=-uFcVq+Ipq9V/mIaQIYnj--
