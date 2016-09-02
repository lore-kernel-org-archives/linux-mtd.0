Date: Fri, 2 Sep 2016 14:59:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: mxc_nand: Set timing for v2 controllers
Message-ID: <20160902145948.15692921@bbrezillon>
In-Reply-To: <20160902124353.w6tpaitbaflu6naj@pengutronix.de>
References: <1471948445-29936-1-git-send-email-s.hauer@pengutronix.de>
 <20160826094653.762be9fb@bbrezillon>
 <20160829083558.gfydmebh7bx3wdxz@pengutronix.de>
 <20160829105050.574a2b8a@bbrezillon>
 <20160902124353.w6tpaitbaflu6naj@pengutronix.de>
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

On Fri, 2 Sep 2016 14:43:53 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> On Mon, Aug 29, 2016 at 10:50:50AM +0200, Boris Brezillon wrote:
> > Hi Sascha,
> > 
> > On Mon, 29 Aug 2016 10:35:58 +0200
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >   
> > > Hi Boris,
> > > 
> > > On Fri, Aug 26, 2016 at 09:46:53AM +0200, Boris Brezillon wrote:  
> > > > Hi Sascha,
> > > > 
> > > > On Tue, 23 Aug 2016 12:34:05 +0200
> > > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > > 
> > > > AFAIR, you should apply the new mode on the NAND side
> > > > (ONFI_FEATURE_ADDR_TIMING_MODE) before applying the new config to the
> > > > controller.
> > > > 
> > > > See what's done here [1].
> > > > 
> > > > Note that on all the NANDs I tested, it seems to work even if you don't
> > > > set ONFI_FEATURE_ADDR_TIMING_MODE, but the ONFI Spec describes the
> > > > procedure as:    
> > > 
> > > Indeed, works here without notifying the NAND chip aswell. I wasn't even
> > > aware that there is a possibility to notify the NAND chip.
> > >   
> > > > 
> > > > 1/ detect supported modes
> > > > 2/ select one
> > > > 3/ apply it to the NAND using set(ONFI_FEATURE_ADDR_TIMING_MODE)
> > > > 4/ release the CS
> > > > 5/ adjust the controller setting to match the new config
> > > > 
> > > > On a side note, I really think we should handle this timing selection in
> > > > the core, and only ask the NAND controller drivers to adapt the
> > > > controller settings.    
> > > 
> > > I agree that the core should do this. Do you already have any thoughts
> > > how the API could could look like?  
> > 
> > I already provided a simple implementation a while ago [1]. Not sure it
> > handles all the corner cases though.  
> 
> I just picked up the patch and ported my mxc_nand patch over to it. See
> the result on the mailing list.

Thanks for doing that. I'll try to review the series soon.

Boris
