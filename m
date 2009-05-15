Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4xAU-0003jM-Ou
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 13:09:49 +0000
Subject: Re: [resending-2] [PATCH] [MTD] [NAND] Add OMAP2 / OMAP3 NAND driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <46851.192.168.10.89.1241083986.squirrel@dbdmail.itg.ti.com>
References: <61255.192.168.10.89.1240984646.squirrel@dbdmail.itg.ti.com>
	<46851.192.168.10.89.1241083986.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 16:08:39 +0300
Message-Id: <1242392919.27996.238.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, vimal singh <vimalsingh@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-30 at 15:03 +0530, vimal singh wrote:
> This driver is present in the OMAP tree, now pushing it to MTD.
> 
> Original author(s):
>        Jian Zhang <jzhang@ti.com>
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  drivers/mtd/nand/Kconfig  |    6
>  drivers/mtd/nand/Makefile |    1
>  drivers/mtd/nand/omap2.c  |  776 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 783 insertions(+)

Hi Thomas,

would you please find a little time and Ack/Nack this
please?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
