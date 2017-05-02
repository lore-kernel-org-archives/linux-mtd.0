Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5T4C-0004bc-I9
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:21:58 +0000
Date: Tue, 2 May 2017 10:21:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/3][v2] fixing 1bit hamming
Message-ID: <20170502102103.27195aff@bbrezillon>
In-Reply-To: <20170502081323.3138-1-lynxis@fe80.eu>
References: <20170313074641.28b383e7@bbrezillon>
 <20170502081323.3138-1-lynxis@fe80.eu>
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

Hi Alexander,

Please use the "mtd: nand: " prefix for all NAND related patches.

On Tue,  2 May 2017 10:13:20 +0200
Alexander Couzens <lynxis@fe80.eu> wrote:

A detailed explanation of what you're trying to do here would have been
useful. As is, your cover letter is just useless.

> v1:
> Use the old layout for all drivers/chips which doesn't set it explicit.
> 
> v2:
> Only use the old layout for 1bit hamming if the layout isn't set
> by the driver or devicetree.
> 
> Alexander Couzens (3):
>   mtd/nand: add ooblayout for old hamming layout
>   nand_base: use nand_ooblayout_lp_hamming_ops for 1bit hamming as
>     default
>   mtd: nand: davinci: set ECC algorithm explicitly for HW based ECC
> 
>  drivers/mtd/nand/davinci_nand.c |  4 ++-
>  drivers/mtd/nand/nand_base.c    | 77 ++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/nand.h        |  1 +
>  3 files changed, 80 insertions(+), 2 deletions(-)
> 
