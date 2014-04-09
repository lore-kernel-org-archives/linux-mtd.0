Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwbA-0006Lh-Rs
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:47:45 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 5/9] mtd: spi-nor: shorten Kconfig naming
Date: Wed, 9 Apr 2014 19:44:42 +0200
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397064774-31784-5-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091944.42548.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 at 07:32:50 PM, Brian Norris wrote:
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/Makefile         |  2 +-
>  drivers/mtd/devices/Kconfig  |  2 +-
>  drivers/mtd/spi-nor/Kconfig  | 11 ++++++++---
>  drivers/mtd/spi-nor/Makefile |  2 +-
>  4 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
