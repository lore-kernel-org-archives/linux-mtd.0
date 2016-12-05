Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDrVL-00046H-9d
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 11:32:20 +0000
Date: Mon, 5 Dec 2016 13:27:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161205112727.GI1459@lahna.fi.intel.com>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 28, 2016 at 03:06:23PM +0300, Mika Westerberg wrote:
> This is 6th iteration of the series. You can find the previous versions
> archived on:
> 
>   v5: https://lwn.net/Articles/706363/
>   v4: https://lwn.net/Articles/703773/
>   v3: https://lwn.net/Articles/697231/
>   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
>   v1: https://lkml.org/lkml/2016/6/14/269
> 
> This patch series adds support for the Intel SPI serial flash controller
> found on many recent Intel CPUs including Baytrail and Braswell. This
> driver makes it possible to access the BIOS and other platform data which
> is stored on the SPI serial flash. It is also possible to upgrade the BIOS
> using this driver if it has not been protected by special hardware bits.
> 
> The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
> MAX.
> 
> Since poking the SPI serial flash can brick the machine, this driver can
> only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
> unless instructed othwerwise by module parameter.

Hi Lee,

I think we have enough acks from the MTD maintainers. I wonder if you
could merge this series via your MFD tree?
