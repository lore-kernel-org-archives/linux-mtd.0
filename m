Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0YZJ-000559-Jb
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 03:56:07 -0400
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1182184301.6074.62.camel@localhost.localdomain>
References: <1182184301.6074.62.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 19 Jun 2007 10:55:49 +0300
Message-Id: <1182239749.4403.48.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-06-18 at 17:31 +0100, Richard Purdie wrote:
> +static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
> +{
> +	struct erase_info erase;
> +	DECLARE_WAITQUEUE(wait, current);
> +	wait_queue_head_t wait_q;
> +	int ret;
> +
> +	init_waitqueue_head(&wait_q);
> +	erase.mtd =3D mtd;
> +	erase.callback =3D mtdoops_erase_callback;
> +	erase.addr =3D offset;
> +	if (mtd->erasesize < OOPS_PAGE_SIZE)
> +		erase.len =3D OOPS_PAGE_SIZE;

It seems to me that your code won't work if mtd->erasesize <
OOPS_PAGE_SIZE anyway, so this check should not be here I guess.


> +	ret =3D mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
> +			&retlen, (u_char *) &count);
> +	if ((retlen !=3D 4) || (ret < 0)) {
> +		printk(KERN_ERR "mtdoops: Read failure at %d (%d of 4 read)"
> +				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
> +				retlen, ret);
> +		return 1;
> +	}

mtd->read() returns -EUCLEAN in case of a correctable bit-flip, ignore
this error code here and elsewhere as well please.

> +static void mtdoops_prepare(struct mtdoops_context *cxt)
> +{
> +	struct mtd_info *mtd =3D cxt->mtd;
> +	int i =3D 0, j, ret, mod;
> +
> +	/* We were unregistered */
> +	if (!mtd)
> +		return;
> +
> +	mod =3D (cxt->nextpage * OOPS_PAGE_SIZE) % mtd->erasesize;
> +	if (mod !=3D 0) {
> +		cxt->nextpage =3D cxt->nextpage + ((mtd->erasesize - mod) / OOPS_PAGE_=
SIZE);
> +		if (cxt->nextpage > cxt->oops_pages)
> +			cxt->nextpage =3D 0;
> +	}
> +
> +	while (mtd->block_isbad &&
> +			mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE)) {

Well, mtd->block_isbad() may return error, unlikely, bu still. You also
ignore the error at other places.

> +badblock:
> +		printk(KERN_WARNING "mtdoops: Bad block at %08x\n",
> +				cxt->nextpage * OOPS_PAGE_SIZE);
> +		i++;
> +		cxt->nextpage =3D cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
> +		if (cxt->nextpage > cxt->oops_pages)
> +			cxt->nextpage =3D 0;
> +		if (i =3D=3D (cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE))) {
> +			printk(KERN_ERR "mtdoops: All blocks bad!\n");
> +			return;
> +		}
> +	}
> +
> +	for (j =3D 0, ret =3D -1; (j < 3) && (ret < 0); j++)
> +		ret =3D mtdoops_erase_block(mtd, cxt->nextpage * OOPS_PAGE_SIZE);

Ugh, why do you make it this difficult way instead of

for (all EBs) {
    ret =3D erase()
    if (ret =3D=3D -EIO) {
        markbad();
    } else
        return err;
}

> +
> +	if (ret < 0) {
> +		if (mtd->block_markbad)
> +			mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
> +		goto badblock;

Please, mark EB as bad only in case of -EIO. Also, do not ignore error
code of mtd->block_markbad()


Is it possible to re-structure the code and erase/check if EB is bad in
_one_ cycle (thus avoiding this goto which is difficult to understand)?

Surely all you want is to format the partition. So make a loop, skip bad
EBs and erase good ones. In case of erase failure (-EIO) mark the EB as
bad.

> +static int find_next_position(struct mtdoops_context *cxt)
> +{
> +	struct mtd_info *mtd =3D cxt->mtd;
> +	int page, maxpos =3D 0;
> +	u32 count, maxcount =3D 0xffffffff;
> +	size_t retlen;
> +
> +	for (page =3D 0; page < cxt->oops_pages; page++) {
> +		mtd->read(mtd, page * OOPS_PAGE_SIZE, 4, &retlen, (u_char *) &count);

Please, check return code here.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
