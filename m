Received: from quartz.orcorp.ca ([184.70.90.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bytdE-0002ZO-Nm
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 04:46:37 +0000
Date: Mon, 24 Oct 2016 22:46:08 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob@landley.net" <rob@landley.net>,
 "galak@codeaurora.org" <galak@codeaurora.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [v7, 1/3] nand: pl353: Add basic driver for arm pl353 smc nand
 interface
Message-ID: <20161025044608.GA4929@obsidianresearch.com>
References: <1433786918-21500-2-git-send-email-punnaia@xilinx.com>
 <20161021203322.GA28655@obsidianresearch.com>
 <20161021234611.1f737144@bbrezillon>
 <CAGnW=Bb-pnJ9-xjcw-1dR-y+oKjNs53bgD+dh1LwsMTCmzdRmQ@mail.gmail.com>
 <20161024225954.GA12438@obsidianresearch.com>
 <03CA77BA8AF6F1469AEDFBDA1322A7B764216D8A@XAP-PVEXMBX02.xlnx.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03CA77BA8AF6F1469AEDFBDA1322A7B764216D8A@XAP-PVEXMBX02.xlnx.xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 25, 2016 at 03:58:49AM +0000, Punnaiah Choudary Kalluri wrote:

> > I have hacked the v7 patchset enough to work on 4.8 and hacked it some
> > more to work on my hardware. The driver appears to be in no better
> > shape than the 3.12 out-of-tree Xilinx release I was using previously..
>
> The driver in Xilinx tree works with 4.6 kernel and adopted the
> required

I mean, the driver from the 3.12 Xilinx tree that I last looked
at years ago. This is at v7 now and is still needs lots of work, I did
some fixing, including making parts of it work on 4.8.
You can copy it out of the patch I sent you.

> Changes (may release in 1-2 weeks). Still it need some rework, now a days
> I am seeing many requests from different people for this driver and some of
> Them are using different version of IP as you know this IP has four variants and
> Xilinx is using the pl353 variant.

Well, I am using Xilinx Zynq hardware and care about making that
configuration actually work. This is the last driver I require to use
Zynq with mainline.

It clearly needs more work than just forward porting to 4.8, so please
let me know if you are able to tackle this.

> Let's wait for the next series of patches and Get the patches tested
> with others as well along with the review comments.

You now have 10 review comments from me, please respond to all of them in
your v8 patchset - no sense in continuing to drag this out.

Please cc me on future series.

Jason

> Regards,
> Punnaiah
> > I've attached the ugly, ugly patch I made, it may save you some time
> > when preparing v8.
> > 
> > Commentary:
> >  1) nand_chip already includes mtd_info, no reason for a second one in
> >     the pl353_nand_info struct. The standard accessors mtd_to_nand/etc
> >     should be used instead of priv
> >  2) I hacked out all the ECC stuff from the driver since I don't use
> >     it and it was broken.. Obviously some has to come back, but fixing
> >     other things on this list first will make that much easier and better..
> >  3) pl353_nand_write_page_swecc/pl353_nand_read_page_swecc are pure
> >     outdated copies of the core routines and should not exist in a
> >     driver. This needs to be fixed so nand_scan_tail sets them.
> >     This seems to be a side effect of #9 ?
> >  4) The hacky stuff to detect 2 vs 3 address cycle NAND doesn't work,
> >     and doesn't work without ONFI (see patch for possible fix). The
> >     driver should probably use the same scheme the core code uses..
> >     But this is all a problem because of #10
> >  5) The driver assumes alignment of the iomap, needs to use + not |
> >     when constructing the address. (yes, this blows up on my system)
> >  6) Driver unconditionally sets timing to ONFI mode 0 (slow!)
> >     Maybe timing should be common code driven by DT..
> >  7) Driver unconditionally selects a BBT format, and an ECC layout
> >     (neither match what my system uses, but I guess that is a core mtd
> >     issue these days :/)
> >  8) Driver unconditionally forces a chip-delay (wrong for my
> >     system) maybe this should be common code driven by DT..
> >  9) This buisness with pl353_nand_ecc_init and the
> >     special functions to do PL353_NAND_LAST_TRANSFER_LENGTH stuff
> >     is just horrid. I'd expect that is a big NAK.
> > 
> >     The driver needs to implement read_buf *properly* so the core
> >     routines can be used instead of trying to 'fix' the call sites
> >     to do the PL353_NAND_LAST_TRANSFER_LENGTH stuff.
> >  10) pl353_nand_cmd_function is a wonky copy of nand_command_lp,
> > maybe
> >      this driver should use cmd_ctrl, or the core code should be
> >      refactored some more..
