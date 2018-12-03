Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj1K-00080S-2L
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:51:59 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yangtao Li <tiny.windzz@gmail.com>, robert.jarzmik@free.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 miquel.raynal@bootlin.com, keescook@chromium.org,
 shreeya.patel23498@gmail.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: mtd: use DEFINE_SHOW_ATTRIBUTE() instead of open-coding it
Date: Mon,  3 Dec 2018 08:51:45 +0100
Message-Id: <20181203075145.28502-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181202083358.10896-1-tiny.windzz@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2018-12-02 at 08:33:58 UTC, Yangtao Li wrote:
> DEFINE_SHOW_ATTRIBUTE macro can help us simplify the code,so change
> to it.And change the DEBUGFS_RO_ATTR macro defined in some file to a
> standard macro.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
