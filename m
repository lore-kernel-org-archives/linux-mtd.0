Date: Mon, 11 Mar 2013 11:03:14 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 07/12] mtd: gpmi: move to use generic DMA helper
Message-ID: <20130311030312.GB18574@S2101-09.ap.freescale.net>
References: <1361978748-25281-1-git-send-email-shawn.guo@linaro.org>
 <1361978748-25281-8-git-send-email-shawn.guo@linaro.org>
 <1362748785.5101.4.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1362748785.5101.4.camel@sauron.fi.intel.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Arnd Bergmann <arnd@arndb.de>,
 Huang Shijie <b32955@freescale.com>, Vinod Koul <vinod.koul@intel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Fri, Mar 08, 2013 at 03:19:45PM +0200, Artem Bityutskiy wrote:
> On Wed, 2013-02-27 at 23:25 +0800, Shawn Guo wrote:
> > With the generic DMA device tree helper supported by mxs-dma driver,
> > client devices only need to call dma_request_slave_channel() for
> > requesting a DMA channel from dmaengine.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > Cc: Artem Bityutskiy <dedekind1@gmail.com>
> > Cc: linux-mtd@lists.infradead.org
> 
> It looks like this ne is rather independent and can go via the MTD tree.
> So pushed this one to l2-mtd.git - let me know if I am confused. Thanks!

First of all, there is a new version (v2) of the patch (series) to
address review comments.

Secondly, as Arnd pointed it out, you shouldn't apply this single
patch, because it depends on the first 3 patches in the series to
work.  Applying this single patch will result in a non-functional
gpmi driver.

As I mentioned in the cover letter, I prefer to have your ACK on
the patch to merge the series through arm-soc tree as a whole.  If
you insist that you merge the patch through your tree, I can also
create a topic branch containing the first 3 patches, as Arnd suggests.
Please just let me know.

Shawn
