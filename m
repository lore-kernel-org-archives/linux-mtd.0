Received: from eu1sys200aog120.obsmtp.com ([207.126.144.149])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5FQE-0005Tm-3L
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:52:48 +0000
Message-ID: <4F574BE8.8050905@st.com>
Date: Wed, 7 Mar 2012 17:22:08 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Vipin KUMAR <vipin.kumar@st.com>
Subject: Re: [PATCH 00/18] mtd/nand/fsmc related modifications
References: <cover.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

It seems that Artem's mail id is an old one..Please remove it while 
replying to avoid getting bounces. The getmaintainer script needs to be 
updated with the correct mail id.

Regards
Vipin

On 3/7/2012 5:00 PM, Vipin KUMAR wrote:
> Hello All,
>
> Please find the nand/fsmc driver modifications
> Major modifications include
> - DMA support
> - Word read/write support to improve performance
> - Move platform related things(ALE/CLE) from driver to platfrom files
> - Add default partition support for more devices with erase sizes (256KB, 512KB,
> 		1024KB, 2048KB)
> - Bugfixes
> 	- Read only 512 + 13 bytes for 8bit NAND devices
> 	- Flip the bit only if the error index is<  4096
> 	- Fixed data abort inside change_bit()
>
> Armando Visconti (4):
>    fsmc_nand.c: Fixed data abort inside change_bit()
>    nand/fsmc: Improve the fsmc_correct_data() routine
>    fsmc_nand.c: Support of 224-bytes OOB area length
>    fsmc/nand: Add support for default partitions for several NAND
>      devices
>
> Bhavna Yadav (1):
>    mtd/fsmc_nand: ECC1&  ECC4 layout separated for different page sizes
>
> Shiraz Hashim (3):
>    nand/fsmc: use ALE and CLE offsets from platform data
>    mtd/nand/fsmc: Move ALE, CLE defines to their respective platform
>    mtd/fsmc_nand: add pm callbacks to support hibernation
>
> Vipin Kumar (10):
>    nand/fsmc: Newly erased page read algorithm implemented
>    nand/fsmc: Correct the multiline comment format
>    nand/fsmc: Read only 512 + 13 bytes for 8bit NAND devices
>    nand/fsmc: Flip the bit only if the error index is<  4096
>    nand/fsmc: Initialize the badblockbits to 7
>    fsmc/nand: Modify fsmc driver to accept nand timing parameters via
>      platform
>    fsmc/nand: Use devm routines
>    fsmc/nand: Use dev_err to report error scenario
>    fsmc/nand: Access the NAND device word by word whenever possible
>    fsmc/nand: Add DMA support
>
>   arch/arm/mach-u300/core.c                   |    2 +
>   arch/arm/mach-u300/include/mach/u300-regs.h |    5 +
>   drivers/mtd/nand/fsmc_nand.c                |  900 ++++++++++++++++++++++-----
>   include/linux/mtd/fsmc.h                    |   62 ++-
>   4 files changed, 788 insertions(+), 181 deletions(-)
>
> .
>
