Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEcBm-000333-8o
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:50:58 +0000
Date: Sun, 19 Jun 2016 14:50:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 0/8] MTD: xway: fix driver
Message-ID: <20160619145036.4888855a@bbrezillon>
In-Reply-To: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hauke,

On Sat, 18 Jun 2016 21:14:04 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Without these patches the driver does not work for me.
> Some of these patches are in OpenWrt for years now and should go 
> upstream. In addition this converts it from some hack with the 
> plat_nand driver to a normal platform driver.

Thanks for the cleanup.

Still, I think we could go further. For example, you could get rid of
the IO_R/W_ADDR assignment and have your own ->iomem field in
xway_nand_data.
And I'd also like to see a clean nand_controller/nand_chip separation,
as done in other drivers (brcm, sunxi, qcom, ...), and that would be
even better if you could support a new binding where the NAND
controller and NAND chip are properly separated.
Note that these changes can be done incrementally and won't prevent the
inclusion of the patches you've already posted.

The last thing that is really bothering me is the ebu spinlock and its
implications on the whole system responsiveness.

Could you tell me more about this EBU. Do you really have to make it a
spinlock, and do you really have to disable irqs?

Regards,

Boris

> 
> changes since:
> v1:
>  - convert to normal platform driver
>  - do not use global variable xway_latchcmd
>  - use mtd_to_nand()
> 
> Hauke Mehrtens (4):
>   MTD: xway: convert to normal platform driver
>   MTD: xway: add some more documentation
>   MTD: xway: extract read and write function
>   MTD: xway: use global NAND_CMD_RESET define
> 
> John Crispin (4):
>   MTD: xway: the latched command should be persistent
>   MTD: xway: remove endless loop
>   MTD: xway: add missing write_buf and read_buf to nand driver
>   MTD: xway: fix nand locking
> 
>  drivers/mtd/nand/Kconfig     |   1 -
>  drivers/mtd/nand/xway_nand.c | 206 ++++++++++++++++++++++++++++++-------------
>  2 files changed, 147 insertions(+), 60 deletions(-)
> 
