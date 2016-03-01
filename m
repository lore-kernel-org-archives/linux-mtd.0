Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aahWp-0006l3-OD
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2016 10:27:44 +0000
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris BREZILLON
 <boris.brezillon@free-electrons.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
CC: Romain Izard <romain.izard.pro@gmail.com>, <devicetree@vger.kernel.org>,
 Josh Wu <rainyfeeling@outlook.com>, Yang Wenyou <Wenyou.Yang@atmel.com>
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Message-ID: <56D56E95.4030204@atmel.com>
Date: Tue, 1 Mar 2016 11:27:33 +0100
MIME-Version: 1.0
In-Reply-To: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 01/02/2016 11:25, Romain Izard a écrit :
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

Brian,

Hi, do we need to resend this series with all the tags collected (aka
ping ;-)) ?

Bye,


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
Nicolas Ferre
