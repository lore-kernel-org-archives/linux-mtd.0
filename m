Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d48pb-0005d2-D4
 for linux-mtd@lists.infradead.org; Fri, 28 Apr 2017 16:33:21 +0000
Date: Fri, 28 Apr 2017 18:32:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 1/2] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
Message-ID: <20170428183250.4c43e107@bbrezillon>
In-Reply-To: <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
 <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Masahiro,

Sorry for the delay, I was busy with non-NAND/MTD stuff lately.

On Wed, 19 Apr 2017 16:06:57 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Each driver has been responsible for:
>   - Check if ECC setting specified (mostly by DT) is valid
>   - Meet the chip's required ECC strength
>   - Maximize the strength when NAND_ECC_MAXIMIZE flag is set
>=20
> The logic can be generalized by factoring out driver-specific
> parameters.  A driver provides:
>   - Array of (step_size, strength) supported on the controller
>   - A hook that calculates ECC bytes from the combination of
>     (step_size, strength).
>=20
> Then, this commit provides 3 helper functions:
> nand_check_ecc_caps - Check if preset (step_size, strength) is valid
> nand_try_to_match_ecc_req - Match the chip's requirement
> nand_try_to_maximize_ecc - Maximize the ECC strength
>=20
> These helpers will save duplicated code among drivers.

