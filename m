Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA2Ha-0000Bq-Cx
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 13:05:46 +0000
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1228823163.2753.18.camel@localhost.localdomain>
References: <1228823163.2753.18.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 09 Dec 2008 15:03:23 +0200
Message-Id: <1228827803.13686.189.camel@sauron>
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

On Tue, 2008-12-09 at 19:46 +0800, xiaochuan-xu wrote:
> >From e3af46580d374fc5da79212c17ef9f0179299bd0 Mon Sep 17 00:00:00 2001
> From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
> Date: Tue, 9 Dec 2008 19:27:40 +0800
> Subject: [PATCH] Adjust severial macros
>=20
> In order to fulfill the identical function of the currenty
> prot RB-tree. *_PROTECTION macros are increased respectively
>=20
> Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
> ---
>  drivers/mtd/ubi/wl.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 0b1e8c7..603435f 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -130,9 +130,9 @@
>   * How many erase cycles are short term, unknown, and long term physical
>   * eraseblocks protected.
>   */
> -#define ST_PROTECTION 16
> -#define U_PROTECTION  10
> -#define LT_PROTECTION 4
> +#define ST_PROTECTION 17
> +#define U_PROTECTION  11
> +#define LT_PROTECTION 5

I doubt these constants make much sense. I would suggest you to get rid
of them and simplify things. Let's have only one constant instead of 3.
This will allow us to implement efficient protection queue which you
will not need to walk at all.

So I'd suggest you to send a separate "preparation" patch which
introduces one constant instead of 3. E.g.,

#define PROTECTION 10

It may be re-named to PROT_LIST_LEN later, probably.

How does this plan sound to you?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
