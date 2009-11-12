Received: from fmmailgate02.web.de ([217.72.192.227])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8W5k-000148-2C
	for linux-mtd@lists.infradead.org; Thu, 12 Nov 2009 09:35:52 +0000
Date: Thu, 12 Nov 2009 10:35:45 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: mxc nand i.mx35: no OOB with HW_ECC
Message-ID: <20091112093545.GW30179@pengutronix.de>
References: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
Sender: saschahauer@web.de
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

On Tue, Nov 03, 2009 at 04:25:10PM +0100, John Ogness wrote:
> Hi,
> 
> I spent a while trying to figure out why JFFS2 was getting hardware ECC
> errors on an i.MX35 NANDFC with 2K pages. The problem also existed when
> using nandwrite together with the -n and -o options.
> 
> The problem is that for page sizes larger than 512 bytes, the i.MX35
> NANDFC can only write the page and oob data together. When writing the
> page and oob data, the ECC hardware also writes the ECC codes for
> it. This is ok if the filesystem driver or userspace application
> understands that only one write per page+oob is allowed.
> 
> But jffs2 and "nandwrite -n -o" assume that they can write the oob data
> and the page data separately. With the recently posted mxc_nand.c
> driver, this results in the NANDFC writing the ECC codes to flash
> twice... with different values. This means the ECC codes that end up on
> the flash chip are garbage.

I can confirm jffs2 errors on i.MX35 with the patches I posted. And yes
you're right, I mostly use UBIFS.

Freescale originally provided two drivers, one for the i.MX27/31 type
nand controller (v1) from which the in kernel driver is derived and one
for the remaining nand controllers (i.mx35/25) (v2). What I did is to
work on both drivers till they both looked (nearly) the same and posted
the patches for the v1 driver.

One remaining difference is in mxc_do_addr_cycle(). Here is the version
from the v2 driver which works with jffs2:

static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int
page_addr)
{
	struct nand_chip *nand_chip = mtd->priv;
	struct mxc_nand_host *host = nand_chip->priv;

	u32 page_mask = nand_chip->pagemask;

	if (column != -1) {
		send_addr(host, column & 0xFF, 0);
		if (mtd->writesize == 2048) {
			/* another col addr cycle for 2k page */
			send_addr(host, (column >> 8) & 0xF, 0);
		} else if (mtd->writesize == 4096) {
			/* another col addr cycle for 4k page */
			send_addr(host, (column >> 8) & 0x1F, 0);
		}
	}
	if (page_addr != -1) {
		do {
			send_addr(host, (page_addr & 0xff), 0);
			page_mask >>= 8;
			page_addr >>= 8;
		} while (page_mask != 0);
	}
}

Putting this function into the v1 driver makes the driver work for me on
i.MX35 with jffs2. Can you confirm this?

I haven't looked deeply into the differences and I suspect this version
of mxc_do_addr_cycle() won't work on the v1 type controllers, so this is
not a solution yet.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
