Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTzwq-0000Px-Rf
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 15:11:13 +0000
Date: Fri, 24 Jul 2009 00:11:04 +0900 (JST)
Message-Id: <20090724.001104.229278926.anemo@mba.ocn.ne.jp>
To: vimal.newwork@gmail.com
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <ce9ab5790907230004g103af356s1b44cda2d64bbc55@mail.gmail.com>
References: <ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
	<20090723.001338.27942898.anemo@mba.ocn.ne.jp>
	<ce9ab5790907230004g103af356s1b44cda2d64bbc55@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dbaryshkov@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Jul 2009 12:34:43 +0530, vimal singh <vimal.newwork@gmail.co=
m> wrote:
> > OK, but I still feel duplicating nand_ecc code is not so good. =A0H=
ow
> > about splitting nand_correct_data into two parts? =A0A pure calcula=
tion
> > function and a wrapper for mtd interface. =A0Like this:
> =

> But I do not see any thing extra, which you achieve from this
> wrapper...  Is this a prototype, and you want to handle above scenari=
o
> in this wrapper (calling 'nand_correct_data' multiple times based on
> something, probably 'ecc.bytes')?

Yes, if we have __nand_correct_data(buf, read_ecc, calc_ecc, eccsize)
which do job based on its eccsize argument, the ecc.correct function
of the tmio_nand driver can be implemented like this:

int tmio_nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
		unsigned char *read_ecc, unsigned char *calc_ecc)
{
	int r0, r1;

	/* assume ecc.size =3D 512 and ecc.bytes =3D 6 */
	r0 =3D __nand_correct_data(buf, read_ecc, calc_ecc, 256);
	if (r0 < 0)
		return r0;
	r1 =3D __nand_correct_data(buf + 256, read_ecc + 3, calc_ecc + 3, 256)=
;
	if (r1 < 0)
		return r1;
	return r0 | r1;
}

Note that this is not tested at all since I do not have tmio device.

Of course if Dmitry had another idea, I will not intrude this
approach.

---
Atsushi Nemoto
