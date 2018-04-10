Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5ott-0005Tf-RH
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 08:45:24 +0000
Date: Tue, 10 Apr 2018 10:44:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, han.xu@nxp.com,
 festevam@gmail.com, marek.vasut@gmail.com, frieder.schrempf@exceet.de,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
Subject: Re: [PATCH v10 0/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
Message-ID: <20180410104449.4f0ff5ce@bbrezillon>
In-Reply-To: <1523349348-20778-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1523349348-20778-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

On Tue, 10 Apr 2018 14:05:46 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> fsl-quadspi.c driver creates different LUT entries for various cmds like
> read, write, erase, readid etc. These entries are created statically when
> driver gets intiliazed.
> 
> To support various cmds e.g. different read cmds like SPINOR_OP_READ,
> SPINOR_OP_READ_4B, SPINOR_OP_READ_FAST_4B, SPINOR_OP_READ_FAST,
> SPINOR_OP_READ_1_1_2, SPINOR_OP_READ_1_2_2 etc driver needs to
> have different LUT entries for different cmds.
> 
> FSL QUADSPI controller has 4 chip select and one can use different flashes
> on all different chip select.
> We analyzed that the flashes have different parameters for the same command
> and this is true for NAND devices.
> Also reg_protocol information, needed for read register, read any register
> commands, read SFDP register, not available at time of spi_nor_scan.
> As FSL QUADSPI controller has limitation in number of LUT entries, max 16,
> thus require to have dynamic LUT creation support.
> 
> Thus to have support for different flash devices, this patch-set adds
> support to create LUT entry in run-time based on the exact cmnd requested.
> Information like cmnd opcode, protocol info, dummy bit info etc required
> for creating LUT entries parsed from instance of passed 'struct spi_nor'.
> 
> Also fix initialize sequence of AHB read, move
> fsl_qspi_init_ahb_read() in  fsl_qspi_nor_setup() function.
> 
> Tested with "S25FS512S" flash and have checked read, write, erase
> functionality using mtd_debug utility.
> For read have checked hwcaps as SNOR_HWCAPS_READ_FAST,
> SNOR_HWCAPS_READ_1_2_2 and SNOR_HWCAPS_READ_1_4_4
> i.e. read cmds SPINOR_OP_READ_FAST_4B [0x0c],
> SPINOR_OP_READ_1_2_2_4B [0xbc] and SPINOR_OP_READ_1_4_4_4B [0xec]
> 
> Yogesh Gaur (2):
>   mtd: fsl-quadspi: add support to create dynamic LUT entry
>   mtd: fsl-quadspi: fix init AHB read in fsl_qspi_nor_setup()
> 
> Changes for v10:
> - Incorporated Han Xu review comments.
> Changes for v9:
> - Incorporated Boris Brezillon review comments.
> Changes for v8:
> - Incorporated Frieder Schrempf review comments.
> Changes for v7:
> - Incorporated Han Xu review comments.

This kind of changelogs ('Incorporated xxx review comments') is not
really useful, so please describe what had changed functionally or what
has been fixed instead. You can of course specify who suggested the
change, but it should not be the only information you give.

> Changes for v6:
> - Incorporated Boris Brezillon review comments.
> - Added dedicated LUT for AHB read cmd, required for devmem Read.
> Changes for v5:
> - Fix LUT preparation for SPINOR_OP_READ and SPINOR_OP_READ_4B cmds.
> Changes for v4:
> - Drop patch
> 'mtd: fsl-quadspi: update hwcaps read capabilities as READ_1_4_4', it
> would be taken care in next-series.
> - Added patch for 'fix initialize sequence of AHB read'.
> Changes for v3:
> - Add STOP instruction for prepared LUT and remove memset of 4 LUT reg.
> - Update information in cover letter.
> Changes for v2:
> - Swap patch sequences in the series to solve git bissect issue.
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 468 ++++++++++++++++++++++++--------------
>  1 file changed, 298 insertions(+), 170 deletions(-)
> 
