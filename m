Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEcDi-0007il-Ub
 for linux-mtd@lists.infradead.org; Sat, 15 Feb 2014 10:11:41 +0000
Message-ID: <52FF3D3F.7040201@pengutronix.de>
Date: Sat, 15 Feb 2014 11:11:11 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: =?UTF-8?B?Ikt1biBDaGVuICjpmYjmmIYpIg==?= <Kun.Chen@mediatek.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: Re: =?UTF-8?B?562U5aSNOiBbUEFUQ0ggNi82XSBzZWxpbnV4OiBkbyBub3QgY28=?=
 =?UTF-8?B?bmZ1c2UgbG9ja2RlcA==?=
References: <1392375054-7090-1-git-send-email-mkl@pengutronix.de>	
 <1392375054-7090-6-git-send-email-mkl@pengutronix.de>
 <1392385262.12215.88.camel@sauron.fi.intel.com>
 <52FE1ED9.9000800@pengutronix.de>
 <CB75B1DB52D5294B94D5216BEFBBD8244490BFD6@mtkmbs33n1>
In-Reply-To: <CB75B1DB52D5294B94D5216BEFBBD8244490BFD6@mtkmbs33n1>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="OROJ62VEoNfUNpvlpSx6LxCHLBMqUUk0x"
Cc: =?UTF-8?B?IkxpbmdlciBMZWUgKOadjueVjOmLkiki?= <linger.lee@mediatek.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OROJ62VEoNfUNpvlpSx6LxCHLBMqUUk0x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/15/2014 07:55 AM, Kun Chen (=E9=99=88=E6=98=86) wrote:
> In our platform, we apply the xattr patch and get this lock warning
> which same as you described in
> http://lists.infradead.org/pipermail/linux-mtd/2013-February/045818.htm=
l
>
> Does this lock warning already has patch now?

Taking this discussion to the linux-mtd list. Have you applied the
whole series I've send you? Look at the end of this mail for the patch.

Marc
>=20
> Our lock warning message:
>=20
> [   18.069796]-(1)[1:init]---------------------------------------------=
----------
> [   18.070697]-(1)[1:init]init/1 is trying to acquire lock:
> [   18.071358]-(1)[1:init] (&sb->s_type->i_mutex_key#7){+.+...}, at: [<=
c02a6dd4>] ubifs_init_security+0x34/0x6c
> [   18.072583]-(1)[1:init]
> [   18.072587]-(1)[1:init]but task is already holding lock:
> [   18.073548]-(1)[1:init] (&ui->ui_mutex){+.+...}, at: [<c027a894>] ub=
ifs_mkdir+0xb4/0x224
> [   18.074557]-(1)[1:init]
> [   18.074561]-(1)[1:init]which lock already depends on the new lock.
> [   18.074567]-(1)[1:init]
> [   18.075935]-(1)[1:init]
> [   18.075939]-(1)[1:init]the existing dependency chain (in reverse ord=
er) is:
> [   18.077107]-(1)[1:init]
> [   18.077111]-(1)[1:init]-> #1 (&ui->ui_mutex){+.+...}:
> [   18.078039]-(1)[1:init]       [<c00d2b10>] __lock_acquire+0x1518/0x1=
b1c
> [   18.078863]-(1)[1:init]       [<c00d36b8>] lock_acquire+0xac/0x14c
> [   18.079634]-(1)[1:init]       [<c0836928>] mutex_lock_nested+0x6c/0x=
560
> [   18.080458]-(1)[1:init]       [<c0277de4>] ubifs_setattr+0xf8/0x408
> [   18.081238]-(1)[1:init]       [<c019c94c>] notify_change+0x1fc/0x31c=

> [   18.082030]-(1)[1:init]       [<c017f1dc>] chmod_common+0x70/0x90
> [   18.082789]-(1)[1:init]       [<c017fdac>] sys_fchmodat+0x3c/0x54
> [   18.083549]-(1)[1:init]       [<c017fdec>] sys_chmod+0x28/0x2c
> [   18.084275]-(1)[1:init]       [<c000e480>] ret_fast_syscall+0x0/0x40=

