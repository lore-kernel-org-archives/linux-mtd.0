Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ev6aJ-0003MK-Hh
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2018 19:24:45 +0000
From: Richard Weinberger <richard@nod.at>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: Add option to create UBI FS version 4 on empty UBI
 volume
Date: Sun, 11 Mar 2018 20:25:51 +0100
Message-ID: <6098386.P4OGBmHZAp@blindfold>
In-Reply-To: <20180311160451.26833-1-hauke@hauke-m.de>
References: <20180311160451.26833-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hauke,

Am Sonntag, 11. M=E4rz 2018, 17:04:51 CET schrieb Hauke Mehrtens:
> Instead of creating an ubifs file system with format version 5 by
> default on empty UBI volumes add a compile option to create an older ubi
> with file system format version 4 instated. This allows it to be mount
> as a volume on kernel versions < 4.10, which does not support format
> version 5.
> We saw that some people can not access their older data when they
> downgraded from kernel 4.14 to kernel 4.9 to prevent this this option
> would help.

I agree, we should address this.

> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  fs/ubifs/Kconfig | 13 +++++++++++++
>  fs/ubifs/sb.c    |  6 ++++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
> index 83a961bf7280..a1426b865726 100644
> --- a/fs/ubifs/Kconfig
> +++ b/fs/ubifs/Kconfig
> @@ -74,3 +74,16 @@ config UBIFS_FS_SECURITY
>  	  the extended attribute support in advance.
>=20
>  	  If you are not using a security module, say N.
> +
> +config UBIFS_FS_FORMAT4

A new config option is IMHO too coarse grained.
Sadly ubifs rejects unknown mount parameters, so having it as mount option =
is=20
also not feasible since old kernels will refuse to mount then.

Please make it a module parameter. For example ubifs.default_version.

Thanks,
//richard
