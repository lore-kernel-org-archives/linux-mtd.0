Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBOrj-0003pn-W1
 for linux-mtd@lists.infradead.org; Fri, 10 Jun 2016 16:01:00 +0000
Date: Fri, 10 Jun 2016 18:00:36 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 <linux-kernel@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson
 <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
In-Reply-To: <20160610173426.48960ad1@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606101743110.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon>
 <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
 <20160609110814.78823ef3@bbrezillon>
 <alpine.DEB.2.02.1606091313490.6751@lnxricardw1.se.axis.com>
 <20160610173426.48960ad1@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 10 Jun 2016, Boris Brezillon wrote:

> The goal here is to retrieve the controller attached to a given chip in
> order to avoid the global nfc_info variable (and abusing
> nand_get/set_controller_data() to store a pointer to the controller is
> not a good idea either: it's supposed to be used to store per-chip
> private data).

> Then, let's say I really care about this clear separation between NAND
> controllers and NAND chips (even if the controller is only supporting a
> single device), because it makes things clearer, and because it brings
> some consistency in the NAND controller drivers.
> That's something I've asked to other contributors, and I'm asking it to
> you too.

Certainly. As I said, I'm not trying to get away from doing it if there's 
any motivation for it which there clearly is.

> You'll see that implementing this separation is not much more
> complicated than having this global variable, and I must admit global
> variable make me scream (especially when they can be avoided).

Yes, I see now. With struct nand_hw_control in the proper place it allows 
a translation from a struct nand_chip * to a future non-global struct 
nfc_info * . Yeah, I would probably have stumbled upon this when rewriting 
it.
 
> > > But this is not there yet, and in the meantime, if possible, I'd prefer
> > > seeing drivers implementing the ->cmd_ctrl() function instead of
> > > overloading the default ->cmdfunc() implementation.  
> > 
> > I see, I suppose that's because during the course of this the ->cmdfunc() 
> > logic will be significantly changed, requiring corresponding changes in 
> > drivers that do overload that function? Fair enough, that's a pretty good 
> > reason, probably more so than the alleged simplicity of the ->cmd_ctrl() 
> > interface.
> 
> There's another reason actually. We have chip specific functions (like
> ->setup_read_retry()) which might want to use
> non-standard/vendor-specific operations, and this implies patching all
> ->cmdfunc() implementations, or at least making sure they will work
> fine with these new commands.

I see. 

> So yes, I'm clearly trying to avoid specific ->cmdfunc() (especially
> when they are not generic enough to support new commands).

Yes, makes sense. 

> Again, ->cmd_ctrl() does not have to be used in your internal
> ecc->read/write_page() implementations (all you'll have to do is avoid
> using the ->cmdfunc() method and create your own NAND controller
> specific commands instead), but it should at least be used for basic
> operations that do not require high performances (i.e. NAND detection,
> NAND RESET, read-retry, ...).

Ok, good.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
