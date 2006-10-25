Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gch2L-0005Dc-ET
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 07:35:14 -0400
Subject: Re: [PATCH] [PATCH] [MTD] MAPS: Support for BIOS flash chips on
	the nvidia ck804 southbridge
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ryan Jackson <rjackson@lnxi.com>
In-Reply-To: <20061024174606.GE21009@localdomain>
References: <20061024174606.GE21009@localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 25 Oct 2006 14:35:03 +0300
Message-Id: <1161776104.3260.201.camel@sauron>
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

Hello Ryan,

please, find few of my minor notes below:

> +/*
> + * ck804xrom.c
> + *
> + * Normal mappings of chips in physical memory
> + * $Id: ck804xrom.c,v 1.1 2005/01/06 16:58:24 dolsen Exp $
No need to dubmit CVS stuff
Also it would be nice to add your name at the header.

> + */

> +#include <linux/config.h>
Don't include this file - this stuff is done by the Linux build system.=20

> +#define MOD_NAME KBUILD_BASENAME
> +
> +#define ADDRESS_NAME_LEN 18
> +
> +#define ROM_PROBE_STEP_SIZE (64*1024) /* 64KiB */
I personally would be happier to see a comment about what this macro is,
not about that 64*1024 =3D 64KiB.


> +	/* Free all of the mtd devices */
> +	list_for_each_entry_safe(map, scratch, &window->maps, list) {
> +		if (map->rsrc.parent) {
> +			release_resource(&map->rsrc);
> +		}
{} for one-line operators are not needed as well as all over the code -
that's a linux coding style convention.

> +        pci_write_config_byte(pdev, 0x88, byte | (1<<6));
> +	}
> +	else {
> +		window->phys =3D 0xffff0000; /* 64KiB */
Please, use } else { instead.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
