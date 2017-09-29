Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dxuNf-0004MJ-Cs
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 12:27:02 +0000
Date: Fri, 29 Sep 2017 14:26:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 0/2] mtd: nand: wait for tWHR, and fix the
 setup_data_interface of Denali
Message-ID: <20170929142635.07d55f77@bbrezillon>
In-Reply-To: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
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

On Fri, 29 Sep 2017 19:38:38 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 1/2 : add NAND_WAIT_TWHR and nand_whr_delay().
>       You can set this new flag if you want nand_command(_lp)
>       to insert tWHR delay where needed.
> 
> 2/2 : Fix Denali setup_data_interface.
>       Boris' suggestion in v1 was a good reminder that
>       made me realize tCCS was missing in the driver.  Fix it now.
> 
> 
> Changes in v2:
>   - Add nand_whr_delay() helper
>     Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR flag
>   - newly added
> 
> Masahiro Yamada (2):
>   mtd: nand: wait for tWHR after NAND_CMD_STATUS / NAND_CMD_READID

Hm, I thought you were introducing this to then use it in the denali
driver. Sorry, but I don't want to apply something that nobody needs.
If someone ever complains about a missing delay I'll point him to your
patch, but until then I'll keep the core unchanged.

>   mtd: nand: denali: fix setup_data_interface to meet tCCS delay

This one is valid. I'll queue it to nand/next soon.

Thanks,

Boris

> 
>  drivers/mtd/nand/denali.c    | 10 ++++++++--
>  drivers/mtd/nand/nand_base.c | 21 +++++++++++++++++++--
>  include/linux/mtd/rawnand.h  | 13 ++++++++-----
>  3 files changed, 35 insertions(+), 9 deletions(-)
> 
