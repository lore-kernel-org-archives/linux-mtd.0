Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SypxS-000394-As
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2012 20:00:53 +0000
Date: Tue, 7 Aug 2012 22:00:44 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Calvin Johnson <linux.cj@gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
Message-ID: <20120807200044.GA9929@parrot.com>
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
 <20120711174309.GA25743@parrot.com>
 <CAEhpT-UMk0hiDaKAwn8GtS0B3HHRudbSUSHpZ68-i+LmMNH-=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEhpT-UMk0hiDaKAwn8GtS0B3HHRudbSUSHpZ68-i+LmMNH-=A@mail.gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Kevin Cernekee <cernekee@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Joel Reardon <reardonj@inf.ethz.ch>,
 "peter.barada@gmail.com" <peter.barada@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 07, 2012 at 11:08:04AM +0100, Calvin Johnson wrote:
> Hello Ivan,
> 
> 
> >>Due to the nature of NAND bitflips, I cannot see how a NAND datasheet
> >> could guarantee such a thing (what would be the duration of a "0xff
> >> guarantee" anyway ?). In practice, bitflips do appear already on 34nm SLC
> >> devices, on blocks that have just been erased; hence I am not surprised
> >> by your own findings on MLC devices.
> 
> 
> Are these bit flips occurring due to power fluctuations while performing program/erase as mentioned in http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits ?

Hello Calvin,

No, the bitflips I was referring to are not caused by an interrupted erase or program operation.
They just appear when reading back an erased block. They sometimes exhibit a specific pattern: the same bit column is flipped on multiple
pages in the same block.
 
> If that is the case, I am observing a different problem with a MLC NAND flash.
> 
> I wrote 4K bytes of data and read back the same 4K several times. The page size is 4K. I am NOT performing multiple erase/programs. Please note that I am reading back the same data which sometimes matches exactly what was written and sometimes does not, showing bit flips at random locations.  I am not using any ECC to correct the bit errors, which of course will be done later as I'm trying to understand this problem.

Is the amount of observed errors always within the ECC range recommended for this device ?

 
> Is this behavior expected in MLC NANDs? Is there any reference document/links which discuss more about this?
> 
> I have read about  read disturb errors but as I understand it is a permanent error.(http://www.klabs.org/richcontent/MemoryContent/nvmt_symp/nvmts_2002/docs/12/12_dan_p.pdf )
> ----------------------------------------------------------------------------------------------
> Read Disturb Errors
> The read disturb effect causes a page read operation to induce a permanent, bit value change in one of the read bits. In BLC flash technology based on a 0..16μ manufacturing
> 3 process, the typical read disturb error rate is on the order of 1 bit error per 106 repetitive reads of the page containing the bit.
> Although MLC cells are more prone to such errors, the effect in actual measurements is less severe than in program disturb errors. The measured rate is on the order of 1 bit error per approximately 105 repetitive reads of the page.
> 
> ----------------------------------------------------------------------------------------------

I don't have much experience with raw MLC devices, but at least I can share a few interesting docs:

* An interesting article about SLC and MLC technology: http://www.eetimes.com/design/memory-design/4390427/-SLC-vs-MLC--Which-works-best-for-high-reliability-applications-

* An overview of NAND technology from Micron: http://www.google.com/url?sa=t&rct=j&q=nand%20mlc%20erratic%20read%20errors&source=web&cd=1&ved=0CE4QFjAA&url=http%3A%2F%2Fdownload.micron.com%2Fpdf%2Fpresentations%2Fevents%2Fflash_mem_summit_jcooke_inconvenient_truths_nand.pdf&ei=MHEhUImCLcGH0AXPzYG4Aw&usg=AFQjCNGfW2BXUfAt9zLU0Nlc5WSYooZwrA&cad=rja

* A highly technical book about NAND technology, including bit error machanisms: http://books.google.com/books?id=vaq11vKwo_kC&printsec=frontcover&dq=Inside+NAND+Flash&source=bl&ots=UIULMnmFv3&sig=pqLo7iQ2HXmLvkxcWcSWgpiqEoc&hl=en&sa=X&ei=iXAhUPDRNMHS0QXgmIDACA&ved=0CDUQ6AEwAA

* A very interesting presentation from Intel: http://www.stanford.edu/class/ee380/Abstracts/081112-Fazio-slides.pdf

My guess is that the erratic/transient bitflips that you are observing are not uncommon on MLC devices...

BR,
--
Ivan
