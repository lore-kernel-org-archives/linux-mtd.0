Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Vg4-0007ql-L7
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 22:28:54 +0000
Date: Tue, 31 May 2016 00:28:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Valdis.Kletnieks@vt.edu
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] mtd: nand: samsung: retrieve ECC requirements
 from extended ID
Message-ID: <20160531002824.2f612484@bbrezillon>
In-Reply-To: <137285.1464641769@turing-police.cc.vt.edu>
References: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464353701-23233-14-git-send-email-boris.brezillon@free-electrons.com>
 <198040.1464567635@turing-police.cc.vt.edu>
 <20160530094446.5edec3ac@bbrezillon>
 <137285.1464641769@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 May 2016 16:56:09 -0400
Valdis.Kletnieks@vt.edu wrote:

> On Mon, 30 May 2016 09:44:46 +0200, Boris Brezillon said:
> > Hi Valdis,  
> 
> > Actually, that was my first reaction [1], but the more I think about it
> > the more I realize it's a non-issue.
> > AFAICT, there's no full-id entries for Samsung NANDs in the nand_ids
> > table, so this either means there's no real users of Samsung MLCs or
> > NAND controller drivers connecting to those chips don't care about the  
> > ->ecc_{step_ds,strength_ds} fields.  
> 
> I'm mostly, though not totally convinced (not having looked closely at
> the existing code).  There's still a possible issue with the distinction
> between:
> 
> A) "driver never references the variable" and
> 
> B) driver check if it's zero, and acts like it doesn't care if it is, but if
> it's non-zero, it goes ahead and uses it, with possible hilarity ensuing if the
> value is wrong.
> 
> Should be pretty easy for somebody who knows the code better than I to rule
> out case B fairly quickly...

Ok, so I had a quick look, and only 4 drivers are actually using the
->ecc_{strength,step}_ds fields, and AFAICT, all of them are already
broken with the existing implementation, even if those fields are set
to 0.

- the atmel driver uses a default ECC config (2bits/512bytes) if
  those fields are set to 0, and this config is clearly not suitable
  for the MLC NANDs we are talking about (note that SLC NANDs seem to
  all use the 4 bytes extended ID scheme, which seems to be common to
  all vendors).

- the gpmi driver either returns an error if one of these fields
  are set to zero and the 'fsl,use-minimum-ecc' DT property is defined,
  or tries to fill the whole OOB area with ECC bytes if the property is
  not defined. The 2nd solution could work, if only we were sure about
  the encoding of the OOB size, but, as the ECC requirements field, it
  depends on the extended ID scheme. So, in the end, it's broken too.

- the pxa and sunxi drivers are just blindly relying on those fields if
  the 'nand-ecc-strength' and 'nand-ecc-step-size' properties are
  undefined. The pxa default to 1bit/512bytes if ecc strength or ecc
  step appear to be set to 0, while the sunxi driver completely rejects
  the NAND chip.
  In both cases, the current implementation is broken, either because
  you will use an unsuitable ECC config or because your NAND chip won't
  be registered.

So, as you can see, we're just moving from a broken state to another
broken state, except the new infrastructures allows one to extend the
detection logic and thus allow for correct detection of more chips.

> 
> > I agree that the solution is not perfect, but I'd prefer seeing the
> > NAND detection code iteratively improved than rejecting everything
> > until we're 100% sure that all cases are correctly handled (which might
> > never happen since NAND vendors introduce new NAND ID scheme if they
> > need to).
> >
> > BTW, do you have Samsung datasheets describing a different NAND ID
> > format, or is it purely hypothetical?  
> 
> Mostly hypothetical.  I've just seen too many patches that assume "all chips
> from  vendor XYZ do *this*" that were not at all corrrect.
> 

Yep, that's true, except I'm not promising anything here, I just say
that this patch adds code to detect a range of Samsung chips, and that
it can be extended to properly detect chips that do not use this format
if we appear to find some (which is very likely to happen).

Of course, we could decide to leave everything as is and add full-id
entries to the nand_ids table each time we want to support a new chip
that does not expose a valid ONFI of JEDEC parameter table. But that
means adding more and more info to the nand_flash_dev structure and
polluting the nand_ids table with a bunch of NAND chips that could
otherwise be handled by the same detection code.
And as detailed above, this solution is just as broken as mine but in a
different way (in both cases, NANDs that are not already supported by
the kernel will either be rejected or used ).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
