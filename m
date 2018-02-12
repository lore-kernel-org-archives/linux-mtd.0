Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elCcy-0007Ba-Qg
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 11:50:34 +0000
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
To: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Kamal Dasu
 <kdasu.kdev@gmail.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <40a44152-e62c-d57e-7646-7699301c29cc@ti.com>
Date: Mon, 12 Feb 2018 17:20:46 +0530
MIME-Version: 1.0
In-Reply-To: <20180205232120.5851-2-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Some controllers are exposing high-level interfaces to access various
> kind of SPI memories. Unfortunately they do not fit in the current
> spi_controller model and usually have drivers placed in
> drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> memories in general.
> 
> This is an attempt at defining a SPI memory interface which works for
> all kinds of SPI memories (NORs, NANDs, SRAMs).

Wouldn't it be better if spi_mem* implementations were in separate file?
drivers/spi/spi.c is 3.5K+ lines and is bit difficult to follow.


-- 
Regards
Vignesh
