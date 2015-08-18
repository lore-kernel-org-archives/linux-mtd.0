Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRgBQ-0003BJ-L9
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 12:40:05 +0000
Subject: Re: [PATCH v4 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
To: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
CC: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 <linux-kernel@vger.kernel.org>
From: Alex Smith <alex.smith@imgtec.com>
Message-ID: <55D3278C.5000403@imgtec.com>
Date: Tue, 18 Aug 2015 13:39:40 +0100
MIME-Version: 1.0
In-Reply-To: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27/07/2015 14:50, Alex Smith wrote:
> Hi,
> 
> This series adds support for the BCH controller and NAND devices on
> the Ingenic JZ4780 SoC.
> 
> Tested on the MIPS Creator Ci20 board. All dependencies are now in
> mainline so it should be possible to compile test now.
> 
> This version of the series has been rebased on 4.2-rc4, and also adds
> an additional patch to fix an issue that was encountered in the
> external Ci20 3.18 kernel branch.
> 
> Review and feedback welcome.
> 
> Thanks,
> Alex
> 
> Alex Smith (3):
>   mtd: nand: increase ready wait timeout and report timeouts
>   dt-bindings: binding for jz4780-{nand,bch}
>   mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
> 
>  .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
>  drivers/mtd/nand/Kconfig                           |   7 +
>  drivers/mtd/nand/Makefile                          |   1 +
>  drivers/mtd/nand/jz4780_bch.c                      | 354 +++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h                      |  42 +++
>  drivers/mtd/nand/jz4780_nand.c                     | 376 +++++++++++++++++++++
>  drivers/mtd/nand/nand_base.c                       |  15 +-
>  7 files changed, 849 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c

Hi,

Would it be possible for these to go in for 4.3?

Thanks,
Alex
