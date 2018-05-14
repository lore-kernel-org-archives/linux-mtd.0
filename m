Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI9GH-0008Rj-CC
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:55:20 +0000
Date: Mon, 14 May 2018 10:54:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Bean Huo <beanhuo@micron.com>,
 Peter Pan <peterpandong@micron.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Do not check FAIL bit when executing a
 SET_FEATURES op
Message-ID: <20180514105451.43537aef@xps13>
In-Reply-To: <20180511124407.7314-1-boris.brezillon@bootlin.com>
References: <20180511124407.7314-1-boris.brezillon@bootlin.com>
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

On Fri, 11 May 2018 14:44:07 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> The ONFI spec clearly says that FAIL bit is only valid for PROGRAM,
> ERASE and READ-with-on-die-ECC operations, and should be ignored
> otherwise.
> 
> It seems that checking it after sending a SET_FEATURES is a bad idea
> because a previous READ, PROGRAM or ERASE op may have failed, and
> depending on the implementation, the FAIL bit is not cleared until a
> new READ, PROGRAM or ERASE is started.
> 
> This leads to ->set_features() returning -EIO while it actually worked,
> which can sometimes stop a batch of READ/PROGRAM ops.
> 
> Note that we only fix the ->exec_op() path here, because some drivers
> are abusing the NAND_STATUS_FAIL flag in their ->waitfunc()
> implementation to propagate other kind of errors, like
> wait-ready-timeout or controller-related errors. Let's not try to fix
> those drivers since they worked fine so far.
> 
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

So we have no real way to know if a SET_FEATURES actually succeeded.
I checked the ONFI spec and could not find anything. A GET_FEATURES
will do the trick though (when supported).

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
