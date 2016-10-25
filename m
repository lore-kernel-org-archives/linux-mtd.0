Received: from mail1.bemta12.messagelabs.com ([216.82.251.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz0s0-0000sy-6d
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 12:30:25 +0000
Subject: Re: [PATCH] mtd: nand: Fix data interface configuration logic
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>
References: <1477320380-11062-1-git-send-email-boris.brezillon@free-electrons.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <580F5043.6060901@sigmadesigns.com>
Date: Tue, 25 Oct 2016 14:29:55 +0200
MIME-Version: 1.0
In-Reply-To: <1477320380-11062-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24/10/2016 16:46, Boris Brezillon wrote:

> When changing from one data interface setting to another, one has to
> ensure a specific sequence which is described in the ONFI spec.
> 
> One of these constraints is that the CE line has go high after a reset
> before a command can be sent with the new data interface setting, which
> is not guaranteed by the current implementation.
> 
> Rework the nand_reset() function and all the call sites to make sure the
> CE line is asserted and released when required.
> 
> Also make sure to actually apply the new data interface setting on the
> first die.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: d8e725dd8311 ("mtd: nand: automate NAND timings selection")
> ---
>  drivers/mtd/nand/nand_base.c | 60 +++++++++++++++++++++++++++++++-------------
>  include/linux/mtd/nand.h     |  2 +-
>  2 files changed, 43 insertions(+), 19 deletions(-)

Tested-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Regards.
