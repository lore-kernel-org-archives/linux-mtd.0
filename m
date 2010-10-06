Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3bRV-0002zp-4o
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2010 21:22:30 +0000
Received: by vws11 with SMTP id 11so18804vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Oct 2010 14:22:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
Date: Wed, 6 Oct 2010 23:22:27 +0200
Message-ID: <AANLkTi=1j-N-VdJ0=tF5Sf8B8tasvtBYaWteoHCuxnkD@mail.gmail.com>
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Karl Beldan <karl.beldan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Karl Beldan <karl.beldan@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Edit for my off-by-one typo:

On Wed, Oct 6, 2010 at 11:02 PM, Karl Beldan <karl.beldan@gmail.com> wrote:
> Hi,
>
> I have been using this tweak for some time now, and I am getting tired of
> having to resort to it so often.
> It allows to pass such cmdline root as:
> =C2=A0"root=3Dmtdb:ubivolx rootfstype=3Dsquashfs"
> I am pretty sure many people use squashfs/cramfs filesystems on top of na=
nd,
> for example, and I thought that this might initiate discussion.
>
> --
> Karl
>
> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
> ---
> =C2=A0init/do_mounts.c | =C2=A0 15 +++++++++++++--
> =C2=A01 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index 02e3ca4..20d9380 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -20,6 +20,7 @@
> =C2=A0#include <linux/nfs_fs.h>
> =C2=A0#include <linux/nfs_fs_sb.h>
> =C2=A0#include <linux/nfs_mount.h>
> +#include <linux/mtd/mtd.h>
>
> =C2=A0#include "do_mounts.h"
>
> @@ -386,8 +387,18 @@ void __init prepare_namespace(void)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (saved_root_name[0]) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root_device_name =
=3D saved_root_name;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(root_devi=
ce_name, "mtd", 3) ||
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !strncmp=
(root_device_name, "ubi", 3)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(root_devi=
ce_name, "mtdb:", 4)) {
Here, it is 5 not 4

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct mtd_info *mtd =3D get_mtd_device_nm(root_device_name + 4);
same here

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (!IS_ERR(mtd))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(root_device_name, "/dev/mtdblock=
%d", mtd->index);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "VFS: Unable to find mtd=
 \"%s\"\n", root_device_name + 4);
and here

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk("List of all partitions:\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk_all_partitions();
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic("VFS: Unable to mount root fs");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strncmp(ro=
ot_device_name, "mtd", 3) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0!strncmp(root_device_name, "ubi", 3)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mount_block_root(root_device_name, root_mountflags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> --
> 1.7.1.422.g049e9
>

--=20
Karl
