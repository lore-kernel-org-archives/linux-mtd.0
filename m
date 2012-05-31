Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaBUs-0008WE-3F
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 19:57:27 +0000
Received: by laap9 with SMTP id p9so1216333laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 31 May 2012 12:57:22 -0700 (PDT)
Date: Thu, 31 May 2012 22:57:12 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
Subject: Re: mtd nand erase and bad block
Message-ID: <20120531225712.79f0c6f2@halley>
In-Reply-To: <4FC78012.5010704@sirius-es.it>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matteo,

On Thu, 31 May 2012 16:28:34 +0200 Matteo Facchinetti <matteo.facchinetti@sirius-es.it> wrote:
> On 05/31/2012 03:28 PM, Adrian Hunter wrote:
> > On 31/05/12 15:12, Matteo Facchinetti wrote:
> >> If I try to erase with -N parameter I read the following output:
> >> ~# flash_erase -N /dev/mtd6 0 0
> >> Erasing 1024 Kibnand_erase_nand: attempt to erase a bad block at page
> >> 0x00001600
> >> yte @ 200000 --  5 % complete libmtd: error!: MEMERASE64 ioctl failed for
> >> eraseblock 2 (mtd6)
> >>          error 5 (Input/output error)
> >> flash_erase: error!: /dev/mtd6: MTD Erase failure
> >>               error 5 (Input/output error)
> >> Erasing 1024 Kibyte @ 2700000 -- 100 % complete
> >>
> >> I espected that with -N option, flash_erase should erase the hand-damaged
> >> block, recovering the usability of the block. Is it true?
> >>
> >> What's going wrong?
> >
> > The NAND driver has validation to prevent erasure of bad blocks.  Refer
> > nand_erase_nand() in drivers/mtd/nand/nand_base
> >
> > 		/* Check if we have a bad block, we do not erase bad blocks! */
> > 		if (nand_block_checkbad(mtd, ((loff_t) page)<<
> > 					chip->page_shift, 0, allowbbt)) {
> > 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
> > 				    __func__, page);
> > 			instr->state = MTD_ERASE_FAILED;
> > 			goto erase_exit;
> > 		}
> >
> >
> this means that -N parameter bypass only the BBT table check, but in the 
> erase routine there is a low level check that forbids the bad block erase.
> 
> What's the way for recheck bad blocks and refresh the BBT from userspace 
> application?

Well, seems there's no way doing so via Linux MTD APIs.

I know u-boot allows doing so, using its 'scrub' command.
Actually, what it really does is hacks the exact condition quoted above
by Adrian, adding a '!instr->scrub &&' to the condition expression.

I assume such an option could be added to the MEMERASE ioctl.

Regards,
Shmulik
