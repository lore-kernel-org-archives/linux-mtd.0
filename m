Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONjiY-0006tN-2O
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 09:43:02 +0000
Subject: Re: [RFC][PATCH 17/26] MTD: Nand: Add JZ4740 NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <1275505950-17334-1-git-send-email-lars@metafoo.de>
References: <1275505397-16758-1-git-send-email-lars@metafoo.de>
	<1275505950-17334-1-git-send-email-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:40:15 +0300
Message-ID: <1276422015.19028.204.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-02 at 21:12 +0200, Lars-Peter Clausen wrote:
> This patch adds support for the NAND controller on JZ4740 SoCs.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/nand/Kconfig        |    6 +
>  drivers/mtd/nand/Makefile       |    1 +
>  drivers/mtd/nand/jz4740_nand.c  |  442 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/jz4740_nand.h |   34 +++
>  4 files changed, 483 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/jz4740_nand.c
>  create mode 100644 include/linux/mtd/jz4740_nand.h

I doubt "include/linux/" is the right place to define 'struct
jz_nand_platform_data' - it should instead live is somwhere in
arch/mips/

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