> [   18.085068]-(1)[1:init]
> [   18.085072]-(1)[1:init]-> #0 (&sb->s_type->i_mutex_key#7){+.+...}:
> [   18.086141]-(1)[1:init]       [<c082b3a8>] print_circular_bug+0x68/0=
x2c4
> [   18.086976]-(1)[1:init]       [<c00d2bac>] __lock_acquire+0x15b4/0x1=
b1c
> [   18.087800]-(1)[1:init]       [<c00d36b8>] lock_acquire+0xac/0x14c
> [   18.088571]-(1)[1:init]       [<c0836928>] mutex_lock_nested+0x6c/0x=
560
> [   18.089395]-(1)[1:init]       [<c02a6dd4>] ubifs_init_security+0x34/=
0x6c
> [   18.090230]-(1)[1:init]       [<c027a930>] ubifs_mkdir+0x150/0x224
> [   18.091000]-(1)[1:init]       [<c018d128>] vfs_mkdir+0xc8/0x144
> [   18.091737]-(1)[1:init]       [<c0191330>] sys_mkdirat+0xb8/0xc8
> [   18.092486]-(1)[1:init]       [<c0191368>] sys_mkdir+0x28/0x2c
> [   18.093213]-(1)[1:init]       [<c000e480>] ret_fast_syscall+0x0/0x40=

> [   18.094005]-(1)[1:init]
> [   18.094009]-(1)[1:init]other info that might help us debug this:
> [   18.094015]-(1)[1:init]
> [   18.095362]-(1)[1:init] Possible unsafe locking scenario:
> [   18.095367]-(1)[1:init]
> [   18.096338]-(1)[1:init]       CPU0                    CPU1
> [   18.097021]-(1)[1:init]       ----                    ----
> [   18.097704]-(1)[1:init]  lock(&ui->ui_mutex);
> [   18.098247]-(1)[1:init]                               lock(&sb->s_ty=
pe->i_mutex_key#7);
> [   18.099244]-(1)[1:init]                               lock(&ui->ui_m=
utex);
> [   18.100101]-(1)[1:init]  lock(&sb->s_type->i_mutex_key#7);
> [   18.100784]-(1)[1:init]
> [   18.100789]-(1)[1:init] *** DEADLOCK ***
> [   18.100794]-(1)[1:init]
> [   18.101882]-(1)[1:init][Caution!] init/1 is runable state
> [   18.102555]-(1)[1:init]2 locks held by init/1:
> [   18.103106]-(1)[1:init] #0:  (&type->i_mutex_dir_key#3/1){+.+.+.}, a=
t: [<c018fd7c>] kern_path_create+0x74/0xfc
> [   18.104353]-(1)[1:init] #1:  (&ui->ui_mutex){+.+...}, at: [<c027a894=
>] ubifs_mkdir+0xb4/0x224
> [   18.105416]-(1)[1:init]
> [   18.105420]-(1)[1:init]stack backtrace:
> [   18.106196]-(1)[1:init]Backtrace:=20
> [   18.106633]-(1)[1:init][<c0012848>] (dump_backtrace+0x0/0x114) from =
[<c082a18c>] (dump_stack+0x20/0x24)
> [   18.107802]-(1)[1:init] r6:c0e8e244 r5:c0e8e134 r4:c0e8e244 r3:271ae=
95f
> [   18.108636]-(1)[1:init][<c082a16c>] (dump_stack+0x0/0x24) from [<c08=
2b5b4>] (print_circular_bug+0x274/0x2c4)
> [   18.109871]-(1)[1:init][<c082b340>] (print_circular_bug+0x0/0x2c4) f=
rom [<c00d2bac>] (__lock_acquire+0x15b4/0x1b1c)
> [   18.111183]-(1)[1:init][<c00d15f8>] (__lock_acquire+0x0/0x1b1c) from=
 [<c00d36b8>] (lock_acquire+0xac/0x14c)
> [   18.112408]-(1)[1:init][<c00d360c>] (lock_acquire+0x0/0x14c) from [<=
c0836928>] (mutex_lock_nested+0x6c/0x560)
> [   18.113655]-(1)[1:init][<c08368bc>] (mutex_lock_nested+0x0/0x560) fr=
om [<c02a6dd4>] (ubifs_init_security+0x34/0x6c)
> [   18.114966]-(1)[1:init][<c02a6da0>] (ubifs_init_security+0x0/0x6c) f=
rom [<c027a930>] (ubifs_mkdir+0x150/0x224)
> [   18.116211]-(1)[1:init] r7:dcf12000 r6:dc1edb10 r5:df861ef4 r4:dbfe1=
b10
> [   18.117046]-(1)[1:init][<c027a7e0>] (ubifs_mkdir+0x0/0x224) from [<c=
018d128>] (vfs_mkdir+0xc8/0x144)
> [   18.118192]-(1)[1:init][<c018d060>] (vfs_mkdir+0x0/0x144) from [<c01=
91330>] (sys_mkdirat+0xb8/0xc8)
> [   18.119317]-(1)[1:init] r8:c000e704 r7:00000027 r6:000001f8 r5:00000=
000 r4:dbfe4150
> [   18.120283]-(1)[1:init][<c0191278>] (sys_mkdirat+0x0/0xc8) from [<c0=
191368>] (sys_mkdir+0x28/0x2c)
> [   18.121396]-(1)[1:init] r6:00000005 r5:0004f7c4 r4:000001f8
> [   18.122102]-(1)[1:init][<c0191340>] (sys_mkdir+0x0/0x2c) from [<c000=
e480>] (ret_fast_syscall+0x0/0x40)
> Best regards.
>=20
> - Kun Chen (=E9=99=88=E6=98=86)
>=20
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Marc Kleine-Budde [mailto:mkl@pengutronix.=
de]=20
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2014=E5=B9=B42=E6=9C=8814=E6=97=A5=
 21:49
> =E6=94=B6=E4=BB=B6=E4=BA=BA: artem.bityutskiy@linux.intel.com
> =E6=8A=84=E9=80=81: Kun Chen (=E9=99=88=E6=98=86)
> =E4=B8=BB=E9=A2=98: Re: [PATCH 6/6] selinux: do not confuse lockdep
>=20
> On 02/14/2014 02:41 PM, Artem Bityutskiy wrote:
>> On Fri, 2014-02-14 at 11:50 +0100, Marc Kleine-Budde wrote:
>>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>>
>>> Selinux has per-inode mutexes called 'isec->lock', and they are=20
>>> initialized in the same place, which makes lockdep treat all of the=20
>>> them as if they were identical. However, locking rules may be a=20
>>> little bit different depending on the file-system, so we should put=20
>>> these locks to separate classes, just like we do for 'i_mutex'.=20
>>> Namely, we should put them to per-FS type classes, which is exactly w=
hat this patch does.
>>>
>>> The problem this patch intends to fix is a strange lockdep warning,=20
>>> which I, frankly speaking, do not really understand, but I believe=20
>>> the root-cause should be fixed by this patch.
>>
>> I wonder, why this patch is not in upstream? Does it work, BTW? :-)=20
>> You could try to re-send it to selinux maintainers.
>=20
> $customer changes priorities, no time to test. But I hope Kun Chen can =
take over.
>=20
> Marc
>=20

