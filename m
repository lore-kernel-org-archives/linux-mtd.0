Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Zq3-0003ie-2Z
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 22:53:19 +0000
Date: Sun, 28 Jul 2013 19:53:00 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: gpio: Determine bus width automatically
Message-ID: <20130728225259.GA4215@localhost>
References: <1374582499-31823-1-git-send-email-shc_work@mail.ru>
 <CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 23, 2013 at 11:42:08PM -0700, Brian Norris wrote:
> On Tue, Jul 23, 2013 at 5:28 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> > This patch provide automatically determine of bus width. If resource size,
> > supplied to the driver more than 1 byte, the NAND_BUSWIDTH_AUTO option
> > will be used in the MTD core.
> 
> I presume this depends on the bugfix I sent for NAND_BUSWIDTH_AUTO /
> nand_set_defaults()? That's worth noting (as I am right now), for
> whenever someone gets around to merging this.
> 
> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > ---
> >  .../devicetree/bindings/mtd/gpio-control-nand.txt  |  5 ++---
> 
> Considering the changes in device-tree bindings, it's good to CC the
> device-tree list, I believe.
> 

Adding the new devicetree list in Cc.

Keep in mind you might want to split the DT binding part of the patch
into a separate patch. For small patches like this one, it's probably
not a big deal.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
