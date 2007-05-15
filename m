Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HnsRl-0007E0-3M
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 04:31:55 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: ECC on 2048 byte page size 8-bit NAND on Samsung S3C2440
Date: Tue, 15 May 2007 20:39:56 +1200
References: <20070515003039.GB32448@prithivi.gnumonks.org>
In-Reply-To: <20070515003039.GB32448@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705152039.56206.manningc2@actrix.gen.nz>
Cc: Harald Welte <laforge@openmoko.org>, Ben Dooks <ben@trinity.fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 15 May 2007 12:30, Harald Welte wrote:
> Hi!
>
> On openmoko's future mobile communications devices, we're using 2048
> byte page sized NAND chips (x8 organization such as K9F8G08U0A).
>
> However, it seems to me that the ECC support for 2048byte page sized
> NAND chips is not really implemented yet, neither by the NAND core, nor
> by the S3C2440 NAND driver.
>
> As far as I understand it (I haven't worked with 2k page before), the
> 2440 NAND controller can generate a 4-byte ECC for each 2048byte page (8
> bytes in case of x16 organization, this seems somehow strange).
>
> In addition to ECC on the actual main data area, it also supports ECC on
> the OOB data, too.  I haven't found any piece of code in any other NAND
> driver in the kernel that uses this feature.

You could use that if you use yaffs with the tags stored in oob, but most of 
the time yaffs_ecc.c is used to do an ECC on tags calculation.
Using yaffs_ecc.c to do ECC on a few bytes is very low cost.

>
> Also, I don't see something like a standard ECC layout for the 2048byte
> page deivces.  Is there one?

I don't believe there is really such a thing as a standard, except for the 
standards that ONFI are driving for. Scratch around on www.onfi.org.

>
> I can certainly spend my time hacking up some working code.  The
> quesetion is if there is already some thought by one of the people
> involved for some longer time with linux-mtd and/or the s3c2440.
>
> So if you have implementation thoughts / wishes / guidelines: THis is
> the time to raise them, before I just doo what I deem appropriate ;)
>
> Cheers,
