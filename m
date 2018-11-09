Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLCeh-0007J3-61
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 19:41:24 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: mtd: cfi_cmdset_0020: Mark expected switch fall-throughs
Date: Fri,  9 Nov 2018 20:40:59 +0100
Message-Id: <20181109194059.20893-1-boris.brezillon@bootlin.com>
In-Reply-To: <20180815170226.GA14553@embeddedor.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2018-08-15 at 17:02:26 UTC, "Gustavo A. R. Silva" wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
> 
> Addresses-Coverity-ID: 114857 ("Missing break in switch")
> Addresses-Coverity-ID: 114858 ("Missing break in switch")
> Addresses-Coverity-ID: 114859 ("Missing break in switch")
> Addresses-Coverity-ID: 114860 ("Missing break in switch")
> Addresses-Coverity-ID: 114861 ("Missing break in switch")
> Addresses-Coverity-ID: 114862 ("Missing break in switch")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
