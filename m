Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MUOV6-0002hE-4L
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 17:24:17 +0000
Received: by fxm11 with SMTP id 11so1618436fxm.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jul 2009 10:24:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090724.001104.229278926.anemo@mba.ocn.ne.jp>
References: <ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
	<20090723.001338.27942898.anemo@mba.ocn.ne.jp>
	<ce9ab5790907230004g103af356s1b44cda2d64bbc55@mail.gmail.com>
	<20090724.001104.229278926.anemo@mba.ocn.ne.jp>
Date: Fri, 24 Jul 2009 21:24:01 +0400
Message-ID: <bc64b4640907241024j7a5c88d9ic5eb2cdbd74f8ead@mail.gmail.com>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ian Molton <spyro@f2s.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, vimal.newwork@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/7/23 Atsushi Nemoto <anemo@mba.ocn.ne.jp>:
> On Thu, 23 Jul 2009 12:34:43 +0530, vimal singh <vimal.newwork@gmail.com>=
 wrote:
>> > OK, but I still feel duplicating nand_ecc code is not so good. =A0How
>> > about splitting nand_correct_data into two parts? =A0A pure calculatio=
n
>> > function and a wrapper for mtd interface. =A0Like this:
>>
>> But I do not see any thing extra, which you achieve from this
>> wrapper... =A0Is this a prototype, and you want to handle above scenario
>> in this wrapper (calling 'nand_correct_data' multiple times based on
>> something, probably 'ecc.bytes')?
>
> Yes, if we have __nand_correct_data(buf, read_ecc, calc_ecc, eccsize)
> which do job based on its eccsize argument, the ecc.correct function
> of the tmio_nand driver can be implemented like this:
>
> int tmio_nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned char *read_ecc, unsigned char *ca=
lc_ecc)
> {
> =A0 =A0 =A0 =A0int r0, r1;
>
> =A0 =A0 =A0 =A0/* assume ecc.size =3D 512 and ecc.bytes =3D 6 */
> =A0 =A0 =A0 =A0r0 =3D __nand_correct_data(buf, read_ecc, calc_ecc, 256);
> =A0 =A0 =A0 =A0if (r0 < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return r0;
> =A0 =A0 =A0 =A0r1 =3D __nand_correct_data(buf + 256, read_ecc + 3, calc_e=
cc + 3, 256);
> =A0 =A0 =A0 =A0if (r1 < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return r1;
> =A0 =A0 =A0 =A0return r0 | r1;
> }
>
> Note that this is not tested at all since I do not have tmio device.

This seems to be the thing that was initially ment by Zaurus kernels, so
this if Ian doesn't object,

Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

--=20
With best wishes
Dmitry
