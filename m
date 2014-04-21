Received: from mail-pb0-f44.google.com ([209.85.160.44])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcGBl-0003EA-5V
 for linux-mtd@lists.infradead.org; Mon, 21 Apr 2014 15:31:21 +0000
Received: by mail-pb0-f44.google.com with SMTP id rp16so3857640pbb.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2014 08:30:54 -0700 (PDT)
Date: Mon, 21 Apr 2014 23:30:45 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Hou Zhiqiang <B48286@freescale.com>
Subject: Re: [PATCH V4] mtd: m25p80: Modify the name of mtd_info
Message-ID: <20140421153042.GA3498@localhost.localdomain>
References: <1398078381-22452-1-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398078381-22452-1-git-send-email-B48286@freescale.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, mingkai.hu@freescale.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 21, 2014 at 07:06:21PM +0800, Hou Zhiqiang wrote:
> To specify spi flash layouts by "mtdparts=..." in cmdline, we must
> give mtd_info a fixed name,because the cmdlinepart's parser will
> match the name of mtd_info given in cmdline.
> Now, if use DT, the mtd_info's name will be spi->dev->name. It
> consists of spi_master->bus_num, and the spi_master->bus_num maybe
> dynamically fetched. So, in this case, replace the component bus_num
> with thei physical address of spi master.
> 
> Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
> ---
> V4:
> 	add check no-NULL for pointer of master's device node, and if it failed
> 	to get physcial address of the master, then name the mtd_info by the
> 	name of spi->dev.
> V3:
> 	Fix a bug, matching unsigned long long with "%llx".
> V2:
> 	1. Fix some code style issue.
> 	2. Cast physical address to unsigned long long.
> 
>  drivers/mtd/devices/m25p80.c | 16 ++++++++++++++--
please rebase this patch on the latest l2-mtd tree.

thanks
Huang Shijie
