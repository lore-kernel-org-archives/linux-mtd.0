Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj1d-0008KI-MO
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:52:27 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Colin King <colin.king@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mtd: nftl: clean up indentation, remove extraneous tabs
Date: Mon,  3 Dec 2018 08:52:13 +0100
Message-Id: <20181203075213.28993-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181118163656.30698-1-colin.king@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2018-11-18 at 16:36:56 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The hunk of code is indented too much by one level, fix this by
> removing the extraneous tabs. Also terminate block comment using
> the recommended coding style to clean up checkpatch warning.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
