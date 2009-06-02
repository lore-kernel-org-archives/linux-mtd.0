Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBdXj-0001Eu-Mw
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 23:37:26 +0000
Received: by yw-out-1718.google.com with SMTP id 9so4986641ywk.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jun 2009 16:37:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090602225827.GC26220@fluff.org.uk>
References: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
	<20090602225827.GC26220@fluff.org.uk>
Date: Tue, 2 Jun 2009 19:37:18 -0400
Message-ID: <8bd0f97a0906021637u3db96870m8fee2356153ee8f3@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH] mtd/maps: gpio-addr-flash: new
	driver for GPIO assisted flash addressing
From: Mike Frysinger <vapier.adi@gmail.com>
To: Ben Dooks <ben-linux@fluff.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, Mike Frysinger <vapier@gentoo.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 2, 2009 at 18:58, Ben Dooks wrote:
> On Tue, Jun 02, 2009 at 12:07:30AM -0400, Mike Frysinger wrote:
>> +struct async_state {
>> + =C2=A0 =C2=A0 struct mtd_info *mtd;
>> + =C2=A0 =C2=A0 struct map_info map;
>> + =C2=A0 =C2=A0 size_t gpio_count;
>> + =C2=A0 =C2=A0 unsigned *gpio_addrs;
>> + =C2=A0 =C2=A0 int *gpio_values;
>> + =C2=A0 =C2=A0 unsigned long win_size;
>> +};
>
> no kerneldoc for this?

guess i could figure that out and add it

>> +static void gf_set_gpios(struct async_state *state, unsigned long ofs)
>> +{
>> + =C2=A0 =C2=A0 size_t i;
>> + =C2=A0 =C2=A0 int value;
>> + =C2=A0 =C2=A0 for (i =3D 0; i < state->gpio_count; ++i) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D !!((ofs / state->w=
in_size) & (1 << i));
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (state->gpio_values[i] !=
=3D value) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
gpio_set_value(state->gpio_addrs[i], value);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
state->gpio_values[i] =3D value;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }
>> +}
>> +
>> +static map_word gf_read(struct map_info *map, unsigned long ofs)
>> +{
>> + =C2=A0 =C2=A0 struct async_state *state =3D (struct async_state *)map-=
>map_priv_1;
>> + =C2=A0 =C2=A0 u16 word;
>> + =C2=A0 =C2=A0 map_word test;
>> +
>> + =C2=A0 =C2=A0 gf_set_gpios(state, ofs);
>> +
>> + =C2=A0 =C2=A0 word =3D readw(map->virt + (ofs % state->win_size));
>> + =C2=A0 =C2=A0 test.x[0] =3D word;
>> + =C2=A0 =C2=A0 return test;
>> +}
>> +
>> +static void gf_copy_from(struct map_info *map, void *to, unsigned long =
from, ssize_t len)
>> +{
>> + =C2=A0 =C2=A0 struct async_state *state =3D (struct async_state *)map-=
>map_priv_1;
>> +
>> + =C2=A0 =C2=A0 gf_set_gpios(state, from);
>> +
>> + =C2=A0 =C2=A0 /* BUG if operation crosss the win_size */
>> + =C2=A0 =C2=A0 BUG_ON(!((from + len) % state->win_size <=3D (from + len=
)));
>> +
>> + =C2=A0 =C2=A0 /* operation does not cross the win_size, so one shot it=
 */
>> + =C2=A0 =C2=A0 memcpy_fromio(to, map->virt + (from % state->win_size), =
len);
>> +}
>> +
>> +static void gf_write(struct map_info *map, map_word d1, unsigned long o=
fs)
>> +{
>> + =C2=A0 =C2=A0 struct async_state *state =3D (struct async_state *)map-=
>map_priv_1;
>> + =C2=A0 =C2=A0 u16 d;
>> +
>> + =C2=A0 =C2=A0 gf_set_gpios(state, ofs);
>> +
>> + =C2=A0 =C2=A0 d =3D d1.x[0];
>> + =C2=A0 =C2=A0 writew(d, map->virt + (ofs % state->win_size));
>> +}
>> +
>> +static void gf_copy_to(struct map_info *map, unsigned long to, const vo=
id *from, ssize_t len)
>> +{
>> + =C2=A0 =C2=A0 struct async_state *state =3D (struct async_state *)map-=
>map_priv_1;
>> +
>> + =C2=A0 =C2=A0 gf_set_gpios(state, to);
>> +
>> + =C2=A0 =C2=A0 /* BUG if operation crosss the win_size */
>> + =C2=A0 =C2=A0 BUG_ON(!((to + len) % state->win_size <=3D (to + len)));
>> +
>> + =C2=A0 =C2=A0 /* operation does not cross the win_size, so one shot it=
 */
>> + =C2=A0 =C2=A0 memcpy_toio(map->virt + (to % state->win_size), from, le=
n);
>> +}
>> +
>> +#ifdef CONFIG_MTD_PARTITIONS
>> +static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot", N=
ULL };
>> +#endif
>> +
>> +static int __devinit gpio_flash_probe(struct platform_device *pdev)
>> +{
>> + =C2=A0 =C2=A0 int ret;
>> + =C2=A0 =C2=A0 size_t i;
>> + =C2=A0 =C2=A0 struct physmap_flash_data *pdata =3D pdev->dev.platform_=
data;
>> + =C2=A0 =C2=A0 struct resource *memory =3D platform_get_resource(pdev, =
IORESOURCE_MEM, 0);
>> + =C2=A0 =C2=A0 struct resource *gpios =3D platform_get_resource(pdev, I=
ORESOURCE_IRQ, 0);
>> + =C2=A0 =C2=A0 struct async_state *state;
>
> both memory and gpios wrap, please put the platform_get_resource()
> onto their own lines.

looks fine to me

> =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =3D platform_get_resource(pdev, IORESOUR=
CE_IRQ, 0);
>
> nope, not irqs. maybe someone should propose IORESOURCE_GPIO.

IORESOURCE_IRQ is the closest thing as it represents a pin.  the
existing masks allows for only 4 types and they're already allocated.
if someone felt like tackling that crap, i'd have no problem
converting the driver.

>> + =C2=A0 =C2=A0 state =3D kzalloc(sizeof(*state) + (sizeof(int) * gpios-=
>end * 2), GFP_KERNEL);
>
> hmm, why not keep the pointer to the resource you just got instead?

the GPIO array is duplicated and i could keep a reference to that, but
the rest would add overhead.  i would need two pointers anyways, so
simply caching the calculated values (gpio_count and win_size) instead
makes more sense.
-mike
