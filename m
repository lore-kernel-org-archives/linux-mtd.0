Received: from duba03h03-0.dplanet.ch ([212.35.36.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qplf-0007h1-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 06:49:27 +0100
Reply-To: <hamishl@dplanet.ch>
From: "Hamish Guthrie \(Mail Lists\)" <hamishl@dplanet.ch>
To: "David Woodhouse" <dwmw2@infradead.org>, <brendan.simon@bigpond.com>
Cc: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: mtd: looking for serial flash storage 
Date: Tue, 9 Oct 2001 08:02:12 +0200
Message-ID: <NEBBJKADBKFNCJOMHOAKAEFBCNAA.hamishl@dplanet.ch>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <14237.1002533881@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

You need 13 address lines for a DoC (A0..A12).

There are drivers in Linux 2.4.x for Disk-on-Key (The M-Systems USB devices)


Hamish

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of David Woodhouse
> Sent: Monday, October 08, 2001 11:38 AM
> To: brendan.simon@bigpond.com
> Cc: mtd
> Subject: Re: mtd: looking for serial flash storage
>
>
>
> brendan.simon@bigpond.com said:
> >  I can  not easily use a DiskOnChip as there are only 12 address lines
> > from the  CPU board connector available to me.  I am investigating
> > serial flash  devices.  Are there any that MTD or Linux supports ???
>
> You don't need 12 address lines for a DiskOnChip, do you?
>
> > I know about the Atmel data flash devices.  Are they supported by
> > Linux  or MTD ???
>
> I'm not sure what devices you're referring to - do you have a reference?
>
> > I am interested in investigating the chipsets that the key ring type
> > USB  hard drives use.  Does anyone know what chipsets these are ?
> > Does MTD  or Linux support them ???
>
> The flash in those devices is generally just standard NAND flash,
> which is
> supported by Linux. I have no idea about the microcontrollers which are
> used to do the translation layer and emulate a hard drive.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
