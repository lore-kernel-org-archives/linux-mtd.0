Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STwwX-0001YR-6Q
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 15:12:13 +0000
Received: by ggcs5 with SMTP id s5so3757979ggc.36
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2012 08:12:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336997687-6868-9-git-send-email-hechtb@gmail.com>
References: <1336997687-6868-1-git-send-email-hechtb@gmail.com>
 <1336997687-6868-9-git-send-email-hechtb@gmail.com>
Date: Mon, 14 May 2012 08:12:11 -0700
Message-ID: <CAN8TOE9sq56X_VUgi+ZujLRPs=SpcJm9a1N-NuzF6+6R2WPLAg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] mtd: sh_flctl: Use user oob data in hardware ECC
 mode
From: Brian Norris <computersforpeace@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-sh@vger.kernel.org,
 magnus.damm@gmail.com, Bastian Hecht <hechtb@gmail.com>,
 linux-mtd@lists.infradead.org, laurent.pinchart@ideasonboard.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 14, 2012 at 5:14 AM, Bastian Hecht <hechtb@googlemail.com> wrot=
e:
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 631f7ed..8a07212 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -384,6 +395,7 @@ static int flctl_read_page_hwecc(struct mtd_info *mtd=
, struct nand_chip *chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *b=
uf, int oob_required, int page)
> =A0{
> =A0 =A0 =A0 =A0chip->read_buf(mtd, buf, mtd->writesize);
> + =A0 =A0 =A0 chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> =A0 =A0 =A0 =A0return 0;
> =A0}

Well, my 'oob_required' patches won the race for inclusion in
l2-mtd-2.6.git, so it's probably good to just use the 'oob_required'
parameter now. That is:

if (oob_required)
       chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);

> @@ -391,6 +403,7 @@ static void flctl_write_page_hwecc(struct mtd_info *m=
td, struct nand_chip *chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 uint8_t *buf, int oob_required)
> =A0{
> =A0 =A0 =A0 =A0chip->write_buf(mtd, buf, mtd->writesize);
> + =A0 =A0 =A0 chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> =A0}

Similar here:

if (oob_required)
       chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);

Brian
