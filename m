Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbL7T-0000K7-30
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 11:17:34 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>,
	linux-mtd@lists.infradead.org
Date: Fri, 18 Jun 2004 17:11:35 +0200
References: <EFF9A3506F74924AB5CC77BDC66E79351812BB@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812BB@atcml01.atc.army.mil>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406181711.35243.tglx@linutronix.de>
Cc: 
Subject: Re: DoC MilPlus32 try to get working???
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 June 2004 14:56, Carlos, John J USAATC wrote:
> Hi,
> I have been trying to get diskonchip to work with the MilPlus chip.  I
> have merged the drivers in the devices directory in diskonchip.c  I still
> have to see if the bad block table is working/implemented.  This is the
> error message I get the first time after a boot up that I insmod
> diskonchip. Subsequent insmods of diskonchip just report no valid boot
> record.

You insmod drivers/mtd/nand/diskonchip .
Why does it show INFTL messages ?
Who is calling INFTL functions?
Before you start playing with INFTL the chip driver itself must be fully=20
functional.

>   Could anyone tell me what the cause is.  I guess I need to get the bad
> block checking working first before anything else?
>
> mtd: Giving out device 4 to DiskOnChip Millennium Plus
> in inftl_add_mtd
> INFTL: add_mtd for DiskOnChip Millennium Plus
> INFTL: INFTL_mount(inftl=3D0xc1cc6600)
> INFTL: find_boot_record(inftl=3D0xc1cc6600)
> INFTL: block read at 0x0 of mtd4 failed: -22
> INFTL: block read at 0x8000 of mtd4 failed: -22
> INFTL: block read at 0x10000 of mtd4 failed: -22
> INFTL: block read at 0x18000 of mtd4 failed: -22
> INFTL: block read at 0x20000 of mtd4 failed: -22
> INFTL: further failures for this block will not be printed
> INFTL: could not find valid boot record?
> INFTL: could not mount device
> NFTL: add_mtd for DiskOnChip Millennium Plus
> Block read at 0x0 of mtd4 failed: -22
> Block read at 0x8000 of mtd4 failed: -22
> Block read at 0x10000 of mtd4 failed: -22
> Block read at 0x18000 of mtd4 failed: -22
> Block read at 0x20000 of mtd4 failed: -22
> Further failures for this block will not be printed
> Could not find valid boot record
> NFTL: could not mount device
> #
>
> Thanks to all who have been answering my calls for help!!!!
> John
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
