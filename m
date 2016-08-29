Date: Mon, 29 Aug 2016 10:50:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: mxc_nand: Set timing for v2 controllers
Message-ID: <20160829105050.574a2b8a@bbrezillon>
In-Reply-To: <20160829083558.gfydmebh7bx3wdxz@pengutronix.de>
References: <1471948445-29936-1-git-send-email-s.hauer@pengutronix.de>
 <20160826094653.762be9fb@bbrezillon>
 <20160829083558.gfydmebh7bx3wdxz@pengutronix.de>
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

Hi Sascha,

On Mon, 29 Aug 2016 10:35:58 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Hi Boris,
> 
> On Fri, Aug 26, 2016 at 09:46:53AM +0200, Boris Brezillon wrote:
> > Hi Sascha,
> > 
> > On Tue, 23 Aug 2016 12:34:05 +0200
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > 
> > AFAIR, you should apply the new mode on the NAND side
> > (ONFI_FEATURE_ADDR_TIMING_MODE) before applying the new config to the
> > controller.
> > 
> > See what's done here [1].
> > 
> > Note that on all the NANDs I tested, it seems to work even if you don't
> > set ONFI_FEATURE_ADDR_TIMING_MODE, but the ONFI Spec describes the
> > procedure as:  
> 
> Indeed, works here without notifying the NAND chip aswell. I wasn't even
> aware that there is a possibility to notify the NAND chip.
> 
> > 
> > 1/ detect supported modes
> > 2/ select one
> > 3/ apply it to the NAND using set(ONFI_FEATURE_ADDR_TIMING_MODE)
> > 4/ release the CS
> > 5/ adjust the controller setting to match the new config
> > 
> > On a side note, I really think we should handle this timing selection in
> > the core, and only ask the NAND controller drivers to adapt the
> > controller settings.  
> 
> I agree that the core should do this. Do you already have any thoughts
> how the API could could look like?

I already provided a simple implementation a while ago [1]. Not sure it
handles all the corner cases though.

> The Nand drivers probably have to
> propagate somehow which modes they support, maybe we add a onfi_modes
> field to struct nand_chip. Then if onfi_modes is nonzero we call a
> nand_chip->set_onfi_mode() function?

The idea was to have some way to ask the controller whether it supports
specific timings or not. I don't remember if this was part of my
initial proposal.

Note that we should pass struct real timings and not ONFI timing
mode.

Regards,

Boris

[1]https://lkml.org/lkml/2015/10/23/179
