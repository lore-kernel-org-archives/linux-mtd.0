Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5dSk-0007Wf-Qk
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 14:37:32 +0000
Message-ID: <511BA51E.9000606@pengutronix.de>
Date: Wed, 13 Feb 2013 15:37:18 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: SELinux + ubifs: possible circular locking dependency
References: <51123C80.2050400@pengutronix.de> <5115076E.3070703@pengutronix.de>
 <1360759673.12703.147.camel@sauron.fi.intel.com>
In-Reply-To: <1360759673.12703.147.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2TEKQGUJXEENPRNERVKOV"
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2TEKQGUJXEENPRNERVKOV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/13/2013 01:47 PM, Artem Bityutskiy wrote:
>> I'm on a arm imx28 v3.8-rc6 (+ a handfull of patches to support the
>> custom board) but no modifications on ubifs, selinux or the vfs layer.=

>> And not including the xattr patches by Subodh Nijsure.
>>
>> When booting with SELinux and lockdep enabled I see this _possible_
>> circular locking dependency:
>=20
> I guess one needs to really understand how lockdep works, because it
> seems there is no direct 'tnc_mutex -> isec->lock', and lockdep somehow=

> deducts this connection inderectly.
>=20
> However, it seems I see what _may_ be the reason, and here is a patch
> which I think may fix the issue. Would you please test/review it? It is=

> inlined and also attached.

Thanks,

[...]

The compiler complains

security/selinux/hooks.c:210:2: error: incompatible type for argument 3 o=
f 'lockdep_init_map'
In file included from include/linux/spinlock_types.h:18:0,
                 from include/linux/spinlock.h:81,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:5,
                 from include/uapi/linux/timex.h:56,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:17,
                 from include/linux/tracehook.h:49,
                 from security/selinux/hooks.c:29:
include/linux/lockdep.h:279:13: note: expected 'struct lock_class_key *' =
but argument is of type 'struct lock_class_key'



> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index ef26e96..328180e 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -207,6 +207,7 @@ static int inode_alloc_security(struct inode *inode=
)
>  		return -ENOMEM;
> =20
>  	mutex_init(&isec->lock);
> +	lockdep_set_class(&isec->lock, inode->i_sb->s_type->i_mutex_key);

So I added an "&", so that the line looks like that:

+       lockdep_set_class(&isec->lock, &inode->i_sb->s_type->i_mutex_key)=
;

>  	INIT_LIST_HEAD(&isec->list);
>  	isec->inode =3D inode;
>  	isec->sid =3D SECINITSID_UNLABELED;
>=20

That solves original circular lock warning, but brings these two:

> [    0.213843] ------------[ cut here ]------------
> [    0.218687] WARNING: at kernel/lockdep.c:702 __lock_acquire+0x1824/0=
x1c58()
> [    0.225875] Modules linked in:
> [    0.229156] [<c000d0f0>] (unwind_backtrace+0x0/0xf0) from [<c001575c=
>] (warn_slowpath_common+0x4c/0x64)
> [    0.238812] [<c001575c>] (warn_slowpath_common+0x4c/0x64) from [<c00=
15790>] (warn_slowpath_null+0x1c/0x24)
> [    0.248750] [<c0015790>] (warn_slowpath_null+0x1c/0x24) from [<c0054=
8f0>] (__lock_acquire+0x1824/0x1c58)
> [    0.258500] [<c00548f0>] (__lock_acquire+0x1824/0x1c58) from [<c0055=
210>] (lock_acquire+0x88/0x9c)
> [    0.267750] [<c0055210>] (lock_acquire+0x88/0x9c) from [<c0390aa4>] =
(mutex_lock_nested+0x5c/0x2ec)
> [    0.276968] [<c0390aa4>] (mutex_lock_nested+0x5c/0x2ec) from [<c00dc=
f04>] (lock_mount+0x1c/0xbc)
> [    0.286031] [<c00dcf04>] (lock_mount+0x1c/0xbc) from [<c00dd310>] (d=
o_add_mount+0x18/0xc8)
> [    0.294531] [<c00dd310>] (do_add_mount+0x18/0xc8) from [<c00de17c>] =
(do_mount+0x1cc/0x8d0)
> [    0.303062] [<c00de17c>] (do_mount+0x1cc/0x8d0) from [<c00de904>] (s=
ys_mount+0x84/0xb8)
> [    0.311343] [<c00de904>] (sys_mount+0x84/0xb8) from [<c022cf58>] (de=
vtmpfsd+0x4c/0x2b8)
> [    0.319593] [<c022cf58>] (devtmpfsd+0x4c/0x2b8) from [<c0034a58>] (k=
thread+0xa4/0xb0)
> [    0.327656] [<c0034a58>] (kthread+0xa4/0xb0) from [<c0009448>] (ret_=
from_fork+0x14/0x2c)
> [    0.336062] ---[ end trace 1b75b31a2719ed1c ]---

