Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTvu-0005QK-WC
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 16:10:04 +0000
Received: by mail-wm0-x241.google.com with SMTP id m203so34871029wma.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 08:09:42 -0800 (PST)
Subject: Re: [PATCH v6 1/3] spi-nor: Add support for Intel SPI serial flash
 controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161128120626.130693-2-mika.westerberg@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5a3840ef-e407-ea29-d06c-f2f3eda2c133@gmail.com>
Date: Thu, 1 Dec 2016 17:08:42 +0100
MIME-Version: 1.0
In-Reply-To: <20161128120626.130693-2-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/28/2016 01:06 PM, Mika Westerberg wrote:
> Add support for the SPI serial flash host controller found on many Intel
> CPUs including Baytrail and Braswell. The SPI serial flash controller is
> used to access BIOS and other platform specific information. By default the
> driver exposes a single read-only MTD device but with a module parameter
> "writeable=1" the MTD device can be made read-write which makes it possible
> to upgrade BIOS directly from Linux.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---


[...]

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>


-- 
Best regards,
Marek Vasut
