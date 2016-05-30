Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Hss-0006kJ-HY
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 07:45:11 +0000
Date: Mon, 30 May 2016 09:44:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Valdis.Kletnieks@vt.edu
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] mtd: nand: samsung: retrieve ECC requirements
 from extended ID
Message-ID: <20160530094446.5edec3ac@bbrezillon>
In-Reply-To: <198040.1464567635@turing-police.cc.vt.edu>
References: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464353701-23233-14-git-send-email-boris.brezillon@free-electrons.com>
 <198040.1464567635@turing-police.cc.vt.edu>
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

Hi Valdis,

On Sun, 29 May 2016 20:20:35 -0400
Valdis.Kletnieks@vt.edu wrote:

> On Fri, 27 May 2016 14:54:59 +0200, Boris Brezillon said:
> > From: Hans de Goede <hdegoede@redhat.com>
> >
> > On some nand controllers with hw-ecc the controller code wants to know
> > the ecc strength and size and having these as 0, 0 is not accepted.
> >
> > Specifying these in devicetree is possible but undesirable as the nand
> > may be different in different production runs of the same board, so it
> > is better to get this info from the nand id where possible.
> >
> > This commit adds code to read the ecc strength and size from the nand
> > for Samsung extended-id nands. This code is based on the info for the 5th
> > id byte in the datasheets for the following Samsung nands: K9GAG08U0E,
> > K9GAG08U0F, K9GAG08X0D, K9GBG08U0A, K9GBG08U0B. These all use these bits
> > in the exact same way.  
> 
> Is this correct for all Samsung nand devices supported by this driver?
> 
> (If this driver only covers those 5 specific parts, it's OK.  If there's
> others, more research is needed....)

Actually, that was my first reaction [1], but the more I think about it
the more I realize it's a non-issue.
AFAICT, there's no full-id entries for Samsung NANDs in the nand_ids
table, so this either means there's no real users of Samsung MLCs or
NAND controller drivers connecting to those chips don't care about the
->ecc_{step_ds,strength_ds} fields.

I agree that the solution is not perfect, but I'd prefer seeing the
NAND detection code iteratively improved than rejecting everything
until we're 100% sure that all cases are correctly handled (which might
never happen since NAND vendors introduce new NAND ID scheme if they
need to).

BTW, do you have Samsung datasheets describing a different NAND ID
format, or is it purely hypothetical?

Regards,

Boris

[1]http://lists.infradead.org/pipermail/linux-mtd/2015-July/060582.html

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
