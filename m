Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAzna-0004Kw-HS
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 14:19:36 +0000
Date: Wed, 17 May 2017 16:19:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: mchp23k256: device tree and mchp23lcv1024
Message-ID: <20170517141909.GC2650@lunn.ch>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 17, 2017 at 05:39:04PM +1200, Chris Packham wrote:
> This series adds device tree support to the mchp23k256 driver and
> support for the mchp23lcv1024 chip. I suspect there are more compatible
> variants that we could now enumerate if desired.

Hi Chris

I tested my user case. No obvious regressions.

Tested-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
