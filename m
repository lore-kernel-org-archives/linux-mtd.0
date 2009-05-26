Received: from yw-out-1718.google.com ([74.125.46.155])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8zjr-00038L-J2
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 16:43:15 +0000
Received: by yw-out-1718.google.com with SMTP id 9so2350176ywk.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 May 2009 09:42:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090526113122.GB16835@linux-sh.org>
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
	<1243331191-11445-2-git-send-email-vapier@gentoo.org>
	<20090526113122.GB16835@linux-sh.org>
Date: Tue, 26 May 2009 12:42:48 -0400
Message-ID: <8bd0f97a0905260942m4b574d75oc4f38ee3d8849395@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/maps: uclinux: support Blackfin systems
From: Mike Frysinger <vapier.adi@gmail.com>
To: Paul Mundt <lethal@linux-sh.org>, linux-kernel@vger.kernel.org,
	uclinux-dist-devel@blackfin.uclinux.org, Greg Ungerer <gerg@uclinux.org>,
	uclinux-dev@uclinux.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 26, 2009 at 07:31, Paul Mundt wrote:
> On Tue, May 26, 2009 at 05:46:31AM -0400, Mike Frysinger wrote:
>> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
>> index 57699c2..dcb552f 100644
>> --- a/drivers/mtd/maps/uclinux.c
>> +++ b/drivers/mtd/maps/uclinux.c
>> @@ -55,8 +55,13 @@ static int __init uclinux_mtd_init(void)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd;
>> =C2=A0 =C2=A0 =C2=A0 struct map_info *mapp;
>> +#ifdef CONFIG_BLACKFIN
>> + =C2=A0 =C2=A0 extern unsigned long memory_mtd_start;
>> + =C2=A0 =C2=A0 unsigned long addr =3D (unsigned long) memory_mtd_start;
>> +#else
>> =C2=A0 =C2=A0 =C2=A0 extern char _ebss;
>> =C2=A0 =C2=A0 =C2=A0 unsigned long addr =3D (unsigned long) &_ebss;
>> +#endif
>>
>> =C2=A0 =C2=A0 =C2=A0 mapp =3D &uclinux_ram_map;
>> =C2=A0 =C2=A0 =C2=A0 mapp->phys =3D addr;
>
> NAK.
>
> I know there's no accounting for taste, but it would be nice to at least
> see some minimal amount of effort going in to fixing these things
> sanely rather than just lazily shoving ifdefs in wherever possible.
>
> In this case you should just kill all of that crap off, and have the
> platforms that use this set uclinux_ram_map up themselves, it's already
> a global. Of course you can use _ebss as a default value for
> uclinux_ram_map.phys and just override it in your platform.

i would agree if it were a board-specific issue, but it's an arch
issue, so pushing it to the boards level is wrong.  i can however
replace the addr with a global weak and add a symbol into the Blackfin
arch code to override it.

the structs being global in this file is simply wrong from what i can
tell ... everything in there should be static.  i'll send a patch for
that later on.
-mike
