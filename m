Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yp9U7-0003Ww-Du
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 06:04:08 +0000
Date: Mon, 4 May 2015 08:03:46 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 2/4] mtd: sh_flctl: drop unused variable
Message-ID: <20150504060346.GB26350@opentech.at>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
 <1430553430-21396-2-git-send-email-hofrat@osadl.org>
 <1477205.SvYxjlTIEF@avalon> <20150504051723.GW3521@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150504051723.GW3521@localhost>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 04 May 2015, Vinod Koul wrote:

> On Sun, May 03, 2015 at 10:33:43PM +0300, Laurent Pinchart wrote:
> > Hi Nicholas,
> > 
> > Thank you for the patch.
> > 
> > On Saturday 02 May 2015 09:57:08 Nicholas Mc Guire wrote:
> > > shdma_tx_submit() called via dmaengine_submit() returns the assigned
> > > cookie but this is not used here so the variable and assignment can
> > > be dropped.
> > > 
> > > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > 
> > I would rephrase the commit message to avoid mentioning shdma_tx_submit() as 
> > that's not relevant. Something like "dmaengine_submit() returns the assigned
> > cookie but this is not used here so the variable and assignment can be 
> > dropped."
> And I am bit surrised about taht. Ideally the driver should use the cookie
> to check the status later on...
>
looking at other drivers it seems like the drivers should call 
dma_submit_error(cookie); on the received cookie - which does:
  return cookie < 0 ? cookie : 0;
but doing that after dmaengine_submit() which actually already queued the
this request in shdma_base.cc:shdma_tx_submit() might not be that helpful 
and looking at dma_cookie_assign() I do not see how the condition that 
dma_submit_error is checking for ever could occur as it can't go below 
cookie = DMA_MIN_COOKIE which is defined to 1 (include/linux/dmaengine.h)

As other drivers seem to not be doing more with the returned cookie than 
calling dma_submit_error() on it this seems ok here ...but I'm not that
deep into this - my starting point was a simple API inconsisteny in the
use of wait_for_completion_timeout() :)

thx!
hofrat
