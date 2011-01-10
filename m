Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PcFRw-0002Bw-Q6
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2011 10:58:12 +0000
Date: Mon, 10 Jan 2011 11:54:33 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Tim Barr <tbarr@multitech.com>
Subject: Re: New NAND flash die rev recommends 4 bit ECC
Message-ID: <20110110105432.GA11157@parrot.com>
References: <1CD05B980C94AC408B37C82BBABAA3E6149861DA@mtsexchange.dc.multitech.prv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E6149861DA@mtsexchange.dc.multitech.prv>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 06, 2011 at 09:34:31PM +0000, Tim Barr wrote:
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

Hello Tim,

I am currently working on a generic software BCH encoder/decoder that can
handle modern NAND ECC requirements (4 bits, or actually any number of bits per
any number of bytes). This BCH engine can also to be used on "hybrid" systems
in which a NAND controller can compute BCH parity bits (such as OMAP3630 GPMC),
but is not able to perform error correction (which is quite more involved than
Hamming 1 bit correction).

If you need to use the on-die ecc of your NAND device, this wiki has a few
interesting bits: http://processors.wiki.ti.com/index.php/GPMC_ECC
One of the main issues is spare area utilization: if you plan to use YAFFS2,
you'll need to squeeze its metadata into the remaining available spare space
once the NAND on-die ecc is enabled (still possible with 4bit ecc, probably
impossible with 8bit ecc ?). An alternative is to use UBIFS, as it does not
store any information in spare area.
BR,

Ivan
