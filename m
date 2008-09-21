Received: from mta23.gyao.ne.jp ([125.63.38.249] helo=mx.gate01.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KhDQr-0005FK-UL
	for linux-mtd@lists.infradead.org; Sun, 21 Sep 2008 01:08:14 +0000
Date: Sun, 21 Sep 2008 10:07:13 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
Subject: Re: [PATCH v2] mtd: sh_flctl: add support for Renesas SuperH FLCTL
Message-ID: <20080921010713.GA2522@linux-sh.org>
References: <48D348FC.3060301@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48D348FC.3060301@renesas.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 19, 2008 at 03:38:52PM +0900, Yoshihiro Shimoda wrote:
> Several Renesas SuperH CPU has FLCTL. The FLCTL support NAND Flash.
> This driver support SH7723.
> 
> Signed-off-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
> Acked-by: Paul Mundt <lethal@linux-sh.org>
> ---
> 
> PATCH v2:
>  - fix size of ioremap().
> 
>  drivers/mtd/nand/Kconfig     |    7 +
>  drivers/mtd/nand/Makefile    |    1 +
>  drivers/mtd/nand/sh_flctl.c  |  878 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/sh_flctl.h |  125 ++++++
>  4 files changed, 1011 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/sh_flctl.c
>  create mode 100644 include/linux/mtd/sh_flctl.h
> 
I'll merge the platform bits once this is applied. Optionally I can roll
this in to my tree if dwmw2 acks it.
