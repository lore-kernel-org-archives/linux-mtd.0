Date: Tue, 5 Nov 2013 21:46:42 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 12/28] mtd: nand: pxa3xx: Use a completion to signal
 device ready
Message-ID: <20131106004641.GG11759@localhost>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383656135-8627-13-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131105195136.GS20061@ld-irv-0074.broadcom.com>
 <20131106002759.GF11759@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131106002759.GF11759@localhost>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 05, 2013 at 09:27:59PM -0300, Ezequiel Garcia wrote:
> > 
> > I believe your handling of this 'is_ready' bit is a little unwise, as
> > you are actually creating extra concurrency that is unneeded. I'll
> > summarize what you're doing with this 'is_ready' field:
> > 
> >   cmdfunc() -> sets info->is_ready=0 for appropriate commands
> >             -> kicks off the hardware
> > 
> > The following two sequences may then occur concurrently:
> > 
> >   (1) pxa3xx_nand_irq -> ready interrupt occurs
> >                       -> set info->is_ready=1
> > 		      -> signal 'dev_ready' completion
> > 
> >   (2) waitfunc -> check info->is_ready, if it is 0...
> >                   |_ ... wait for the dev_ready completion
> > 
> > Instead of setting info->is_ready=1 under (1), you could set it in (2),

So, after some more careful thought and some testings, it seems you're
correct. Setting is_read in waitfunc() results in a non-racy solution and
the atomic_t can go away.

I'll take a look at the other remaining issues and see about preparing
a v4, so we can try to converge quick enough for v3.14.

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
