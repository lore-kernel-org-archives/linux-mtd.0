Received: from moutng.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SN554-0000TC-Kw
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 16:28:39 +0000
Date: Wed, 25 Apr 2012 18:25:11 +0200 (CEST)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
In-Reply-To: <CABYn4sz0pMSYEA3w968GA-qu0VKc+e-TLqYTcTuudPwpMFxV2A@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1204251824230.25529@axis700.grange>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <1335368735.6356.17.camel@koala>
 <CABYn4sz0pMSYEA3w968GA-qu0VKc+e-TLqYTcTuudPwpMFxV2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 prabhakar@freescale.com, Mike Dunn <mikedunn@newsguy.com>,
 Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, "Rafael J. Wysocki" <rjw@sisk.pl>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bastian

On Wed, 25 Apr 2012, Bastian Hecht wrote:

> Hello,
>=20
> this should be an sh_flctl unrelated problem. Guennadi, have you seen
> this error somewhere before?

You're #111:

https://lkml.org/lkml/2012/4/19/621

Thanks
Guennadi

>=20
> thanks,
>=20
>  Bastian Hecht
>=20
> > ---------------------------------------------------------------------=
-----------
> > Failed to build the following commit for configuration "l2_mackerel_d=
efconfig" (architecture arm)":
> >
> > 54043ff MIPS: Kbuild: remove -Werror
> >
> > In file included from include/linux/kernel.h:19:0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/cache.h:4,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/time.h:7,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/stat.h:60,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:10,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from drivers/mtd/nand/sh_flctl.c:24:
> > include/linux/bitops.h: In function 'hweight_long':
> > include/linux/bitops.h:66:26: warning: signed and unsigned type in co=
nditional expression [-Wsign-compare]
> > drivers/mtd/nand/sh_flctl.c: In function 'set_addr':
> > drivers/mtd/nand/sh_flctl.c:117:25: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
> > drivers/mtd/nand/sh_flctl.c: In function 'flctl_cmdfunc':
> > drivers/mtd/nand/sh_flctl.c:611:15: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
> > drivers/mtd/nand/sh_flctl.c:638:28: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
> > In file included from include/linux/kernel.h:19:0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/cache.h:4,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/time.h:7,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/stat.h:60,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:10,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from init/version.c:10:
> > include/linux/bitops.h: In function 'hweight_long':
> > include/linux/bitops.h:66:26: warning: signed and unsigned type in co=
nditional expression [-Wsign-compare]
> > arch/arm/mach-shmobile/built-in.o: In function `mackerel_sdhi0_gpio_c=
d':
> > pfc-sh7372.c:(.text+0x33ec): undefined reference to `mmc_detect_chang=
e'
> > make[1]: *** [.tmp_vmlinux1] Error 1
> >
>=20

---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
