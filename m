Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtWLx-0003es-Kn
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 05:40:58 +0000
Date: Thu, 19 Dec 2013 13:10:53 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v6] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131219051050.GA12530@shlinux2.ap.freescale.net>
References: <1387393632-5338-1-git-send-email-eliedebrauwer@gmail.com>
 <1387393632-5338-2-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1387393632-5338-2-git-send-email-eliedebrauwer@gmail.com>
Cc: shijie8@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 18, 2013 at 08:07:12PM +0100, Elie De Brauwer wrote:
> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> found in an erased page. Typically causing problems at higher levels
> (ubifs corrupted empty space warnings). This problem was also observed
> when using SLC NAND devices.
> 
> This patch configures the BCH block to mark a block as 'erased' if
> not too much bitflips are found. Next HW_BCH_STATUS0:ALLONES
> is used to check if the data read were all ones, indicating a read of a
> properly erased chunk was performed. If this was not the case a slow path
> is entered where bitflips are counted and corrected in software,
> allowing the upper layers to take proper actions.
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>

thanks a lot!

Acked-by: Huang Shijie <b32955@freescale.com>
