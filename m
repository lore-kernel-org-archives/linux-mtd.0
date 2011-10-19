Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGYOV-0006w2-58
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 15:49:27 +0000
Date: Wed, 19 Oct 2011 17:49:13 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Angus CLARK <angus.clark@st.com>
Subject: Re: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Flash.
Message-ID: <20111019154913.GA18674@parrot.com>
References: <0680EC522D0CC943BC586913CF3768C0059050481E@dbde02.ent.ti.com>
	<4E9EEBDC.5000002@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4E9EEBDC.5000002@st.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Kumar,
	Goutam" <goutam.kumar@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 19, 2011 at 04:25:16PM +0100, Angus CLARK wrote:
> Hi Goutam,
> 
> On 10/19/2011 03:28 PM, Kumar, Goutam wrote:
> > 
> > There is MT29F2G08ABAEAWP (256MB, 8-bit) NAND device on TI EVM.
> > 
> 
> This particular NAND device requires 4-bit ECC.  As far as I can tell, you are
> using the OMAP2 driver with 1-bit Hamming H/W ECC.  This will throw
> uncorrectable ECC errors (as seen in your log) if there are 2 bit flips in any
> ECC block.  The problem gets worse if there are 3 or 4 bit flips, which is still
> within spec of the NAND device.
> 
> This may, or may not, be the source of your problem, but it might be worth
> taking a look anyway.
> 
> The device does include a 4-bit on-die ECC engine, which can be enabled using
> the 'SET_FEATURE' command.  I don't believe this is available in nand_base.c at
> present, but it is not too hard to add.  You would also need to disable the
> OMAP2 H/W ECC support to avoid any layout clashes in the OOB area.  Of course,
> whatever changes you make to the kernel, would also have to be made to u-boot.

If your SoC (AM335x) has the same NAND ECC features as the OMAP36xx
(BCH 4/8 bits), then you can also use it to correct NAND errors, up to 8 bit
per 512 bytes; which is better (and safer) than what the manufacturer
recommends.
I have a patch supporting this with the BCH library on 2.6.35 if you're
interested. Not for 3.1 yet, as I'm waiting for a repost of omap2 driver
patches from TI guys on the mtd list to submit my own patch.

BR,
--
Ivan
