Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYIx4-0006xP-LD
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 19:48:55 +0000
Date: Tue, 23 Feb 2016 13:48:29 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY DEVICES [MTD]" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6] mtd: support BB SRAM on ICP DAS LP-8x4x
Message-ID: <20160223194829.GA20334@rob-hp-laptop>
References: <1450205941-15593-1-git-send-email-ynvich@gmail.com>
 <1456253890-30825-1-git-send-email-ynvich@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456253890-30825-1-git-send-email-ynvich@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 23, 2016 at 09:58:01PM +0300, Sergei Ianovich wrote:
> This provides an MTD device driver for 512kB of battery backed up SRAM
> on ICPDAS LP-8X4X programmable automation controllers.
> 
> SRAM chip is connected via FPGA and is not accessible without a driver,
> unlike flash memory which is wired to CPU MMU.
> 
> This SRAM becomes an excellent persisent storage of volatile process
> data like counter values and sensor statuses. Storing those data in
> flash or mmc card is not a viable solution.
> 
> Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> CC: Rob Herring <robh@kernel.org>
> 
>    v5..v6
>    * replace wildcards in compatible and module name
>    * drop obsolete mtd_part_parser_data.of_node
> 
>    v4..v5
>    * remove .owner from struct platform_driver
>    * constify struct of_device_id
>     for further Brian Norris comments:
>    * drop unused property from doc file
>    * move defconfig update to a different file
>    * drop extra match w/ of_match_device()
> 
>    v3..v4 for Brian Norris 'Reviewed-by'
>    * add doc file for DT binding
>    * move DTS binding to a different patch (8/21)
>    * drop unused include directive
>    * drop safely unused callback
>    * drop non-default partion probe types
>    * drop duplicate error checks
>    * drop duplicate error reporting
>    * fixed error message on MTD registeration
>    * fixed module removal routine
> 
>    v2..v3
>    * no changes (except number 08/16 -> 10/21)
> 
>    v0..v2
>    * use device tree
>    * use devm helpers where possible
> ---
>  .../devicetree/bindings/mtd/icpdas-lp8841-sram.txt |  23 +++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/devices/Kconfig                        |  14 ++
>  drivers/mtd/devices/Makefile                       |   1 +
>  drivers/mtd/devices/sram_lp8841.c                  | 198 +++++++++++++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/icpdas-lp8841-sram.txt
>  create mode 100644 drivers/mtd/devices/sram_lp8841.c
