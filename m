Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTuvP-0001KE-Mm
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 09:49:24 +0000
Received: by qw-out-1920.google.com with SMTP id 5so538440qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jul 2009 02:49:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090723090730.GA24918@mail.gnudd.com>
References: <ce9ab5790907222130o2f1d704u199fbf7f1435e74f@mail.gmail.com>
	<cover.1248300341.git.rubini@unipv.it>
	<20090723065922.GA22450@mail.gnudd.com>
	<20090723090730.GA24918@mail.gnudd.com>
Date: Thu, 23 Jul 2009 15:19:18 +0530
Message-ID: <ce9ab5790907230249s25a66deeh1bb2ffec73187719@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815
	board)
From: vimal singh <vimal.newwork@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>, vimal.newwork@gmail.com,
	STEricsson_nomadik_linux@list.st.com, linux@arm.linux.org.uk,
	linux-mtd@lists.infradead.org, andrea.gallo@stericsson.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 23, 2009 at 2:37 PM, Alessandro Rubini<rubini-list@gnudd.com> w=
rote:
>>> 'nand_calculate_ecc' and 'nand_correct_data' (nand_ecc.c) do it in SW.
>>> This need not to be re-do.
>>
>> When I initially tried soft ecc it didn't work, so I thought ours was
>> a different algorithm. Most likely I was wrong, I'll recheck ASAP.
>
> It's slightly different. This is what I get (old is nand_calculate_ecc(),=
 new is mine).
>
> =A0 old: 65 56 55
> =A0 new: 56 65 55
>
> =A0 old: 33 fc 0c
> =A0 new: fc 33 0c
>
> =A0 old: c0 c0 3c
> =A0 new: c0 c0 3c
>
> =A0 old: c3 3f cf
> =A0 new: 3f c3 cf
>
> =A0 old: c0 0f 30
> =A0 new: 0f c0 30
>
> =A0 old: 03 f3 3f
> =A0 new: f3 03 3f
>
> So, the standard procedure is not compatible with data already in
> flash (written with the older u-boot and kernel provided by the vendor
> with the kit).

No, Its just byte order. Try enabling 'CONFIG_MTD_NAND_ECC_SMC' in your con=
figs.
It should work fine.

-vimal

>
> The code in nomadik_ecc512_calc() is derived from vendor data sheet,
> looking at vendor code I got; since both routines gives the same results,
> mine _should_ be compatible with hw ecc, for the day I'll be
> able to make it work. However vendor code never used hw ecc, either,
> so I'm not sure this routine is really compatible with it.
>
> Actually, I got a hint about why hw ecc isn't working for me, but
> can't try it these days.
>
> In view of this, can my code stay?
>
> /alessandro
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
