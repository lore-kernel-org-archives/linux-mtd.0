Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gb67j-0006hV-J2
 for linux-mtd@lists.infradead.org; Sun, 23 Dec 2018 15:57:04 +0000
Date: Sun, 23 Dec 2018 07:56:49 -0800
From: Tony Lindgren <tony@atomide.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ladislav Michl <ladis@linux-mips.org>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v6 13/14] mtd: onenand: omap2: Configure driver from DT
Message-ID: <20181223155649.GJ6707@atomide.com>
References: <20180112131105.GA13810@lenoch> <20180112131725.GN13810@lenoch>
 <20181222010246.GA27785@darkstar.musicnaut.iki.fi>
 <20181222101938.GA30696@lenoch>
 <20181223125149.GE27785@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181223125149.GE27785@darkstar.musicnaut.iki.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Aaro Koskinen <aaro.koskinen@iki.fi> [181223 12:52]:
> Hi,
> 
> On Sat, Dec 22, 2018 at 11:19:38AM +0100, Ladislav Michl wrote:
> > Well, DT timings for onenand node seems to be copied over without actually
> > verifying correctness. I do not know which chip comes with N950, so please
> > verify timings in you DT according chip used. Idea is to use timings for
> > slowest chip used and driver will ask for faster one if possible.
> 
> Hmm, right. I thought we had some dumped values in the DT, but apparently
> wrong ones. What is the method for dumping the "right" values? If I just
> enable GPMC debug with old kernel, it's dumping the DT entries twice,
> but neither set works with the new kernel.
> 
> Then I tried the "before" values from the new kernel, and they seem to
> work (patch below)...

You can enable CONFIG_OMAP_GPMC_DEBUG=y and the gpmc driver should print
out the bootloader timings for you on boot to make sure they're what you
posted. Then if the values are different between devices, then it makes
sense to add them to the device specific dts files.

Regards,

Tony
