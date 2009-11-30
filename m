Received: from 74-93-104-97-washington.hfc.comcastbusiness.net ([74.93.104.97]
	helo=sunset.davemloft.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NEv0D-0005Lc-M2
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 01:24:42 +0000
Date: Sun, 29 Nov 2009 17:24:30 -0800 (PST)
Message-Id: <20091129.172430.95886199.davem@davemloft.net>
To: bhutchings@solarflare.com
Subject: Re: [PATCH 04/12] sfc: Extend MTD driver for use with new NICs
From: David Miller <davem@davemloft.net>
In-Reply-To: <1259543444.3709.88.camel@localhost>
References: <1259543444.3709.88.camel@localhost>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: netdev@vger.kernel.org, linux-net-drivers@solarflare.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ben Hutchings <bhutchings@solarflare.com>
Date: Mon, 30 Nov 2009 01:10:44 +0000

> In new NICs flash is managed by firmware and we will use high-level
> operations on partitions rather than direct SPI commands.  Add support
> for multiple MTD partitions per flash device and remove the direct
> link between MTD and SPI devices.  Maintain a list of MTD partitions
> in struct efx_nic.
> 
> Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>

Applied.
