Received: from h24-66-20-25.wp.shawcable.net ([24.66.20.25] helo=iders01.iders.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tyST-0001yY-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 23:47:10 +0100
From: "Christian Gan" <cgan@iders.ca>
To: <manningc2@actrix.gen.nz>, "Nick Bane" <nick@cecomputing.co.uk>,
   "Marc Singer" <elf@buici.com>
Cc: <linux-mtd@lists.infradead.org>, <yaffs@toby-churchill.org>
Subject: RE: Interest in DOC and YAFFS?
Date: Tue, 24 Sep 2002 17:46:57 -0500
Message-ID: <NFBBLPGPLKFIKCCPLALEEECPCEAA.cgan@iders.ca>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020924205746.837BF43CF@tiger.actrix.co.nz>
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

Hello all,

I heard my name being mentioned so I thought to respond :)

Currently I do have an implementation of HW_ECC for nand working.  Most of
the structure is already in the NAND mtd.  Our NAND is connected through a
custom FPGA that does the ECC for us.

The current breakdown is this:

1. YAFFS calls write_page in the MTD.  write_page fills the page and the HW
ECC data in OOB where YAFFS expects it to be (using custom enable_hwecc and
calc_ecc).
2. YAFFS calls write_oob for the tag data, however the ECC bytes are filled
with 0xff so that it doesn't corrupt the ECC already written by the MTD.
i.e. my CalcECC function in YAFFS just writes 0xff.
3. When YAFFS verifies the tag data, the ECC bytes are skipped since YAFFS
will not know what they are supposed to be.

Problems with this is that Steps 1 and 2 need to be combined to once write
call, otherwise we may blow the specs of some NANDs for max writes to OOBs.

Verbose version of things needed to make HW ECC work with YAFFS:

MTD Changes:
============
- the nand_chip struct has a pointer to a function for enable_hwecc, you'll
have to create your own function depending on your system and have the
structure point to it.  The mtd calls this function to reset the HW ECC on
the NAND device.  So it gets called once in the beginning of a page and
again at the 256 byte mark.
- calculate_ecc has to be changed so that it now reads the registers
containing the calculated ECC in HW.
- the problem with this implementation is that YAFFS needs a NAND MTD that
allows it to write the page and OOB at the same time.  Here's a snipped of
email I wrote on the YAFFS mailing list earlier:

"A further problem I have to think about now is the max number of allowable
writes in the OOB.  Some NANDs allow for three writes but there are some
who's maxes are speced for two.  Which means that in my case:

  1 write to OOB by the MTD when writing a page (for HW ECC).
  1 write to OOB by YAFFS for tags.
  1 write to OOB by YAFFS to mark pages deleted.
  = 3 writes
which of course would violate some NAND specs..."

- Finally, the current MTD uses the OOB to write the ECCs and also a "valid
ECC" byte.  YAFFS tags has no room for the valid ECC byte in the OOB so I
had to ignore it, which is not exactly ideal.  The byte location that the
MTD writes to the OOB for ECC also must be changed (by defining the ecc_pos
in the oob config).

YAFFS Changes:
==============
- Remove any instance where YAFFS tries to read / write ECC.  i.e. when
YAFFS writes it's tags, have it write 0xff for the ECC bytes.  Don't verify
the ECC in the tag/oob area in VerifyCompare and don't try to correct data
in ReadChunkFromNand.
- I'm working on getting Charles this code so that he can put in a NO_ECC
macro of some sort.

> -----Original Message-----
> From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> Sent: Tuesday, September 24, 2002 3:54 PM
> To: Nick Bane; Marc Singer
> Cc: linux-mtd@lists.infradead.org; yaffs@toby-churchill.org
> Subject: Re: Interest in DOC and YAFFS?
>
>
>
> > > > How this works with DOC I am unclear as I had noticed a
> while back that
> > > > there was hardware assisted ECC. This might get in the way
> of YAFFS ECC
> >
> > but
> >
> > > > maybe this can be circumvented.
> > >
> > > As far as I can tell, the hardware ECC just makes the DOC faster.
> >
> > Umm. It may use some of the oob data area for its own ECC in a YAFFS
> > incompatible way. I am not sure of my ground here, only that you need to
> > check it out.
> >
> > > Also, I think that Microsys has released information about how to use
> > > the hardware ECC.
> >
> > Ok.
>
> Determining, then straightening out, OOB conflicts is essetially what DOC
> support boils down to.
>
> As far as I am aware, the ECC does not actually impact on the
> NAND and works
> something like as follows.
> * As you write bytes to the NAND buffer, an ECC is calculated on
> the side in
> the ASIC.
> * You can then read ASIC registers to determine the ECC.
>
> Essentially you can just ignore the ECC and see raw NAND chips,
> ie the ECC is
> non-intrusive.
>
> Thus, the current YAFFS page programming would change from something like:
>
> * Calculate ecc. + tags and format up OOB (spare)
> * Write data + oob
> * Program page
>
> to:
>
> * Write data
> * Read ECC from ASIC
> * Format up and write oob.
> * Program page
>
> Essentially, the hw ecc saves the ecc calcs - that's all.
>
> Christian Gan has implemented a hw ecc scheme which I think is
> like above in
> YAFFS, so I suspect DOC support might almost be done :-).
>
> -- Charles
>
>
> ------------------------------------------------------------------
> ---------------------
> This mailing list is hosted by Toby Churchill open software
(www.toby-churchill.org).
If mailing list membership is no longer wanted you can remove yourself from
the list by
sending an email to yaffs-request@toby-churchill.org with the text
"unsubscribe"
(without the quotes) as the subject.
