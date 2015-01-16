Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCC1O-0006Pn-JU
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 18:53:27 +0000
Date: Fri, 16 Jan 2015 19:53:00 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
In-Reply-To: <CAAK6Zt3mWvNwDnVU0oORTDC1Es_0jyvNqNyQPxqEjsgJJETiFw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1501161938150.16829@lnxricardw1.se.axis.com>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
 <20150114191907.GX9759@ld-irv-0074>
 <CAAK6Zt3suTh9=GpYP8CYooqOsq6xFnLOUAPk=o4N2dnL7P-sgg@mail.gmail.com>
 <alpine.DEB.2.02.1501160954560.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt3mWvNwDnVU0oORTDC1Es_0jyvNqNyQPxqEjsgJJETiFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 16 Jan 2015, Daniel Ehrenberg wrote:

> I'm currently using an out-of-tree NAND driver which is not based on
> nand_base.c.

Are you and Erik Ekman on this list working on the same thing, he is also 
using an out-of-tree NAND driver?

> > One turning point for me was the realization that at least for some NAND
> > chips, it is out of spec to read bad blocks except once, to determine
> > which ones are bad by looking at the bad block markers in the individual
> > blocks. Hence, using a BBT is a way of fulfilling that requirement. In
> > practice, though, the flashes I've come in contact with (SLC up to say 2
> > Gbit) don't seem to have any problems in this regard.
> 
> Does UBI not satisfy this requirement itself by its own bad block management?

UBI does not have any bad block management itself, it is bad block aware, 
so that it is aware that the underyling media may have bad blocks, but it 
basically just ignores them and relies on the mtd layer to keep track of 
them.

> > with upgrade software, is that if something goes wrong that causes blocks
> > to be marked bad spuriously, if not using a BBT the new bad blocks are
> > marked as such in the same way as factory bad blocks, making it impossible
> > to separate the two and undo the bad block markings and revert to the
> > factory condition. When using a BBT, new bad blocks are marked in the BBT
> > only, so by erasing the BBT and rescanning the bad block markers in the
> > OOBs of the blocks the flash can be reset to a known state.
> >
> But when I'm using UBI, will the bad block table ever be read by
> anyone other than this startup scan to count the number of bad blocks
> in the partition?

When I said 'once' I meant once during the lifetime of the flash, not once 
per boot.

The principle is that bad blocks should basically never even be read after 
the flash has been writen, as since they are bad, doing so could 
potentially cause all sorts of ill effects on the data on the flash chip. 
Therefore it is acceptable to read them once when the flash chip is empty, 
but after that bad blocks should be managed using a separate table so that 
the bad blocks are never touched again.

In my personal, but rather limited, experience (1-2 Gb SLC flash), reading 
bad blocks don't seem to cause any problems. As I mentioned in another 
post, blocks seem to be either 'hard' bad in which they seem to be 
completely disengaged from the rest of the chip, or 'soft' bad in which 
case they are just worn out past the point where they can remember data 
but not otherwise damaged. Mostly speciulation based on empirical 
findings, as I have not consulted any flash manufacturer on the subject.

The conclusion as far as I'm concerned is to use a BBT in a production 
code so that the flash is only ever read in its entirety (i.e. with 
badblocks) once, in order to generate the BBT. In our R&D department, 
especially in departments where they just want a unit to work and aren't 
testing or developing flash code, we can be more leniant and have even 
erased factory-marked bad blocks in some cases (when possible). In the 
unlikely event that a memory chip starts behaving erratically (which 
hasn't happened yet) we'd just replace it. In the field such a situation 
would be harder to diagnose so we want to avoid that as far as possible.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
