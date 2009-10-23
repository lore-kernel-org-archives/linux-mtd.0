Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1FNV-0002ro-1s
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 08:20:09 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: alfred steele <alfred.jaquez@gmail.com>
Date: Fri, 23 Oct 2009 10:19:49 +0200
References: <20091020131157.GR8818@pengutronix.de>
	<200910221226.07328.jbe@pengutronix.de>
	<528f13590910221417i393958b6tc0d402e9e206ff51@mail.gmail.com>
In-Reply-To: <528f13590910221417i393958b6tc0d402e9e206ff51@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200910231019.49157.jbe@pengutronix.de>
Subject: Re: About the mxc nand driver
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Donnerstag, 22. Oktober 2009, alfred steele wrote:
> > I can currently speak only about the i.MX35 NFC. But it handles larger
> > pages than 512 byte in the same way the i.MX27 NFC does. The tables in
> > the datasheet suggests they define a fixed location for the bad block
> > marker in the spare area and this will be repeated 4 times for a 2048
> > byte page. But it seems the NFS does not touch any other byte than the
> > ones defined for ECC usage.
>
> So does the mxc_nand driver without "Saschas" latest patches work for
> NAND transactions on the mx35 nfc.

The current mainline mxc nand driver does not work on i.MX35. The i.MX35 NFC 
is of the next generation. We are on the way to merge the new features into 
this driver. 

> This probably suggests that the for 
> a 4K page size NAND, it would boil down to 8 cycles. Does that still
> hold true?

Yes, a 4 kiB page would generate 8 stripes of ECC data, 16 bytes each. 7 free, 
9 for ECC.

AFAIK i.MX35 (4 symbols ECC):

512 byte page:

* OOB offset: 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
*      Usage: |<----------------->|<----------------------->|
*                      User                   ECC

2048 byte page:

* OOB offset: 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
* OOB offset: 10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F
* OOB offset: 20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F
* OOB offset: 30 31 32 33 34 35 36 37 38 39 3A 3B 3C 3D 3E 3F
*      Usage: |<----------------->|<----------------------->|
*                       User                  ECC

4096 byte page:

* OOB offset: 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
* OOB offset: 10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F
*             .. .. .. .. .. .. .. .. .. .. .. .. .. .. .. ..
* OOB offset: 60 61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F
* OOB offset: 70 71 72 73 74 75 76 77 78 79 7A 7B 7C 7D 7E 7F
*      Usage: |<----------------->|<----------------------->|
*                       User                  ECC

But recent 4 kiB NANDs also provide 218 bytes of OOB. In this case this NFS 
also supports 18 byte of ECC. But currently I'm not sure about its layout.

jbe

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228     |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/  |
