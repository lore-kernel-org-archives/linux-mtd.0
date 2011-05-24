MIME-Version: 1.0
In-Reply-To: <1305557977-16871-2-git-send-email-marc.zyngier@arm.com>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-2-git-send-email-marc.zyngier@arm.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 24 May 2011 00:43:21 -0400
Message-ID: <BANLkTi=sd-Xhm8yXXbHk_VfMWwdaez_LhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] MTD: Add integrator-flash feature to physmap
To: Marc Zyngier <marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 16, 2011 at 10:59, Marc Zyngier wrote:
> --- a/include/linux/mtd/physmap.h
> +++ b/include/linux/mtd/physmap.h
> @@ -22,6 +22,8 @@ struct map_info;
>
> =C2=A0struct physmap_flash_data {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0width;
> + =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (*init)(struct platform_device *);
> + =C2=A0 =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(*exit)(struct platform_device *);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*set_vpp)(struct map_info *, int);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nr_parts;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pfow_base;

you use the platform_device structure but never include any header for
it.  please add "struct platform_device;" to the top of this file
after the #includes.

include/linux/mtd/physmap.h:25: warning: =E2=80=98struct platform_device=E2=
=80=99
declared inside parameter list
include/linux/mtd/physmap.h:25: warning: its scope is only this
definition or declaration, which is probably not what you want
include/linux/mtd/physmap.h:26: warning: =E2=80=98struct platform_device=E2=
=80=99
declared inside parameter list
include/linux/mtd/physmap.h:27: warning: =E2=80=98struct platform_device=E2=
=80=99
declared inside parameter list
-mike
