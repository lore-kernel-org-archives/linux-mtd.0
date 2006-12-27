Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GzWvp-0006NS-8X
	for linux-mtd@lists.infradead.org; Wed, 27 Dec 2006 06:26:51 -0500
Subject: Re: [PATCH] NAND: nandsim bad block injection
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vijay Kumar <vijaykumar@bravegnu.org>
In-Reply-To: <17806.31709.360587.895943@vaishnavi.localdomain>
References: <17806.31709.360587.895943@vaishnavi.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Dec 2006 13:26:10 +0200
Message-Id: <1167218770.4217.12.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Vijay,

On Sun, 2006-12-24 at 18:38 +0530, Vijay Kumar wrote:
> Adds support for bad block creation on block erase and page program,
> by returning erase/program failed in the status byte. The probability
> of fault occurrence can be specified through module parameters.
>=20
> Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

Looks useful.
=20
> +#define PROB_SCALE_FACTOR         1000
> +#define PROB_SCALE_FACTOR_STR     "1000"
Use __stringify(PROB_SCALE_FACTOR) instead.

> +static int inject_fault_with_prob(int prob)
> +{
> +	int rnd;
> +
> +	rnd =3D random32() % PROB_SCALE_FACTOR;
> +
> +	if (rnd < prob)
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +static inline int inject_erase_fault(void)
> +{
> +	return inject_fault_with_prob(erase_fail_prob);
> +}
I think there is no need in having 'inject_fault_with_prob()' function
at all. Just use

int rnd =3D random32() % PROB_SCALE_FACTOR;
return rnd < prob;

> +
> +static inline int inject_prog_fault(void)
> +{
> +	return inject_fault_with_prob(prog_fail_prob);
> +}
Ditto.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
