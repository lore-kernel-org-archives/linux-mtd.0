Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmlW3-0002Zh-6T
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:18:23 +0000
Date: Mon, 16 Jan 2012 20:32:46 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: linux/mtd/gpmi-nand.h: No such file or directory
Message-ID: <20120116123245.GA19835@S2100-06.ap.freescale.net>
References: <4F1013DC.8040902@prolan.hu>
 <1326712888.14299.55.camel@sauron.fi.intel.com>
 <4F14097D.9060601@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4F14097D.9060601@freescale.com>
Content-Transfer-Encoding: quoted-printable
Cc: Vinod Koul <vinod.koul@intel.com>, linux-mtd@lists.infradead.org,
 Peter Rusko <rusko.peter@prolan.hu>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 16, 2012 at 07:26:53PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B401=E6=9C=8816=E6=97=A5 19:21, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> >On Fri, 2012-01-13 at 12:22 +0100, Peter Rusko wrote:
> >>Hi all,
> >>
> >>I can't compile the gpmi-nand module. Currently I'm using the
> >>pengutronix/imx repository, but I've tried the master branch in
> >>mtd-2.6-git and got the same results:
> >>
> >>    CC      drivers/mtd/nand/gpmi-nand/gpmi-nand.o
> >>drivers/mtd/nand/gpmi-nand/gpmi-nand.c:24:33: fatal error:
> >>linux/mtd/gpmi-nand.h: No such file or directory
> >>compilation terminated.
> >>
> >>Where can I find that header?
> >It looks like it has never been added to the kernel tree. Huang?
> >
> Shawn has added it to his git tree to fix the compiling error.
>=20
No, it's not on my tree.  I folded the patch that fixes this error in
the series[1] of mxs-dma dma_transfer_direction migration as patch #3.
The series has been picked up by Vinod.  I suppose Vinod should send
the series to Linus for 3.3, but I have not seen them on Linus' tree.
Vinod?

Regards,
Shawn

[1] http://thread.gmane.org/gmane.linux.kernel.mmc/11669
