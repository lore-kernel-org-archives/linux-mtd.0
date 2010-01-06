Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSWyd-0000jb-4A
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 14:35:15 +0000
Subject: Re: [PATCH v2 2/2]: Introducing 'gpmc-nand.c' for GPMC specific
	NAND init
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790912140147v23e3705aucf6d25c56aaaab31@mail.gmail.com>
References: <64662.192.168.10.89.1259933932.squirrel@dbdmail.itg.ti.com>
	<20091204220138.GJ24013@atomide.com>
	<ce9ab5790912062229xae89bb3m6965b4f4465f11c3@mail.gmail.com>
	<ce9ab5790912070529h1143355du691ce6a23f5ddb56@mail.gmail.com>
	<20091207175644.GA24013@atomide.com>
	<20091208235725.GA24013@atomide.com>
	<ce9ab5790912132226n6480c029ve93def5ebec1e2c9@mail.gmail.com>
	<ce9ab5790912140147v23e3705aucf6d25c56aaaab31@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 16:34:57 +0200
Message-Id: <1262788497.3177.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, "Govindraj.R" <govindraj.raja@ti.com>,
	linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-14 at 15:17 +0530, Vimal Singh wrote:
> From 6170aa1c63c49a3f09e76258f400230b742fdd6f Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Wed, 25 Nov 2009 18:23:15 +0530
> Subject: [PATCH] Introducing 'gpmc-nand.c' for GPMC specific NAND init
> 
> Introducing 'gpmc-nand.c' for GPMC specific NAND init.
> For example: GPMC timing parameters and all.
> This patch also migrates gpmc related calls from 'nand/omap2.c'
> to 'gpmc-nand.c'.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  arch/arm/mach-omap2/Makefile           |    3 +
>  arch/arm/mach-omap2/gpmc-nand.c        |  137 ++++++++++++++++++++++++++++++++
>  arch/arm/plat-omap/include/plat/nand.h |    6 ++
>  drivers/mtd/nand/omap2.c               |   26 +------
>  4 files changed, 149 insertions(+), 23 deletions(-)
>  create mode 100644 arch/arm/mach-omap2/gpmc-nand.c

I assume this is material for Tony and the omap tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
