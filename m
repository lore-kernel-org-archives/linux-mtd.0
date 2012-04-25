Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN4kO-0007dW-37
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 16:07:16 +0000
Received: by lagy4 with SMTP id y4so253761lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 09:07:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335368735.6356.17.camel@koala>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <1335368735.6356.17.camel@koala>
Date: Wed, 25 Apr 2012 18:07:14 +0200
Message-ID: <CABYn4sz0pMSYEA3w968GA-qu0VKc+e-TLqYTcTuudPwpMFxV2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Bastian Hecht <hechtb@googlemail.com>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Content-Type: text/plain; charset=ISO-8859-1
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
 Armando Visconti <armando.visconti@st.com>,
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

Hello,

this should be an sh_flctl unrelated problem. Guennadi, have you seen
this error somewhere before?

thanks,

 Bastian Hecht

> -------------------------------------------------------------------------=
-------
> Failed to build the following commit for configuration "l2_mackerel_defco=
nfig" (architecture arm)":
>
> 54043ff MIPS: Kbuild: remove -Werror
>
> In file included from include/linux/kernel.h:19:0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/cache.h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/time.h:7,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/stat.h:60,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:10,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from drivers/mtd/nand/sh_flctl.c:24:
> include/linux/bitops.h: In function 'hweight_long':
> include/linux/bitops.h:66:26: warning: signed and unsigned type in condit=
ional expression [-Wsign-compare]
> drivers/mtd/nand/sh_flctl.c: In function 'set_addr':
> drivers/mtd/nand/sh_flctl.c:117:25: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
> drivers/mtd/nand/sh_flctl.c: In function 'flctl_cmdfunc':
> drivers/mtd/nand/sh_flctl.c:611:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
> drivers/mtd/nand/sh_flctl.c:638:28: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
> In file included from include/linux/kernel.h:19:0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/cache.h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/time.h:7,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/stat.h:60,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:10,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from init/version.c:10:
> include/linux/bitops.h: In function 'hweight_long':
> include/linux/bitops.h:66:26: warning: signed and unsigned type in condit=
ional expression [-Wsign-compare]
> arch/arm/mach-shmobile/built-in.o: In function `mackerel_sdhi0_gpio_cd':
> pfc-sh7372.c:(.text+0x33ec): undefined reference to `mmc_detect_change'
> make[1]: *** [.tmp_vmlinux1] Error 1
>
