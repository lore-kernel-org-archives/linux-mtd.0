Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePPVt-0003ZT-Bh
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 09:09:11 +0000
Date: Thu, 14 Dec 2017 10:08:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Antonio Borneo <borneo.antonio@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Rob Herring <robh@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mchp23k256: propagate return value of spi_sync()
Message-ID: <20171214090824.GB19186@lunn.ch>
References: <20171210151956.2053-1-borneo.antonio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171210151956.2053-1-borneo.antonio@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 10, 2017 at 04:19:56PM +0100, Antonio Borneo wrote:
> The call to spi_sync() can fail.
> Check the return value and propagate it.
> 
> Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
