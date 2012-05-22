Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWjqX-0003O8-OB
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 07:49:34 +0000
Message-ID: <1337673190.2483.115.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johan Gunnarsson <johan.gunnarsson@axis.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Tue, 22 May 2012 10:53:10 +0300
In-Reply-To: <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QOzh4eJPteAdtLN4Ho2T"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, jespern@axis.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QOzh4eJPteAdtLN4Ho2T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 10:42 +0200, Johan Gunnarsson wrote:
> @@ -533,19 +541,29 @@ static void panic_nand_wait_ready(struct mtd_info *=
mtd, unsigned long timeo)
>  void nand_wait_ready(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip =3D mtd->priv;
> -	unsigned long timeo =3D jiffies + 2;
> +	struct hrtimer timer;
> =20
>  	/* 400ms timeout */
>  	if (in_interrupt() || oops_in_progress)
>  		return panic_nand_wait_ready(mtd, 400);
> =20
>  	led_trigger_event(nand_led_trigger, LED_FULL);
> +
> +	/* Arm timeout timer for 20ms timeout */
> +	hrtimer_init(&timer, CLOCK_REALTIME, HRTIMER_MODE_REL);
> +	timer.function =3D nand_wait_timeout_callback;
> +	hrtimer_start(&timer, ns_to_ktime(20 * 1000 * 1000),
> +	              HRTIMER_MODE_REL);
> +
>  	/* Wait until command is processed or timeout occurs */
>  	do {
>  		if (chip->dev_ready(mtd))
>  			break;
>  		touch_softlockup_watchdog();
> -	} while (time_before(jiffies, timeo));

Si this function waits for the chip, but if we cannot access the "ready"
pin - it waits for 400msecs? Where this number 400 comes from? Why not
500? How many chips we have which do not provide "dev_ready()" function?
Can we simplify this function and assume everyone has "dev_ready()" and
add BUG_ON(!chip->dev_ready) - could you make a small research ? Or can
we do like this:

if (!dev_ready()) {
	msleep(400);
	return
}

do {
} while

Why should we iterate if "dev_ready" is NULL?

My point is that this stuff ancient horror which needs love and cleaning
up. Your does not make it less scary. I'd prefer to first clean the
whole thing up, and then fix it.

I'm CCing Brian who spent a lot of time digging nand_base.c recently, he
has probably got some ideas.

--=20
Best Regards,
Artem Bityutskiy

--=-QOzh4eJPteAdtLN4Ho2T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu0XmAAoJECmIfjd9wqK0hdAP/3PFBAHm1gUtz2K5Zc1VP7e0
uy7UgDKTwcWivmfYtj3oh/1TUGMmhNjdTzFz2cs9gxZa6SO5O9dcvvEi/xVV/DAC
gWuJgFWyCN1QwJNWpI6X0gQX6KqtEEmNziLh9Lsf9YGgnz9lyc1XyyXIm/8LzAXC
fsKJi92uhTKy8mcqTH00gB+rm6Y7W/WgVvC1keGzvd1jTVlMiZmxd4JAfWwnWfq7
FFTGIyXSpX7u8W9/4WQp+IkViJ0phg7QpuUhtfmI8LiTo6VhQTh2skCLgYkMAzkh
9C7RN2xoG6iqoFexCQwG7+cAoqAsIyeDXZ+ln9klBex78mBpIKo1/gNtJ6Tf/1wM
g83bWNK73QBH7ig9abGR612Uqr2J66WVaAwtHaTvQDUVdonFtQXYAJiWVbTdb+9C
JFA+XvEUtuzZYgZXIW4B84BPR2Olp+t5fO3wEDkDmiMldt8VmxvxP3V97/MFlIhe
U8W0n8w1fvqDflyGtHO1K3DCpDtYw8uWL30e85BA3efpmAWU7Xh9AJVoVx/Ms07Y
8WEYzBXnzRdiQjn2Brl5sGvQPr0WwlzNbioj7KeD4jVDZZn6rjdeLHpw9wsSJY6Q
1C6FJSBaZBwAONp0npQ+1nkaoWuYeJkv5DM/DIdqRfgPIeRqAc0JtO1CZFv3i44c
81rSTmIMK4eC+gJcudnF
=riZz
-----END PGP SIGNATURE-----

--=-QOzh4eJPteAdtLN4Ho2T--
