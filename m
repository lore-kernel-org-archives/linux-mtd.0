Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSWau-0000Oh-Oh
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 20:37:53 +0000
Received: by paom9 with SMTP id m9so1988586pao.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 13:37:30 -0700 (PDT)
Date: Thu, 20 Aug 2015 13:37:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Viet Nga Dao <vndao@altera.com>
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nga_chi86 <ngachi86@gmail.com>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Message-ID: <20150820203726.GE74600@google.com>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
 <201508201003.38179.marex@denx.de>
 <CAN1oZWwLRYxs=eeWi8jh-jo8+C7WckdW1hfyunmq5_1qb1Jb8w@mail.gmail.com>
 <201508201052.47502.marex@denx.de>
 <CAN1oZWzADdeNyZofXQwKa0F2_Jv4Oda824ew5C3Ug+-V9Lx3hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1oZWzADdeNyZofXQwKa0F2_Jv4Oda824ew5C3Ug+-V9Lx3hw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2015 at 05:18:14PM +0800, Viet Nga Dao wrote:
> You might misunderstand the hardware problem i mention here. This soft
> IP controller is able to provide the ID for our Altera EPCS/EPCQ flash
> chips, which are non JEDEC chips. As from EPCQ device data sheet
> (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf),
> the device ID is 8 bit data.

8 bits of data is vastly insufficient for uniquely identifying a flash.
This is not extendible and is not really a candidate for inclusion in
mainline, unless it's somehow guaranteed that these flash can only be
used with your controller (and I'm not sure how you would do that).
Otherwise, you need to augment every flash with more out-of-band
device-tree information.

> The remaining problem here is that this
> controller is able to support Micron chips but it currently has
> limitation in providing only 8 bit ID, which is not full JEDEC ID for
> Micron chips.

You're just proving my point. I will not support "READ ID" detection
that is based on only 8 bits of ID.

> Hence, we are asking hardware engineer to find out the
> solution so that the driver does not need to do any dirty hacking.

OK, then I wish your hardware team great speed.

> And
> so, this table should still be here even hardware fix will take place
> or not.

I'm not sure how you come to this conclusion.

BTW, to reiterate one other question that I feel wasn't adequately
answered: what does the full ID string look like for these EPCS/EPCQ
flash chips? Not the ID as seen by your limited controller, but the ID
that can be reported by the flash chip. Is it really only an 8-bit
number? Or does it have a longer string that your controller just can't
read?

Brian
