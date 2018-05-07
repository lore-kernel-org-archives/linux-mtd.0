Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFcYS-0006f6-Aj
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 09:35:37 +0000
Received: by mail-wm0-x243.google.com with SMTP id j5-v6so14136698wme.5
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2018 02:35:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180410224439.9260-8-boris.brezillon@bootlin.com>
References: <20180410224439.9260-1-boris.brezillon@bootlin.com>
 <20180410224439.9260-8-boris.brezillon@bootlin.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 7 May 2018 11:35:23 +0200
Message-ID: <CACna6rw4_sBzhtnvn+vkfiqkt4yQgsk6a1OrM8D7K_81RgUSkQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] spi: bcm53xx: Implement the spi_mem interface
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 Vignesh R <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sourav Poddar <sourav.poddar@ti.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 April 2018 at 00:44, Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> The spi_mem interface is meant to replace the spi_flash_read() one.
> Implement the ->exec_op() method so that we can smoothly get rid of the
> old interface.
>
> Note that the current ->flash_read() implementation looks a bit fragile
> since it does not take the ->read_opcode passed by the spi-nor layer
> into account, which means if might not work with all kind of NORs.
>
> Anyway, I left the logic unchanged and added a few extra checks to make
> sure we're receiving something that looks like a NOR read operation.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Actually, I've just sent
[PATCH] spi: remove the older/duplicated bcm53xx driver
https://patchwork.kernel.org/patch/10383719/

This patch can be probably dropped, as I expect spi-bcm53xx.c to disappear soon.