Thanks for working on this. My comments below.

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  drivers/mtd/nand/nand_base.c | 178 +++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mtd/nand.h     |  31 ++++++++
>  2 files changed, 209 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0670e13..ee43e5e 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4539,6 +4539,184 @@ static int nand_set_ecc_soft_ops(struct mtd_info =
*mtd)
>  	}
>  }
> =20
> +/**
> + * nand_check_ecc_caps - check if ECC step size and strength is supported
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @caps: ECC engine caps info structure
> + *
> + * When ECC step size and strength are set, check if the combination is =
really
> + * supported by the controller and fit within the chip's OOB.  On succes=
s,
> + * ECC bytes per step is set.
> + */
> +int nand_check_ecc_caps(struct mtd_info *mtd, struct nand_chip *chip,
> +			const struct nand_ecc_engine_caps *caps)
> +{
> +	const struct nand_ecc_setting *setting;
> +	int preset_step =3D chip->ecc.size;
> +	int preset_strength =3D chip->ecc.strength;
> +	int ecc_bytes;
> +
> +	if (!preset_step || !preset_strength)
> +		return -ENODATA;
> +
> +	for (setting =3D caps->ecc_settings; setting->step; setting++) {
> +		if (setting->step !=3D preset_step ||
> +		    setting->strength !=3D preset_strength)
> +			continue;
> +
> +		ecc_bytes =3D caps->calc_ecc_bytes(setting);
> +		if (WARN_ON_ONCE(ecc_bytes < 0))
> +			continue;
> +
> +		if (ecc_bytes * mtd->writesize / setting->step >
> +		    caps->avail_oobsize) {
> +			pr_err("ECC (step, strength) =3D (%d, %d) does not fit in OOB",
> +			       setting->step, setting->strength);
> +			return -ENOSPC;
> +		}
> +
> +		chip->ecc.bytes =3D ecc_bytes;
> +		return 0;
> +	}
> +
> +	pr_err("ECC (step, strength) =3D (%d, %d) not supported on this control=
ler",
> +	       preset_step, preset_strength);
> +
> +	return -ENOTSUPP;
> +}
> +
> +/**
> + * nand_try_to_match_ecc_req - meet the chip's requirement with least EC=
C bytes
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @caps: ECC engine caps info structure
> + *
> + * If chip's ECC requirement is available, try to meet it with the least=
 number
> + * number of ECC bytes (i.e. with the largest number of OOB-free bytes).
> + * On success, the chosen ECC settings are set.
> + */
> +int nand_try_to_match_ecc_req(struct mtd_info *mtd, struct nand_chip *ch=
ip,
> +			      const struct nand_ecc_engine_caps *caps)
> +{
> +	const struct nand_ecc_setting *setting, *best_setting =3D NULL;
> +	int req_step =3D chip->ecc_step_ds;
> +	int req_strength =3D chip->ecc_strength_ds;
> +	int req_corr, steps, ecc_bytes, ecc_bytes_total;
> +	int best_ecc_bytes, best_ecc_bytes_total =3D INT_MAX;
> +
> +	/* No information provided by the NAND chip */
> +	if (!req_step || !req_strength)
> +		return -ENOTSUPP;
> +
> +	/* number of correctable bits the chip requires in a page */
> +	req_corr =3D mtd->writesize / req_step * req_strength;
> +
> +	for (setting =3D caps->ecc_settings; setting->step; setting++) {
> +		/* If chip->ecc.size is already set, respect it. */
> +		if (chip->ecc.size && setting->step !=3D chip->ecc.size)
> +			continue;
> +
> +		/* If chip->ecc.strength is already set, respect it. */
> +		if (chip->ecc.strength &&
> +		    setting->strength !=3D chip->ecc.strength)
> +			continue;

Hm, I don't get it. If chip->ecc.strength and chip->ecc.size are
explicitly set, you should just call nand_check_ecc_caps() and skip
nand_try_to_match_ecc_req(). Why would you call
nand_try_to_match_ecc_req() in this case?

> +
> +		/*
> +		 * If the controller's step size is smaller than the chip's
> +		 * requirement, comparison of the strength is not simple.
> +		 */

There's one thing we can easily do in this case: try to apply the
same strength but on the smaller step size. If it fits the OOB area, we
have a valid match, if it doesn't, then we can fallback to ECC
maximization in case no valid settings were found after iterating over
ECC settings.

How about:

		if (setting->step < req_step &&
		    setting->strength < req_strength)
			continue;

> +		if (setting->step < req_step)
> +			continue;

You should probably check that setting->step < mtd->writesize.

> +
> +		steps =3D mtd->writesize / setting->step;

Not sure it will ever happen to have a step which is not a multiple of
->writesize, but it's probably safer to do DIV_ROUND_UP(), or simply
skip the ECC setting entry if mtd->writesize % setting->step !=3D 0.

> +
> +		ecc_bytes =3D caps->calc_ecc_bytes(setting);
> +		if (WARN_ON_ONCE(ecc_bytes < 0))
> +			continue;
> +		ecc_bytes_total =3D ecc_bytes * steps;
> +
> +		if (ecc_bytes_total > caps->avail_oobsize ||
> +		    setting->strength * steps < req_corr)
> +			continue;
> +
> +		/*
> +		 * We assume the best is to meet the chip's requrement
> +		 * with the least number of ECC bytes.
> +		 */

If ecc_settings entries were in ascending order (lowest step-size and
strength first), you could bail out as soon as you find a suitable
config, because following settings would necessarily take more bits.

> +		if (ecc_bytes_total < best_ecc_bytes_total) {
> +			best_ecc_bytes_total =3D ecc_bytes_total;
> +			best_setting =3D setting;
> +			best_ecc_bytes =3D ecc_bytes;
> +		}
> +	}
> +
> +	if (!best_setting)
> +		return -ENOTSUPP;
> +
> +	chip->ecc.size =3D best_setting->step;
> +	chip->ecc.strength =3D best_setting->strength;
> +	chip->ecc.bytes =3D best_ecc_bytes;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(nand_try_to_match_ecc_req);
> +
> +/**
> + * nand_try_to_maximize_ecc - choose the max ECC strength available
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @caps: ECC engine caps info structure
> + *
> + * Choose the max ECC strength that is supported on the controller, and =
can fit
> + * within the chip's OOB.   * On success, the chosen ECC settings are se=
t.
> + */
> +int nand_try_to_maximize_ecc(struct mtd_info *mtd, struct nand_chip *chi=
p,
> +			     const struct nand_ecc_engine_caps *caps)
> +{
> +	const struct nand_ecc_setting *setting, *best_setting =3D NULL;
> +	int steps, ecc_bytes, corr;
> +	int best_corr =3D 0;
> +	int best_ecc_bytes;
> +
> +	for (setting =3D caps->ecc_settings; setting->step; setting++) {
> +		/* If chip->ecc.size is already set, respect it. */
> +		if (chip->ecc.size && setting->step !=3D chip->ecc.size)
> +			continue;
> +
> +		steps =3D mtd->writesize / setting->step;
> +		ecc_bytes =3D caps->calc_ecc_bytes(setting);
> +		if (WARN_ON_ONCE(ecc_bytes < 0))
> +			continue;
> +
> +		if (ecc_bytes * steps > caps->avail_oobsize)
> +			continue;
> +
> +		corr =3D setting->strength * steps;
> +
> +		/*
> +		 * If the number of correctable bits is the same,
> +		 * bigger ecc_step has more reliability.
> +		 */
> +		if (corr > best_corr ||
> +		    (corr =3D=3D best_corr && setting->step > best_setting->step)) {
> +			best_corr =3D corr;
> +			best_setting =3D setting;
> +			best_ecc_bytes =3D ecc_bytes;
> +		}

Same comment as earlier: you could probably skip a few entries by
enforcing ordering in the ecc_settings array.

> +	}
> +
> +	if (!best_setting)
> +		return -ENOTSUPP;
> +
> +	chip->ecc.size =3D best_setting->step;
> +	chip->ecc.strength =3D best_setting->strength;
> +	chip->ecc.bytes =3D best_ecc_bytes;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(nand_try_to_maximize_ecc);
> +
>  /*
>   * Check if the chip configuration meet the datasheet requirements.
> =20
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 2ae781e..394128f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -486,6 +486,28 @@ static inline void nand_hw_control_init(struct nand_=
hw_control *nfc)
>  }
> =20
>  /**
> + * struct nand_ecc_setting - information of ECC step supported by ECC en=
gine
> + * @step: data bytes per ECC step
> + * @bytes: ECC bytes per step
> + */
> +struct nand_ecc_setting {
> +	int step;
> +	int strength;
> +};

I think I already mentioned that I'd prefer to have the step and
strength info separated in 2 different objects so that we can easily
re-use the strength definitions for all step-size supported by the
engine (ECC engines usually provide the same set of strengths for all
supported step-size).

struct nand_ecc_step_size_caps {
	int step_size;
	int *strengths;
};

struct nand_ecc_engine_caps {
	const struct nand_ecc_step_size_caps *step_sizes;
	/* ... */
};

static int my_strengths[] =3D { 8, 16, 24, 0 };
static const struct nand_ecc_step_size_caps my_step_sizes[] =3D {
	{ 512, my_strengths },
	{=C2=A01024, my_strengths },
	/* sentinel */
};

static const struct nand_ecc_engine_caps my_ecc_caps =3D {
	.step_sizes =3D my_step_sizes,
	/* ... */
};


> +
> +/**
> + * struct nand_ecc_engine_caps - capability of ECC engine
> + * @ecc_settings: array of (step, strength) supported by this ECC engine
> + * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
> + * @avail_oobsize: OOB size that the ECC engine can use for ECC correcti=
on
> + */
> +struct nand_ecc_engine_caps {
> +	const struct nand_ecc_setting *ecc_settings;
> +	int (*calc_ecc_bytes)(const struct nand_ecc_setting *ecc_setting);
> +	int avail_oobsize;

avail_oobsize should be passed as an argument to the different helpers
you define above, because it's completely dependent on the NAND chip,
which means you would have change it dynamically, which in turn
prevents you from defining this object as 'static const' in your driver.

> +};
