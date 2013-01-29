Received: from zmc.proxad.net ([212.27.53.206])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U0IHy-0002hi-9K
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 21:00:20 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] mtd: fix the wrong timeo for panic_nand_wait()
Date: Tue, 29 Jan 2013 22:00:14 +0100
References: <CAMiH66HWn5PtjX20=WT7GMMV=J72rg3jx64iACSBiExjoD+X7A@mail.gmail.com>
 <1358818230-27037-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1358818230-27037-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201301292200.14622.ffainelli@freebox.fr>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

Le mardi 22 janvier 2013 02:30:30, Huang Shijie a =C3=A9crit :
> In nand_wait(), the timeo for panic_nand_wait() is assigned with
> wrong value(jiffies + some delay). The timeo should be set like the
> panic_nand_write() does.
>=20
> This patch fixes it, and also uses the msecs_to_jiffies() to make the
> code more readable.

You are not exactly explaining what is the issue with the current code, and=
=20
how you are fixing it. If someone needs to backport this patch for whatever=
=20
reason, it must be clear as to what it fixes.

>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> fix the compiler error in version 1, and add some commits.
>=20
> ---
>  drivers/mtd/nand/nand_base.c |    8 ++------
>  1 files changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8323ac9..a8c1fb4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -825,13 +825,8 @@ static void panic_nand_wait(struct mtd_info *mtd,
> struct nand_chip *chip, static int nand_wait(struct mtd_info *mtd, struct
> nand_chip *chip) {
>=20
> -	unsigned long timeo =3D jiffies;
>  	int status, state =3D chip->state;
> -
> -	if (state =3D=3D FL_ERASING)
> -		timeo +=3D (HZ * 400) / 1000;
> -	else
> -		timeo +=3D (HZ * 20) / 1000;
> +	unsigned long timeo =3D (state =3D=3D FL_ERASING ? 400 : 20);
>=20
>  	led_trigger_event(nand_led_trigger, LED_FULL);
>=20
> @@ -849,6 +844,7 @@ static int nand_wait(struct mtd_info *mtd, struct
> nand_chip *chip) if (in_interrupt() || oops_in_progress)
>  		panic_nand_wait(mtd, chip, timeo);
>  	else {
> +		timeo =3D jiffies + msecs_to_jiffies(timeo);
>  		while (time_before(jiffies, timeo)) {
>  			if (chip->dev_ready) {
>  				if (chip->dev_ready(mtd))

=2D-=20
=46lorian
