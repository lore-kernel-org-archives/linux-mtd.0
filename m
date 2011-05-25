Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPH9U-0004D4-Fz
	for linux-mtd@lists.infradead.org; Wed, 25 May 2011 16:41:45 +0000
Date: Wed, 25 May 2011 18:41:07 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
Message-ID: <20110525164107.GA16801@parrot.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
	<Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
	<BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 24, 2011 at 02:09:10AM +0100, Brian Norris wrote:
> >>> So I bet
> >>> your device is actually an x8 device and so the 1st/6th byte pattern is
> >>> correct. I think the fact that this conflicts with your ECC patterns is
> >>> something you must deal with.
> >>
> >> I don't agree, that's a big mtd regression. If you update your kernel on such
> >> flash, you brick it.
> >
> > I agree, even if the behavior may have been incorrect in the past, we should think very carefully about changing this for exactly this reason.
> 
> Right, I see how this could be a problem. So for a resolution, I'd ask
> for suggestions on which of the following seems best:
> 1) Completely revert the SCANBYTE1AND6 change
> 2) Remove the option from nand_get_flash_type(), still allowing
> drivers to enable the scan option themselves
> 3) Have nand_get_flash_type() use ECC layout information to decide to
> scan bytes 1+6 or just byte 1 only
> 
> Regarding correctness:
> As far as I can tell, no one has found a definitive answer on the
> manufacturer intention, right? I'm now leaning toward the intention
> that software only needs to scan *either* byte 1 *or* byte 6, but I
> don't know for sure.

Hello Brian,

Here is a relevant excerpt from a 2004 STM application note (AN1819):

  RECOGNIZING BAD BLOCKS
  The devices are supplied with all the locations inside valid blocks
  erased (FFh). The Bad Block Information is written prior to shipping.
  For 528 Byte/256 Word Page (NANDxxx-A) devices, any block where the
  6th Byte/ 1st Word in the spare area of the 1st page does not contain
  FFh is a Bad Block.  For 2112 Byte/1056 Word Page devices, any block,
  where the 1st and 6th Bytes, or 1st Word, in the spare area of the 1st
  page, does not contain FFh, is a Bad Block.

If we check only the 1st byte, we just need to make sure that there is no
possibility of having a good erased block with:
- 1st byte == bad block marker (usually 0x00)
and
- 6th byte == 0xff

I believe this is unlikely; or rather, it _was_ totally unlikely in 2004 when
the application note was written.

Therefore, I think we can safely use only the 1st marker byte to detect factory
bad blocks in that case (STM large page); the manufacturer simply guarantees
that both markers are written when a factory bad block is marked. It does not
require you to check both bytes.

<digression>
The above note is probably not applicable to recent devices. Because bitflips
are much more likely to appear, saying that a specific byte marks a bad block
if it "does not contain FFh" it not realistic. ONFI 2.2 clarifies the issue and
states that a marker is 0x00, not just a byte that "does not contain FFh".
And recent Micron devices do not store markers in flash; they just return 0x00
for any byte read in a bad block (instead of the real data), using an internal
bad block table.
</digression>

I suggest we revert the SCANBYTE1AND6 change, because:
- it breaks existing ecc layouts
- factory bad blocks in relevant STM nands can be detected without checking the
  6th byte

Best Regards,

Ivan
