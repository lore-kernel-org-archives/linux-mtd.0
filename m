Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAjOx-0000Hk-Ix
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 21:53:36 +0000
Received: by mail-qt0-x231.google.com with SMTP id s2-v6so19588620qti.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2018 14:53:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180422183522.11118-4-boris.brezillon@bootlin.com>
References: <20180422183522.11118-1-boris.brezillon@bootlin.com>
 <20180422183522.11118-4-boris.brezillon@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Apr 2018 00:53:22 +0300
Message-ID: <CAHp75VfNzxGoSk==sdnOzp7LhuHVuanWAHOQk0eQC_g3Y3miQA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] spi: Extend the core to ease integration of SPI
 memory controllers
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Vignesh R <vigneshr@ti.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 22, 2018 at 9:35 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Some controllers are exposing high-level interfaces to access various
> kind of SPI memories. Unfortunately they do not fit in the current
> spi_controller model and usually have drivers placed in
> drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> memories in general.
>
> This is an attempt at defining a SPI memory interface which works for
> all kinds of SPI memories (NORs, NANDs, SRAMs).

> +config SPI_MEM
> +       bool "SPI memory extension"

> +#if IS_ENABLED(CONFIG_SPI_MEM)

IS_BUILTIN().
You defined it as boolean, IS_ENABLE() is superfluous.


> +#else
> +#endif /* CONFIG_SPI_MEM */

-- 
With Best Regards,
Andy Shevchenko
