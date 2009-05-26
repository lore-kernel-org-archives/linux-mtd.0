Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8zrY-0004uT-Ug
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 16:51:02 +0000
Received: by yw-out-1718.google.com with SMTP id 9so2352694ywk.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 May 2009 09:50:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090526164735.GA24261@linux-sh.org>
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
	<1243331191-11445-2-git-send-email-vapier@gentoo.org>
	<20090526113122.GB16835@linux-sh.org>
	<8bd0f97a0905260942m4b574d75oc4f38ee3d8849395@mail.gmail.com>
	<20090526164735.GA24261@linux-sh.org>
Date: Tue, 26 May 2009 12:50:51 -0400
Message-ID: <8bd0f97a0905260950i6da64210n7da256627d3e38ff@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/maps: uclinux: support Blackfin systems
From: Mike Frysinger <vapier.adi@gmail.com>
To: Paul Mundt <lethal@linux-sh.org>, Mike Frysinger <vapier.adi@gmail.com>,
	linux-kernel@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dev@uclinux.org,
	linux-mtd@lists.infradead.org
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

On Tue, May 26, 2009 at 12:47, Paul Mundt wrote:
> On Tue, May 26, 2009 at 12:42:48PM -0400, Mike Frysinger wrote:
>> On Tue, May 26, 2009 at 07:31, Paul Mundt wrote:
>> > On Tue, May 26, 2009 at 05:46:31AM -0400, Mike Frysinger wrote:
>> >> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
>> >> index 57699c2..dcb552f 100644
>> >> --- a/drivers/mtd/maps/uclinux.c
>> >> +++ b/drivers/mtd/maps/uclinux.c
>> >> @@ -55,8 +55,13 @@ static int __init uclinux_mtd_init(void)
>> >> ??{
>> >> ?? ?? ?? struct mtd_info *mtd;
>> >> ?? ?? ?? struct map_info *mapp;
>> >> +#ifdef CONFIG_BLACKFIN
>> >> + ?? ?? extern unsigned long memory_mtd_start;
>> >> + ?? ?? unsigned long addr =3D (unsigned long) memory_mtd_start;
>> >> +#else
>> >> ?? ?? ?? extern char _ebss;
>> >> ?? ?? ?? unsigned long addr =3D (unsigned long) &_ebss;
>> >> +#endif
>> >>
>> >> ?? ?? ?? mapp =3D &uclinux_ram_map;
>> >> ?? ?? ?? mapp->phys =3D addr;
>> >
>> > NAK.
>> >
>> > I know there's no accounting for taste, but it would be nice to at lea=
st
>> > see some minimal amount of effort going in to fixing these things
>> > sanely rather than just lazily shoving ifdefs in wherever possible.
>> >
>> > In this case you should just kill all of that crap off, and have the
>> > platforms that use this set uclinux_ram_map up themselves, it's alread=
y
>> > a global. Of course you can use _ebss as a default value for
>> > uclinux_ram_map.phys and just override it in your platform.
>>
>> i would agree if it were a board-specific issue, but it's an arch
>> issue, so pushing it to the boards level is wrong. =C2=A0i can however
>> replace the addr with a global weak and add a symbol into the Blackfin
>> arch code to override it.
>>
> I obviously meant architectures setting up the address, not the board
> code, as this has nothing at all to do with boards. There are already
> plenty of cases in setup_arch() for filling in uclinux mtd data, one more
> isn't going to make a difference.
>
> I don't see anything wrong with keeping uclinux_ram_map as a global
> however, particularly since platforms that need to special case the
> mapping can easily do this under the existing ifdef. Adding weak symbols
> for something like this just seems silly.

the point of the weak symbol was so that the map could provide a sane
default that works for most everyone out there without having to copy
& paste the same code to every arch, and to make new arch porters
worry about what needs to be done to use this very trivial map
-mike
