Received: from mail2.rdsor.ro ([193.231.238.20] helo=oradea.rdsnet.ro)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eu3PR-00019N-El
	for linux-mtd@lists.infradead.org; Wed, 04 Jan 2006 02:50:23 -0500
From: Balint Cristian <rezso@rdsor.ro>
To: linux-mtd@lists.infradead.org
Date: Wed, 4 Jan 2006 09:26:37 +0200
References: <200512230211.11487.husamsenussi@gmail.com>
In-Reply-To: <200512230211.11487.husamsenussi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200601040926.38030.rezso@rdsor.ro>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: 
Subject: Re: DiskOnChip Millennium Plus 64M in OMAP1510 device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 23 December 2005 04:11, husamsenussi@gmail.com wrote:


Hello !

	Do you have   Texas Instruments (VTIHOST) for flash this chip=20
via JTAG ?
	This comes with the OMAP 1510 platform from TI.

	It can help us to write a sane driver for 2.6.x and this chip.



> Hi,
>
> I'm having problem loading the MDOC + driver, for some reason the driver
> returning the wrong flash ID.
>
> This is what I see in my log file
>
> Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufacturer =
ID:
> 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
> Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufacturer =
ID:
> 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
> Jan =A01 00:18:32 h6300 user.info kernel: 2 flash chips found. Total
> DiskOnChip size: 0 MiB
>
>
> I'm running linux 2.6.14.3 in iPAQ h6340 with OMAP1510 processer, and I'm
> using the old driver because the new only support 16M
>
> Thanks.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
