Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eoDSv-0006Ib-Rl
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 19:20:40 +0000
Date: Tue, 20 Feb 2018 20:20:08 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v2] mtd: nand: Replace printk() with appropriate
 pr_*macro()
Message-ID: <20180220202008.4a67d0e9@bbrezillon>
In-Reply-To: <1519148238.14621.3.camel@gmail.com>
References: <1519046025-9412-1-git-send-email-shreeya.patel23498@gmail.com>
 <20180219155115.3d9d1bd5@bbrezillon>
 <1519146401.12276.4.camel@gmail.com>
 <20180220181647.6f2367b6@bbrezillon>
 <1519148238.14621.3.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Feb 2018 23:07:18 +0530
Shreeya Patel <shreeya.patel23498@gmail.com> wrote:

> On Tue, 2018-02-20 at 18:16 +0100, Boris Brezillon wrote:
> > On Tue, 20 Feb 2018 22:36:41 +0530
> > Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> >  =20
> > >=20
> > > On Mon, 2018-02-19 at 15:51 +0100, Boris Brezillon wrote: =20
> > > >=20
> > > > Hi Shreeya,
> > > >=20
> > > > On Mon, 19 Feb 2018 18:43:45 +0530
> > > > Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > The log levels embedded with the name are more concise than
> > > > > printk.
> > > > > Replace printks having a log level with the appropriate
> > > > > pr_*macro.
> > > > >=20
> > > > > Signed-off-by: Shreeya Patel <shreeya.patel23498@gmail.com>
> > > > > ---
> > > > >=20
> > > > > Changes in v2:
> > > > > =C2=A0 -Merge previous patches of the patchset regarding replacem=
ent
> > > > > of printk with pr_*macro, into single patch.
> > > > >=20
> > > > >=20
> > > > > =C2=A0drivers/mtd/nand/cs553x_nand.c=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A09 ++---
> > > > > =C2=A0drivers/mtd/nand/diskonchip.c=C2=A0=C2=A0=C2=A0=C2=A0| 76 +=
++++++++++++++++++++---
> > > > > ----
> > > > > ------------
> > > > > =C2=A0drivers/mtd/nand/fsl_elbc_nand.c |=C2=A0=C2=A02 +-
> > > > > =C2=A0drivers/mtd/nand/fsl_ifc_nand.c=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> > > > > =C2=A0drivers/mtd/nand/mxc_nand.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A02 +-
> > > > > =C2=A0drivers/mtd/nand/nand_bch.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 12 +++----
> > > > > =C2=A0drivers/mtd/nand/nandsim.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 10 +++---
> > > > > =C2=A0drivers/mtd/nand/r852.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> > > > > =C2=A0drivers/mtd/nand/r852.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 ++--
> > > > > =C2=A0drivers/mtd/nand/sm_common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A05 ++-
> > > > > =C2=A010 files changed, 65 insertions(+), 61 deletions(-)
> > > > > =C2=A0=C2=A0 =20
> > > > [...]
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > =C2=A0
> > > > > diff --git a/drivers/mtd/nand/diskonchip.c
> > > > > b/drivers/mtd/nand/diskonchip.c
> > > > > index c3aa53c..b97d88c 100644
> > > > > --- a/drivers/mtd/nand/diskonchip.c
> > > > > +++ b/drivers/mtd/nand/diskonchip.c=C2=A0=C2=A0 =20
> > > > [...]
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > @@ -438,7 +438,7 @@ static void __init
> > > > > doc2000_count_chips(struct
> > > > > mtd_info *mtd)
> > > > > =C2=A0			break;
> > > > > =C2=A0	}
> > > > > =C2=A0	doc->chips_per_floor =3D i;
> > > > > -	printk(KERN_DEBUG "Detected %d chips per floor.\n",
> > > > > i);
> > > > > +	pr_info("Detected %d chips per floor.\n", i);=C2=A0=C2=A0 =20
> > > > Should be pr_debug() here.
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > =C2=A0}
> > > > > =C2=A0=C2=A0=C2=A0 =20
> > > > [...]
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > diff --git a/drivers/mtd/nand/nandsim.c
> > > > > b/drivers/mtd/nand/nandsim.c
> > > > > index 246b439..4e5f817 100644
> > > > > --- a/drivers/mtd/nand/nandsim.c
> > > > > +++ b/drivers/mtd/nand/nandsim.c
> > > > > @@ -184,15 +184,15 @@ MODULE_PARM_DESC(bch,		=C2=A0"En
> > > > > able
> > > > > BCH ecc and set how many bits should "
> > > > > =C2=A0
> > > > > =C2=A0/* Simulator's output macros (logging, debugging, warning,
> > > > > error)
> > > > > */
> > > > > =C2=A0#define NS_LOG(args...) \
> > > > > -	do { if (log) printk(KERN_DEBUG NS_OUTPUT_PREFIX "
> > > > > log: "
> > > > > args); } while(0)
> > > > > +	do { if (log) pr_debug(NS_OUTPUT_PREFIX " log: "
> > > > > args); }
> > > > > while(0)=C2=A0=C2=A0 =20
> > > > You could define pr_fmt() to avoid passing NS_OUTPUT_PREFIX.
> > > > Something
> > > > like:
> > > >=20
> > > > #define pr_fmt(fmt)	"[nandsim]" fmt
> > > >=20
> > > > (remember to put this definition before include directives).
> > > >=20
> > > > Then, all you have to do is
> > > >=20
> > > > do { if (log) pr_debug(" log: " args); } while(0)
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > =C2=A0#define NS_DBG(args...) \
> > > > > -	do { if (dbg) printk(KERN_DEBUG NS_OUTPUT_PREFIX "
> > > > > debug:
> > > > > " args); } while(0)
> > > > > +	do { if (dbg) pr_debug(NS_OUTPUT_PREFIX " debug: "
> > > > > args);
> > > > > } while(0)
> > > > > =C2=A0#define NS_WARN(args...) \
> > > > > -	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warning: "
> > > > > args); } while(0)
> > > > > +	do { pr_warn(NS_OUTPUT_PREFIX " warning: " args); }
> > > > > while(0)
> > > > > =C2=A0#define NS_ERR(args...) \
> > > > > -	do { printk(KERN_ERR NS_OUTPUT_PREFIX " error: "
> > > > > args); }
> > > > > while(0)
> > > > > +	do { pr_err(NS_OUTPUT_PREFIX " error: " args); }
> > > > > while(0)
> > > > > =C2=A0#define NS_INFO(args...) \
> > > > > -	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); }
> > > > > while(0)
> > > > > +	do { pr_info(NS_OUTPUT_PREFIX " " args); } while(0)
> > > > > =C2=A0
> > > > > =C2=A0/* Busy-wait delay macros (microseconds, milliseconds) */
> > > > > =C2=A0#define NS_UDELAY(us) \
> > > > > diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
> > > > > index fc9287a..3d54c6a 100644
> > > > > --- a/drivers/mtd/nand/r852.c
> > > > > +++ b/drivers/mtd/nand/r852.c
> > > > > @@ -935,7 +935,7 @@ static int=C2=A0=C2=A0r852_probe(struct pci_d=
ev
> > > > > *pci_dev,
> > > > > const struct pci_device_id *id)
> > > > > =C2=A0		&dev->card_detect_work, 0);
> > > > > =C2=A0
> > > > > =C2=A0
> > > > > -	printk(KERN_NOTICE DRV_NAME ": driver loaded
> > > > > successfully\n");
> > > > > +	pr_notice(DRV_NAME ": driver loaded
> > > > > successfully\n");=C2=A0=C2=A0 =20
> > > > Same here:
> > > >=20
> > > > #define pr_fmt(fmt)	DRV_NAME fmt=C2=A0=C2=A0 =20
> > > I am facing the following errors here.
> > >=20
> > >=20
> > >=20
> > > In file included from drivers/mtd/nand/r852.c:22:0:
> > > drivers/mtd/nand/r852.h:148:0: warning: "pr_fmt" redefined
> > > =C2=A0#define pr_fmt(fmt)=C2=A0=C2=A0(DRV_NAME fmt)
> > > =C2=A0^
> > > In file included from ./include/linux/kernel.h:14:0,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from drivers/mtd/nand/r852.c:10:
> > > ./include/linux/printk.h:287:0: note: this is the location of the
> > > previous definition
> > > =C2=A0#define pr_fmt(fmt) fmt =20
> > That's because you didn't define pr_fmt() before all the #include
> > directives in this driver. See the '#indef pr_fmt' statement in
> > printk.h
> > which is preventing redefinition of this symbol if the file including
> > printk.h (either directly or indirectly) already defines it. =20
>=20
> Yes, and that is why I did undef before defining it again in the r852.c
> file.
> Shouldn't it work in this manner?

It should compile (I'd need to see the diff to figure out why it fails
to compile in your case), but not necessarily do what you want.
When you use #undef/#define to redefine a macro the new definition
applies to everything that uses it in the code *after* the
point it's been redefined. One problem I can think of (but there
probably are others) is when some intermediate header files use
pr_xxx() inside macros/inline functions. In this case, you probably
want the prefix to be applied and that can only be done if you've
defined your own pr_fmt() before including printk.h.

Another reason to define pr_fmt() before including printk.h is that it
requires one line instead of 2 if you go for the #undef/#define
solution.

--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
