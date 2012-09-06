Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9ZaH-0002Nd-SD
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 10:45:19 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [1/1] mxc_nand : allow swapping the Bad block Indicator for NFC
 v1.
Date: Thu, 6 Sep 2012 12:44:01 +0200
References: <CACKLOr0zCCZ0WNpGiOOvoUk4s_vR5Ls4aw6PhXDoYeNQFTESgQ@mail.gmail.com>
 <504871AF.7040809@gmail.com>
In-Reply-To: <504871AF.7040809@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201209061244.02071.jbe@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 javier Martin <javier.martin@vista-silicon.com>,
 =?utf-8?q?Ga=C3=ABtan_Carlier?= <gcembed@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ga=C3=ABtan Carlier wrote:
> Hi Javier,
>
> On 09/06/2012 11:14 AM, javier Martin wrote:
> > Hi Ga=C3=ABtan,
> > has this behavior been documented by Freescale anywhere?

There is an application note available=20
called "FSL_AppNote_Nand_Flash_Bad_Block_Management_for_Linux_BSP.pdf"
which describes the behaviour.

After reading a page from NAND into the internal NFC's SRAM, the data layou=
t=20
looks like:

SRAM Offset               real NAND's Data
=2D--------------- SRAM data area ---------------------
  0
  .                     [   0 ...  511] 512 Byte page data
 511
 512
  .                     [ 528 ... 1039] 512 Byte page data
1023
1024
  .                     [1056 ... 1567] 512 Byte page data
1535
1536
  .                     [1584 ... 2047] 464 Byte page data
1999
2000
  .                     [   0 ...   47] 48 Byte OOB data
2047

=2D------------- SRAM OOB area ----------------------------
2048     0x800
  .                     [ 512 ...  527] 16 Byte page data
2063
2064     0x810
  .                     [1040 ... 1055] 16 Byte page data
2079
2080     0x820
  .                     [1568 ... 1583] 16 Byte page data
2095
2096     0x830
  .                     [  48 ...   63] 16 Byte OOB data
2112

> > Furthermore, what I can't guess is where that 0x7D0 comes from. I know
> > J=C3=BCrgen described something related to the spare area being mixed w=
ith
> > the data (main) area but, is there any documentation about it we can
> > check?

See the table above: if you are interested in the byte at offset 0 in the=20
NAND's OOB area, you must read the byte at offset 2000 (=3D 0x7D0) in the S=
RAM=20
area instead.

Regards,
Juergen

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | Phone: +49-5121-206917-5128=
 |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555=
 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/ =
 |
