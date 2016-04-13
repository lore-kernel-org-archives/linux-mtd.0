Date: Wed, 13 Apr 2016 09:42:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Wenyou
 Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Han Xu
 <han.xu@nxp.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>, linux-omap@vger.kernel.org, Nicolas Ferre
 <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard
 <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Zhou Wang <wangzhou1@hisilicon.com>, Alex
 Smith <alex.smith@imgtec.com>, Harvey Hunt <harvey.hunt@imgtec.com>
Subject: Re: [PATCH 04/12] mtd: nand: brcm: rely on generic DT parsing done
 in nand_scan_ident()
Message-ID: <20160413094215.5f317588@bbrezillon>
In-Reply-To: <20160412223111.GA21705@localhost>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459515272-31011-5-git-send-email-boris.brezillon@free-electrons.com>
 <20160412223111.GA21705@localhost>
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

On Tue, 12 Apr 2016 15:31:11 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Fri, Apr 01, 2016 at 02:54:24PM +0200, Boris Brezillon wrote:
> > The core now takes care of parsing generic DT properties in
> > nand_scan_ident() when nand_set_flash_node() has been called.
> > Rely on this initialization instead of calling of_get_nand_xxx()
> > manually.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Applied.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
