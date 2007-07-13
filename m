Received: from sccrmhc12.comcast.net ([63.240.77.82])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9Fev-0005JX-1k
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 03:33:51 -0400
Date: Thu, 12 Jul 2007 23:33:47 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH][MTD] Add COMPATIBLE_IOCTL() for MEMGETOOBSEL
Message-ID: <20070713063347.GA19047@plexity.net>
References: <20070620235245.GA12800@mag.az.mvista.com>
	<625fc13d0706201852g5348a209q82c5cc5b9dc42bf6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625fc13d0706201852g5348a209q82c5cc5b9dc42bf6@mail.gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	"Mark A. Greer" <mgreer@mvista.com>
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jun 20 2007, at 20:52, Josh Boyer was caught saying:
> On 6/20/07, Mark A. Greer <mgreer@mvista.com> wrote:
> > The flash_eraseall MTD utility uses the MEMGETOOBSEL so add a
> > COMPATIBLE_IOCTL() entry for it.
> >
> > Signed-off-by: Mark A. Greer <mgreer@mvista.com>
> > ---
> > I know MEMGETOOBSEL is supposed to be obsolete but flash_eraseall uses
> > it so...
> >
> > Also, MEMSETOOBSEL is used by nandwrite.c but that ioctl doesn't appear
> > to be implemented so I didn't add it.  My util source is
> > http://ftp.linux.org.uk/pub/people/dwmw2/mtd/cvs/mtd/util/
> > in case I'm looking at old source.
> 
> You are.  But it's still the same in the current code:
> 
> http://git.infradead.org/?p=mtd-utils.git;a=summary
> 
> And now that you've found MEMSETOOBSEL being used but not implemented,
> I'll have to go figure out what that's about.

Josh,

I'm merging Mark's patch into the MontaVista tree and will send out and
updated patch vs upstream but also wondering what the proper route is for
MEMSETOOBSEL? I've been out of the mtd loop for a while but looking at the 
git log for mtd-abi.h and mtdchar.c, it looks like the ioctl() was removed 
over a year ago (commit ff268fb8791cf18df536113355d7184007c269d9).  Do we 
re-introduce it or can we update the tools?

Thomas, I'm including you b/c you made the original commit to remove 
MEMSETOOBSEL but also made changes to nandwrite.c that use it a month 
later. :) Should we put MEMSETOOBSEL back in?

Tnx,
~Deepak

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net 

"Ever bigger machines, entailing ever bigger concentrations of economic
power and exerting ever greater violence against the environment, do not
represent progress: they are a denial of wisdom. Wisdom demands a new
orientation of science and technology towards the organic, the gentle, the
non-violent, the elegant and beautiful." - Small is Beautiful
