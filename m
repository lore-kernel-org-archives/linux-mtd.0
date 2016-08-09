Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bX5MT-0003l9-Ru
 for linux-mtd@lists.infradead.org; Tue, 09 Aug 2016 11:38:23 +0000
Date: Tue, 9 Aug 2016 14:37:55 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20160809113755.GM1729@lahna.fi.intel.com>
References: <1466609565-113251-1-git-send-email-mika.westerberg@linux.intel.com>
 <1466609565-113251-2-git-send-email-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466609565-113251-2-git-send-email-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 22, 2016 at 06:32:43PM +0300, Mika Westerberg wrote:
> Add support for the SPI serial flash host controller found on many Intel
> CPUs including Baytrail and Braswell. The SPI serial flash controller is
> used to access BIOS and other platform specific information. By default the
> driver exposes a single read-only MTD device but with a module parameter
> "writeable=1" the MTD device can be made read-write which makes it possible
> to upgrade BIOS directly from Linux.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Brian,

It looks like v4.8-rc1 changed struct spi_nor read/write callbacks to
return number of bytes read/written and also dropped retlen from the
arguments.

Is it fine if I send an updated series with that fixed or do you want to
review this one first?

Thanks.
