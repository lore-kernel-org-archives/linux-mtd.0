Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoBrF-00011V-8q
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 17:37:41 +0000
Received: by mail-pf0-x241.google.com with SMTP id z14so2788211pfe.10
 for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2018 09:37:26 -0800 (PST)
Message-ID: <1519148238.14621.3.camel@gmail.com>
Subject: Re: [PATCH NAND v2] mtd: nand: Replace printk() with appropriate
 pr_*macro()
From: Shreeya Patel <shreeya.patel23498@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,  maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar,  outreachy-kernel@googlegroups.com
Date: Tue, 20 Feb 2018 23:07:18 +0530
In-Reply-To: <20180220181647.6f2367b6@bbrezillon>
References: <1519046025-9412-1-git-send-email-shreeya.patel23498@gmail.com>
 <20180219155115.3d9d1bd5@bbrezillon> <1519146401.12276.4.camel@gmail.com>
 <20180220181647.6f2367b6@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2018-02-20 at 18:16 +0100, Boris Brezillon wrote:
> On Tue, 20 Feb 2018 22:36:41 +0530
> Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> 
> > 
> > On Mon, 2018-02-19 at 15:51 +0100, Boris Brezillon wrote:
> > > 
> > > Hi Shreeya,
> > > 
> > > On Mon, 19 Feb 2018 18:43:45 +0530
> > > Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> > >   
> > > > 
> > > > 
> > > > The log levels embedded with the name are more concise than
> > > > printk.
> > > > Replace printks having a log level with the appropriate
> > > > pr_*macro.
> > > > 
> > > > Signed-off-by: Shreeya Patel <shreeya.patel23498@gmail.com>
> > > > ---
> > > > 
> > > > Changes in v2:
> > > >   -Merge previous patches of the patchset regarding replacement
> > > > of printk with pr_*macro, into single patch.
> > > > 
> > > > 
> > > >  drivers/mtd/nand/cs553x_nand.c   |  9 ++---
> > > >  drivers/mtd/nand/diskonchip.c    | 76 +++++++++++++++++++++---
> > > > ----
> > > > ------------
> > > >  drivers/mtd/nand/fsl_elbc_nand.c |  2 +-
> > > >  drivers/mtd/nand/fsl_ifc_nand.c  |  2 +-
> > > >  drivers/mtd/nand/mxc_nand.c      |  2 +-
> > > >  drivers/mtd/nand/nand_bch.c      | 12 +++----
> > > >  drivers/mtd/nand/nandsim.c       | 10 +++---
> > > >  drivers/mtd/nand/r852.c          |  2 +-
> > > >  drivers/mtd/nand/r852.h          |  6 ++--
> > > >  drivers/mtd/nand/sm_common.c     |  5 ++-
> > > >  10 files changed, 65 insertions(+), 61 deletions(-)
> > > >   
> > > [...]
> > >   
> > > > 
> > > > 
> > > >  
> > > > diff --git a/drivers/mtd/nand/diskonchip.c
> > > > b/drivers/mtd/nand/diskonchip.c
> > > > index c3aa53c..b97d88c 100644
> > > > --- a/drivers/mtd/nand/diskonchip.c
> > > > +++ b/drivers/mtd/nand/diskonchip.c  
> > > [...]
> > >   
> > > > 
> > > > 
> > > > @@ -438,7 +438,7 @@ static void __init
> > > > doc2000_count_chips(struct
> > > > mtd_info *mtd)
> > > >  			break;
> > > >  	}
> > > >  	doc->chips_per_floor = i;
> > > > -	printk(KERN_DEBUG "Detected %d chips per floor.\n",
> > > > i);
> > > > +	pr_info("Detected %d chips per floor.\n", i);  
> > > Should be pr_debug() here.
> > >   
> > > > 
> > > > 
> > > >  }
> > > >    
> > > [...]
> > >   
> > > > 
> > > > 
> > > > diff --git a/drivers/mtd/nand/nandsim.c
> > > > b/drivers/mtd/nand/nandsim.c
> > > > index 246b439..4e5f817 100644
> > > > --- a/drivers/mtd/nand/nandsim.c
> > > > +++ b/drivers/mtd/nand/nandsim.c
> > > > @@ -184,15 +184,15 @@ MODULE_PARM_DESC(bch,		 "En
> > > > able
> > > > BCH ecc and set how many bits should "
> > > >  
> > > >  /* Simulator's output macros (logging, debugging, warning,
> > > > error)
> > > > */
> > > >  #define NS_LOG(args...) \
> > > > -	do { if (log) printk(KERN_DEBUG NS_OUTPUT_PREFIX "
> > > > log: "
> > > > args); } while(0)
> > > > +	do { if (log) pr_debug(NS_OUTPUT_PREFIX " log: "
> > > > args); }
> > > > while(0)  
> > > You could define pr_fmt() to avoid passing NS_OUTPUT_PREFIX.
> > > Something
> > > like:
> > > 
> > > #define pr_fmt(fmt)	"[nandsim]" fmt
> > > 
> > > (remember to put this definition before include directives).
> > > 
> > > Then, all you have to do is
> > > 
> > > do { if (log) pr_debug(" log: " args); } while(0)
> > >   
> > > > 
> > > > 
> > > >  #define NS_DBG(args...) \
> > > > -	do { if (dbg) printk(KERN_DEBUG NS_OUTPUT_PREFIX "
> > > > debug:
> > > > " args); } while(0)
> > > > +	do { if (dbg) pr_debug(NS_OUTPUT_PREFIX " debug: "
> > > > args);
> > > > } while(0)
> > > >  #define NS_WARN(args...) \
> > > > -	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warning: "
> > > > args); } while(0)
> > > > +	do { pr_warn(NS_OUTPUT_PREFIX " warning: " args); }
> > > > while(0)
> > > >  #define NS_ERR(args...) \
> > > > -	do { printk(KERN_ERR NS_OUTPUT_PREFIX " error: "
> > > > args); }
> > > > while(0)
> > > > +	do { pr_err(NS_OUTPUT_PREFIX " error: " args); }
> > > > while(0)
> > > >  #define NS_INFO(args...) \
> > > > -	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); }
> > > > while(0)
> > > > +	do { pr_info(NS_OUTPUT_PREFIX " " args); } while(0)
> > > >  
> > > >  /* Busy-wait delay macros (microseconds, milliseconds) */
> > > >  #define NS_UDELAY(us) \
> > > > diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
> > > > index fc9287a..3d54c6a 100644
> > > > --- a/drivers/mtd/nand/r852.c
> > > > +++ b/drivers/mtd/nand/r852.c
> > > > @@ -935,7 +935,7 @@ static int  r852_probe(struct pci_dev
> > > > *pci_dev,
> > > > const struct pci_device_id *id)
> > > >  		&dev->card_detect_work, 0);
> > > >  
> > > >  
> > > > -	printk(KERN_NOTICE DRV_NAME ": driver loaded
> > > > successfully\n");
> > > > +	pr_notice(DRV_NAME ": driver loaded
> > > > successfully\n");  
> > > Same here:
> > > 
> > > #define pr_fmt(fmt)	DRV_NAME fmt  
> > I am facing the following errors here.
> > 
> > 
> > 
> > In file included from drivers/mtd/nand/r852.c:22:0:
> > drivers/mtd/nand/r852.h:148:0: warning: "pr_fmt" redefined
> >  #define pr_fmt(fmt)  (DRV_NAME fmt)
> >  ^
> > In file included from ./include/linux/kernel.h:14:0,
> >                  from drivers/mtd/nand/r852.c:10:
> > ./include/linux/printk.h:287:0: note: this is the location of the
> > previous definition
> >  #define pr_fmt(fmt) fmt
> That's because you didn't define pr_fmt() before all the #include
> directives in this driver. See the '#indef pr_fmt' statement in
> printk.h
> which is preventing redefinition of this symbol if the file including
> printk.h (either directly or indirectly) already defines it.

Yes, and that is why I did undef before defining it again in the r852.c
file.
Shouldn't it work in this manner?

> 
