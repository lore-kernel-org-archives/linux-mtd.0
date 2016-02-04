Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRK3M-0000GJ-M5
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2016 13:34:33 +0000
Date: Thu, 4 Feb 2016 14:33:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Josh Wu
 <rainyfeeling@outlook.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Yang
 Wenyou <Wenyou.Yang@atmel.com>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
Message-ID: <20160204143340.1ffa2292@bbrezillon>
In-Reply-To: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
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

Hi Romain,

Just a remark that is not directly related to your work: when people
take the time to review your work, try to keep them in Cc of the
following versions of your patchset.

On Mon,  1 Feb 2016 11:25:55 +0100
Romain Izard <romain.izard.pro@gmail.com> wrote:

> The NAND Flash controller for SAMA5D2 has small differences that make it
> impossible to use the existing driver for SAMA5D3. This patchset uses the
> device tree's compatible string to get those differences, and the code is
> slightly modified to handle them.
> 
> Base on linux-mtd-next, commit 15c0be7bec002f9a529dd0966d0db96dde176fd0
> 
> See previous revisions to apply on the Atmel Linux 4.1 branch.
> 
> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there is no
> existing SAMA5D2 board with NAND Flash memory (yet).

Overall, it looks good to me (even if I don't fully agree on how you
decided to define NFC_SR_RB_EDGEX values :-P, but that's just a
nitpick).

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> V3 -> V2:
> - Rebase on linux-mtd-next
> - Skip patches already in the tree
> 
> V2 -> V1:
> - Rebase on v4.4
> - Use of_device_get_match_data
> - Split message cleanup
> - Reword a small part of the atmel_nand device tree binding
> - Use 'caps' for all private data structures
> 
> RFC -> V1:
> - Split the support of 32-bit ECC on SAMA5D2 in two commits
> - Fix the missing ECC strength configuration code
> 
> Romain Izard (5):
>   mtd: atmel_nand: Support variable RB_EDGE interrupts
>   dt-bindings: atmel_nand: Reword the documenation
>   mtd: atmel_nand: Support PMECC on SAMA5D2
>   mtd: atmel_nand: Support 32-bit ECC strength
>   ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 31 +++++----
>  arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++++
>  drivers/mtd/nand/atmel_nand.c                      | 77 ++++++++++++++++++----
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
>  5 files changed, 131 insertions(+), 27 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
