Subject: Re: NAND: pending patches for FSL-UPM and Socrates-NAND
From: David Woodhouse <dwmw2@infradead.org>
To: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <692AD100-F140-4388-ADC9-A14B6D7371FC@kernel.crashing.org>
References: <49DA065A.2050204@grandegger.com>
	<692AD100-F140-4388-ADC9-A14B6D7371FC@kernel.crashing.org>
Content-Type: text/plain
Date: Mon, 06 Apr 2009 07:34:35 -0700
Message-Id: <1239028475.11870.34.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Wolfgang Grandegger <wg@grandegger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-04-06 at 09:02 -0500, Kumar Gala wrote:
> On Apr 6, 2009, at 8:40 AM, Wolfgang Grandegger wrote:
> 
> > Hello,
> >
> > I would like to ask for the status of the following patches:
> >
> > [PATCH v4 0/4] NAND: Multi-chip support for FSL-UPM for TQM8548	 
> > modules
> >
> >  NAND: FSL-UPM: add multi chip support
> >  http://lists.infradead.org/pipermail/linux-mtd/2009-March/025070.html
> >
> >  NAND: FSL-UPM: Add wait flags to support board/chip specific delays
> >  http://lists.infradead.org/pipermail/linux-mtd/2009-March/025071.html
> >
> >  powerpc: NAND: FSL UPM: document new bindings
> >  http://lists.infradead.org/pipermail/linux-mtd/2009-March/025072.html
> >
> >  powerpc/85xx: TQM8548: Update DTS file for multi-chip support
> >  http://lists.infradead.org/pipermail/linux-mtd/2009-March/025051.html
> 
> I can take all 4 via the powerpc tree if David ack's the first two.   
> (or I can just deal with the last two).
> 
> > Re: [PATCH 1/2] NAND: Add support for oob size 128
> >  http://lists.infradead.org/pipermail/linux-mtd/2009-March/025046.html
> >
> > [PATCH 2/2] NAND: Add support for NAND on the Socrates board
> >  http://lists.infradead.org/pipermail/linux-mtd/2009-March/024982.html
> 
> These are best handled by David.

I've just applied all six, and was about to send Linus the pull request.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