The warning comes from:

	list_for_each_entry(class, hash_head, hash_entry) {
		if (class->key =3D=3D key) {
			/*
			 * Huh! same key, different name? Did someone trample
			 * on some memory? We're most confused.
			 */
			WARN_ON_ONCE(class->name !=3D lock->name);
			return class;
		}
	}


[...]

> [    0.342000] devtmpfs: initialized
> [    0.350187] pinctrl core: initialized pinctrl subsystem
> [    0.358000]
> [    0.359656] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [    0.365218] [ INFO: possible recursive locking detected ]
> [    0.370812] 3.8.0-rc7-00011-g7a589e1-dirty #108 Tainted: G        W
> [    0.377562] ---------------------------------------------
> [    0.383125] swapper/1 is trying to acquire lock:
> [    0.387906]  (&inode->i_sb->s_type->i_mutex_key#7){+.+.+.}, at: [<c0=
1a988c>] inode_doinit_with_dentry+0x8c/0x55c
> [    0.398437]
> [    0.398437] but task is already holding lock:
> [    0.404562]  (&inode->i_sb->s_type->i_mutex_key#7){+.+.+.}, at: [<c0=
191bd4>] __create_file+0x50/0x25c
> [    0.414093]
> [    0.414093] other info that might help us debug this:
> [    0.420906]  Possible unsafe locking scenario:
> [    0.420906]
> [    0.427125]        CPU0
> [    0.429687]        ----
> [    0.432250]   lock(&inode->i_sb->s_type->i_mutex_key#7);
> [    0.437781]   lock(&inode->i_sb->s_type->i_mutex_key#7);
> [    0.443312]
> [    0.443312]  *** DEADLOCK ***
> [    0.443312]
> [    0.449593]  May be due to missing lock nesting notation
> [    0.449593]
> [    0.456687] 1 lock held by swapper/1:
> [    0.460500]  #0:  (&inode->i_sb->s_type->i_mutex_key#7){+.+.+.}, at:=
 [<c0191bd4>] __create_file+0x50/0x25c
> [    0.470468]
> [    0.470468] stack backtrace:
> [    0.475125] [<c000d0f0>] (unwind_backtrace+0x0/0xf0) from [<c0054578=
>] (__lock_acquire+0x14ac/0x1c58)
> [    0.484625] [<c0054578>] (__lock_acquire+0x14ac/0x1c58) from [<c0055=
210>] (lock_acquire+0x88/0x9c)
> [    0.493843] [<c0055210>] (lock_acquire+0x88/0x9c) from [<c0390aa4>] =
(mutex_lock_nested+0x5c/0x2ec)
> [    0.503093] [<c0390aa4>] (mutex_lock_nested+0x5c/0x2ec) from [<c01a9=
88c>] (inode_doinit_with_dentry+0x8c/0x55c)
> [    0.513468] [<c01a988c>] (inode_doinit_with_dentry+0x8c/0x55c) from =
[<c01a3f9c>] (security_d_instantiate+0x1c/0x34)
> [    0.524187] [<c01a3f9c>] (security_d_instantiate+0x1c/0x34) from [<c=
0191af0>] (debugfs_mknod.part.15.constprop.18+0x94/0x128)
> [    0.535812] [<c0191af0>] (debugfs_mknod.part.15.constprop.18+0x94/0x=
128) from [<c0191d34>] (__create_file+0x1b0/0x25c)
> [    0.546781] [<c0191d34>] (__create_file+0x1b0/0x25c) from [<c0191e68=
>] (debugfs_create_dir+0x1c/0x28)
> [    0.556312] [<c0191e68>] (debugfs_create_dir+0x1c/0x28) from [<c04d1=
f58>] (pinctrl_init+0x1c/0xd0)
> [    0.565531] [<c04d1f58>] (pinctrl_init+0x1c/0xd0) from [<c0008900>] =
(do_one_initcall+0x108/0x17c)
> [    0.574656] [<c0008900>] (do_one_initcall+0x108/0x17c) from [<c04c38=
58>] (kernel_init_freeable+0xec/0x1b4)
> [    0.584593] [<c04c3858>] (kernel_init_freeable+0xec/0x1b4) from [<c0=
389af0>] (kernel_init+0x8/0xe4)
> [    0.593906] [<c0389af0>] (kernel_init+0x8/0xe4) from [<c0009448>] (r=
et_from_fork+0x14/0x2c)

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2TEKQGUJXEENPRNERVKOV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlEbpSEACgkQjTAFq1RaXHO/pwCff4DFQOWdtfjkY82Qkk7UVCgs
jUMAnR7Zb3magInpJDLlwwEChf01hDgP
=nH00
-----END PGP SIGNATURE-----

------enig2TEKQGUJXEENPRNERVKOV--
