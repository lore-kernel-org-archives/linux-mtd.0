Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1XnpEX-0008T3-4W
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 13:42:17 +0000
From: Juergen Borleis <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
Date: Mon, 10 Nov 2014 14:42:51 +0100
References: <201411101307.03225.jbe@pengutronix.de> <5460B10E.9060501@nod.at>
 <alpine.DEB.2.02.1411101404180.23184@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1411101404180.23184@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201411101442.51441.jbe@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>,
 "jlauruhn@micron.com" <jlauruhn@micron.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "tlinder@codeaurora.org" <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,

On Monday 10 November 2014 14:13:27 Ricard Wanderlof wrote:
> [...]
> These are interesting figures. I must admit I've never seen anything quite
> so bad before.

That leads me to the question if I have done the test in a correct way.

> We use 128 MiB and 256 MiB SLC NAND chips in our products, and as part of
> the device qualification we run a test on a couple of samples where we
> repeatedly read the first four blocks of the flash in an endless loop, and
> measure the number of correctable and uncorrectable errors that occur.
>
> Normally, we can read millions of times before even getting a single bit
> flip. I've currently had a Macronix 128 MiB flash under test, which
> according to the data sheet requires 4-bit ECC, but after 68 million reads
> of the type just mentioned is still performing well with only single-bit
> errors in various places in the test area. (The fact that errors do start
> to occur after a while puts any suspicions of unexpected read caching to
> rest). Admittedly, this is all at room temperature, etc, and only a single
> sample, but it still is quite far from 200 000 reads. Other chips of the
> same sizes that we use which specify 1-bit ECC have a similar performance.
>
> The fact that 512 MiB is worse than 256 MiB is not too surprising, there
> could well be a technology jump between those sizes, with smaller bit
> cells for the larger flash.

I have no idea how the two boards were programmend I run these two tests on=
=2E=20
Maybe the NAND programming was done in a wrong way which leads to this bad=
=20
result.
On these boards the first 4 MiB area is the 'bootloader area', which must h=
ave=20
a special layout to enable the ROM code to load the bootloader from it.

I have a bunch of boards here with 128/256/512 MiB NANDs where I can repeat=
 the=20
tests. Any recommendations how to setup the NAND before to do the tests aga=
in?

jbe

=2D-=20
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| Juergen Borleis =A0 =A0 =A0 =A0 =A0 =A0 |
Industrial Linux Solutions               =A0 =A0 =A0| Phone: +49-5121-20691=
7-5128 |
Peiner Str. 6-8, 31137 Hildesheim, Germany =A0 =A0| Fax: =A0 +49-5121-20691=
7-5555 |
Amtsgericht Hildesheim, HRA 2686 =A0 =A0 =A0 =A0 =A0 =A0 =A0| http://www.pe=
ngutronix.de/ =A0|
