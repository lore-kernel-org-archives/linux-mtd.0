Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3kyn-0000sx-72
	for linux-mtd@lists.infradead.org; Fri, 30 Oct 2009 06:29:01 +0000
Subject: Re: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790910292320x2eef0550pdc3fde5d616ea361@mail.gmail.com>
References: <ce9ab5790910292320x2eef0550pdc3fde5d616ea361@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Oct 2009 08:28:50 +0200
Message-Id: <1256884130.29885.865.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-30 at 11:50 +0530, Vimal Singh wrote:
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Fri, 30 Oct 2009 11:34:14 +0530
> Subject: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver
> 
> This patch series addresses some of the issues in omap nand driver.
> 
> Vimal Singh (3):
>   Fixing compilation warning for 'nand/omap2.c'
>   NAND: OMAP: Fixing omap nand driver, compiled as module
>   NAND: OMAP: Simplifying HWECC and removing unnecessary macros
> 
>  drivers/mtd/nand/omap2.c |  315 ++++++++++++++++------------------------------
>  1 files changed, 108 insertions(+), 207 deletions(-)

Could you please post this to linux-omap as well?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
