Received: from mail-bn1blp0184.outbound.protection.outlook.com
 ([207.46.163.184] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XD8It-00025t-W5
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 08:35:08 +0000
From: "Wu, Aaron" <Aaron.Wu@analog.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded flash
Date: Fri, 1 Aug 2014 08:34:03 +0000
Message-ID: <649EF91064D35D40B9C93A225BF416746123CC52@NWD2MBX7.ad.analog.com>
References: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
 <20140801063449.GD3095@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mike Frysinger <vapier@gentoo.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Zhang,
 Sonic" <Sonic.Zhang@analog.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian and Mike,

AFAICT I agree with you, I think the BUG_ON is not likely to be executed, I=
'm OK with removing it, Mike, what's your idea.

And do you want me to make a new patch or make another patch to remove the =
BUG_ON and the "," issue if we can reach agreement on this issue?

Best regards,
Aaron=20

-----Original Message-----
From: Wu, Aaron=20
Sent: Friday, August 01, 2014 3:00 PM
To: 'Brian Norris'
Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org; Zhang, Sonic; Mike =
Frysinger
Subject: RE: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded fl=
ash

Hi Brian,

Thanks for your time and comments.

This patch originally intend to solve the issue that Flash operation addres=
s passed in from upper layer may exceed the maxim address boundary allowed =
by the window size defined by the gpio style of flash.

Take the read, memcpy_fromio for example, this address is described by (map=
->virt + (from % state->win_size)  +  this_len), where this_len varies in d=
ifferent situation.  If the address do exceed the boundary then we repeat r=
ead to work around it.

I actually did not pay enough attention on the BUG_ON condition from Mike, =
I will check later and be back.

At last this patch fixed a customer reported issue so I suppose this "cross=
 the boundary" bug do exits and this patch roughly fixed it.

Best regards,
Aaron  =20

-----Original Message-----
From: Brian Norris [mailto:computersforpeace@gmail.com]
Sent: Friday, August 01, 2014 2:35 PM
To: Wu, Aaron
Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org; Zhang, Sonic; Mike =
Frysinger
Subject: Re: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded fl=
ash

+ Mike Frysinger

Hi Aaron,

I'm trying to judge the quality of your patch, but I'm very distracted from=
 this by trying to figure out the original intent of this code.
Perhaps Mike can comment.

On Thu, Jul 03, 2014 at 04:13:34PM +0800, Aaron Wu wrote:
> In this bug, the address operation range may exceed the window size=20
> defined by gpio expanded flash MTD partition.
>=20
> Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c |   34 ++++++++++++++++++++++++++++--=
----
>  1 file changed, 28 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c
> b/drivers/mtd/maps/gpio-addr-flash.c
> index a4c477b..ca9282f 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -108,13 +108,24 @@ static void gf_copy_from(struct map_info *map,=20
> void *to, unsigned long from, ssi  {
>  	struct async_state *state =3D gf_map_info_to_state(map);
> =20
> -	gf_set_gpios(state, from);
> +	int this_len;
> =20
>  	/* BUG if operation crosses the win_size */
>  	BUG_ON(!((from + len) % state->win_size <=3D (from + len)));

What do you think of this BUG_ON()? AFAICT, the BUG_ON() predicate is prova=
bly false [1], at least whenever

	from >=3D 0 && len >=3D 0 && state->win_size > 0.

Was the intent more like this?

	BUG_ON((from + len - 1) / state->win_size !=3D from / state->win_size);

If so, then it seems like maybe this patch is trying to address the case th=
at was previously considered a BUG()?

In any case, if we can't figure out what the BUG_ON() really should have be=
en, then maybe we should kill it and take something like your patch to fix =
the case you're looking at, Aaron.

> =20
> -	/* operation does not cross the win_size, so one shot it */
> -	memcpy_fromio(to, map->virt + (from % state->win_size), len);
> +	while (len) {
> +		if ((from % state->win_size) + len > state->win_size)
> +			this_len =3D state->win_size - (from % state->win_size);
> +		else
> +			this_len =3D len;
> +
> +		gf_set_gpios(state, from);
> +		memcpy_fromio(to, map->virt + (from % state->win_size)
> +			, this_len);
> +		len -=3D this_len;
> +		from +=3D this_len;
> +		to +=3D this_len;
> +	}
>  }
> =20
>  /**
> @@ -147,13 +158,24 @@ static void gf_copy_to(struct map_info *map,=20
> unsigned long to,  {
>  	struct async_state *state =3D gf_map_info_to_state(map);
> =20
> -	gf_set_gpios(state, to);
> +	int this_len;
> =20
>  	/* BUG if operation crosses the win_size */
>  	BUG_ON(!((to + len) % state->win_size <=3D (to + len)));

Same here. I think the BUG_ON() condition is a no-op (always false).

> =20
> -	/* operation does not cross the win_size, so one shot it */
> -	memcpy_toio(map->virt + (to % state->win_size), from, len);
> +	while (len) {
> +		if ((to % state->win_size) + len > state->win_size)
> +			this_len =3D state->win_size - (to % state->win_size);
> +		else
> +			this_len =3D len;
> +
> +		gf_set_gpios(state, to);
> +		memcpy_toio(map->virt + (to % state->win_size), from, len);
> +
> +		len -=3D this_len;
> +		to +=3D this_len;
> +		from +=3D this_len;
> +	}
>  }
> =20
>  static const char * const part_probe_types[] =3D {

Brian

[1] If it was provably false, then I should be able to write out a proof! I=
t relies on something like this:

	If x >=3D 0 and y > 0, then x % y <=3D x.