=46rom 10270a6b9899790ead4cc8d44c41cc1dc9dc5087 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Thu, 14 Feb 2013 09:07:36 +0200
Subject: [PATCH] selinux: do not confuse lockdep

Selinux has per-inode mutexes called 'isec->lock', and they are
initialized in
the same place, which makes lockdep treat all of the them as if they were=

identical. However, locking rules may be a little bit different depending=
 on
the file-system, so we should put these locks to separate classes, just
like we
do for 'i_mutex'. Namely, we should put them to per-FS type classes,
which is
exactly what this patch does.

The problem this patch intends to fix is a strange lockdep warning, which=
 I,
frankly speaking, do not really understand, but I believe the root-cause
should
be fixed by this patch.

Look at the stacktrace #4: here we have 'debugfs_create_dir()'

[    5.390312] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    5.396500] [ INFO: possible circular locking dependency detected ]
[    5.402781] 3.8.0-rc6-00005-g4f7e39d #49 Not tainted
[    5.407750] -------------------------------------------------------
[    5.414031] systemd/1 is trying to acquire lock:
[    5.418656]  (&c->tnc_mutex){+.+...}, at: [<c01552d0>]
ubifs_tnc_locate+0x30/0x198
[    5.426343]
[    5.426343] but task is already holding lock:
[    5.432218]  (&isec->lock){+.+.+.}, at: [<c018e298>]
inode_doinit_with_dentry+0x8c/0x55c
[    5.440375]
[    5.440375] which lock already depends on the new lock.
[    5.440375]
[    5.448593]
[    5.448593] the existing dependency chain (in reverse order) is:
[    5.456093]
-> #4 (&isec->lock){+.+.+.}:
[    5.460250]        [<c004e8e8>] lock_acquire+0x64/0x78
[    5.465437]        [<c0355d5c>] mutex_lock_nested+0x5c/0x2ec
[    5.471125]        [<c018e298>] inode_doinit_with_dentry+0x8c/0x55c
[    5.477437]        [<c0189bd8>] security_d_instantiate+0x1c/0x34
[    5.483500]        [<c017a614>]
debugfs_mknod.part.15.constprop.18+0x94/0x128
[    5.490656]        [<c017a858>] __create_file+0x1b0/0x25c
[    5.496093]        [<c017a98c>] debugfs_create_dir+0x1c/0x28
[    5.501781]        [<c0491ce8>] pinctrl_init+0x1c/0xd0
[    5.506968]        [<c0008900>] do_one_initcall+0x108/0x17c
[    5.512593]        [<c0483858>] kernel_init_freeable+0xec/0x1b4
[    5.518562]        [<c034f398>] kernel_init+0x8/0xe4
[    5.523562]        [<c0009448>] ret_from_fork+0x14/0x2c
[    5.528812]
-> #3 (&sb->s_type->i_mutex_key#2){+.+.+.}:
[    5.534312]        [<c004e8e8>] lock_acquire+0x64/0x78
[    5.539468]        [<c0355d5c>] mutex_lock_nested+0x5c/0x2ec
[    5.545187]        [<c017a6f8>] __create_file+0x50/0x25c
[    5.550531]        [<c017a98c>] debugfs_create_dir+0x1c/0x28
[    5.556218]        [<c026cfc4>] clk_debug_create_subtree+0x1c/0x108
[    5.562500]        [<c0495bfc>] clk_debug_init+0x68/0xc0
[    5.567875]        [<c0008900>] do_one_initcall+0x108/0x17c
[    5.573468]        [<c0483858>] kernel_init_freeable+0xec/0x1b4
[    5.579437]        [<c034f398>] kernel_init+0x8/0xe4
[    5.584437]        [<c0009448>] ret_from_fork+0x14/0x2c
[    5.589687]
-> #2 (prepare_lock){+.+.+.}:
[    5.593937]        [<c004e8e8>] lock_acquire+0x64/0x78
[    5.599125]        [<c0355d5c>] mutex_lock_nested+0x5c/0x2ec
[    5.604812]        [<c026d400>] clk_prepare+0x18/0x38
[    5.609906]        [<c023a2f8>] __gpmi_enable_clk+0x30/0xb0
[    5.615531]        [<c023a7bc>] gpmi_begin+0x18/0x530
[    5.620625]        [<c0239244>] gpmi_select_chip+0x3c/0x54
[    5.626156]        [<c02341ac>] nand_do_read_ops+0x7c/0x3e4
[    5.631750]        [<c023483c>] nand_read+0x50/0x74
[    5.636656]        [<c02198e4>] part_read+0x5c/0xa4
[    5.641593]        [<c0217404>] mtd_read+0x84/0xb8
[    5.646406]        [<c02450cc>] ubi_io_read+0xa0/0x2c0
[    5.651593]        [<c0242640>] ubi_eba_read_leb+0x190/0x424
[    5.657281]        [<c0241b18>] ubi_leb_read+0xac/0x120
[    5.662562]        [<c01503e4>] ubifs_leb_read+0x28/0x8c
[    5.667906]        [<c0151f74>] ubifs_read_node+0x98/0x2a0
[    5.673437]        [<c014e780>] ubifs_read_sb_node+0x54/0x78
[    5.679125]        [<c014f444>] ubifs_read_superblock+0xc60/0x163c
[    5.685343]        [<c014d64c>] ubifs_mount+0x800/0x171c
[    5.690687]        [<c00b5740>] mount_fs+0x44/0x184
[    5.695593]        [<c00cd7ec>] vfs_kern_mount+0x4c/0xc0
[    5.700968]        [<c00cf394>] do_mount+0x18c/0x8d0
[    5.705968]        [<c00cfb5c>] sys_mount+0x84/0xb8
[    5.710875]        [<c0483bc8>] mount_block_root+0x118/0x258
[    5.716562]        [<c0483eac>] prepare_namespace+0x8c/0x17c
[    5.722281]        [<c034f398>] kernel_init+0x8/0xe4
[    5.727281]        [<c0009448>] ret_from_fork+0x14/0x2c
[    5.732531]
-> #1 (&le->mutex){++++..}:
[    5.736625]        [<c004e8e8>] lock_acquire+0x64/0x78
[    5.741812]        [<c0356468>] down_read+0x40/0x54
[    5.746718]        [<c02424e4>] ubi_eba_read_leb+0x34/0x424
[    5.752312]        [<c0241b18>] ubi_leb_read+0xac/0x120
[    5.757562]        [<c01503e4>] ubifs_leb_read+0x28/0x8c
[    5.762937]        [<c0151f74>] ubifs_read_node+0x98/0x2a0
[    5.768437]        [<c016edc0>] ubifs_load_znode+0x88/0x560
[    5.774062]        [<c0155254>] ubifs_lookup_level0+0x190/0x1dc
[    5.780031]        [<c01552e4>] ubifs_tnc_locate+0x44/0x198
[    5.785656]        [<c014c614>] ubifs_iget+0x6c/0x8a4
[    5.790718]        [<c014da64>] ubifs_mount+0xc18/0x171c
[    5.796093]        [<c00b5740>] mount_fs+0x44/0x184
[    5.801000]        [<c00cd7ec>] vfs_kern_mount+0x4c/0xc0
[    5.806343]        [<c00cf394>] do_mount+0x18c/0x8d0
[    5.811343]        [<c00cfb5c>] sys_mount+0x84/0xb8
[    5.816250]        [<c0483bc8>] mount_block_root+0x118/0x258
[    5.821968]        [<c0483eac>] prepare_namespace+0x8c/0x17c
[    5.827656]        [<c034f398>] kernel_init+0x8/0xe4
[    5.832656]        [<c0009448>] ret_from_fork+0x14/0x2c
[    5.837906]
-> #0 (&c->tnc_mutex){+.+...}:
[    5.842250]        [<c004de48>] __lock_acquire+0x14ec/0x1b08
[    5.847968]        [<c004e8e8>] lock_acquire+0x64/0x78
[    5.853125]        [<c0355d5c>] mutex_lock_nested+0x5c/0x2ec
[    5.858812]        [<c01552d0>] ubifs_tnc_locate+0x30/0x198
[    5.864437]        [<c0155a48>] ubifs_tnc_lookup_nm+0x28/0x150
[    5.870312]        [<c016fc18>] ubifs_getxattr+0xc0/0x254
[    5.875750]        [<c018e468>] inode_doinit_with_dentry+0x25c/0x55c
[    5.882125]        [<c018f1a8>] sb_finish_set_opts+0xa4/0x21c
[    5.887906]        [<c019055c>] selinux_set_mnt_opts+0x2ec/0x4b8
[    5.893968]        [<c01907dc>] superblock_doinit+0xb4/0xc0
[    5.899562]        [<c00b51f4>] iterate_supers+0xb4/0xdc
[    5.904906]        [<c01a02e8>] security_load_policy+0x248/0x3c4
[    5.910968]        [<c0194994>] sel_write_load+0x9c/0x6a0
[    5.916406]        [<c00b2148>] vfs_write+0xa0/0x17c
[    5.921406]        [<c00b2450>] sys_write+0x3c/0x70
[    5.926343]        [<c00093a0>] ret_fast_syscall+0x0/0x38
[    5.931781]
[    5.931781] other info that might help us debug this:
[    5.931781]
[    5.939781] Chain exists of:
  &c->tnc_mutex --> &sb->s_type->i_mutex_key#2 --> &isec->lock
