Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwaQ-0006H5-Al
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:46:59 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/9] mtd: spi-nor: unify read opcode variants with ST SPI
 FSM
Date: Wed, 9 Apr 2014 19:41:33 +0200
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397064774-31784-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091941.33666.marex@denx.de>
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

On Wednesday, April 09, 2014 at 07:32:48 PM, Brian Norris wrote:
> serial_flash_cmds.h defines our opcodes a little differently. Let's
> borrow its naming, since it's borrowed from the SFDP standard, and it's
> more extensible.
> 
> This prepares us for merging serial_flash_cmds.h and spi-nor.h opcode
> listing.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
