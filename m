Received: from mail86.messagelabs.com ([216.82.242.179])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SrOKW-0001XP-1P
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 07:05:54 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Wed, 18 Jul 2012 17:05:24 +1000
Subject: RE: UBIFS fails to mount on second boot
Message-ID: <6871BC8982B258468985EE735D2C57524B09D0EECD@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
 ,<1340806219.3070.23.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
 ,<1340977577.3070.207.camel@sauron.fi.intel.com>
 ,<6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
 <6871BC8982B258468985EE735D2C575243C0F088B7@ntcex01.corp.netcomm.com.au>,
 <1342240778.3209.12.camel@brekeke>
In-Reply-To: <1342240778.3209.12.camel@brekeke>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Artem Bityutskiy <dedekind1@gmail.com> wrote:
> I suspect this is a bug in the free space fixup code - my level of
> confidence on this is 80%. Could you please verify this by removing
> the -F mkfs.ubifs parameter or using the patch below. Thanks!

You're right, the problem doesn't happen without fixup.

I thought I was not flashing empty pages in U-Boot, but that turned
out not to be quite true. Without fixup, the boot died in a hailstorm
of asserts. I fixed that, but now the flashing takes noticeably longer.

In other words, I quite like the fixup feature and would prefer if it does=
n't
go away permanently. Otherwise:

Tested-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>

>=20
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 5862dd9..3398114 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1295,11 +1295,13 @@ static int mount_ubifs(struct ubifs_info *c)
>  =09if (err)
>  =09=09goto out_master;
> =20
> +#if 0
>  =09if (!c->ro_mount && c->space_fixup) {
>  =09=09err =3D ubifs_fixup_free_space(c);
>  =09=09if (err)
>  =09=09=09goto out_lpt;
>  =09}
> +#endif
> =20
>  =09if (!c->ro_mount) {
>  =09=09/*
>=20

Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
