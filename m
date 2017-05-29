Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFPmh-0004Tn-QP
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 18:52:57 +0000
Date: Mon, 29 May 2017 20:52:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/3] mtd: nand: Remove unused features
Message-ID: <20170529205234.716f10c4@bbrezillon>
In-Reply-To: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 16 May 2017 00:17:40 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> This 3 patches are removing features that have either been introduced
> and never used or that are no longer used.

Applied to nand/next after adding a real commit message in patch 1.

> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   mtd: nand: Drop unused cached programming support
>   mtd: nand: Remove support for block locking/unlocking
>   mtd: nand: Drop the ->errstat() hook
> 
>  drivers/mtd/nand/nand_base.c | 216 ++-----------------------------------------
>  include/linux/mtd/nand.h     |  15 ---
>  2 files changed, 7 insertions(+), 224 deletions(-)
> 
