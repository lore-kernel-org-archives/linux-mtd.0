MIME-Version: 1.0
In-Reply-To: <1314185188-6151-1-git-send-email-jason.hui@linaro.org>
References: <1314185188-6151-1-git-send-email-jason.hui@linaro.org>
Date: Tue, 13 Sep 2011 14:31:30 +0800
Message-ID: <CAB4PhKd_=KjNGJ+3TL5tqPqoetcD28oaWC55UqNRqFGZ7gmYHw@mail.gmail.com>
Subject: Re: [[PATCH v2] mtd: check parts pointer before using it
From: Jason Liu <liu.h.jason@gmail.com>
To: Jason Liu <jason.hui@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David.Woodhouse@intel.com, patches@linaro.org, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem,

2011/8/24 Jason Liu <jason.hui@linaro.org>:
> The code has the check for parts but it called after kmemdup,
> kmemdup(parts, sizeof(*parts) * nr_parts,...)
> if (!parts)
> =A0 =A0 =A0 =A0return -ENOMEM
>
> In fact, we need check parts before safely using it.
> and we also need check the real_parts to make sure kmemdup
> allocation sucessfully.
>
> Signed-off-by: Jason Liu <jason.hui@linaro.org>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>
> ---
> V2: Fix one error condition check and add real_parts check too.
> ---
> This patch is based on git://git.infradead.org/users/dedekind/l2-mtd-2.6.=
git
> ---
> =A0drivers/mtd/mtdcore.c | =A0 =A07 ++++---
> =A01 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 09bdbac..b01993e 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -465,12 +465,13 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
 const char **types,
> =A0 =A0 =A0 =A0struct mtd_partition *real_parts;
>
> =A0 =A0 =A0 =A0err =3D parse_mtd_partitions(mtd, types, &real_parts, pars=
er_data);
> - =A0 =A0 =A0 if (err <=3D 0 && nr_parts) {
> + =A0 =A0 =A0 if (err <=3D 0 && nr_parts && parts) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0real_parts =3D kmemdup(parts, sizeof(*part=
s) * nr_parts,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 G=
FP_KERNEL);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D nr_parts;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!parts)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!real_parts)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D nr_parts;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (err > 0) {
> --
> 1.7.4.1

Ping, any comments about it? Thanks,

Jason

>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
