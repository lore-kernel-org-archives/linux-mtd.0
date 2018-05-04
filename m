Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEXUO-0002yl-Ob
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 09:58:58 +0000
Date: Fri, 4 May 2018 11:58:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, stable@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Bean Huo <beanhuo@micron.com>,
 Peter Pan <peterpandong@micron.com>
Subject: Re: [PATCH] mtd: rawnand: micron: Fix support for on-die ECC
Message-ID: <20180504115835.5702710e@xps13>
In-Reply-To: <20180503074908.20485-1-boris.brezillon@bootlin.com>
References: <20180503074908.20485-1-boris.brezillon@bootlin.com>
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

Hi Boris,

On Thu,  3 May 2018 09:49:08 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> It looks like the NAND_STATUS_FAIL bit is sticky after an ECC failure,
> which leads all READ operations following the failing one to report
> an ECC failure. Reset the chip to clear the NAND_STATUS_FAIL bit.
> 
> Note that this behavior is not document in the datasheet, but resetting
> the chip is the only solution we found to fix the problem.
> 
> Fixes: 9748e1d87573 ("mtd: nand: add support for Micron on-die ECC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Bean Huo <beanhuo@micron.com>
> Cc: Peter Pan <peterpandong@micron.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
