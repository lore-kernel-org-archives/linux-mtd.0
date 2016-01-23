Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN538-0000Bn-AJ
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 20:44:46 +0000
Received: by mail-pa0-x230.google.com with SMTP id ho8so59405575pac.2
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 12:44:25 -0800 (PST)
Date: Sat, 23 Jan 2016 12:44:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Romain Izard <romain.izard.pro@gmail.com>, devicetree@vger.kernel.org,
 Yang Wenyou <Wenyou.Yang@atmel.com>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Subject: Re: [PATCH v1 1/5] mtd: atmel_nand: Do not warn on bitflips
Message-ID: <20160123204422.GA35559@google.com>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-2-git-send-email-romain.izard.pro@gmail.com>
 <20160113185421.22e1cb9c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160113185421.22e1cb9c@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 06:54:21PM +0100, Boris Brezillon wrote:
> On Wed, 13 Jan 2016 17:34:13 +0100
> Romain Izard <romain.izard.pro@gmail.com> wrote:
> 
> > When using multi-bit ECC, it is normal for the NAND Flash driver to
> > correct bit errors during the life of the product. Those errors will
> > only be cleared once a threshold has been reached, and corrections can
> > occur regularly before this.
> > 
> > Use only dev_dbg and not dev_info to report the bitflips, to keep the
> > system log clean when everything works correctly.
> > 
> > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> > Acked-by:  Wenyou Yang <wenyou.yang@atmel.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed patch 1 to l2-mtd.git/next
