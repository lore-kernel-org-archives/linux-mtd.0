Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVjoj-00031t-VU
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 03:08:25 -0400
Subject: Re: [PATCH 2/2] NAND: nandsim sector-wise allocation
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vijay Kumar <vijaykumar@bravegnu.org>
In-Reply-To: <17701.15655.736379.98045@vaishnavi.localdomain>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
	<17701.15655.736379.98045@vaishnavi.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Oct 2006 10:08:16 +0300
Message-Id: <1160118496.13696.57.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vijay,

thank you for your patches. Please, find my comments below.

On Thu, 2006-10-05 at 22:43 +0530, Vijay Kumar wrote:
> For page wise allocation, an array of flash page pointers is allocated
> during initialization. The flash pages are themselves allocated when a
> write occurs to the page. The flash pages are deallocated when they
> are erased.
>=20
> The init, read, prog and erase operations are moved to separate functions=
,
> and for each allocation/mapping type a set of init/read/prog/erase
> functions are defined.
>=20
> Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

Frankly, I do not understand many things in nandsim code now, although I
wrote it :-) So no deep review for now, just minor or obvious things.

>  config  MTD_NAND_NANDSIM_CHIP_ALLOC
> -	bool "Use allocated memory"
> +	bool "Allocate entire chip"
>  	help
> -	  The flash data is stored in allocated memory.
> +	  The flash data is stored in allocated memory. The entire
> +	  memory to hold the flash data is allocated during=20
> +	  initialization.
> =20
> +config MTD_NAND_NANDSIM_PAGE_ALLOC
> +	bool "Allocate flash pages as required"
> +	help
> +	  The flash data is stored in allocated memory. The
> +	  allocation is done on a per page basis, when data is=20
> +	  written to the page. Enables simulation of=20
> +	  higher capacity NAND devices in systems that do
> +	  not have as much RAM.

I believe there is no need in these options. As soon as you've added the
new method, what's the reason to keep the old one? Why you didn't delete
it - any good reason?

> -#ifdef CONFIG_MTD_NAND_NANDSIM_CHIP_MAP
> +#if defined(CONFIG_MTD_NAND_NANDSIM_CHIP_MAP)

I wonder, why "#if defined(kaka)" is better then "#ifdef kaka" ? What
for is this change :-) ?

>  #include <asm/io.h>
>  #endif
> =20
> @@ -45,8 +45,10 @@
>  #define CONFIG_NANDSIM_CHIP_MAP      1
>  #elif defined(CONFIG_MTD_NAND_NANDSIM_CHIP_ALLOC)
>  #define CONFIG_NANDSIM_CHIP_ALLOC    1
> +#elif defined(CONFIG_MTD_NAND_NANDSIM_PAGE_ALLOC)
> +#define CONFIG_NANDSIM_PAGE_ALLOC  1

Ditto. Although it is anyway reasonable to get rid of this junk #ifdefs
at all.

> +union ns_mem_t {
> +	u_char *byte;
> +	uint16_t *word;
> +};

Minor, but 'union ns_mem' is a better name. We usually use "_t" for
typedefs, and we use typedefs very rarely and only if there is a good
reason.

> +static int
> +alloc_map_device(struct nandsim *ns)

Again minor. I understand that everybody has its own style, and I
appreciate this. But when one fixes an existing code, it makes sense to
follow the same style. So I offer to use definitions like

static int alloc_map_device(struct nandsim *ns);

This is just a nice stuff to bear in mind, IMHO.

> +	for (i =3D 0; i < num; i++) {
> +		ns->mem.byte[NS_RAW_OFFSET(ns) + ns->regs.off + i] &=3D ns->buf.byte[i=
];
> +	}

Again a nit. We usually don't use brackets in case of one-line code -
just a convention.

> 			ns->mem.byte[NS_RAW_OFFSET(ns) + ns->regs.off + i] &=3D ns->buf.byte[i=
];
> +		if (prog_page(ns, num) =3D=3D -1) {
> +			return -1;
> +		}

Ditto.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
