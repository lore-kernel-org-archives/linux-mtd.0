Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXK-0002jG-77
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:15 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 00/13] mtd/nand/fsmc related modifications
Date: Wed, 14 Mar 2012 11:47:06 +0530
Message-ID: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

These are the patches 8-20 of the original patchset of which 1-7 have already
been applied by you. I have rebased these patches over
git://git.infradead.org/users/dedekind/l2-mtd.git to help you apply these easily

Modifications in v2
- Add support for partition information to be passed from platform data
- Default partition information removed from driver
- Remove sparse errors and warnings

Modifications in v1
- DMA support
- Word read/write support to improve performance
- Move platform related things(ALE/CLE) from driver to platfrom files
- Add default partition support for more devices with erase sizes (256KB, 512KB,
		1024KB, 2048KB)
- Bugfixes
	- Read only 512 + 13 bytes for 8bit NAND devices
	- Flip the bit only if the error index is < 4096
	- Fixed data abort inside change_bit()

Regards
Vipin

Armando Visconti (1):
  nand/fsmc: Remove default partition information from driver

Shiraz Hashim (1):
  mtd/fsmc_nand: add pm callbacks to support hibernation

Vipin Kumar (11):
  nand/fsmc: Pass partition information through platform data
  nand/fsmc: Correct the multiline comment format
  nand/fsmc: Read only 512 + 13 bytes for 8bit NAND devices
  nand/fsmc: Flip the bit only if the error index is < 4096
  nand/fsmc: Initialize the badblockbits to 7
  nand/fsmc: Modify fsmc driver to accept nand timing parameters via
    platform
  nand/fsmc: Use devm routines
  nand/fsmc: Use dev_err to report error scenario
  nand/fsmc: Access the NAND device word by word whenever possible
  nand/fsmc: Add DMA support
  nand/fsmc: Remove sparse warnings and errors

 drivers/mtd/nand/fsmc_nand.c |  572 ++++++++++++++++++++++++++----------------
 include/linux/mtd/fsmc.h     |  151 +++++++-----
 2 files changed, 443 insertions(+), 280 deletions(-)
