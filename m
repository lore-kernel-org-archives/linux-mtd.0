Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e5Fm1-0006Xn-KC
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 18:42:31 +0000
Date: Thu, 19 Oct 2017 20:41:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de
Subject: Re: mtd: nand: mxc: change debug messages
Message-ID: <20171019204154.3415b0b9@bbrezillon>
In-Reply-To: <20171016095155.29174-1-s.hauer@pengutronix.de>
References: <20171016095155.29174-1-s.hauer@pengutronix.de>
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

On Mon, 16 Oct 2017 11:51:53 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> I often get reports from customers containing useless "UnCorrectable RS-ECC Error"
> messages. Lower this message to debug level and while at it, use dev_dbg instead
> of pr_debug.
> 
> Sascha
> 
> ----------------------------------------------------------------
> Sascha Hauer (2):
>       mtd: nand: mxc: lower ECC failed message priority to debug level
>       mtd: nand: mxc: use dev_dbg to print debug messages

Applied both.

Thanks,

Boris

> 
>  drivers/mtd/nand/mxc_nand.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
