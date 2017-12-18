Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQyBM-0005rO-NS
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:22:28 +0000
Date: Mon, 18 Dec 2017 17:22:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Antonio Borneo <borneo.antonio@gmail.com>, Rob Herring
 <robh@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Chris
 Packham <chris.packham@alliedtelesis.co.nz>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: mchp23k256: propagate return value of spi_sync()
Message-ID: <20171218172203.3721ac0b@bbrezillon>
In-Reply-To: <20171214090824.GB19186@lunn.ch>
References: <20171210151956.2053-1-borneo.antonio@gmail.com>
 <20171214090824.GB19186@lunn.ch>
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

On Thu, 14 Dec 2017 10:08:24 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Sun, Dec 10, 2017 at 04:19:56PM +0100, Antonio Borneo wrote:
> > The call to spi_sync() can fail.
> > Check the return value and propagate it.
> > 
> > Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>  
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied.

Thanks,

Boris

> 
>     Andrew
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
