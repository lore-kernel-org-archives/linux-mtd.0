Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3RdS-0003Eg-E1
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2016 17:53:39 +0000
Date: Sun, 6 Nov 2016 18:53:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>
Cc: <dwmw2@infradead.org>, <dedekind1@gmail.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: nand: Add bb_per_lun and blocks_per_lun
 fields to nand_chip
Message-ID: <20161106185317.3504896c@bbrezillon>
In-Reply-To: <20161101183231.GA13831@zach-desktop>
References: <1477686464-7437-1-git-send-email-zach.brown@ni.com>
 <1477686464-7437-4-git-send-email-zach.brown@ni.com>
 <20161101145058.65317535@bbrezillon>
 <20161101183231.GA13831@zach-desktop>
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

On Tue, 1 Nov 2016 13:32:32 -0500
Zach Brown <zach.brown@ni.com> wrote:

> On Tue, Nov 01, 2016 at 02:50:58PM +0100, Boris Brezillon wrote:
> > On Fri, 28 Oct 2016 15:27:42 -0500
> > Zach Brown <zach.brown@ni.com> wrote:
> >  
> > > The fields bb_per_lun and blocks_per_lun are useful determining the
> > > number of bad blocks a MTD needs to allocate. How they are set will
> > > depend on if the chip is ONFI, JEDEC or a fuill-id entry in the nand_ids
> > > table.
> > >
> > > Signed-off-by: Zach Brown <zach.brown@ni.com>
> > > ---
> > >  include/linux/mtd/nand.h | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > > index c5d3d502..efbe439 100644
> > > --- a/include/linux/mtd/nand.h
> > > +++ b/include/linux/mtd/nand.h
> > > @@ -771,6 +771,9 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
> > >   *			supported, 0 otherwise.
> > >   * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
> > >   *			supported, 0 otherwise.
> > > + * @bb_per_lun:	[INTERN] the max number of bad blocks each LUN of a
> > > + *			this nand device will encounter their life times.
> > > + * @blocks_per_lun:	[INTERN] The number of PEBs in a LUN
> > >   * @read_retries:	[INTERN] the number of read retry modes supported
> > >   * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
> > >   * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
> > > @@ -853,6 +856,8 @@ struct nand_chip {
> > >  		struct nand_onfi_params	onfi_params;
> > >  		struct nand_jedec_params jedec_params;
> > >  	};
> > > +	__le16 bb_per_lun;
> > > +	__le32 blocks_per_lun;  
> >
> > Two things I don't like here:
> > - you use little-endian types, while it should use native endianness.
> >   Make it easier, and just declare those fields as int (or unsigned
> >   int).
> > - you stick to the ONFI spec, while I'd prefer to see the term lun
> >   replaced by die, and I wonder if we don't already have a field
> >   storing the number of blocks per die (I might be wrong though).
> >  
> 
> I looked for an existing field for number of blocks per die and could not find
> it. Perhaps you were remembering chipsize? or numchips? I looked at how they
> were calculated and chipsize is a multiple of (blocks_per_lun * lun_count) so
> it can't be used to find blocks_per_lun without storing lun_count anyways.
> Let me know if you think I missed something.

Probably not, we so many fields in the nand_chip and mtd_info struct
that I don't remember which ones we are missing ;-).
