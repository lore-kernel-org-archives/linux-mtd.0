Received: from lb2-smtp-cloud2.xs4all.net ([194.109.24.25])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2b9u-0001UI-J6
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 08:14:51 +0000
Message-ID: <1433924063.24094.27.camel@x220>
Subject: Re: [PATCH] mtd: nand: support for Toshiba BENAND (Built-in ECC NAND)
From: Paul Bolle <pebolle@tiscali.nl>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Date: Wed, 10 Jun 2015 10:14:23 +0200
In-Reply-To: <1433920119-16303-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1433920119-16303-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-06-10 at 16:08 +0900, KOBAYASHI Yoshitake wrote:
>  drivers/mtd/nand/Kconfig     |   16 ++++++++++++++++
>  drivers/mtd/nand/Makefile    |    1 +
>  drivers/mtd/nand/nand_base.c |   32 ++++++++++++++++++++++++++++++--
>  include/linux/mtd/nand.h     |    3 +++
>  4 files changed, 50 insertions(+), 2 deletions(-)

This _doesn't_ add drivers/mtd/nand/nand_benand.c (or something
similar). And there's no file with that name in today's linux-next.

> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile

> +obj-$(CONFIG_MTD_NAND_BENAND)	+= nand_benand.o

So there's another patch that adds drivers/mtd/nand/nand_benand.c?


Paul Bolle
