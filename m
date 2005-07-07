Received: from mail.professional-internet.de ([213.69.77.2]
	helo=hermes.professional-internet.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqW4e-00085A-77
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2005 09:05:54 -0400
Received: from mailer.port.de ([195.4.0.127])
	by hermes.professional-internet.de (8.12.10/8.12.10) with ESMTP id
	j67D5nVk020116
	for <linux-mtd@lists.infradead.org>; Thu, 7 Jul 2005 15:05:49 +0200
Received: from ulrich.port.de (ulrich.port.de [194.173.33.14])
	by mailer.port.de (8.12.10/8.12.7/SuSE Linux 0.6) with ESMTP id
	j67D5oJA021785
	for <linux-mtd@lists.infradead.org>; Thu, 7 Jul 2005 15:05:50 +0200
From: Ruediger Haertel <hae@port.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 7 Jul 2005 15:05:51 +0200
References: <200507061745.18226.hae@port.de>
In-Reply-To: <200507061745.18226.hae@port.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507071505.51557.hae@port.de>
Subject: Re: MTD/ DoC Millenium Plus - Failure in flash detection
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 6. Juli 2005 17:45 schrieb Ruediger Haertel:
> Hello all,
>
> I am trying to get the DOC Millenium Plus chip 16 MB, ChipID = 0x41)
> on my board (Coldfire 5272, uClinux) running. The chip as such is
> detected. If the DoC is accessed correctly then the flash chip has id
> 0xA5. This id is not in the table of NAND IDs in the file nand_ids.c.
>
> The cvs MTD drivers has 0xA5 assigned to a SAMSUNG 2 GiB chip. But as
> far as I know the Doc MilPlus 16MB uses a Toshiba flash.
>
> Any suggestions what's wrong here.

I updated the mtd drivers as stated on the infradead website. Because 
the API changed I had to make small fixes to my cfi mapping module. Now 
the chip is correctly detected. Both drivers, ie. the old DiskOnChip 
and the new NAND DiskOnChip, work.
For the NAND DiskOnChip driver I had to apply the patch mentioned here:
http://lists.infradead.org/pipermail/linux-mtd/2004-October/010640.html

Using configured DiskOnChip probe address 0x40000000
DiskOnChip found at 0x40000000
NAND device: Manufacturer ID: 0x98, Chip ID: 0x73 (Toshiba NAND 16MiB 
3,3V 8-bi)
nand_read_ecc: Failed ECC read, page 0x00000020 on chip 0
ECC error scanning DOC at 0x4000
nand_read_ecc: Failed ECC read, page 0x00000040 on chip 0
ECC error scanning DOC at 0x8000
nand_read_ecc: Failed ECC read, page 0x00000060 on chip 0
ECC error scanning DOC at 0xc000
doc200x_correct_data corrected 2 errors
nand_read_ecc: Failed ECC read, page 0x00000080 on chip 0
ECC error scanning DOC at 0x10000
DiskOnChip BNAND Media Header not found.
mtd: Giving out device 5 to DiskOnChip Millennium Plus

What irritates me is the output: 
DiskOnChip BNAND Media Header not found.

Why is that ?
How can I make a first test of the DoC, ie. reading writing reading?
I tried nanddump and nandtest. But no success:

/>nanddump /dev/mtd5 /var/xxx 0 128
MTD_open
MTD_ioctl
Unknown flash (not normalM NAND)
TD_close
pid 29: failed 256

/> nandtest /dev/mtd5
MTD_open
open flash: Permission denied
pid 31: failed 256


Any help apreciated :)

-- 

Ruediger Haertel
