Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOqrb-0005iy-ON
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2018 21:13:48 +0000
Date: Mon, 19 Nov 2018 22:13:22 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Vignesh R <vigneshr@ti.com>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Yogesh Narayan Gaur
 <yogeshnarayan.gaur@nxp.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Piotr Bugalski <bugalski.piotr@gmail.com>
Subject: Re: [PATCH v3 0/7] spi: spi-mem: Add a direct mapping API
Message-ID: <20181119221322.2b449570@bbrezillon>
In-Reply-To: <20181115195640.GP2089@sirena.org.uk>
References: <20181106160536.13415-1-boris.brezillon@bootlin.com>
 <20181115195640.GP2089@sirena.org.uk>
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

Hi Mark,

On Thu, 15 Nov 2018 11:56:40 -0800
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Nov 06, 2018 at 05:05:29PM +0100, Boris Brezillon wrote:
> > Hello,
> > 
> > Here is a v3 addressing the comment I received from Yogesh on the
> > m25p80 modifications. Note that this part is still untested (I only
> > tested on a spinand device so far), so that'd be great if someone
> > could test it.  
> 
> The SPI bits are all fine FWIW, leaving for a bit longer for testing but
> I could also just apply those bits immediately and send a branch as I
> think it's the MTD bits that really need the testing?

Feel free to apply the SPI bits.

Regards,

Boris
