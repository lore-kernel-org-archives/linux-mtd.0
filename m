Received: from qw-out-1920.google.com ([74.125.92.150])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MV3R3-0004pC-S9
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 13:06:46 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1670269qwf.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jul 2009 06:03:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090724.001104.229278926.anemo@mba.ocn.ne.jp>
References: <ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
	<20090723.001338.27942898.anemo@mba.ocn.ne.jp>
	<ce9ab5790907230004g103af356s1b44cda2d64bbc55@mail.gmail.com>
	<20090724.001104.229278926.anemo@mba.ocn.ne.jp>
Date: Sun, 26 Jul 2009 18:33:05 +0530
Message-ID: <ce9ab5790907260603m5e455921g56ccd587345b2743@mail.gmail.com>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: vimal singh <vimal.newwork@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=ISO-8859-1
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

On Thu, Jul 23, 2009 at 8:41 PM, Atsushi Nemoto<anemo@mba.ocn.ne.jp> wrote:
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

Better 'r0 + r1', returned value should represent number of error bits
corrected.


After fixing above comment:

Acked-by: Vimal Singh <vimalsingh@ti.com>


---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
