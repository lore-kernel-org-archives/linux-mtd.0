MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <201105240059.p4O0xPfN009516@hera.kernel.org>
References: <201105240059.p4O0xPfN009516@hera.kernel.org>
Date: Wed, 8 Jun 2011 20:53:23 +0200
Message-ID: <BANLkTim1=DBd1AvPw1VuPfGi_Z5ktAhyPg@mail.gmail.com>
Subject: Re: ARM: 6910/1: MTD: physmap: let set_vpp() pass a platform_device
	instead of a map_info
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Marc Zyngier <Marc.Zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 24, 2011 at 02:59, Linux Kernel Mailing List
<linux-kernel@vger.kernel.org> wrote:
> =C2=A0 =C2=A0ARM: 6910/1: MTD: physmap: let set_vpp() pass a platform_dev=
ice instead of a map_info
>
> =C2=A0 =C2=A0The set_vpp() method provided by physmap passes a map_info b=
ack to
> =C2=A0 =C2=A0the platform code, which has little relevance as far as the =
platform
> =C2=A0 =C2=A0is concerned (this parameter is completely unused).
>
> =C2=A0 =C2=A0Instead, pass the platform_device, which can be used in the =
pismo
> =C2=A0 =C2=A0driver to retrieve some important information in a nicer way=
, instead
> =C2=A0 =C2=A0of the hack that was in place.
>
> =C2=A0 =C2=A0The empty set_vpp function in board-at572d940hf_ek.c is left=
 untouched,
> =C2=A0 =C2=A0as the board/SoC is scheduled for removal.
>
> =C2=A0 =C2=A0Cc: Andrew Victor <linux@maxim.org.za>
> =C2=A0 =C2=A0Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> =C2=A0 =C2=A0Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosof=
t.com>
> =C2=A0 =C2=A0Cc: Philipp Zabel <philipp.zabel@gmail.com>
> =C2=A0 =C2=A0Cc: Eric Miao <eric.y.miao@gmail.com>
> =C2=A0 =C2=A0Cc: Ben Dooks <ben-linux@fluff.org>
> =C2=A0 =C2=A0Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> =C2=A0 =C2=A0Acked-by: David Woodhouse <dwmw2@infradead.org>
> =C2=A0 =C2=A0Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> =C2=A0 =C2=A0Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

> --- a/include/linux/mtd/physmap.h
> +++ b/include/linux/mtd/physmap.h
> @@ -24,7 +24,7 @@ struct physmap_flash_data {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0width;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*init)(struct platform_device *);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*exit)(struct platform_device *);
> - =C2=A0 =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(*set_vpp)(struct map_info *, int);
> + =C2=A0 =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(*set_vpp)(struct platform_device *, int);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nr_parts;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pfow_base;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0*probe_type;

You forgot to update the set_vpp parameter of physmap_configure():

void physmap_configure(unsigned long addr, unsigned long size,
                int bankwidth, void (*set_vpp)(struct map_info *, int) );

causing

drivers/mtd/maps/physmap.c: In function =E2=80=98physmap_configure=E2=80=99=
:
drivers/mtd/maps/physmap.c:255: warning: assignment from incompatible
pointer type

Interestingly, there are no (in-tree) users of physmap_configure()?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
