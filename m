Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POIVY-0001gW-W0
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 23:24:15 +0000
Received: by wwb17 with SMTP id 17so677076wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Dec 2010 15:24:09 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1291296518-31566-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1291296518-31566-1-git-send-email-roman.tereshonkov@nokia.com>
Date: Fri, 3 Dec 2010 08:24:09 +0900
Message-ID: <AANLkTinu52rJ_JMhibaxgtqOy=7cg2tVGGKVeZ7imGhO@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: bugfix for 2x mode bad block handling
From: Kyungmin Park <kmpark@infradead.org>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Thu, Dec 2, 2010 at 10:28 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> This bug becomes visible in 2x mode when chip->writesize
> is different from mtd->writesize (=3D 2 * chip->writesize).
> At this case the bad block information is read from
> the first and the third physical pages instead of
> the first and the second as specification states.
>
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_bbt.c | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onen=
and_bbt.c
> index 01ab5b3..905209b 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -91,13 +91,15 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *=
buf, struct nand_bbt_descr
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (j =3D 0; j < len; j++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* No need to read pages f=
ully,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * just read required OOB =
bytes */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_bbt_read_oo=
b(mtd, from + j * mtd->writesize + bd->offs, &ops);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_bbt_read_oo=
b(mtd,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from + j * =
this->writesize + bd->offs, &ops);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* If it is a initial bad =
block, just ignore it */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret =3D=3D ONENAND_BBT=
_READ_FATAL_ERROR)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EI=
O;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret || check_short_patt=
ern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret || check_short_patt=
ern(&buf[j * scanlen],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0scanlen, this->writesize, bd)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbm->bbt[i=
 >> 3] |=3D 0x03 << (i & 0x6);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KER=
N_WARNING "Bad eraseblock %d at 0x%08x\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0i >> 1, (unsigned int) from);
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
