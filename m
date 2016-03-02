Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab84n-00007q-QL
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 14:48:35 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] mtd: mtdram: Add parameter for setting writebuf
 size
Date: Wed, 02 Mar 2016 15:48:02 +0100
Message-ID: <38372465.103Wx4k7xg@ws-stein>
In-Reply-To: <1456929355.2169.24.camel@intel.com>
References: <1456924001-1000-1-git-send-email-alexander.stein@systec-electronic.com>
 <1456929164.2169.21.camel@gmail.com> <1456929355.2169.24.camel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 March 2016 14:35:55, Bityutskiy, Artem wrote:
> On Wed, 2016-03-02 at 16:32 +0200, Artem Bityutskiy wrote:
> > On Wed, 2016-03-02 at 14:06 +0100, Alexander Stein wrote:
> > > 
> > > +config MTDRAM_WRITEBUF_SIZE
> > > +       int "MTDRAM write buf size in Bytes"
> > > +       depends on MTD_MTDRAM
> > > +       default "64"
> > > +       help
> > > +         This allows you to configure the write buffer size in the
> > > device
> > > +         emulated by the MTDRAM driver.  If the MTDRAM driver is
> > > built
> > > +         as a module, it is also possible to specify this as a
> > > parameter when
> > > +         loading the module. E.g. ubifs relies this in the
> > > recovery
> > > algorithm.
> > Why another Kconfig option (compile-time) instead of just a module
> > parameter (run-time), which would be more flexible?
> 
> Oh, pardon, you are adding both. I never found the Kconfig options very
> useful. Quite the opposite, I always thought MTD has too many of those
> little Kconfig options and the config menu is too large. I'd suggest to
> only add the runtime option, unless you really need the Kconfig option
> too (why?).

I don't need it. Setting using modprobe is enough for me and a lot more flexible. I just kept it the same way as the other 2 parameters. Even those are rather useless in Kconfig, IMHO. Or do you prefer removing the existing Kconfig options all together and just rely on module parameters?

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
