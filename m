Subject: Re: Pull request: i.MX nand driver updates
From: David Woodhouse <dwmw2@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20100823064024.GP27749@pengutronix.de>
References: <20100823064024.GP27749@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Aug 2010 00:37:45 +0100
Message-ID: <1282865865.29421.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-23 at 08:40 +0200, Sascha Hauer wrote:
> Hi Artem,
> 
> Please pull the following patches to the i.MX nand driver for -next.
> The patches have been reviewed here on the list and on linux-arm-kernel.
> 
> Sascha
> 
> The following changes since commit da5cabf80e2433131bf0ed8993abc0f7ea618c73:
> 
>   Linux 2.6.36-rc1 (2010-08-15 17:41:37 -0700)
> 
> are available in the git repository at:
>   git://git.pengutronix.de/git/imx/linux-2.6.git mtd-imx-nand
> 
> John Ogness (2):
>       mxc_nand: Do not do byte accesses to the NFC buffer.
>       mxc_nand: remove unused variables.
> 
> Sascha Hauer (10):
>       mxc_nand: remove 0xe00 offset from registers
>       mxc_nand: rework get_dev_status
>       mxc_nand: make some internally used functions overwriteable
>       mxc_nand: factor out a check_int function
>       mxc_nand: add V1_V2 namespace to registers
>       mxc_nand: support 8bit ecc
>       mxc_nand: fix correct_data function
>       mxc_nand: Add v3 (i.MX51) Support
>       mxc_nand: do not depend on disabling the irq in the interrupt handler
>       mxc_nand: configure pages per block for v2 controller

Um, that repo seems to be based on something earlier than 2.6.36-rc1.
And the real -rc1 already contains most of those commits.

I think there are four commits which aren't already included. Of those,
at least one looks like a bug fix which needs to go into 2.6.36. What
about the others?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
