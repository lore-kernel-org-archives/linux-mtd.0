Subject: Re: FAT vs jFFS2 for NAND.
From: David Woodhouse <dwmw2@infradead.org>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
Content-Type: text/plain
Date: Mon, 19 Jun 2006 21:23:46 +0100
Message-Id: <1150748626.2646.7.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-19 at 11:31 -0700, Han Chang wrote:
> Thanks! The reason for using FAT on the NAND is when the device has the NAND 
> is connected to a PC via USB, it can appear to be storage device read by the 
> PC user directly. 

Can't you use the 'PTP' USB protocol, which is designed for sharing
pictures? It can also share an arbitrary file system, I believe.

Failing that, SmartMedia makes a certain amount of sense. Use the code
from the CVS tree as a basis, or just do it yourself (using the
mtd_blkdevs helper stuff which we already use for nftl etc.)

-- 
dwmw2
