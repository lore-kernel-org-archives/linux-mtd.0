Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGQgz-0004bV-6e
 for linux-mtd@lists.infradead.org; Sat, 27 Oct 2018 15:40:03 +0000
Date: Sat, 27 Oct 2018 17:39:45 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Grandbois, Brett" <brett.grandbois@opengear.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for SPI boot flash access
 for AMD Family 16h
Message-ID: <20181027173945.241e87b2@bbrezillon>
In-Reply-To: <20181016005726.26813-1-brett.grandbois@opengear.com>
References: <20181016005726.26813-1-brett.grandbois@opengear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brett,

On Tue, 16 Oct 2018 00:57:41 +0000
"Grandbois, Brett" <brett.grandbois@opengear.com> wrote:

> Add support to expose the SPI boot flash on AMD Family 16h CPUs as a
> standard mtd device to give userspace BIOS updaters greater feature
> support.  The BIOS and Kernel Developer's Guide refers to this as the
> 'SPI ROM' controller and so the driver follows that naming convention
> for consistency.
> 

We're currently trying to convert spi-nor controller drivers to the
spi-mem interface [1]. Can you look at this new interface and tell me if
you'd be able to implement it? If that's not possible, then I'd prefer
to have this driver implement the mtd_info interface directly.

Thanks,

Boris

[1]https://elixir.bootlin.com/linux/latest/source/include/linux/spi/spi-mem.h#L185
