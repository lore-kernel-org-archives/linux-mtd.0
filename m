Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyBIr-0006O8-5h
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 04:22:05 +0000
Received: by pacej9 with SMTP id ej9so54757849pac.2
 for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2015 20:21:44 -0800 (PST)
Date: Sun, 15 Nov 2015 20:21:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yao Yuan <yao.yuan@freescale.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Li Leo <LeoLi@freescale.com>,
 Scott Wood <scottwood@freescale.com>, Xu Han <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
Message-ID: <20151116042141.GB4021@brian-ubuntu>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151111190359.GE12143@google.com>
 <BLUPR03MB134D5B98BF8C5DA5E763B1E831E0@BLUPR03MB134.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLUPR03MB134D5B98BF8C5DA5E763B1E831E0@BLUPR03MB134.namprd03.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 04:08:39AM +0000, Yao Yuan wrote:
> It looks like easier to read, use and change.
> Is it?

It looks fine either way, IMO.

> And David Woodhouse, Xu Han, Mark Brown
> is there any other comments from you?

FYI, Mark Brown doesn't really have much to do with this. Though he
maintains the SPI subsystem (and regmap, as a matter of fact), SPI *NOR*
code is only a user of the SPI subsystem (and, potentially, regmap). I
hear he's not interested in reviewing MTD work, given the volume of
email he already receives.

Regards,
Brian
