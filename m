Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17u6hO-0002rb-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 08:35:06 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H2Z001SVH1LTF@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 25 Sep 2002 09:34:35 +0200 (MEST)
Date: Wed, 25 Sep 2002 09:33:46 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Interest in DOC and YAFFS?
In-reply-to: <NFBBLPGPLKFIKCCPLALEEECPCEAA.cgan@iders.ca>
To: Christian Gan <cgan@iders.ca>, manningc2@actrix.gen.nz,
 Nick Bane <nick@cecomputing.co.uk>, Marc Singer <elf@buici.com>
Cc: linux-mtd@lists.infradead.org, yaffs@toby-churchill.org
Reply-to: tglx@linutronix.de
Message-id: <200209250933.47027.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <NFBBLPGPLKFIKCCPLALEEECPCEAA.cgan@iders.ca>
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

On Wednesday 25 September 2002 00:46, Christian Gan wrote:
> MTD Changes:
> ============
> - Finally, the current MTD uses the OOB to write the ECCs and also a "valid
> ECC" byte.  YAFFS tags has no room for the valid ECC byte in the OOB so I
> had to ignore it, which is not exactly ideal.  The byte location that the
> MTD writes to the OOB for ECC also must be changed (by defining the ecc_pos
> in the oob config).
The current nand.c in MTD CVS supports not longer a ECC-valid byte.

Further changes:
Use buffered read/write only for non pagealigned access, speed up the
aligned path by using the filesystem-buffer.

Reset chip removed from nand_select(), implicit done only, when erase is
interrupted 

waitfuntion use yield, instead of schedule_timeout

support for 6byte/512byte hardware ECC

read_ecc, write_ecc extended for different oob-layout selections: 
Implemented NAND_NONE_OOB, NAND_JFFS2_OOB, NAND_YAFFS_OOB. 
fs-driver gives one of these constants to select the oob-layout fitting
the filesystem.I have added int oobsel as parameter to each function.
oobdata can be read together with the raw data, when the fs-driver
supplies a big enough buffer. 
size = 12 * number of pages to read (256B pagesize) 
       24 * number of pages to read (512B pagesize)
The buffer contains 8/16 byte oobdata and 4/8 byte returncode from
correct_ecc
oobbuf [0-15] oob-data 1st read page 
oobbuf [16-19] return code from correct_ecc byte 0-255
oobbuf [20-23] return code from correct_ecc byte 256-511
oobbuf [24-39] oob-data 2nd read page
oobbuf [40-31] return code from correct_ecc byte 0-255
.....
The returnvalue of read_ecc is -EIO, if any correct_ecc returned -1. But
retlen is equal to the requested length, so fs-driver can decide what to
do.

oobdata can be given from filesystem to program them in one go together
with the raw data. ECC codes are filled in at the place selected by
oobsel.
This supports multipage programming. 
oobbuf[0-15] 1st page to write
oobbuf[16-31] 2nd page to write
ECC is filled in at the selected place.

I hope these changes are a good compromise for YAFFS folks. In this way
we enable YAFFS support and do not break anything. And you have HW-ECC
support out of the box. Maybe the multipage write/read is useful for you
too.

It's not the maximum speedup, which could be done with a YAFFS-specific
layer, but it enables people to use YAFFS and JFFS2 on the same machine,
even on the same flash chip. 

I started already to write a DOC hardware driver, but at the moment it's 
stucked, because I have to do some paid work :). It's not a really big 
problem to write a DOC driver  for nand.c now.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
