Received: from rdrz.de ([217.160.107.209])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXwEe-0003px-6c
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 03:11:25 -0400
Date: Tue, 17 May 2005 09:11:27 +0200
From: Raphael Zimmerer <killekulla@rdrz.de>
To: Peter Bergmann <bergmann.peter@gmx.net>
Message-ID: <20050517071127.GB22901@rdrz.de>
References: <4285DFCA.8050703@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4285DFCA.8050703@gmx.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip Millennium Plus 32MB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 14, 2005 at 01:23:54PM +0200, Peter Bergmann wrote:
> the devices/doc2001plus.c recognizes the device but the
> inftl.ko says:
> "INFTL no longer supports the old DiskOnChip drivers
> loaded via docprobe. Please use the new diskonchip
> driver under the NAND subsystem"

Up to now that diskonchip driver supports everything except the
"DiskOnChip Millenium PLus 32/64MB", and the old driver doesn't work
with the mtd subsystem.

> what do i have to do in order to get a
> trueffs formatted DiskOnChip Millennium Plus 32MB
> running under linux ?

A new driver for the DiskOnChip Millenium Plus 32/64MB is nearly
finished. I can send you some patches for testing.

- killekulla
