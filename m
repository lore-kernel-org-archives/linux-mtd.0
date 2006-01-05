Received: from zproxy.gmail.com ([64.233.162.192])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Euc6l-0006YA-5p
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 15:53:19 -0500
Received: by zproxy.gmail.com with SMTP id i11so2762250nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Jan 2006 12:53:08 -0800 (PST)
From: husamsenussi@gmail.com
To: Balint Cristian <rezso@rdsor.ro>
Date: Thu, 5 Jan 2006 20:52:38 +0000
References: <200512230211.11487.husamsenussi@gmail.com>
	<200601040926.38030.rezso@rdsor.ro>
In-Reply-To: <200601040926.38030.rezso@rdsor.ro>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200601052052.38441.husamsenussi@gmail.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip Millennium Plus 64M in OMAP1510 device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

No I don't  have VTIHOST,  but I have iPAQ h6300with OMAP1510  and with lin=
ux=20
(2.6.14), and I'm willing to help.

I manage to get the old driver to  discover the card, but I couldn't mount =
the=20
filesystem because I don;t have TrueFFS file system

Do you know the prices for VTIHOST !!!!

Thanks

On Wednesday 04 January 2006 07:26, Balint Cristian wrote:
> On Friday 23 December 2005 04:11, husamsenussi@gmail.com wrote:
>
>
> Hello !
>
> 	Do you have   Texas Instruments (VTIHOST) for flash this chip
> via JTAG ?
> 	This comes with the OMAP 1510 platform from TI.
>
> 	It can help us to write a sane driver for 2.6.x and this chip.
>
> > Hi,
> >
> > I'm having problem loading the MDOC + driver, for some reason the driver
> > returning the wrong flash ID.
> >
> > This is what I see in my log file
> >
> > Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufacturer
> > ID: 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
> > Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufacturer
> > ID: 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
> > Jan =A01 00:18:32 h6300 user.info kernel: 2 flash chips found. Total
> > DiskOnChip size: 0 MiB
> >
> >
> > I'm running linux 2.6.14.3 in iPAQ h6340 with OMAP1510 processer, and I=
'm
> > using the old driver because the new only support 16M
> >
> > Thanks.
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
