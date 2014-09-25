Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXF8d-000311-7j
 for linux-mtd@lists.infradead.org; Thu, 25 Sep 2014 19:55:40 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] spi-nor: Fix for Freescale i.MX6 reboot issue when using
 a N25Q00A boot device.
Date: Thu, 25 Sep 2014 19:09:41 +0200
References: <CAKbvp-NuFWzCCT+eo-WO47kazNuHbcA4KxhjDLYGR9p9Jh9FRg@mail.gmail.com>
In-Reply-To: <CAKbvp-NuFWzCCT+eo-WO47kazNuHbcA4KxhjDLYGR9p9Jh9FRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409251909.41740.marex@denx.de>
Cc: Jeremy Garff <jer@jers.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, August 16, 2014 at 08:14:05 PM, Jeremy Garff wrote:
> This is my first submission to the linux-mtd list.  I found

Found yes

> and fixed

Fixed no ;-)

> a issue related to the i.MX6 when using a N25Q00A spi-nor as the boot
> device.  The following is a patch and more detailed description.  As
> this is my first submission to this list, so please let me know you
> have any questions or concerns.

Well, the problem is that the SPI NOR ends in undefined state when you reset the 
board. The problem is not in Linux, the problem is in your board. You should use 
the RESET-OUTPUT pin of your MX6 to implement proper reset sequencing for the 
SPI NOR.

This patch would not work in case you were doing a PageProgram operation and I 
came around and mashed the 'reset' button on your board. The SPI NOR would be 
somewhere in the middle of the PP and your MX6 would simply not boot.

So the solution here is to fix your hardware ;-)

btw this is a common issue, we should really document this before more people 
get hurt.

btw2 Spansion does much better job, their SPI NORs have RESET pin, so you don't 
need to implement logic to power cycle the SPI NOR.

Best regards,
Marek Vasut