[    5.948500]  Possible unsafe locking scenario:
[    5.948500]
[    5.954437]        CPU0                    CPU1
[    5.958968]        ----                    ----
[    5.963500]   lock(&isec->lock);
[    5.966781]
lock(&sb->s_type->i_mutex_key#2);
[    5.973843]                                lock(&isec->lock);
[    5.979625]   lock(&c->tnc_mutex);
[    5.983062]
[    5.983062]  *** DEADLOCK ***
[    5.983062]
[    5.989000] 4 locks held by systemd/1:
[    5.992781]  #0:  (sel_mutex){+.+.+.}, at: [<c0194918>]
sel_write_load+0x20/0x6a0
[    6.000343]  #1:  (&type->s_umount_key#26){.+.+..}, at: [<c00b51d0>]
iterate_supers+0x90/0xdc
[    6.008968]  #2:  (&sbsec->lock){+.+.+.}, at: [<c01902d4>]
selinux_set_mnt_opts+0x64/0x4b8
[    6.017343]  #3:  (&isec->lock){+.+.+.}, at: [<c018e298>]
inode_doinit_with_dentry+0x8c/0x55c
[    6.025937]
[    6.025937] stack backtrace:
[    6.030375] [<c000d0f0>] (unwind_backtrace+0x0/0xf0) from
[<c0351a2c>] (print_circular_bug+0x25c/0x2a8)
[    6.039843] [<c0351a2c>] (print_circular_bug+0x25c/0x2a8) from
[<c004de48>] (__lock_acquire+0x14ec/0x1b08)
[    6.049531] [<c004de48>] (__lock_acquire+0x14ec/0x1b08) from
[<c004e8e8>] (lock_acquire+0x64/0x78)
[    6.058531] [<c004e8e8>] (lock_acquire+0x64/0x78) from [<c0355d5c>]
(mutex_lock_nested+0x5c/0x2ec)
[    6.067531] [<c0355d5c>] (mutex_lock_nested+0x5c/0x2ec) from
[<c01552d0>] (ubifs_tnc_locate+0x30/0x198)
[    6.076968] [<c01552d0>] (ubifs_tnc_locate+0x30/0x198) from
[<c0155a48>] (ubifs_tnc_lookup_nm+0x28/0x150)
[    6.086593] [<c0155a48>] (ubifs_tnc_lookup_nm+0x28/0x150) from
[<c016fc18>] (ubifs_getxattr+0xc0/0x254)
[    6.096031] [<c016fc18>] (ubifs_getxattr+0xc0/0x254) from
[<c018e468>] (inode_doinit_with_dentry+0x25c/0x55c)
[    6.105968] [<c018e468>] (inode_doinit_with_dentry+0x25c/0x55c) from
[<c018f1a8>] (sb_finish_set_opts+0xa4/0x21c)
[    6.116281] [<c018f1a8>] (sb_finish_set_opts+0xa4/0x21c) from
[<c019055c>] (selinux_set_mnt_opts+0x2ec/0x4b8)
[    6.126218] [<c019055c>] (selinux_set_mnt_opts+0x2ec/0x4b8) from
[<c01907dc>] (superblock_doinit+0xb4/0xc0)
[    6.136000] [<c01907dc>] (superblock_doinit+0xb4/0xc0) from
[<c00b51f4>] (iterate_supers+0xb4/0xdc)
[    6.145093] [<c00b51f4>] (iterate_supers+0xb4/0xdc) from [<c01a02e8>]
(security_load_policy+0x248/0x3c4)
[    6.154625] [<c01a02e8>] (security_load_policy+0x248/0x3c4) from
[<c0194994>] (sel_write_load+0x9c/0x6a0)
[    6.164218] [<c0194994>] (sel_write_load+0x9c/0x6a0) from
[<c00b2148>] (vfs_write+0xa0/0x17c)
[    6.172781] [<c00b2148>] (vfs_write+0xa0/0x17c) from [<c00b2450>]
(sys_write+0x3c/0x70)
[    6.180843] [<c00b2450>] (sys_write+0x3c/0x70) from [<c00093a0>]
(ret_fast_syscall+0x0/0x38)

Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 include/linux/fs.h       | 1 +
 security/selinux/hooks.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6082956..9e83ca8 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1832,6 +1832,7 @@ struct file_system_type {
 	struct lock_class_key i_lock_key;
 	struct lock_class_key i_mutex_key;
 	struct lock_class_key i_mutex_dir_key;
+	struct lock_class_key i_security_lock_key;
 };

 #define MODULE_ALIAS_FS(NAME) MODULE_ALIAS("fs-" NAME)
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 4b34847..bc0c1fc 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -223,6 +223,8 @@ static int inode_alloc_security(struct inode *inode)
 		return -ENOMEM;

 	mutex_init(&isec->lock);
+	lockdep_set_class(&isec->lock,
+			  &inode->i_sb->s_type->i_security_lock_key);
 	INIT_LIST_HEAD(&isec->list);
 	isec->inode =3D inode;
 	isec->sid =3D SECINITSID_UNLABELED;
--=20
1.8.5.3




--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--OROJ62VEoNfUNpvlpSx6LxCHLBMqUUk0x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlL/PT8ACgkQjTAFq1RaXHMGCgCeJ3GPvqlqfXs4tu6pVXEftWYg
PnUAn3uV6g6Taz3NJNDpORSABpyVdsuc
=Y1R5
-----END PGP SIGNATURE-----

--OROJ62VEoNfUNpvlpSx6LxCHLBMqUUk0x--
