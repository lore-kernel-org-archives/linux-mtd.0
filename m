Received: from shards.monkeyblade.net ([198.137.202.13])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rwor9-0003QY-1N
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 05:53:43 +0000
Date: Mon, 13 Feb 2012 00:51:31 -0500 (EST)
Message-Id: <20120213.005131.707348228946745194.davem@davemloft.net>
To: shmulik.ladkani@gmail.com
Subject: Re: [PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff
From: David Miller <davem@davemloft.net>
In-Reply-To: <20120212111308.0267f200@pixies.home.jungo.com>
References: <20120212111308.0267f200@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: bhutchings@solarflare.com, netdev@vger.kernel.org,
 linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Sun, 12 Feb 2012 11:13:08 +0200

> From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> 
> As of bb0eb217, MTD_FAIL_ADDR_UNKNOWN should be used to indicate mtd
> erase failure not specific to any particular block.
> 
> Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff when setting
> 'erase->fail_addr' in 'efx_mtd_erase()'.
> 
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Ben, what would you like me to do with this one?
