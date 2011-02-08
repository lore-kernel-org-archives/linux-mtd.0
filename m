Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkhB-0000XM-5d
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:21:18 +0000
Received: by wwb17 with SMTP id 17so5936124wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Feb 2011 02:21:15 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1297159362-8407-6-git-send-email-adrian.hunter@nokia.com>
References: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
	<1297159362-8407-6-git-send-email-adrian.hunter@nokia.com>
Date: Tue, 8 Feb 2011 19:21:14 +0900
Message-ID: <AANLkTikQE75g5D0qLtw2e-b02sYxKni5m-snac=ZZTkL@mail.gmail.com>
Subject: Re: [PATCH 5/5] mtd: onenand_base: onenand_verify bugfix for
	writepage non-aligned address
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Feb 8, 2011 at 7:02 PM, Adrian Hunter <adrian.hunter@nokia.com> wro=
te:
> From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
>
> In onenand_verify function the address can be writepage non-aligned.
> When a page is read for comparing the right offset should be used
> for "this->verify_buf" to get the right matching with compared
> "buf" buffer.
>
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 10 +++++-----
> =A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 38e6d76..4205b94 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1648,11 +1648,10 @@ static int onenand_verify(struct mtd_info *mtd, c=
onst u_char *buf, loff_t addr,
> =A0 =A0 =A0 =A0int ret =3D 0;
> =A0 =A0 =A0 =A0int thislen, column;
>
> + =A0 =A0 =A0 column =3D addr & (this->writesize - 1);
> +
> =A0 =A0 =A0 =A0while (len !=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 thislen =3D min_t(int, this->writesize, len=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 column =3D addr & (this->writesize - 1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (column + thislen > this->writesize)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 thislen =3D this->writesize=
 - column;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 thislen =3D min_t(int, this->writesize - co=
lumn, len);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->command(mtd, ONENAND_CMD_READ, addr,=
 this->writesize);
>
> @@ -1666,12 +1665,13 @@ static int onenand_verify(struct mtd_info *mtd, c=
onst u_char *buf, loff_t addr,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->read_bufferram(mtd, ONENAND_DATARAM,=
 this->verify_buf, 0, mtd->writesize);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (memcmp(buf, this->verify_buf, thislen))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (memcmp(buf, this->verify_buf + column, =
thislen))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EBADMSG;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len -=3D thislen;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf +=3D thislen;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0addr +=3D thislen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 column =3D 0;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
