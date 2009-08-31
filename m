Received: from mail-vw0-f193.google.com ([209.85.212.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mi16r-0006iP-JQ
	for linux-mtd@lists.infradead.org; Mon, 31 Aug 2009 07:15:30 +0000
Received: by vws31 with SMTP id 31so1944067vws.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Aug 2009 00:15:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1251702212-17785-1-git-send-email-dedekind@infradead.org>
References: <1251702212-17785-1-git-send-email-dedekind@infradead.org>
Date: Mon, 31 Aug 2009 16:15:24 +0900
Message-ID: <9c9fda240908310015s24807b3fo6c9522b2050bdb86@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: use KERN_DEBUG for ECC errors
From: Kyungmin Park <kmpark@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <Adrian.Hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi<

As I remember, it's changed from KERN_DEBUG to KERN_INFO from adrian reques=
t.
I think you worry the ecc error message. If so, how about to change
the ecc message itself? e.g. ecc info
Also controller info instead of controller error.

I got some help there was 1-bit ecc message displayed.

How do you think?

Thank you,
Kyungmin Park

On Mon, Aug 31, 2009 at 4:03 PM, Artem Bityutskiy<dedekind@infradead.org> w=
rote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>
> ECC errors is a normal phenomena on OneNAND and they happen quite
> often. Flash-aware file-systems like JFFS2 or UBIFS are able to
> handle them gracefully.
>
> Currently OneNAND driver prints about ECC errors like this:
> onenand_bbt_wait: ecc error =3D 0x2222, controller error 0x2400
> onenand_bbt_wait: ecc error =3D 0x2222, controller error 0x2400
> onenand_bbt_wait: ecc error =3D 0x2222, controller error 0x2400
>
> These messages are scary and make users think that something serious
> happened. However, they are handled nicely by UBIFS.
>
> This patch makes this messages to be printed with KERN_DEBUG
> level, so that they would not go to the console, at least, which
> is currently happening in case of standard default setup.
>
> Indeed, since ECC errors are supposed to be handled by upper
> level SW, we do not really have to print these messages, and we
> may consider them as debugging prints.
>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 6e82909..994939e 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1450,7 +1450,7 @@ static int onenand_bbt_wait(struct mtd_info *mtd, i=
nt state)
> =A0 =A0 =A0 =A0if (interrupt & ONENAND_INT_READ) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int ecc =3D onenand_read_ecc(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ecc & ONENAND_ECC_2BIT_ALL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "onenand_b=
bt_wait: ecc error =3D 0x%04x"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "onenand_=
bbt_wait: ecc error =3D 0x%04x"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0", control=
ler error 0x%04x\n", ecc, ctrl);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ONENAND_BBT_READ_EC=
C_ERROR;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> --
> 1.6.2.5
>
>
