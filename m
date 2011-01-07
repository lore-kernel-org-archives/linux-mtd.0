Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pb0oQ-0003KH-Ae
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2011 01:08:15 +0000
Received: by ywf7 with SMTP id 7so7199703ywf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Jan 2011 17:08:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E6149861DA@mtsexchange.dc.multitech.prv>
References: <Acut6YF5NCbjdNzPQvGZlLLc/xPTRA==>
	<1CD05B980C94AC408B37C82BBABAA3E6149861DA@mtsexchange.dc.multitech.prv>
Date: Thu, 6 Jan 2011 20:08:11 -0500
Message-ID: <AANLkTi=oO3DvWD_sxkzTN8vajUyWfzmruihFouTRifNV@mail.gmail.com>
Subject: Re: New NAND flash die rev recommends 4 bit ECC
From: twebb <taliaferro62@gmail.com>
To: Tim Barr <tbarr@multitech.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I just got a notice from Micron that they are making changes to the
> 29F2G08/16 (2 Gbit SLC device). For instance, the 29F2G0816AAD is going
> EOL this month and is being replaced by the MT29F2G08ABAEA. The problem
> is that the new data sheet is recommending 4 bit per 526 byte ECC
> instead of 1 bit per 526 byte ECC. As far as I can tell, the processor
> we are using (AT91SAM9G20) only does 1 bit HW ECC and the software ECC
> code for MTD is also 1 bit. The new NAND Flash die does have a HW 4 bit
> ECC engine added in, which probably would need to have code written to
> support it in order to be able to use it.
>
> So, is anyone working on a 4 bit software ECC code or code modifications
> to utilize the on chip HW ECC engine?
>
> Right now we can use a part from an alternate vendor or do a lifetime
> buy, but I am wondering if this is a trend as die size shrinks and other
> vendors will soon require higher level ECC as well.

Yes, I believe this is a trend.

Since the new part has on-board ECC, can you just configure your NAND
controller to NOT use ECC?  Then, in theory, it's business as usual
but you just won't ever get any correctable or uncorrectable bit
errors when you read the flash because the on-board ECC will handle
it.

twebb
