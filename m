Date: Fri, 10 Feb 2012 23:39:36 -0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 1/2] mxs-dma : move the mxs dma.h to a more common place
Message-ID: <20120211073934.GE2198@r65073-Latitude-D630>
References: <1328612075-5825-1-git-send-email-b32955@freescale.com>
 <1328612075-5825-2-git-send-email-b32955@freescale.com>
 <20120210162134.GA2723@r65073-Latitude-D630>
 <CAMiH66EP6UFDYkguzfSFgysDzVREPZ8P1x29TkYvQ+Cuvz-4hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMiH66EP6UFDYkguzfSFgysDzVREPZ8P1x29TkYvQ+Cuvz-4hg@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@intel.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, w.sang@pengutronix.de,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 artem.bityutskiy@intel.com, b29396@freescale.com,
 linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 11, 2012 at 07:36:50AM +0800, Huang Shijie wrote:
> hi,
> 
> On Sat, Feb 11, 2012 at 12:21 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> > On Tue, Feb 07, 2012 at 06:54:34PM +0800, Huang Shijie wrote:
> >> Move the header to a more common place.
> >> The mxs dma engine is not only used in mx23/mx28, but also used
> >> in mx50/mx6q.  It will also be used in the future chips.
> >>
> >> Rename it to mxs-dma.h
> >>
> >> change mxs-dma driver, mxs-mmc driver, gpmi-nand driver, mxs-saif driver
> >> to the new header file.
> >>
> >> Signed-off-by: Huang Shijie <b32955@freescale.com>
> >> ---
> >>  drivers/dma/mxs-dma.c                              |    2 +-
> >>  drivers/mmc/host/mxs-mmc.c                         |    2 +-
> >>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |    2 +-
> >>  .../include/mach/dma.h => include/linux/mxs-dma.h  |    0
> >>  sound/soc/mxs/mxs-pcm.c                            |    2 +-
> >>  sound/soc/mxs/mxs-pcm.h                            |    2 +-
> >>  sound/soc/mxs/mxs-saif.c                           |    2 +-
> >>  7 files changed, 6 insertions(+), 6 deletions(-)
> >>  rename arch/arm/mach-mxs/include/mach/dma.h => include/linux/mxs-dma.h (100%)
> >
> > I suggested you rename it include/linux/fsl/mxs-dma.h [1].  It seems
> > you are ignoring the comment.  Can you explain why it's not a
> > reasonable suggestion?
> 
> For gpmi-nand.h is placed in include/linux/mtd/ directory, so i think
> it's better to place the mxs-dma.h
> to similar include/linux/dma/ directory, but the directory does not exit.
> 
Yes, from subsystem point of view, it makes sense too.

> If i place it at include/linux/fsl/mxs-dma.h , i have to create a new
> folder, I am not sure i have the right
> to do so. But i can try it in the next version.
> 
So either way works for me.  But you need to create a folder anyway.
So let's do it to test people.

> thanks a lot.
> 
> 
> 
> >
> > And Wolfram and Mark told you that you need to Cc subsystem maintainers
> > to collect their acks [2].  But you are still not Ccing Mark Brown and
> > Chris Ball for sound/soc/ and drivers/mmc changes.  So you are not
> > listening.
> 
> ok, i will CC them in next version.  I　really did not know to whom I　should cc .
> 
The file MAINTAINERS is created for this purpose.

-- 
Regards,
Shawn
