Received: from mail-qg0-f51.google.com ([209.85.192.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYgm4-0007dU-9Q
 for linux-mtd@lists.infradead.org; Sun, 06 Sep 2015 20:42:52 +0000
Received: by qgez77 with SMTP id z77so51367712qge.1
 for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2015 13:42:31 -0700 (PDT)
Date: Sun, 6 Sep 2015 17:38:39 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Alex Smith <alex.smith@imgtec.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Message-ID: <20150906203839.GB7745@laptop.cereza>
References: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 Jul 02:50 PM, Alex Smith wrote:
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

The NEMC driver seems to be upstream. Any chance you submit devicetree
changes as well for Ci20 (so we can actually test this)?

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
> 
> -- 
> 2.4.6
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
