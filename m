MIME-Version: 1.0
In-Reply-To: <187ed7b3996c7f37ce782d847d3ecc761c3e52b8.1292833228.git.viresh.kumar@st.com>
References: <cover.1292833228.git.viresh.kumar@st.com>
	<187ed7b3996c7f37ce782d847d3ecc761c3e52b8.1292833228.git.viresh.kumar@st.com>
Date: Sun, 26 Dec 2010 16:38:31 +0100
Message-ID: <AANLkTik_NXigwhRH3KMjV3qmu-GB7m+6hzzdGY8RjBof@mail.gmail.com>
Subject: Re: [PATCH V3 36/63] ST SPEAr : FSMC (Flexible Static Memory
	Controller) NOR interface driver
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Viresh Kumar <viresh.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: rajeev-dlh.kumar@st.com, armando.visconti@st.com,
	Vipin Kumar <vipin.kumar@st.com>, shiraz.hashim@st.com,
	amit.virdi@st.com, vipulkumar.samar@st.com,
	linux-mtd@lists.infradead.org, deepak.sikri@st.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/12/20 Viresh Kumar <viresh.kumar@st.com>:

> SPEAr1300 SoC supports FSMC to interface with various memories
> (NOR/NAND/SRAM). This patch adds the support for FSMC over NOR interface.
>
> The driver being used is driver/mtd/maps/physmap.c

OK..

(...)
> diff --git a/arch/arm/mach-spear13xx/fsmc-nor.c b/arch/arm/mach-spear13xx/fsmc-nor.c
> new file mode 100644
> index 0000000..03234b6
> --- /dev/null
> +++ b/arch/arm/mach-spear13xx/fsmc-nor.c

What is this file doing in mach-spear13xx? Several other platforms
like U300 and Nomadik use the same NOR controller.

This should be in drivers/mtd/* somewhere I believe?

> @@ -0,0 +1,85 @@
> +/*
> + * arch/arm/mach-spear13xx/fsmc-nor.c
> + *
> + * FSMC (Flexible Static Memory Controller) interface for NOR
> + *
> + * Copyright (C) 2010 ST Microelectronics
> + * Vipin Kumar<vipin.kumar@st.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <plat/fsmc.h>

Use <linux/mtd/fsmc.h> as include file, get rid of plat/fsmc.h.
Extend that .h file with the stuff you need.

We need to keep definitions for MTD NOR, NAND and OneNAND using FSMC
in this file so as to keep things simple. One header file is enough, and it's
very generic too, FSMC is not for plat-spear/* but also U300, Nomadik and
Ux500.

Yours,
Linus Walleij
