Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4QcE-0006yd-Da
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 11:00:27 +0000
Date: Wed, 9 Nov 2016 13:00:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com, mkraemer@de.adit-jv.com,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v4 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161109110000.GE1447@lahna.fi.intel.com>
References: <20161017145858.143771-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161017145858.143771-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 17, 2016 at 05:58:55PM +0300, Mika Westerberg wrote:
> This is fourth version of the series. Previous versions can be found:
> 
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
> 
> This missed v4.8 and v4.9 so it would be really nice to get it finally
> included in v4.10.

Adding the new MTD and SPI-NOR maintainers. Any change getting this
merged for v4.10?
