Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVj7W-0000dr-RI
 for linux-mtd@lists.infradead.org; Sat, 19 May 2012 12:50:55 +0000
Date: Sat, 19 May 2012 14:50:18 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Afzal Mohammed <afzal@ti.com>
Subject: Re: [PATCH 0/3] GPMC NAND isr using standard API
Message-ID: <20120519125018.GA2407@parrot.com>
References: <cover.1337090835.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1337090835.git.afzal@ti.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2012 at 03:38:09PM +0100, Afzal Mohammed wrote:
> Hi Tony, Artem,
> 
> This series creates a fictitious GPMC interrupt chip and provide the
> clients with interrupts that could be handled using standard APIs.
> This helps in removing the requirement of driver of peripheral
> connected to GPMC having the knowledge about GPMC. The only user is
> OMAP NAND driver, it has also been modified to use interrupts provided
> by imaginary GPMC chip.
> 
> This series has a dependency on [2], while [2] has a trivial
> dependency on [1].
> 
> With this series plus [1,2], GPMC driver conversion which is going to
> happen shortly will not create noticable effect outside of
> arch/arm/*omap*/.
> 
> If this series along with [1,2] can be taken in for 3.5, ripples felt
> by MTD drivers upon GPMC driver conversion would be minimal.

Hi Afzal,

I tried to take your series of patches, but I had issues with the
first [1] (I did not try the others): it depends on the following patch,
which is not in the l2-mtd-2.6 tree:

http://www.mail-archive.com/linux-omap@vger.kernel.org/msg68258.html

and it does not apply anyway to l2-mtd-2.6 because of (at least) the
following patches:

http://lists.infradead.org/pipermail/linux-mtd/2012-April/040631.html
http://lists.infradead.org/pipermail/linux-mtd/2012-April/040724.html

So, do you think you could rebase your series on l2-mtd-2.6 ?
And maybe merge the 3 series into a single one, if they have circular
dependencies ?

Thanks,

--
Ivan

[1] http://www.mail-archive.com/linux-omap@vger.kernel.org/msg68581.html
[2] http://www.mail-archive.com/linux-omap@vger.kernel.org/msg68652.html
