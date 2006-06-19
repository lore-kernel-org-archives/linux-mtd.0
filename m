Received: from pop.scorch.co.nz ([203.167.215.14] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsR0n-0004Y1-SC
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 17:10:26 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: FAT vs jFFS2 for NAND.
Date: Tue, 20 Jun 2006 09:10:41 +1200
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
	<1150748626.2646.7.camel@shinybook.infradead.org>
In-Reply-To: <1150748626.2646.7.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606200910.41974.manningc2@actrix.gen.nz>
Cc: Han Chang <posaune@hotmail.com>, tglx@linutronix.de,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 June 2006 08:23, David Woodhouse wrote:
> On Mon, 2006-06-19 at 11:31 -0700, Han Chang wrote:
> > Thanks! The reason for using FAT on the NAND is when the device has the
> > NAND is connected to a PC via USB, it can appear to be storage device
> > read by the PC user directly.
>
> Can't you use the 'PTP' USB protocol, which is designed for sharing
> pictures? It can also share an arbitrary file system, I believe.

I looked at PTP a while back. This is very picture centric and is no use for 
general file transfer.

There's also a newer (and as-yet unratified) protocol that allows transfers of 
other files. These allow transfer of other file types, but still don't 
support a full fs.

A USB-ftp would be a GoodThing.

>
> Failing that, SmartMedia makes a certain amount of sense. Use the code
> from the CVS tree as a basis, or just do it yourself (using the
> mtd_blkdevs helper stuff which we already use for nftl etc.)

Unfortiunately USB Mass Storage (with a Windows host) pretty much forces the 
use of FAT on top of a block driver.  The SmartMedia block driver model is 
suffieciently robust (FAT corruptions are far more likely to cause failures).

-- CHarles
