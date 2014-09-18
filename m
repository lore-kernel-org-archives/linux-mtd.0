Received: from email.rugged.com ([64.60.45.211])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUeOu-00013j-Di
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 16:17:45 +0000
From: Robert Hurdle <RHurdle@Rugged.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Thu, 18 Sep 2014 09:17:56 -0700
Subject: RE: Question about adding a NAND device
Message-ID: <5498E86A4A68B14A8A06D0380640D04A01FA685FDFDD@atca01em01.adsi.aitech.ent>
References: <5498E86A4A68B14A8A06D0380640D04A01FA6854E73D@atca01em01.adsi.aitech.ent>
 <alpine.DEB.2.02.1409180954450.15431@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1409180954450.15431@lnxricardw1.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you.  Robert Hurdle

-----Original Message-----
From: Ricard Wanderlof [mailto:ricard.wanderlof@axis.com]=20
Sent: Thursday, September 18, 2014 1:03 AM
To: Robert Hurdle
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question about adding a NAND device


On Wed, 17 Sep 2014, Robert Hurdle wrote:

> Hello,
>
> 	I have ported some of u-boot to our board, and I am booting successfully=
 from EEPROM.
> 	I am now in the process of adding the NAND and flash file system support=
 for our non-standard
> 	flash interface (there's an FPGA interface between the software and the =
1 giga-byte NAND) to
> 	u-boot and also to the Linux kernel.  In addition, it is our intention t=
o support UBIFS on our board.
>
> 	It appears that I need to understand how the structures mtd_info and nan=
d_chip (and whatever
> 	they point at) and code in nand_base.c work, in order to provide working=
 routines at the NAND
> 	level.  I have looked at some of the files in u-boot/drivers/mtd/nand fo=
r other boards, and see
> 	a wide variety of models, no doubt based on the hardware differences.   =
Because of our FPGA
> 	interface, I need to have all commands to the NAND chip get re-packaged =
into commands that
> 	get passed to the FPGA.  Am I on the right path?
>
> 	My other question is how long would one guess that this task would take =
for someone fairly
> 	competent, but uninitiated in UBIFS, UBI, MTD, NAND, etc. ?

It's very hard to predict any form of time frame, especially when not=20
knowing much about the hardware.

If your FPGA basically just passes data between the CPU and flash on a=20
byte-by-byte level, then you can probably take some simple driver and=20
rewrite that. If the FPGA contains a more advanced NAND flash controller,=20
which performs ECC, or does something else on a higher level you need to=20
study the way nand_base.c goes about things and also of course the=20
controller implementation in the FPGA.

Basically, mtd was originally written with a byte-by-byte interface in=20
mind. So that case is fairly easy to implement: your driver will just have=
=20
to be able to send data to and read from the flash via FPGA (in this=20
case), and also control the NAND flash CLE and ALE lines, as well as read=20
the READY/BUSY line from the flash. All command sequencing, data transfer=20
and ECC will be handled in software by the mtd layer.

For more advanced cases, there are numerous hooks which can be used where=20
the NAND flash controller accelerate specific functions. In my experience=20
though it requires a lot more understanding of exactly how nand_base.c=20
goes about things, and there is often more than one way to implement the=20
required functionality. Looking at driver code for other NAND flash=20
controllers also helps.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
