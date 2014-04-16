Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaZSA-0000A4-Rs
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 23:41:19 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Date: Thu, 17 Apr 2014 01:40:29 +0200
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1397636299-2390-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404170140.29747.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 16, 2014 at 10:18:19 AM, Huang Shijie wrote:
> The dummy cycles is actually 8 for SPI fast/dual/quad read.
> 
> This patch fixes the wrong dummy value for both the spi-nor.c and m25p80.c.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Inspecting this patch, I see the code will behave identically with/without this 
patch. It is thus unclear to me from the commit message, why this change is 
necessary.

Best regards,
Marek Vasut
