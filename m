Received: from mail-qy0-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEz1p-0008IK-Nw
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 05:10:19 +0000
Received: by qyk9 with SMTP id 9so322864qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Jun 2009 22:10:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1244782878.5847.416.camel@localhost.localdomain>
References: <7948530906110415u3cc3cd62je650881b6385c8f5@mail.gmail.com>
	<1244782878.5847.416.camel@localhost.localdomain>
Date: Fri, 12 Jun 2009 14:10:12 +0900
Message-ID: <9c9fda240906112210s20d935d2r876e741d407a8045@mail.gmail.com>
Subject: Re: [PATCH] MTD: OneNAND OMAP2/3: Fix incorrect bufferram offset
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: Mika Korhonen <mika.j.korhonen@gmail.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Fri, Jun 12, 2009 at 2:01 PM, Artem Bityutskiy<dedekind@infradead.org> w=
rote:
> On Thu, 2009-06-11 at 14:15 +0300, Mika Korhonen wrote:
>> Hi, I was testing 2-plane programming and noticed that when writing
>> and doing a verify read straight after I kept getting 00 00 00 00 ...
>> instead of the written data. I found out that OMAP2/3 version of
>> onenand_bufferram_offset() uses the faked page size instead of the
>> real one. The generic version in onenand_base.c is ok.
>>
>> The patch to fix this is attached.
>
> Looks good to me, Kyungmin?
>
> >From 4ad479f5238560286999c07c30fec3a6a5551dd5 Mon Sep 17 00:00:00 2001
> From: Mika Korhonen <mika.j.korhonen@gmail.com>
> Date: Thu, 11 Jun 2009 14:05:07 +0300
> Subject: [PATCH] MTD: OneNAND OMAP2/3: Fix incorrect bufferram offset
>
> Fixes the case where CONFIG_MTD_ONENAND_2X_PROGRAM is set and
> the real page size differs from mtd_info.writesize.
>
> Signed-off-by: Mika Korhonen <mika.j.korhonen@gmail.com>
> ---
> =9Adrivers/mtd/onenand/omap2.c | =9A =9A2 +-
> =9A1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index df26db8..32de634 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -267,7 +267,7 @@ static inline int omap2_onenand_bufferram_offset(stru=
ct mtd_info *mtd, int area)
>
> =9A =9A =9A =9Aif (ONENAND_CURRENT_BUFFERRAM(this)) {
> =9A =9A =9A =9A =9A =9A =9A =9Aif (area =3D=3D ONENAND_DATARAM)
> - =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A return mtd->writesize;
> + =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A return this->writesize;
> =9A =9A =9A =9A =9A =9A =9A =9Aif (area =3D=3D ONENAND_SPARERAM)
> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9Areturn mtd->oobsize;
> =9A =9A =9A =9A}
> --
> 1.5.6.5
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
