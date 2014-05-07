Received: from mail-bn1blp0187.outbound.protection.outlook.com
 ([207.46.163.187] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WiBBL-0002PK-RH
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 23:23:25 +0000
Message-ID: <1399504973.15726.356.camel@snotra.buserror.net>
Subject: Re: [PATCH 1/1] mtd: eLBC NAND: fixes subpage write support
From: Scott Wood <scottwood@freescale.com>
To: Pekon Gupta <pekon@ti.com>
Date: Wed, 7 May 2014 18:22:53 -0500
In-Reply-To: <1399349492-3006-1-git-send-email-pekon@ti.com>
References: <1399349492-3006-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Helmut Schaa <helmut.schaa@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-05-06 at 09:41 +0530, Pekon Gupta wrote:
> As subpage write is enabled by default for all drivers, nand_write_subpage_hwecc
> causes a crash if the driver did not register ecc->hwctl or ecc->calculate.
> This behavior was introduced in
>    commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9
>    "mtd: nand: subpage write support for hardware based ECC schemes".
> 
> This fixes a crash by emulating subpage write support by padding sub-page data
> with 0xff on either sides to make it full page compatible.
> 
> CC: <stable@vger.kernel.org> # 3.10.x+
> 
> Reported-by: Helmut Schaa <helmut.schaa@googlemail.com>
> Tested-by: Helmut Schaa <helmut.schaa@googlemail.com>
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Scott Wood <scottwood@freescale.com>

-Scott
