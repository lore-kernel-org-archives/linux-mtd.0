Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXNzA-0007pM-Jb
 for linux-mtd@lists.infradead.org; Wed, 10 Aug 2016 07:31:33 +0000
Date: Wed, 10 Aug 2016 10:31:03 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20160810073103.GQ1729@lahna.fi.intel.com>
References: <1466609565-113251-1-git-send-email-mika.westerberg@linux.intel.com>
 <1466609565-113251-2-git-send-email-mika.westerberg@linux.intel.com>
 <CAD6G_RQEBy_-eY_ZnF44J3iemq+ZVazziiPmdRHqqxaieEyAKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6G_RQEBy_-eY_ZnF44J3iemq+ZVazziiPmdRHqqxaieEyAKA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 10, 2016 at 01:02:09AM +0530, Jagan Teki wrote:
> Why is this separate platform driver, can't we combine with single
> spi-nor controller driver, any specific reason?

I also have a PCI driver which uses this same core driver (some CPUs
have the device directly exposed as a PCI device). I'll submit that part
separately later.
