Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6xj4-0001e2-EM
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2006 17:23:54 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Thu, 9 Feb 2006 11:26:10 +1300
References: <200602021212.43995.wolfgang.mues@auerswald.de>
In-Reply-To: <200602021212.43995.wolfgang.mues@auerswald.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200602091126.10462.manningc2@actrix.gen.nz>
Cc: Wolfgang =?iso-8859-15?q?M=FCes?= <wolfgang.mues@auerswald.de>
Subject: Re: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 03 February 2006 00:12, Wolfgang M=FCes wrote:
> Hello,
>
> I want to use JFFS2/MTD in an embedded Linux device with frequent
> writes (worst case is 15 KBytes per 10 seconds, typical case is less than
> 10% of the worst case). The device will be a 512 MBit NAND SLC type from
> Hynix, Samsung or STM. We have a working prototype, and we have read many
> NAND flash papers available on the net, and the recent MTD mailing list
> archives.
>
> Beside of wear leveling questions, there are program disturb errors
> (programming a page flips a bit in another page) and read disturb errors
> (reading a page flips a bit). Rates for these single-bit-errors are
> available in publications from M-systems and Toshiba.
>
> But since single bit errors are easily corrected by ECC, I am more
> interested in errors where more than 1 bit is flipped in a 256 byte ECC
> area. We cannot calculate these error numbers from the single bit errors
> because we don't know if these errors are unrelated to each other.

If you have not already done so, read the Toshiba NAND flash application=20
guide:
http://www.dataio.com/pdf/NAND/Toshiba/NandDesignGuide.pdf.pdf

that might give some further info.

>
> Is there any information available to estimate/calculate the remaining
> errors after ECC correction? Or is there any information about first hand
> experience of NAND stress tests or other real world experience?
>
> Maybe the NAND project is terminated if I don't find anything about
> practical reliability...

I have not used JFFS2, but I have done extensive testing with YAFFS. At the=
=20
NAND level they should be about the same.

I have done a few accelerated lifetime tests that have gone very well. In o=
ne=20
test (run once on 512byte page devices and once on 2k page devices) I wrote=
,=20
read back and verified over 120Gbytes of data to the fs without a single bi=
t=20
betting lost. Other people did similar tests too. This was on non-Linux=20
devices, but that's not material at the NAND level.

=46rom my observations NAND is very reliable and is getting more reliable a=
ll=20
the time.

There are at least two factor that might be different for JFFS2 vs YAFFS:
* Most flash reliability is specified based on an assumption that you perfo=
rm=20
a maximum number of writes per page. I don't know what JFFS2 does, but YAFF=
S=20
does one major write and then writes a single byte deletion marker to the O=
OB=20
area when the page is discarded. YAFFS2 does not write deletion markers. Th=
is=20
is generally well within the write limits used for the specification, so th=
e=20
fash should be less stressed than was used to derive the specs. JFFS2 might=
=20
be different here.
* YAFFS is very conservative on dealing with ECC failures. YAFFS retires a=
=20
block if one ECC failure is seen. JFFS2, IIRC allows five of so failure=20
before retiring a block. The Toshiba folk have told me that if a block is=20
going bad, it is most likely to start displaying recoverable 1-bit errors=20
before displaying non-recoverable multi-bit errors. Thus, YAFFS will=20
potentially perform differently in this area.

Still, I think those rliability differences, at the flash level, are more t=
han=20
likely theoretical noise and are unlikely to be material in the real world.

One important factor, IMHO, is how you handle the write protect pin on the=
=20
NAND. Some people tie the WP to the power supply failure flag. IMHO this is=
 a=20
bad thing to do since it can cause incomplete writes to happen if the wp is=
=20
asserted during a write or erase cycle.

=2D- Charles
