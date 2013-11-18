Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViTgs-0002hJ-Bo
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 18:36:55 +0000
Received: by mail-ie0-f173.google.com with SMTP id x13so9412820ief.18
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 10:36:32 -0800 (PST)
Date: Mon, 18 Nov 2013 10:36:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
Message-ID: <20131118183626.GA9468@ld-irv-0074.broadcom.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
 <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
 <527BAA32.3020901@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <527BAA32.3020901@st.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Ivan Djelic <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Angus,

On Thu, Nov 07, 2013 at 02:56:50PM +0000, Angus Clark wrote:
> Firstly, apologies for dragging up an issue that dates back well over a year!

No problem. Some of these same issues have been nagging at me in the
back of my head, actually. I don't think this problem is solved
completely correctly, so it's good you bring it up!

> While preparing to upstream an out-of-tree NAND driver, we have fallen foul of
> the change from MTD_OPS_RAW to MTD_OPS_PLACE_OOB in nand_bbt.c:scan_read_oob().
> 
> One issue relates to what is at best a hack within our own driver, and that is
> for us to deal with :-)  However, I also have a concern that the patch could
> result in genuine bad blocks escaping detection.
> 
> As I understand it, the patch was attempting to address the following situation:
>     - NAND-resident BBTs are not used.
>     - The BBT is re-created on each boot by scanning for MBBM.
>     - A page write yields one or more bit-flips in the location used for the
> MBBM, resulting in non-0xff data being present.
>     - The non-0xff data is then misinterpreted as a MBBM on a subsequent boot,
> giving a false bad-block.
> 
> In cases where the ECC scheme covers the MBBM location, then I can see that
> enabling the ECC would cause the non-0xff data to be corrected, and therefore
> avoid the block being falsely identified as bad.

This is more or less the situation that was being addressed. But my
particular situation was actually targeting situations in which a BBT is
used "most of the time", but sometimes (for various reasons) the BBT may
be erased/corrupted and need rebuilt on an unclean flash. But it's a
similar scenario either way, IMO.

> However, I can also construct a situation where a genuine MBBM gets "corrected"
> to 0xff.  Consider, for example, an 8-bit ECC scheme covering the MBBM location,
> where the ECC for a sector of all 0xff data is also all 0xff.  In this case, a
> MBBM of 0x00, with the remaining data all 0xff, would get "corrected" to 0xff.
> Although perhaps a slightly contrived example, the S/W BCH ECC included in the
> kernel scheme can be driven in this way, and I have seen blocks marked as bad
> with this pattern in the past.

Yes, I suspected that this may be possible. But I never observed it
myself (I don't use SW ECC; I only use my HW ECC).

> It is difficult to know if your particular system could suffer in this way.  It
> all depends on the nature of your ECC scheme.  I guess my concern is that the
> patch deviates from what is recommended by the NAND manufacturers, and that it
> makes certain assumptions on how the ECC scheme operates.

My system cannot suffer in this way, because (unfortunately) my HW ECC
does not consider all-0xff to be valid ECC. So it cannot correct
bitflips in erased pages, nor can it "correct" a bad block marker from
0x00 to 0xff.

I'm not sure it's a deviation from manufacturer recommendations, since
manufacturers make no statement about what to do if the BBT fails. But
they do seem to imply that you should build the BBT once and never
revisit the bad block markers.

I agree that my patch does make a few assumptions about the ECC scheme.

> My own view is that the only safe way to record and track bad blocks is to use
> NAND-resident BBTs; after all, if a block is bad then there is no guarantee that
> an attempt to write a MBBM would succeed.  NAND-resident BBTs would also avoid
> the problem the patch was attempting fix in the first place.

I agree that BBTs should be used (I use them). However, they do not
solve my original problem completely: how can a BBT be rebuilt robustly?

I think that my original approach (use ECC while scanning BBMs) is not
100% correct, but I don't think dropping it is 100% correct either.
Rather, I would prefer taking some form of Matthieu's patch (linked in
the reply that you're bringing up from > 1 year ago!) so that we use the
'badblockbits' parameter appropriately. Then I would be fine with
scanning BBMs in RAW mode, and I think we can satisfy both my use case
and yours safely.

> On 07/13/2012 06:39 PM, Brian Norris wrote:
> > On Tue, Jul 10, 2012 at 12:45 AM, Matthieu CASTET <matthieu.castet@parrot.com> wrote:
> >> http://thread.gmane.org/gmane.linux.drivers.mtd/42243 ?

BTW, this patch came into discussion again recently for other reasons:

  http://lists.infradead.org/pipermail/linux-mtd/2013-November/049692.html

Anything more you can contribute to this general conversation would be
more than welcome! I think Ezequiel and I are still interested in
unifying some of nand_bbt and nand_base, regarding BBM scanning, and I
think we can resolve several pending issues by doing so.

Thanks,
Brian
