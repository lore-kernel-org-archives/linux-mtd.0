Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSMMt-0007v6-9w
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 09:42:44 +0000
From: Marek Vasut <marex@denx.de>
To: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 11:42:18 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nga_chi86" <ngachi86@gmail.com>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
 <201508201052.47502.marex@denx.de>
 <CAN1oZWzADdeNyZofXQwKa0F2_Jv4Oda824ew5C3Ug+-V9Lx3hw@mail.gmail.com>
In-Reply-To: <CAN1oZWzADdeNyZofXQwKa0F2_Jv4Oda824ew5C3Ug+-V9Lx3hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508201142.18586.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 20, 2015 at 11:18:14 AM, Viet Nga Dao wrote:

Hi,

[...]

> >> That is why we decided to upstream the
> >> driver. If the hardware fix, there might not need to have any changes
> >> in driver to support or if yes, it will be just minor.
> > 
> > If the hardware can do proper READID opcode, this entire nonsense table
> > will go away and a proper integration into the SPI NOR framework will
> > take place.
> > 
> > You might consider submitting this driver for staging, but I definitely
> > am not a big fan of that.
> 
> You might misunderstand the hardware problem i mention here. This soft
> IP controller is able to provide the ID for our Altera EPCS/EPCQ flash
> chips, which are non JEDEC chips. As from EPCQ device data sheet
> (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature
> /hb/cfg/cfg_cf52012.pdf), the device ID is 8 bit data.

So what exactly is the output of READID instruction followed by 6 Byte read
on an EPCQ chip?

> The remaining
> problem here is that this controller is able to support Micron chips but
> it currently has
> limitation in providing only 8 bit ID, which is not full JEDEC ID for
> Micron chips.

OK

> Hence, we are asking hardware engineer to find out the
> solution so that the driver does not need to do any dirty hacking. And
> so, this table should still be here even hardware fix will take place
> or not.

[...]

Best regards,
Marek Vasut
