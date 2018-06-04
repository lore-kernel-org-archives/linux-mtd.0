From: Richard Weinberger <richard@nod.at>
To: Lionel Debieve <lionel.debieve@st.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 tglx@linutronix.de, haver@linux.vnet.ibm.com, u.kleine-koenig@pengutronix.de,
 joel@clambassador.com, schwarzerf@gmail.com,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, paulmck@linux.vnet.ibm.com
Subject: Re: [Resend PATCH 1/1] mtd: ubi: Update ubi-media.h to dual license
Date: Mon, 04 Jun 2018 15:28:19 +0200
Message-ID: <6364434.VVWtcepFll@blindfold>
In-Reply-To: <20180604132137.32136-2-lionel.debieve@st.com>
References: <20180604132137.32136-1-lionel.debieve@st.com>
 <20180604132137.32136-2-lionel.debieve@st.com>
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

Am Montag, 4. Juni 2018, 15:21:37 CEST schrieb Lionel Debieve:
> Update license template using SPDX. Move the global layout
> of UBI headers to dual license helping UBI to be the standard
> solution for raw NAND management.
>=20
> Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Artem Bityutskiy <dedekind1@gmail.com>
> Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> ---
>  drivers/mtd/ubi/ubi-media.h | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
> index bfceae5a890e..195ff8ca8211 100644
> --- a/drivers/mtd/ubi/ubi-media.h
> +++ b/drivers/mtd/ubi/ubi-media.h
> @@ -1,28 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
>  /*
> - * Copyright (c) International Business Machines Corp., 2006
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> - * the GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 U=
SA
> - *
> + * Copyright (C) International Business Machines Corp., 2006
>   * Authors: Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=
=D0=B9 =D0=90=D1=80=D1=82=D1=91=D0=BC)
>   *          Thomas Gleixner
>   *          Frank Haverkamp
>   *          Oliver Lohmann
>   *          Andreas Arnez
> - */
> -
> -/*
> + *
>   * This file defines the layout of UBI headers and all the other UBI on-=
flash
>   * data structures.
>   */
>=20

Applied.
Thanks everyone for sorting this out!

Thanks,
//richard
